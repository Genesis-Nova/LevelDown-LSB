--------------------------------------------------------------------------------
-- file: CampaignBattleHandler.lua
--------------------------------------------------------------------------------

--Bugs/Possible Issues
-- Able to get Battle Buffs from the first zone a battle happened in after a server reset until another zone is picked

-- Required modules for functionality.
require("modules/module_utils")
require("scripts/utils/utils")

-- Correctly create the module object before any functions that uses it.
---@type Module
local m = Module:new('CampaignBattleHandler')

-- =============================================================================
-- GLOBAL CONFIGURATION CONSTANTS (INITIALIZED FIRST)
-- =============================================================================

-- !!! SET THIS TO TRUE TO SEE THE SERVER LOGS
local ENABLE_DEBUG_LOGS = false 

--In game hour = 2.5 minutes
--In game day = 57.5 minutes

-- Battle chance configuration
local INITIAL_BATTLE_CHANCE = 10    -- Initial chance in percent (e.g., 10%) --10
local HOURLY_CHANCE_INCREASE = 1    -- Increase in percent per hour if no battle starts --5
local BATTLE_COOLDOWN_HOURS = 6   -- Cooldown in hours after a battle ends --4
local PREP_DURATION_HOURS = 1       -- Duration of the preparation phase --1
local BATTLE_DURATION_HOURS = 5     -- Duration of the actual FIGHT in game hours --4

-- NEW: Win condition based on collective HP reduction
local HP_REDUCTION_WIN_THRESHOLD = 25 -- If collective HP is below this % of STARTING HP when time runs out, players win.

-- Unit Level and HP Configuration
local BATTLE_LEVEL_COMMANDER = 110
local BATTLE_LEVEL_REGULAR = 95

--Depreciated values - DO NOT USE --Use MOB_HPP_MOD to edit HPP value--
-- HPP (HP Percent) Modifiers for Battle Units
local COMMANDER_HPP_MOD = 600 
local REGULAR_HPP_MOD = 400     
--------------------------------------------------------------------------------

--HPP Value Toggle
local MOB_HPP_MOD = 4000 --HP percentage for all campaign mobs

-- Global Quantity Configuration
local COMMANDER_QTY = 1     -- One commander per unit
local REGULARS_QTY = 9      -- Five regulars per unit

-- Additional Geometry Configuration
local SAFE_SPAWN_BUFFER = 3         -- Extra padding added to fort width for exclusion zone
local MOB_Y_OFFSET = 1.5            -- Small offset to place mob slightly above fort center Y
local MAX_SPAWN_DISTANCE = 25      -- Max distance from fort center (X/Z) mobs will spawn

-- =============================================================================
-- PLAYER CONTRIBUTION CONFIGURATION (NEW)
-- =============================================================================

-- Multipliers for points awarded per event. Adjust these values to fine-tune score weighting.
local POINT_MULTIPLIERS = {
    ABILITY_USE = 0,    -- Points for using a Job Ability (JA) or Job Trait (JT)
    MELEE_SWING_HIT = 0, -- Points for a successful standard melee swing
    CRITICAL_TAKE = 0,  -- Points awarded when the mob takes a critical hit
    WEAPONSKILL_USE = 0, -- Points for using a Weapon Skill
    MAGIC_USE = 0,      -- Points for using a Spell (Ninjutsu, White/Black Magic, etc.)
    RANGE_STATE_EXIT = 0, -- Points for finishing a Ranged Attack action
}

-- Unique CharVar identifiers for each event type (used to track player contributions)
local CONTRIBUTION_VARS = {
    ABILITY_USE = 'PB_AbilityUseCount',
    MELEE_SWING_HIT = 'PB_MeleeHitCount',
    CRITICAL_TAKE = 'PB_CriticalTakeCount',
    WEAPONSKILL_USE = 'PB_WSUseCount',
    MAGIC_USE = 'PB_MagicUseCount',
    RANGE_STATE_EXIT = 'PB_RangeExitCount',
}

-- NEW 30: Cumulative character variable for lifetime points earned.
local MAX_POINTS_PER_BATTLE = 0
local CUMULATIVE_SCORE_VAR = 'PB_TotalLifetimeScore' 

-- Global identifier prefix for listeners on the mob (used for addListener/removeListener)
local LISTENER_ID_PREFIX = 'CAMPAIGN_POINT_TRACKER_'

-- =============================================================================
-- REWARD CONFIGURATION (NEW 27 / NEW 31)
-- =============================================================================

-- TOGGLE: True = Award Job Points. False = Award Merit Points.
-- Note: EXP is always awarded if the player's main job level is < 99.
local AWARD_JOB_POINTS = true 

-- Base Conversion Multiplier: Final Score * REWARD_MULTIPLIER = Base Reward Amount
local REWARD_MULTIPLIER = 0 

-- NEW 31: Allied Notes Configuration
local ALLIED_NOTES_RATE = 0                    -- Base conversion rate: Final Score * ALLIED_NOTES_RATE
local ALLIED_NOTES_THRESHOLD = 0              -- If the base notes amount meets or exceeds this, apply the modifier
local ALLIED_NOTES_MODIFIER = 0               -- Modifier applied if the threshold is met
local MAX_ALLIED_NOTES_REWARD = 0             -- Maximum Allied Notes per player, regardless of score.

-- BONUS: Multiplier applied to Base Reward if the players achieve a Victory (1.5 = 50% bonus)
local PLAYER_VICTORY_BONUS_MULTIPLIER = 0.0

-- Maximum limits for each reward type per player, regardless of score.
local MAX_JOB_POINTS_REWARD = 0
local MAX_MERIT_POINTS_REWARD = 0
local MAX_EXP_REWARD = 0

-- =============================================================================
-- NEW 34: KEY ITEM REWARD BONUSES (Ordered from lowest to highest rank)
-- =============================================================================
-- max_reward_mod: Multiplier for the maximum limits of all rewards (JP, Merits, EXP, Notes). (1.05 = +5% max reward)
-- notes_threshold_mod: Multiplier for the ALLIED_NOTES_THRESHOLD (0.95 = 5% discount, 500 * 0.95 = 475 threshold)
-- NOTE: The 'ki_name' is used for the lookup since xi.keyItem IDs are unknown outside the core system.
local KI_REWARD_BONUS_CONFIG = {
    -- ki_name (string used for player:hasKeyItem check) = { max_reward_mod, notes_threshold_mod }
    { ki_name = 'BRONZE_RIBBON_OF_SERVICE', max_reward_mod = 1.05, notes_threshold_mod = 1.0000 }, --Lowest Rank
    { ki_name = 'BRONZE_STAR',              max_reward_mod = 1.10, notes_threshold_mod = 0.9816 },
    { ki_name = 'COPPER_EMBLEM_OF_SERVICE', max_reward_mod = 1.15, notes_threshold_mod = 0.9632 },
    { ki_name = 'BRASS_WINGS_OF_SERVICE',   max_reward_mod = 1.20, notes_threshold_mod = 0.9447 },
    { ki_name = 'STARLIGHT_MEDAL',          max_reward_mod = 1.25, notes_threshold_mod = 0.9263 },
    { ki_name = 'BRASS_RIBBON_OF_SERVICE',  max_reward_mod = 1.30, notes_threshold_mod = 0.9079 },
    { ki_name = 'STERLING_STAR',            max_reward_mod = 1.35, notes_threshold_mod = 0.8895 },
    { ki_name = 'IRON_EMBLEM_OF_SERVICE',   max_reward_mod = 1.40, notes_threshold_mod = 0.8711 },
    { ki_name = 'MYTHRIL_WINGS_OF_SERVICE', max_reward_mod = 1.45, notes_threshold_mod = 0.8526 },
    { ki_name = 'MOONLIGHT_MEDAL',          max_reward_mod = 1.50, notes_threshold_mod = 0.8342 },
    { ki_name = 'ALLIED_RIBBON_OF_BRAVERY', max_reward_mod = 1.55, notes_threshold_mod = 0.8158 },
    { ki_name = 'MYTHRIL_STAR',             max_reward_mod = 1.60, notes_threshold_mod = 0.7974 },
    { ki_name = 'HOLYKNIGHT_EMBLEM',        max_reward_mod = 1.65, notes_threshold_mod = 0.7789 },
    { ki_name = 'WINGS_OF_INTEGRITY',       max_reward_mod = 1.70, notes_threshold_mod = 0.7605 },
    { ki_name = 'DAWNLIGHT_MEDAL',          max_reward_mod = 1.75, notes_threshold_mod = 0.7421 },
    { ki_name = 'ALLIED_RIBBON_OF_GLORY',   max_reward_mod = 1.80, notes_threshold_mod = 0.7237 },
    { ki_name = 'GOLDEN_STAR',              max_reward_mod = 1.85, notes_threshold_mod = 0.7053 },
    { ki_name = 'STEELKNIGHT_EMBLEM',       max_reward_mod = 1.90, notes_threshold_mod = 0.6868 },
    { ki_name = 'WINGS_OF_HONOR',           max_reward_mod = 1.95, notes_threshold_mod = 0.6684 },
    { ki_name = 'MEDAL_OF_ALTANA',          max_reward_mod = 2.00, notes_threshold_mod = 0.6500 } -- Highest Rank
}
-- =============================================================================

-- =============================================================================
-- ENEMY ARMY CONFIGURATION
-- =============================================================================
-- ... (ARMIES and BATTLE_ZONES remain the same)

-- A list of all possible enemy armies.
local ARMIES = {
    -- Dark Kindred Army
    {
        name = "Dark Kindred",
        units = {
            {
                unitname = "Shadowhorn Battalion",
                commander = { unitname = "Shadowhorn",      look = '00004f0500000000000000000000000000000000', groupid = 96, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SHB] Stormer",    look = '00000f0100000000000000000000000000000000', groupid = 97, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowfang Battalion",
                commander = { unitname = "Shadowfang",      look = '0000e50200000000000000000000000000000000', groupid = 100, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SFB] Void",       look = '0000bb0100000000000000000000000000000000', groupid = 101, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadoweye Battalion",
                commander = { unitname = "Shadoweye",       look = '0000090100000000000000000000000000000000', groupid = 102, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SEB] Gnat",       look = '0000dc0700000000000000000000000000000000', groupid = 103, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowwing Battalion",
                commander = { unitname = "Shadowwing",      look = '0000b10800000000000000000000000000000000', groupid = 84, zoneid = 136, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SWB] Enrager",    look = '0000b10800000000000000000000000000000000', groupid = 85, zoneid = 136, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowsoul Battalion",
                commander = { unitname = "Shadowsoul",      look = '0000a90800000000000000000000000000000000', groupid = 88, zoneid = 137, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SSB] Devourer",   look = '0000a50100000000000000000000000000000000', groupid = 89, zoneid = 137, qty = REGULARS_QTY },
            },
        },
    },

    -- Orcish Hosts Forces Army
    {
        name = "Orcish Hosts Force",
        units = {
            {
                unitname = "Steelhide Horde",
                commander = { unitname = "Conq. Bakgodek",  look = '0000f30300000000000000000000000000000000', groupid = 74, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SHH] Protector",  look = '0000fa0700000000000000000000000000000000', groupid = 75, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gwajboj's' Gutrenders",
                commander = { unitname = "1-Eyed Gwajoboj", look = '00001b0800000000000000000000000000000000', groupid = 76, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GBG] Trooper",    look = '0000fa0700000000000000000000000000000000', groupid = 77, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Spinebeak Horde",
                commander = { unitname = "DeathLord Roj",   look = '0000ff0700000000000000000000000000000000', groupid = 78, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[SBH] Chopper",    look = '0000fd0700000000000000000000000000000000', groupid = 79, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Clan Reaper",
                commander = { unitname = "Warmachine",      look = '0000ac0100000000000000000000000000000000', groupid = 80, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[CR] Grunt",       look = '0000030800000000000000000000000000000000', groupid = 82, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Moonfang Pack",
                commander = { unitname = "Alpha Anders",    look = '0000f10700000000000000000000000000000000', groupid = 83, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[MFP] Warrior",    look = '0000f10700000000000000000000000000000000', groupid = 85, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gnadgad's Dismemberment Brigade",
                commander = { unitname = "Psnhand Gnadgad", look = '0000010800000000000000000000000000000000', groupid = 86, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GDB] Grappler",   look = '0000000800000000000000000000000000000000', groupid = 87, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gudrud's' Shieldchewers",

                commander = { unitname = "Gudrud",          look = '0000180400000000000000000000000000000000', groupid = 91, zoneid = 82, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GSC] Impaler",    look = '00006c0200000000000000000000000000000000', groupid = 92, zoneid = 82, qty = REGULARS_QTY },
            },
            {
                unitname = "Prozpuz' Throatrippers",
                commander = { unitname = "3-Eyed Prozpuz",  look = '0000040800000000000000000000000000000000', groupid = 88, zoneid = 83, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[PTR] Predator",   look = '0000030800000000000000000000000000000000', groupid = 89, zoneid = 83, qty = REGULARS_QTY },
            },
            {
                unitname = "Gochakzuk's Gravemakers",
                commander = { unitname = "Dirty Gochakzuk", look = '0000190400000000000000000000000000000000', groupid = 88, zoneid = 84, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GGM] Charmer",    look = '0000740200000000000000000000000000000000', groupid = 89, zoneid = 84, qty = REGULARS_QTY },
            },
        },
    },

    -- Quadav Shieldwarriors Forces Army
    {
        name = "Quadav Shieldwarriors Force",
        units = {
            {
                unitname = "Di'Dha Elite Guard",
                commander = { unitname = "Dha Adamantfist", look = '00000e0300000000000000000000000000000000', groupid = 83, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[DEG] Guard",      look = '00009f0200000000000000000000000000000000', groupid = 84, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Waughroon Armored Division",
                commander = { unitname = "Dho Hundredfist", look = '00006b0800000000000000000000000000000000', groupid = 85, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[WAD]Heavyshell",  look = '0000440800000000000000000000000000000000', groupid = 86, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Beadeaux Vanguard",
                commander = { unitname = "Vyu Headhunter",  look = '0000510800000000000000000000000000000000', groupid = 87, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[BV] Vanguard",    look = '0000490800000000000000000000000000000000', groupid = 88, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Qulun Armored Division",
                commander = { unitname = "BiGho Headtaker", look = '00004c0800000000000000000000000000000000', groupid = 89, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[QAD]Heavyshell",  look = '0000490800000000000000000000000000000000', groupid = 90, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Go'Bhu Elite Raiders",
                commander = { unitname = "Bhu Herohunter",  look = '00001d0400000000000000000000000000000000', groupid = 91, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GR] Raider",      look = '00009b0200000000000000000000000000000000', groupid = 92, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Dadough Vanguard",
                commander = { unitname = "Bho Venomtail",   look = '00001f0400000000000000000000000000000000', groupid = 93, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[DV] Vanguard",    look = '00009a0200000000000000000000000000000000', groupid = 94, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "No'Mho Elite Guard",
                commander = { unitname = "Mho Redarmor",    look = '00001e0400000000000000000000000000000000', groupid = 91, zoneid = 89, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[NEG] Guard",      look = '0000990200000000000000000000000000000000', groupid = 92, zoneid = 89, qty = REGULARS_QTY },
            },
            {
                unitname = "Gi'Ghi Elite Guard",
                commander = { unitname = "Ghi Rockchopper", look = '0000440800000000000000000000000000000000', groupid = 90, zoneid = 90, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[GG] Guard",       look = '0000440800000000000000000000000000000000', groupid = 92, zoneid = 90, qty = REGULARS_QTY },
            },
            {
                unitname = "Vhuud Vanguard",
                commander = { unitname = "GaDho Softstep",  look = '0000940200000000000000000000000000000000', groupid = 101, zoneid = 91, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "[VV] Vanguard",    look = '0000920200000000000000000000000000000000', groupid = 103, zoneid = 91, qty = REGULARS_QTY },
            },
        },
    },

    -- Yagudo Theomilitary Forces Army
    {
        name = "Yagudo Theomilitary Force",
        units = {
            {
                unitname = "Templars",
                commander = { unitname = "Vee Qiqa",        look = '00000d0300000000000000000000000000000000', groupid = 88, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Templar",   look = '00005f0200000000000000000000000000000000', groupid = 90, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Disseminators",
                commander = { unitname = "Moo Ouzi",        look = '0000430800000000000000000000000000000000', groupid = 91, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Sower",     look = '00001c0800000000000000000000000000000000', groupid = 92, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Assassins",
                commander = { unitname = "Muu Buxu",        look = '0000210800000000000000000000000000000000', groupid = 93, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Assassin",  look = '00001f0800000000000000000000000000000000', groupid = 94, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Ascetics",
                commander = { unitname = "Dee Xalmo",       look = '0000240800000000000000000000000000000000', groupid = 95, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Ascetic",   look = '0000220800000000000000000000000000000000', groupid = 96, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Plenilune Ronin",
                commander = { unitname = "Kazan the",       look = '00003b0400000000000000000000000000000000', groupid = 97, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Plenilune Ronin",  look = '00001f0800000000000000000000000000000000', groupid = 98, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Inspirers",
                commander = { unitname = "Vuu Puqu",        look = '0000510200000000000000000000000000000000', groupid = 99, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Inspirer",  look = '00003d0400000000000000000000000000000000', groupid = 100, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Sentinels",
                commander = { unitname = "Yuu Mjuu",        look = '00003c0400000000000000000000000000000000', groupid = 74, zoneid = 96, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Sentinel",  look = '0000470200000000000000000000000000000000', groupid = 76, zoneid = 96, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Inciters",
                commander = { unitname = "Vaa Oozu",        look = '0000220800000000000000000000000000000000', groupid = 93, zoneid = 97, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Divine Inciter",   look = '00001c0800000000000000000000000000000000', groupid = 95, zoneid = 97, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Paradigms",
                commander = { unitname = "Yaa Haqa",        look = '00004d0200000000000000000000000000000000', groupid = 89, zoneid = 98, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars =  { unitname = "Divine Priest",   look = '00003d0400000000000000000000000000000000', groupid = 90, zoneid = 98, qty = REGULARS_QTY },
            },
        },
    },
}

-- A list of all possible campaign battle locations.
local BATTLE_ZONES = {
    {
        zoneName = 'East_Ronfaure_[S]',
        zoneID = 81,
        fortCenterPos = {x = 304.9547, y = -29.7595, z = -105.4023},
        fortWidth = 20,
    },

    {
        zoneName = 'North_Gustaberg_[S]',
        zoneID = 88,
        fortCenterPos = {x = -566.1804, y = 39.5266, z = 65.2883},
        fortWidth = 20,
    },

    {
        zoneName = 'Fort_Karugo-Narugo_[S]',
        zoneID = 96,
        fortCenterPos = {x = -119.3196, y = -80, z = 1.2616},
        fortWidth = 20,
    },

    {
        zoneName = 'Jugner_Forest_[S]',
        zoneID = 82,
        fortCenterPos = {x = 59.8708, y = 0.3481, z = -21.9440},
        fortWidth = 20,
    },

    {
        zoneName = 'Grauberg_[S]',
        zoneID = 89,
        fortCenterPos = {x = 295.4877, y = -47.7125, z = 101.7721},
        fortWidth = 0,
    },

    {
        zoneName = 'Meriphataud_Mountains_[S]',
        zoneID = 97,
        fortCenterPos = {x = -318.1815, y = 14.1201, z = 454.3602},
        fortWidth = 0,
    },

    {
        zoneName = 'Pashhow_Marshlands_[S]',
        zoneID = 90,
        fortCenterPos = {x = 452.9308, y = 24.7096, z = 430.0490},
        fortWidth = 0,
    },

    {
        zoneName = 'Vunkerl_Inlet_[S]',
        zoneID = 83,
        fortCenterPos = {x = -205.9059, y = -40, z = -279.2815},
        fortWidth = 10,
    },

    {
        zoneName = 'Sauromugue_Champaign_[S]',
        zoneID = 98,
        fortCenterPos = {x = -61.0005, y = 24.9078, z = 220.2374},
        fortWidth = 20,
    },

    {
        zoneName = 'Batallia_Downs_[S]',
        zoneID = 84,
        fortCenterPos = {x = 225.7461, y = 8.4632, z = 22.7775},
        fortWidth = 20,
    },

    {
        zoneName = 'Rolanberry_Fields_[S]',
        zoneID = 91,
        fortCenterPos = {x = 260.9043, y = 8.2694, z = 219.4440},
        fortWidth = 20,
    },

    {
        zoneName = 'Beaucedine_Glacier_[S]',
        zoneID = 136,
        fortCenterPos = {x = 42.1614, y = -60.1867, z = -43.244},
        fortWidth = 0,
    },

    {
        zoneName = 'Xarcabard_[S]',
        zoneID = 137,
        fortCenterPos = {x = 157.4140, y = -16.0000, z = -121.0564},
        fortWidth = 20,
    },
}

-- We will use one of the zones in our list to "host" the hourly check.
local EVENT_HOST_ZONE_NAME = 'West_Sarutabaruta_[S]'

-- =============================================================================
-- PERSISTENT STATE VARIABLES (SERVER VARS)
-- =============================================================================
-- Tracks the hour the last battle ENDED. Used to enforce the cooldown.
local LAST_BATTLE_END_HOUR_VAR = '[CampaignBattleHandler]LastBattleEndHour' 
-- NEW: 0=Inactive/Cooldown, 1=Preparing, 2=Active/Fighting
local BATTLE_STATE_VAR = '[CampaignBattleHandler]BattleState'               
-- NEW: Hour (0-23) the current battle *preparation* started at.
local BATTLE_PREP_START_HOUR_VAR = '[CampaignBattleHandler]BattlePrepStartHour' 
-- Hour (0-23) the current battle *fight* started at. (Used for duration check)
local BATTLE_START_HOUR_VAR = '[CampaignBattleHandler]BattleFightStartHour' 
-- 1 if timeout has been announced and cooldown started, 0 if not. Prevents duplicate announcements.
local BATTLE_TIMEOUT_ANNOUNCED_VAR = '[CampaignBattleHandler]BattleTimeoutAnnounced' 
-- Persistence variables for the chosen battle location/army/unit
local SELECTED_ZONE_INDEX_VAR = '[CampaignBattleHandler]SelectedZoneIndex'
local SELECTED_ARMY_INDEX_VAR = '[CampaignBattleHandler]SelectedArmyIndex'
local SELECTED_UNIT_INDEX_VAR = '[CampaignBattleHandler]SelectedUnitIndex'
-- NEW: 1 = Player Win (Victory), 2 = Enemy Win (Timeout). Only valid when BATTLE_STATE_VAR is 0 (cooldown).
local LAST_BATTLE_RESULT_VAR = '[CampaignBattleHandler]LastBattleResult'
-- FIX 26: Total maximum HP of all mobs when the battle began (the win condition baseline).
local TOTAL_STARTING_MAX_HP_VAR = '[CampaignBattleHandler]TotalStartingMaxHP' 

-- Global variable to store the current battle chance
local currentBattleChance = INITIAL_BATTLE_CHANCE
-- Global variable to track the total number of mobs spawned for the current battle (only valid when state=2)
local battleMobCount = 0
-- Global variable to track the number of mobs defeated in the current battle (only valid when state=2)
local mobsDefeatedCount = 0
-- Global variables to store battle location/names (persisted via server vars, loaded hourly)
local currentBattleLocationName = ""
local currentAttackingUnitName = ""
local currentAttackingArmyName = ""

-- =============================================================================
-- LOCALIZED MESSAGES (MOVED UP FOR EARLY ACCESS)
-- =============================================================================

local MESSAGES = {
    -- Separator line for announcements
    SEPARATOR = '----------------[CAMPAIGN BATTLE]----------------',
    
    -- NEW: Preparation Start Announcement Format
    PREP_START_FMT = '[PREP] An attack by %s\'s %s is starting in %s in %d hour!',

    -- Battle Start Announcement Format: [Army Name], [Unit Name], [Zone Name]
    BATTLE_START_FMT = '[BATTLE] The %s\'s %s has begun its assault on %s!',
    
    -- New: Defender count announcement
    DEFENDER_COUNT_FMT = '[DEFENSE] There are %d defenders currently prepared to fight!',

    -- Battle End Announcement Format (Player Win): [Army Name], [Unit Name], [Zone Name]
    BATTLE_END_FMT = '[VICTORY] The %s\'s %s was defeated in %s!',

    -- Battle Timeout Announcement Format (Enemy Win): [Army Name], [Unit Name], [Zone Name]
    BATTLE_TIMEOUT_FMT = '[DEFEAT] The %s\'s %s returned victorious from %s!',
    
    -- NEW 25: HP Reduction Victory Announcement Format
    HP_REDUCTION_VICTORY_FMT = '[VICTORY] The %s\'s %s were defeated in %s!',
    
    -- NEW: Winner Announcement Format for world broadcast
    BATTLE_WINNER_FMT = 'Congratulations to %s for earning the MVP title with an incredible %d points!', --Disabled
    
    -- NEW 32: Combined Individual Player Reward Messages
    PLAYER_REWARD_JP_COMBINED_FMT = '[REWARD] You earned %d Job Points and %d Allied Notes for the battle in %s!',
    PLAYER_REWARD_MERIT_COMBINED_FMT = '[REWARD] You earned %d Merit Points and %d Allied Notes for the battle in %s!',
    PLAYER_REWARD_EXP_COMBINED_FMT = '[REWARD] You earned %d Experience Points and %d Allied Notes for the battle in %s!',

    -- NEW 32: Single Primary Reward Messages (Used if Allied Notes = 0)
    PLAYER_REWARD_JP_SINGLE_FMT = '[REWARD] You earned %d Job Points for the battle in %s!',
    PLAYER_REWARD_MERIT_SINGLE_FMT = '[REWARD] You earned %d Merit Points for the battle in %s!',
    PLAYER_REWARD_EXP_SINGLE_FMT = '[REWARD] You earned %d Experience Points for the battle in %s!',
    
    -- Allied Notes Reward Message (Used if primary reward = 0)
    PLAYER_REWARD_NOTES_FMT = '[REWARD] You earned %d Allied Notes for the battle in %s!',
}

-- =======================================
-- UTILITY FUNCTIONS
-- =======================================

-- Helper function to concatenate all arguments into a single string, escape '%', and append a newline.
local function createLogString(...)
    local args = {...}
    local log_parts = {}
    for i, v in ipairs(args) do
        local s = tostring(v)
        -- Escape '%' characters for printf-like C++ functions
        s = s:gsub("%%", "%%%%")
        table.insert(log_parts, s)
    end
    return table.concat(log_parts, " ") .. "\n" -- Append newline here!
end

-- Info level logging.
function log_debug(...)
    local status, err = pcall(print, "INFO: " .. createLogString(...))
    if not status then
        print("ERROR (log_debug fallback): Failed to log: " .. tostring(err) .. "\n")
    end
end

-- Debug level logging.
function log_debug(...)
    -- Check the toggle before processing
    if not ENABLE_DEBUG_LOGS then return end

    local status, err = pcall(print, "DEBUG: " .. createLogString(...))
    if not status then
        print("ERROR (log_debug fallback): Failed to log: " .. tostring(err) .. "\n")
    end
end

---@nodiscard
---Normalizes a zone name string for display by replacing underscores with spaces.
---@param zoneName string The raw zone name with underscores.
---@return string The formatted zone name for display.
local function getDisplayZoneName(zoneName)
    -- The gsub function replaces all occurrences of "_" with a space.
    return zoneName:gsub('_', ' ')
    end

---Broadcasts a message globally to all players by iterating through all zones.
---@param message string The message to send to all players.
---@param includeSeparator boolean|nil Whether to include the separator line before the message. Defaults to true.
local function broadcastCampaignAnnouncement(message, includeSeparator)
    -- Default to true if not provided
    local includeSep = includeSeparator == nil or includeSeparator 

    -- Iterate through all possible zones (assuming 299 is the upper limit for zone IDs)
    for i = 1, 299 do
        local zone = GetZone(i)
        if zone then
            local zonex = zone:getPlayers()
            for _, member in pairs(zonex) do
                -- Retrieve the player's CHARACTER variable setting for announcements.
                local msgSetting = member:getCharVar("CampaignMSG")

                -- Convert the CharVar to a number. 
                -- If it's nil or an empty string (unset), it defaults to 0 (receive messages).
                local suppress = tonumber(msgSetting) or 0

                -- Announce only if the 'suppress' value is NOT exactly 1 (the number).
                if suppress ~= 1 then
                    if includeSep then
                        -- Send separator line
                        -- FIX: MESSAGES is now guaranteed to be initialized.
                        member:printToPlayer(MESSAGES.SEPARATOR, xi.msg.channel.SYSTEM_3)
                    end
                    -- Send the actual message
                    member:printToPlayer(message, xi.msg.channel.SYSTEM_3)
                end
            end
        end
    end
end


---Immediately despawns all currently spawned mobs that are part of the campaign battle.
---This relies on LUA local variables which are NOT persisted across server restarts.
---Therefore, it's only reliable for in-session despawns (Player Win/Normal Timeout).
local function despawnAllBattleMobs()
    log_debug("[CampaignBattleHandler] Despawning all active battle mobs (in-session cleanup).")
    
    -- Iterate over all zones where a battle could be
    -- NOTE: BATTLE_ZONES is guaranteed to be initialized now.
    for _, zoneConfig in pairs(BATTLE_ZONES) do
        local zone = GetZone(zoneConfig.zoneID)
        if zone then
            -- Get all mobs in the zone
            local mobs = zone:getMobs()
            for _, mob in pairs(mobs) do
                -- Only attempt to access local vars if the mob object exists
                if mob then 
                    -- Check for LUA local variables (lost on server crash)
                    if mob:getLocalVar('BattleStartHour') ~= nil and mob:getLocalVar('IsCampaignMob') == 1 then
                        -- This mob is part of the current battle.
                        DespawnMob(mob:getID())
                        log_debug("Despawned campaign mob ID: " .. mob:getID() .. " (Unit: " .. mob:getName() .. ")")
                    end
                end
            end
        end
    end
    log_debug("[CampaignBattleHandler] Global in-session despawn complete.")
end

---@nodiscard
---Calculates the number of hours elapsed between a start and current hour,
---handling the 24-hour cycle wrap-around (e.g., 23:00 to 01:00 is 2 hours).
---@param startHour number The hour the event began (0-23).
---@param currentHour number The current hour (0-23).
---@return number The total hours elapsed.
local function calculateHoursElapsed(startHour, currentHour)
    local diff = currentHour - startHour
    if diff < 0 then 
        diff = diff + 24
    end
    return diff
end

---@nodiscard
---Loads the persisted battle configuration from server variables into local LUA objects.
---@return table|nil selectedZone The zone configuration table, or nil if not found.
---@return table|nil selectedArmy The army configuration table, or nil if not found.
---@return table|nil selectedUnit The unit configuration table, or nil if not found.
local function loadPersistedBattleConfig()
    local zoneIndex = GetServerVariable(SELECTED_ZONE_INDEX_VAR) or 0
    local armyIndex = GetServerVariable(SELECTED_ARMY_INDEX_VAR) or 0
    local unitIndex = GetServerVariable(SELECTED_UNIT_INDEX_VAR) or 0

    if zoneIndex == 0 or armyIndex == 0 or unitIndex == 0 then
        log_debug("[CampaignBattleHandler] No valid persisted configuration indices found.")
        return nil, nil, nil
    end

    local selectedZone = BATTLE_ZONES[zoneIndex]
    local selectedArmy = ARMIES[armyIndex]

    -- Defensive check for unit existence
    local selectedUnit
    if selectedArmy and selectedArmy.units and selectedArmy.units[unitIndex] then
        selectedUnit = selectedArmy.units[unitIndex]
    end

    if not selectedZone or not selectedArmy or not selectedUnit then
        log_debug("[CampaignBattleHandler] ERROR: Persisted indices point to invalid config. Resetting state.")
        SetServerVariable(BATTLE_STATE_VAR, 0)
        return nil, nil, nil
    end

    log_debug("[CampaignBattleHandler] Loaded persisted config: ZoneIdx:", zoneIndex, " ArmyIdx:", armyIndex, " UnitIdx:", unitIndex)
    return selectedZone, selectedArmy, selectedUnit
end

---Updates the global LUA announcement variables for use by functions like onMobDeath.
---@param zone table
---@param army table
---@param unit table
local function updateGlobalAnnouncementState(zone, army, unit)
    currentBattleLocationName = getDisplayZoneName(zone.zoneName)
    currentAttackingArmyName = army.name
    currentAttackingUnitName = unit.unitname
end

---Helper function to increment a specific charVar for a player.
---@param player CPlayer The player to award points to.
---@param varName string The charVar key (e.g., 'PB_WSUseCount').
---@param multiplier number The point value for this event.
local function trackPlayerContribution(player, varName, multiplier)
    -- This check is crucial to ensure we only track real players
    if player and player:isPC() then
        local currentScore = player:getCharVar(varName)
        local newScore = currentScore + multiplier
        player:setCharVar(varName, newScore)
        log_debug(string.format("[Score] Player %s gained %d points for %s. Total: %d", 
                  player:getName(), multiplier, varName, newScore))
    end
end

---@nodiscard
---Checks the player for the highest rank Key Item in the KI_REWARD_BONUS_CONFIG
---and returns the corresponding modifier object.
---@param player CPlayer The player to check.
---@return table|nil The modifier table {max_reward_mod, notes_threshold_mod} or nil.
local function findHighestRankKIModifier(player)
-- Iterate backward from the highest rank (end) to the lowest (start)
for i = #KI_REWARD_BONUS_CONFIG, 1, -1 do
local ki = KI_REWARD_BONUS_CONFIG[i]

-- Look up the Key Item ID constant using the string name (ki.ki_name).
-- We default to the string name itself if the lookup fails, for compatibility.
local kiIdentifier = ki.ki_name
if type(ki.ki_name) == 'string' and xi and xi.keyItem then
-- Attempt to get the actual integer ID from the global xi.keyItem table
local kiId = xi.keyItem[ki.ki_name]
if kiId then
kiIdentifier = kiId
end
end

-- player:hasKeyItem() now receives either the integer ID or the fallback string
local hasKi = player:hasKeyItem(kiIdentifier)

if hasKi then
log_debug(string.format("[KI Bonus] Player %s has highest rank KI: %s. Applying %.2fx Max Reward Mod and %.2fx Notes Threshold Mod.", 
player:getName(), ki.ki_name, ki.max_reward_mod, ki.notes_threshold_mod))
return ki
end
end

    return nil -- No matching Key Item found
end


---Logs the detailed battle results and announces the MVP to the world.
---@param zone CZone The zone object where the battle took place.
local function debugLogBattleResults(zone)
    log_debug(MESSAGES.SEPARATOR)
    log_debug("[BATTLE RESULTS] Calculating MVP score for all participants.")

    local maxScore = 0
    local mvpPlayer = nil
    local allPlayers = zone:getPlayers()

    for _, player in pairs(allPlayers) do
        if player and player:isPC() then
            local totalPoints = 0
            
            -- Tally score from all contribution variables (DO NOT RESET HERE)
            for _, varName in pairs(CONTRIBUTION_VARS) do
                local score = player:getCharVar(varName) or 0
                totalPoints = totalPoints + score
            end
            
            -- Note: MVP is calculated only on base points, as KI bonuses now only affect max rewards.
            local kiBonus = findHighestRankKIModifier(player) -- Find the KI if needed for debugging or logging
            local finalTotalPoints = totalPoints
            -- Removed point_mod application to finalTotalPoints as per user request.

            if finalTotalPoints > maxScore then
                maxScore = finalTotalPoints
                mvpPlayer = player
            end

            log_debug(string.format("[SCORE TALLY] %s final score: %d (Base: %d)", player:getName(), finalTotalPoints, totalPoints))
        end
    end

    --if mvpPlayer and maxScore > 0 then
        -- Announce the MVP using the custom format
    --    local message = string.format(MESSAGES.BATTLE_WINNER_FMT, mvpPlayer:getName(), maxScore)
    --    broadcastCampaignAnnouncement(message, true) -- Use separator for world announcement
    --    log_debug(string.format("[BATTLE RESULTS] MVP: %s with %d points.", mvpPlayer:getName(), maxScore))
    --else
        -- Only announce a separator if the reward system logic hasn't already done it via total defeat.
        -- We can skip this conditional check for simplicity as the MVP announcement is the main purpose.

        --broadcastCampaignAnnouncement("The battle has ended! No MVP awarded as no players scored.", true)

    --    log_debug("[BATTLE RESULTS] No participation score detected. No MVP awarded.")
    --end

    log_debug(MESSAGES.SEPARATOR)
end

---Award all players in the zone rewards based on their contribution score and the battle result.
---@param zone CZone The zone object where the battle took place.
---@param isPlayerVictory boolean True if the players won the battle (Total Defeat or HP Reduction Win).
local function awardBattleRewards(zone, isPlayerVictory)
    log_debug(MESSAGES.SEPARATOR)
    log_debug("[REWARDS] Starting reward calculation. Player Victory: ", tostring(isPlayerVictory))

    local allPlayers = zone:getPlayers()
    local rewardMultiplier = REWARD_MULTIPLIER
    local rewardBonusMsg = ""

    -- Apply the win bonus multiplier
    if isPlayerVictory then
        rewardMultiplier = rewardMultiplier * PLAYER_VICTORY_BONUS_MULTIPLIER
        rewardBonusMsg = string.format(" (%.1fx Victory Bonus)", PLAYER_VICTORY_BONUS_MULTIPLIER)
    end
    
    log_debug(string.format("[REWARDS] Final Score Multiplier: %.2f%s", rewardMultiplier, rewardBonusMsg))

    for _, player in pairs(allPlayers) do
        -- Only consider players who are still in the battle zone and are PCs
        if player and player:isPC() and player:getZoneID() == zone:getID() then
            local totalPoints = 0
            
            -- Tally score from all contribution variables and reset them
            for event, varName in pairs(CONTRIBUTION_VARS) do
                local score = player:getCharVar(varName) or 0
                totalPoints = totalPoints + score
                -- Cleanup: Reset the charVar immediately after fetching it
                player:setCharVar(varName, 0)
            end

            -- *** NEW 34: Apply Key Item Bonuses to Max Rewards and Notes Threshold ***
            local kiBonus = findHighestRankKIModifier(player)
            local pointsToReward = totalPoints -- Base points remain unmodified as per user request
            local notesThreshold = ALLIED_NOTES_THRESHOLD -- Start with base threshold
            local maxRewardMod = 1.0 -- Default: no max limit increase

            if kiBonus then
                -- 1. Load Max Reward Modifier (for JP/Merits/EXP/Notes maximums)
                maxRewardMod = kiBonus.max_reward_mod
                
                -- 2. Apply threshold modifier (e.g., 0.95 reduces the required threshold)
                notesThreshold = math.floor(ALLIED_NOTES_THRESHOLD * kiBonus.notes_threshold_mod)
                log_debug(string.format("[KI Bonus] %s's max rewards boosted (%.2fx). Notes Threshold reduced from %d to %d (%.2fx).",
                          player:getName(), maxRewardMod, ALLIED_NOTES_THRESHOLD, notesThreshold, kiBonus.notes_threshold_mod))
            end
            
            -- Clamp the calculated pointsToReward to the maximum allowed amount.
            if pointsToReward > MAX_POINTS_PER_BATTLE then
                pointsToReward = MAX_POINTS_PER_BATTLE
            end

            if pointsToReward > 0 then
                local currentCumulativeScore = player:getCharVar(CUMULATIVE_SCORE_VAR) or 0
                local newCumulativeScore = currentCumulativeScore + pointsToReward
                player:setCharVar(CUMULATIVE_SCORE_VAR, newCumulativeScore)
                log_debug(string.format("[REWARDS] %s Lifetime Score: %d (Current: %d)", player:getName(), newCumulativeScore, pointsToReward))
            end

            -- Only reward players who participated
            if pointsToReward > 0 then
                
                -- Calculate base reward amount (Score * Multiplier) and floor it to an integer
                local baseRewardAmount = math.floor(pointsToReward * rewardMultiplier)
                
                -- *** Apply KI Max Reward Modifiers ***
                local modifiedMaxJobPoints = math.floor(MAX_JOB_POINTS_REWARD * maxRewardMod)
                local modifiedMaxMeritPoints = math.floor(MAX_MERIT_POINTS_REWARD * maxRewardMod)
                local modifiedMaxExpReward = math.floor(MAX_EXP_REWARD * maxRewardMod)
                local modifiedMaxAlliedNotes = math.floor(MAX_ALLIED_NOTES_REWARD * maxRewardMod)
                
                -- Variables for primary reward logic
                local mainJobLevel = player:getMainLvl() or 0
                local finalRewardAmount = 0
                local primaryRewardName = "" 
                local primaryRewardAction = function() end -- Function to execute the primary reward

                if mainJobLevel < 99 then
                    -- Player is below max level: Give EXP
                    primaryRewardName = "Experience Points"
                    -- Use the modified max limit here
                    finalRewardAmount = math.floor(math.min(baseRewardAmount, modifiedMaxExpReward))
                    primaryRewardAction = function(amount) player:addExp(amount) end
                else
                    -- Player is max level: Give JP or Merits based on the toggle
                    if AWARD_JOB_POINTS then
                        primaryRewardName = "Job Points"
                        
                        local mainJob = player:getMainJob()
                        -- 1. Get the player's current job points for the main job.
                        local currentJobPoints = player:getJobPoints(mainJob) 
                        
                        -- 2. Calculate the maximum reward the event allows (e.g., max 5000 per award).
                        local calculatedReward = math.min(baseRewardAmount, modifiedMaxJobPoints)
                        
                        -- 3. Determine how much space is left before hitting the global cap (MAX_TOTAL_JOB_POINTS).
                        local remainingSpace = 500 - currentJobPoints
                        
                        -- 4. Set the final amount: it's the smaller of the calculated reward or the remaining space.
                        -- Use math.max(0, ...) to ensure the amount is never negative if they are already capped.
                        finalRewardAmount = math.floor(math.max(0, math.min(calculatedReward, remainingSpace)))
                        
                        primaryRewardAction = function(amount) 
                            local job = player:getMainJob()
                            if amount > 0 then
                                player:addJobPoints(job, amount)
                            end
                        end
                    else
                        primaryRewardName = "Merit Points"
                        -- Use the modified max limit here
                        finalRewardAmount = math.floor(math.min(baseRewardAmount, modifiedMaxMeritPoints))
                        primaryRewardAction = function(amount) player:addMerits(amount) end
                    end
                end

                -- Execute primary reward action
                if finalRewardAmount > 0 then
                    primaryRewardAction(finalRewardAmount)
                end
                
                -- =========================================================
                -- Allied Notes Reward Calculation and Awarding
                -- =========================================================
                local notesRewardAmount = 0
                
                -- Calculate base notes reward (Score * Notes Rate)
                local baseNotesAmount = math.floor(pointsToReward * ALLIED_NOTES_RATE)
                
                -- Apply threshold and modifier if applicable (using the KI-modified notesThreshold)
                if baseNotesAmount >= notesThreshold then
                    baseNotesAmount = math.floor(baseNotesAmount * ALLIED_NOTES_MODIFIER)
                    log_debug(string.format("[REWARDS] Allied Notes Threshold Met! Base amount modified to %d. (Modified Threshold: %d)", baseNotesAmount, notesThreshold))
                end

                -- Apply modified max limit and ensure result is non-negative integer
                -- Use the modified max limit here
                notesRewardAmount = math.floor(math.min(baseNotesAmount, modifiedMaxAlliedNotes))
                
                -- Award the Allied Notes currency
                if notesRewardAmount > 0 then
                    player:addCurrency("allied_notes", notesRewardAmount)
                end
                
                -- =========================================================
                -- NEW 32: Combined Message Generation
                -- =========================================================
                local rewardMsgFmt = ""
                local rewardMsg = ""

                if finalRewardAmount > 0 and notesRewardAmount > 0 then
                    -- Use the combined format
                    if primaryRewardName == "Experience Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_EXP_COMBINED_FMT
                    elseif primaryRewardName == "Job Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_JP_COMBINED_FMT
                    elseif primaryRewardName == "Merit Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_MERIT_COMBINED_FMT
                    end
                    -- Fill the combined format with both amounts
                    rewardMsg = string.format(rewardMsgFmt, finalRewardAmount, notesRewardAmount, currentBattleLocationName)

                elseif finalRewardAmount > 0 then
                    -- Only primary reward is present: Use the single primary format
                    if primaryRewardName == "Experience Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_EXP_SINGLE_FMT
                    elseif primaryRewardName == "Job Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_JP_SINGLE_FMT
                    elseif primaryRewardName == "Merit Points" then
                        rewardMsgFmt = MESSAGES.PLAYER_REWARD_MERIT_SINGLE_FMT
                    end
                    -- Fill the single format with the primary amount
                    rewardMsg = string.format(rewardMsgFmt, finalRewardAmount, currentBattleLocationName)

                elseif notesRewardAmount > 0 then
                    -- Only Allied Notes reward is present: Use the single notes format
                    rewardMsgFmt = MESSAGES.PLAYER_REWARD_NOTES_FMT
                    -- Fill the single format with the notes amount
                    rewardMsg = string.format(rewardMsgFmt, notesRewardAmount, currentBattleLocationName)

                end

                -- Send the final reward message if any reward was given
                if rewardMsg ~= "" then
                    player:printToPlayer(rewardMsg, xi.msg.channel.SYSTEM_3)
                end
                
                -- Always log the reward calculation result (using the determined reward names)
                local primaryLogName = finalRewardAmount > 0 and primaryRewardName or "0"
                
                log_debug(string.format("[REWARDS] %s (Lvl %d) awarded %d %s and %d Allied Notes (Score: %d, Base Score: %d)", 
                          player:getName(), mainJobLevel, finalRewardAmount, primaryLogName, notesRewardAmount, pointsToReward, totalPoints))
            else
                log_debug(string.format("[REWARDS] %s did not participate (score 0). No reward.", player:getName()))
            end
        end
    end
    
    log_debug("[REWARDS] Reward calculation complete.")
    log_debug(MESSAGES.SEPARATOR)
end

-- =======================================
-- DYNAMIC ENTITY SPAWNING
-- =======================================

---Spawns the commander and regular units for a selected enemy unit around the battle location.
---@param zone CZone The zone object where the battle will take place.
---@param selectedZone table The configuration table for the zone (contains SPAWN_AREA).
---@param selectedUnit table The configuration table for the enemy unit to spawn.
---@param battleFightStartHour number The hour (0-23) the fight officially started.
local function spawnArmy(zone, selectedZone, selectedUnit, battleFightStartHour)
    
    local totalUnitsToSpawn = selectedUnit.commander.qty + selectedUnit.regulars.qty
    
    -- Fort geometry parameters (now includes Y)
    local centerX = selectedZone.fortCenterPos.x
    local centerY = selectedZone.fortCenterPos.y -- The exact ground/floor height of the fort center
    local centerZ = selectedZone.fortCenterPos.z
    
    -- Calculate half-width, including buffer for safety
    local halfSafeWidth = (selectedZone.fortWidth / 2) + SAFE_SPAWN_BUFFER 
    
    -- Define the exclusion zone boundaries (min/max X and Z values *inside* the fort)
    local minSafeX = centerX - halfSafeWidth
    local maxSafeX = centerX + halfSafeWidth
    local minSafeZ = centerZ - halfSafeWidth
    local maxSafeZ = centerZ + halfSafeWidth

    log_debug("[CampaignBattleHandler] Fort Exclusion Zone defined. Center (X,Z):", centerX, centerZ, " Half-Width (with buffer):", halfSafeWidth)
    log_debug("[CampaignBattleHandler] Exclusion Bounds: X(", minSafeX, ", ", maxSafeX, ") Z(", minSafeZ, ", ", maxSafeZ, ")")
    
    -- Use the fort's central Y coordinate plus a small offset for safe spawning.
    local safeY = centerY + MOB_Y_OFFSET 

    -- *** SET GLOBAL LUA STATE VARIABLES FOR MOB TRACKING ***
    battleMobCount = totalUnitsToSpawn
    mobsDefeatedCount = 0

    -- FIX 26: Reset the persistent Max HP tracker before spawning any mobs.
    SetServerVariable(TOTAL_STARTING_MAX_HP_VAR, 0)
    
    log_debug("[CampaignBattleHandler] Battle started at hour: ", battleFightStartHour, ". Will last for ", BATTLE_DURATION_HOURS, " hours.")
    
    ---@private
    ---Function to generate a random coordinate (X or Z) that is OUTSIDE the exclusion zone.
    ---@param center number The center coordinate (X or Z).
    ---@param halfWidth number The half-width of the exclusion zone (including buffer).
    ---@return number The safe spawn coordinate.
    local function generateSafeCoord(center, halfWidth)
        -- The desired spawn range is between (center - MAX_SPAWN_DISTANCE) and 
        -- (center + MAX_SPAWN_DISTANCE), but *excluding* the (center - halfWidth) 
        -- to (center + halfWidth) range.
        
        -- The two valid outer ranges are:
        local outerRangeMin1 = center - MAX_SPAWN_DISTANCE
        local outerRangeMax1 = center - halfSafeWidth
        local outerRangeMin2 = center + halfSafeWidth
        local outerRangeMax2 = center + MAX_SPAWN_DISTANCE

        local range1Size = outerRangeMax1 - outerRangeMin1
        local range2Size = outerRangeMax2 - outerRangeMin2
        local totalRange = range1Size + range2Size

        if totalRange <= 0 then
            -- Fallback: If MAX_SPAWN_DISTANCE is too small, just spawn at the edge.
            log_debug("Warning: Spawn range too small, spawning at edge of exclusion zone.")
            -- Randomly pick the positive or negative edge
            return center + halfWidth * (math.random() > 0.5 and 1 or -1)
        end

        -- Pick a random distance from the total outer range
        local randomDistance = math.random() * totalRange
        
        local finalCoord
        if randomDistance <= range1Size then
            -- Spawn in the first outer quadrant (e.g., far West/North)
            finalCoord = outerRangeMin1 + randomDistance
        else
            -- Spawn in the second outer quadrant (e.g., far East/South)
            finalCoord = outerRangeMin2 + (randomDistance - range1Size)
        end
        
        return finalCoord
    end
    
    ---@private
    ---Spawn function for both commander and regulars, now including optional entityFlags.
    ---@param unitConfig table The configuration table for the unit (commander or regulars).
    ---@param mobLevel number The level to set the mob to.
    ---@param entityFlags number The entity flags to set on the mob (0 for regulars).
    ---@param hppModValue number The HPP modifier value (e.g., 600 for +600%).
    local function insertUnit(unitConfig, mobLevel, entityFlags, hppModValue)
        local totalQty = unitConfig.qty
        local unitName = unitConfig.outfitname or unitConfig.unitname -- Use outfitname if available
        local rawLook = unitConfig.look 

        -- FIX 12: Simplified logging
        log_debug(string.format("Spawning %d instances of %s (Level: %d)", 
                    totalQty, unitName, mobLevel))

        for i = 1, totalQty do
            -- !!! DYNAMIC SAFE SPAWN LOGIC !!!
            local final_x = generateSafeCoord(centerX, halfSafeWidth)
            local final_z = generateSafeCoord(centerZ, halfSafeWidth)
            local final_y = safeY -- Use the pre-calculated safe height from the fort's Y center

            local final_rot = math.random(0, 255)

            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = unitName,
                look = rawLook, 
                x = final_x,
                y = final_y, -- Use the calculated safe height
                z = final_z,
                rotation = final_rot, 
                groupId = unitConfig.groupid,
                groupZoneId = unitConfig.zoneid,
                allegiance = 0, 
                widescan = 1,

                onMobSpawn = function(mob, _, _)

                    mob:setMobLevel(mobLevel) 

                    --update and increase Commander/Regulars HPP
                    mob:addMod(xi.mod.HPP, MOB_HPP_MOD)
                    mob:updateHealth()
                    mob:addHP(mob:getMaxHP())

                    -- FIX 26 CRITICAL: Calculate and persist the total Max HP after mods for the win condition baseline
                    local finalMaxHP = mob:getMaxHP()
                    local currentTotal = GetServerVariable(TOTAL_STARTING_MAX_HP_VAR) or 0
                    SetServerVariable(TOTAL_STARTING_MAX_HP_VAR, currentTotal + finalMaxHP)
                    
                    log_debug(unitName .. " (ID: " .. mob:getID() .. ") Final Max HP: " .. finalMaxHP .. ". Persistent Total HP updated to: " .. (currentTotal + finalMaxHP))
                    
                    --Set misc stats and mods
                    mob:addMod(xi.mod.DMG, -1000)
                    mob:addMod(xi.mod.ATT, -1000)
                    mob:addMod(xi.mod.ACC, -1000)
                    mob:addMod(xi.mod.EVA, -500)
                    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 50) 
                    mob:setMobMod(xi.mobMod.NO_AGGRO, 0) 
                    mob:setMobMod(xi.mobMod.NO_DROPS, 1) 
                    mob:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE) 
                    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                                    
                    
                    -- APPLY ENTITY FLAGS (Commander specific)
                    if entityFlags and entityFlags > 0 and xi.mobMod.ENTITY_FLAGS ~= nil then
                        mob:setMobMod(xi.mobMod.ENTITY_FLAGS, entityFlags)
                        log_debug(unitName .. " set with ENTITY_FLAGS: " .. entityFlags)
                    end

                    -- FIX: Ensure local variables are set after all mob mod logic. These are critical for despawn!
                    mob:setLocalVar('BattleStartHour', battleFightStartHour) -- The hour the *fight* began
                    mob:setLocalVar('IsCampaignMob', 1) 
                end,

                onMobFight = function(mob, target)
                    -- Add contribution listeners only if the target is a player
                    if target and target:isPC() then

                        -- ABILITY_USE: Entity (player), Target (mob), Ability, action
                        mob:addListener('ABILITY_USE', LISTENER_ID_PREFIX .. 'ABILITY_USE', function(player, mobTarget, ...)
                            trackPlayerContribution(player, CONTRIBUTION_VARS.ABILITY_USE, POINT_MULTIPLIERS.ABILITY_USE)
                        end)

                        -- MELEE_SWING_HIT: Entity (player), Target (mob), attack
                        mob:addListener('MELEE_SWING_HIT', LISTENER_ID_PREFIX .. 'MELEE_SWING_HIT', function(player, mobTarget, ...)
                            trackPlayerContribution(player, CONTRIBUTION_VARS.MELEE_SWING_HIT, POINT_MULTIPLIERS.MELEE_SWING_HIT)
                        end)
                        
                        -- CRITICAL_TAKE: Target (mob), Attacker (player)
                        mob:addListener('CRITICAL_TAKE', LISTENER_ID_PREFIX .. 'CRITICAL_TAKE', function(mob, attacker, ...)
                            trackPlayerContribution(attacker, CONTRIBUTION_VARS.CRITICAL_TAKE, POINT_MULTIPLIERS.CRITICAL_TAKE)
                        end)

                        -- WEAPONSKILL_USE: Entity (player), Target (mob), Skillid, TP, action
                        mob:addListener('WEAPONSKILL_USE', LISTENER_ID_PREFIX .. 'WEAPONSKILL_USE', function(player, mobTarget, ...)
                            trackPlayerContribution(player, CONTRIBUTION_VARS.WEAPONSKILL_USE, POINT_MULTIPLIERS.WEAPONSKILL_USE)
                        end)

                        -- MAGIC_USE: Entity (player), Target (mob), Spell, action
                        mob:addListener('MAGIC_USE', LISTENER_ID_PREFIX .. 'MAGIC_USE', function(player, mobTarget, ...)
                            trackPlayerContribution(player, CONTRIBUTION_VARS.MAGIC_USE, POINT_MULTIPLIERS.MAGIC_USE)
                        end)
                        
                        -- RANGE_STATE_EXIT: Entity (player), Target (mob), action
                        mob:addListener('RANGE_STATE_EXIT', LISTENER_ID_PREFIX .. 'RANGE_STATE_EXIT', function(player, mobTarget, ...)
                            trackPlayerContribution(player, CONTRIBUTION_VARS.RANGE_STATE_EXIT, POINT_MULTIPLIERS.RANGE_STATE_EXIT)
                        end)
                        
                        log_debug("Added campaign contribution listeners to mob ID: " .. mob:getID())
                    end
                end,

                onMobRoam = function(mob)
                    -- Logic remains unchanged
                end,

                onMobDeath = function(mob, playerArg, optParams)
                    log_debug(unitName .. " has been defeated. Checking battle status...")
                    
                    -- *** REMOVE LISTENERS ON DEATH ***
                    for eventName, _ in pairs(POINT_MULTIPLIERS) do
                        mob:removeListener(LISTENER_ID_PREFIX .. eventName)
                    end
                    log_debug("Removed campaign contribution listeners from mob ID: " .. mob:getID())
                    
                    -- Increment the global counter
                    mobsDefeatedCount = mobsDefeatedCount + 1
                    
                    -- Check if all mobs are defeated (Player Win condition)
                    if mobsDefeatedCount >= battleMobCount then
                        -- Send global announcement that the battle is over
                        local message = string.format(MESSAGES.BATTLE_END_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                        broadcastCampaignAnnouncement(message)
                        
                        -- *** CRITICAL: LOG AND CLEAN PLAYER SCORES BEFORE STATE RESETS ***
                        local battleZoneObj = GetZone(mob:getZoneID())
                        if battleZoneObj then
                            -- 1. Log results and announce MVP
                            debugLogBattleResults(battleZoneObj)
                            -- 2. Award rewards (True = Player Victory)
                            awardBattleRewards(battleZoneObj, true)
                        end

                        -- *** END BATTLE STATE AND START COOLDOWN ***
                        SetServerVariable(BATTLE_STATE_VAR, 0) -- Back to inactive/cooldown
                        -- Cooldown starts on the hour the battle ends
                        SetServerVariable(LAST_BATTLE_END_HOUR_VAR, VanadielHour()) 
                        SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Prevents timeout logic from triggering

                        -- *** LOG BATTLE RESULT: PLAYER WIN (Total Defeat) ***
                        SetServerVariable(LAST_BATTLE_RESULT_VAR, 1) -- 1 = Player Win
                        log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Player Victory (1) via Total Defeat.")

                        -- Reset counters
                        battleMobCount = 0
                        mobsDefeatedCount = 0
                    end

                    -- Despawn 5 seconds after death
                    mob:timer(1000, function(m) DespawnMob(m:getID()) end) 
                end,

                onMobDespawn = function(mob, _, _)
                    log_debug(unitName .. " entity has been successfully removed from the zone.")
                end,

                releaseIdOnDisappear = true,
                specialSpawnAnimation = true, 
            })
            
            -- Set spawn position before the entity is created in the world.
            mob:setSpawn(final_x, final_y, final_z, final_rot)
            
            mob:setDropID(0) -- Ensure no native drops
            mob:setMobMod(xi.mobMod.NO_DROPS, 1) 
            mob:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE) -- Ensure claimable is explicitly set if desired
            mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1) 
            mob:spawn()
            
            -- *** UPDATED LOGGING HERE: Showing final planned coordinates ***
            log_debug(string.format("Inserted: %s (Entity ID: %d, Raw Look Value: %s) at X: %.2f, Y: %.2f, Z: %.2f",
                unitName,
                mob:getID(),
                rawLook,
                final_x,
                final_y,
                final_z
            ))
            
            -- Check if the mob was successfully added to the zone by checking its ID
            if mob:getID() == 0 then
                log_debug("[CampaignBattleHandler] CRITICAL ERROR: Mob entity (", unitName, ") failed to spawn successfully. Raw Look Value: ", rawLook, ". Please check if this Look Value is valid for the zone.")
            end
        end
    end

    -- 1. Spawn Commander Units
    local commanderFlags = selectedUnit.commander.entityFlags or 0
    -- PASS THE COMMANDER HPP MOD VALUE
    insertUnit(selectedUnit.commander, BATTLE_LEVEL_COMMANDER, commanderFlags, COMMANDER_HPP_MOD)

    -- 2. Spawn Regular Units
    local regularsFlags = 0 -- Regulars have no special flags
    -- PASS THE REGULAR HPP MOD VALUE
    insertUnit(selectedUnit.regulars, BATTLE_LEVEL_REGULAR, regularsFlags, REGULAR_HPP_MOD)

    log_debug("[CampaignBattleHandler] Army spawn complete. Mobs will despawn after ", BATTLE_DURATION_HOURS, " game hours.")
end


-- =======================================
-- HOURLY EVENT LOGIC
-- =======================================

---Main logic for the hourly event. This function is triggered by the onGameHour event
---for the specific zone it is hooked into.
---@param zone CZone
m:addOverride('xi.zones.' .. EVENT_HOST_ZONE_NAME .. '.Zone.onGameHour', function(zone)
    local currentHour = VanadielHour()
    local battleState = GetServerVariable(BATTLE_STATE_VAR) or 0
    
    -- Load Configuration only if we are in a state other than Inactive/Cooldown
    local selectedZone, selectedArmy, selectedUnit
    if battleState > 0 then
        selectedZone, selectedArmy, selectedUnit = loadPersistedBattleConfig()
        if not selectedZone then 
            log_debug("[CampaignBattleHandler] Failed to load persisted state. Resetting to Inactive (0).")
            SetServerVariable(BATTLE_STATE_VAR, 0)
            battleState = 0 
        else
            updateGlobalAnnouncementState(selectedZone, selectedArmy, selectedUnit)
        end
    end

    -- --- PHASE 2: ACTIVE BATTLE CHECK (State 2) ---
    if battleState == 2 then
        local startHour = GetServerVariable(BATTLE_START_HOUR_VAR) or -1

        -- FIX 26: Load the baseline Max HP (the denominator for the win condition)
        local totalStartingMaxHP = GetServerVariable(TOTAL_STARTING_MAX_HP_VAR) or 0

        -- CRITICAL CHECK: Ensure both the start time and the baseline HP are valid
        if startHour ~= -1 and totalStartingMaxHP > 0 then
            local hoursElapsed = calculateHoursElapsed(startHour, currentHour)

            -- Check if the elapsed hours meets or exceeds the set duration
            if hoursElapsed >= BATTLE_DURATION_HOURS then
                
                local battleZoneObj = GetZone(selectedZone.zoneID)
                local totalCurrentHP = 0
                
                if battleZoneObj then
                    local mobs = battleZoneObj:getMobs()
                    
                    -- 1. Calculate combined HP from all currently alive campaign mobs
                    for _, mob in pairs(mobs) do
                        -- Check if the mob is a campaign mob and still alive
                        if mob and mob:getLocalVar('IsCampaignMob') == 1 and mob:isAlive() then
                            totalCurrentHP = totalCurrentHP + mob:getHP()
                        end
                    end
                end

                -- CRITICAL FIX 26: Remaining HP calculated against the PERSISTED STARTING MAX HP
                local remainingHPRatio = totalCurrentHP / totalStartingMaxHP 
                local remainingHPPercent = remainingHPRatio * 100
                
                log_debug(string.format("[CampaignBattleHandler] Collective Mob HP Check: Total Current HP: %d / Total STARTING Max HP: %d (%.2f%% remaining). Threshold: %d%%.", 
                                    totalCurrentHP, totalStartingMaxHP, remainingHPPercent, HP_REDUCTION_WIN_THRESHOLD))
                
                -- Check for HP REDUCTION VICTORY
                if remainingHPPercent < HP_REDUCTION_WIN_THRESHOLD then
                    
                    -- --- HP REDUCTION VICTORY (Player Win) ---
                    log_debug("[CampaignBattleHandler] HP REDUCTION VICTORY: Collective HP below threshold! Forcing Player Win.")
                    
                    local message = string.format(MESSAGES.HP_REDUCTION_VICTORY_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                    broadcastCampaignAnnouncement(message)

                    -- Log and clean player scores
                    if battleZoneObj then
                        -- 1. Log results and announce MVP
                        debugLogBattleResults(battleZoneObj)
                        -- 2. Award rewards (True = Player Victory)
                        awardBattleRewards(battleZoneObj, true)
                    end

                    -- End Battle State and Start Cooldown
                    SetServerVariable(BATTLE_STATE_VAR, 0)
                    SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
                    SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Prevents timeout logic from triggering

                    -- *** LOG BATTLE RESULT: PLAYER WIN (Total Defeat) ***
                    SetServerVariable(LAST_BATTLE_RESULT_VAR, 1) -- 1 = Player Win
                    log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Player Victory (1) via HP Reduction.")

                    -- Despawn all remaining mobs
                    despawnAllBattleMobs() 
                    
                    -- Crash Recovery Sweep (for stuck dynamic mobs)
                    if selectedZone and battleZoneObj then
                        log_debug("[CampaignBattleHandler] Running CRASH RECOVERY: Sweeping zone ", selectedZone.zoneName, " for stuck dynamic mobs after HP Victory.")
                        local mobs = battleZoneObj:getMobs()
                        local clearedCount = 0
                        for _, mob in pairs(mobs) do
                            local status, is_dynamic = pcall(mob.isDynamic, mob) 
                            if status and is_dynamic then
                                DespawnMob(mob:getID())
                                log_debug("Forced despawn of dynamic mob ID: " .. mob:getID() .. " (Unit: " .. mob:getName() .. ")")
                                clearedCount = clearedCount + 1
                            else
                                log_debug("Skipping invalid/stale mob object during HP Victory recovery sweep.")
                            end
                        end
                        log_debug("[CampaignBattleHandler] CRASH RECOVERY complete. Cleared ", clearedCount, " dynamic mobs from zone ", selectedZone.zoneName)
                    end

                    return 
                    
                else
                    -- --- ORIGINAL TIMEOUT LOGIC (Enemy Win) - falls through if no HP Reduction Victory ---
                    
                    log_debug("[CampaignBattleHandler] BATTLE TIMEOUT: Active fight duration of ", BATTLE_DURATION_HOURS, " hours expired. Forcing cleanup.")
                    
                    -- 1. ANNOUNCEMENT (Only if not announced before crash/save)
                    if GetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR) == 0 then
                        -- Announce
                        local message = string.format(MESSAGES.BATTLE_TIMEOUT_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                        broadcastCampaignAnnouncement(message)
                        SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Mark as announced
                    else
                        log_debug("[CampaignBattleHandler] Timeout already announced. Skipping announcement.")
                    end

                    -- 2. CRITICAL STATE RESET and REWARDS
                    local isPlayerVictory = false -- Enemy Win/Timeout means players lost
                    if selectedZone then
                        local battleZoneObj = GetZone(selectedZone.zoneID)
                        if battleZoneObj then
                            -- Log results and announce MVP
                            debugLogBattleResults(battleZoneObj) 
                            -- Award rewards (False = Enemy Victory/Timeout)
                            awardBattleRewards(battleZoneObj, isPlayerVictory)
                        end
                    end

                    SetServerVariable(BATTLE_STATE_VAR, 0) -- Force state back to 0
                    SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour) -- Start cooldown

                    -- *** LOG BATTLE RESULT: ENEMY WIN/TIMEOUT ***
                    SetServerVariable(LAST_BATTLE_RESULT_VAR, 2) -- 2 = Enemy Win/Timeout
                    log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Enemy Victory/Timeout (2).")

                    -- 3. DESPAWN ALL REMAINING MOBS
                    despawnAllBattleMobs() 
                    
                    -- 4. CRASH RECOVERY
                    if selectedZone then
                        local battleZoneObj = GetZone(selectedZone.zoneID)
                        if battleZoneObj then
                            log_debug("[CampaignBattleHandler] Running CRASH RECOVERY: Sweeping zone ", selectedZone.zoneName, " for stuck dynamic mobs after Enemy Victory.")
                            local mobs = battleZoneObj:getMobs()
                            local clearedCount = 0
                            for _, mob in pairs(mobs) do
                                local status, is_dynamic = pcall(mob.isDynamic, mob) 
                                if status and is_dynamic then
                                    DespawnMob(mob:getID())
                                    log_debug("Forced despawn of dynamic mob ID: " .. mob:getID() .. " (Unit: " .. mob:getName() .. ")")
                                    clearedCount = clearedCount + 1
                                else
                                    log_debug("Skipping invalid/stale mob object during main crash recovery sweep.")
                                end
                            end
                            log_debug("[CampaignBattleHandler] CRASH RECOVERY complete. Cleared ", clearedCount, " dynamic mobs from zone ", selectedZone.zoneName)
                        end
                    end

                    -- 5. Exit the function after cleanup
                    return 
                end
            else
                log_debug("[CampaignBattleHandler] Battle is Active (State 2). ", hoursElapsed, " of ", BATTLE_DURATION_HOURS, " fighting hours elapsed. Continuing.")
                return -- Battle is active and not timed out, exit the function.
            end
        else
            -- EMERGENCY FIX: If BATTLE_STATE_VAR is 2 but START_HOUR or STARTING_MAX_HP is missing,
            -- this means the state is corrupted. Force cleanup.
            log_debug("[CampaignBattleHandler] CORRUPTED STATE DETECTED. BATTLE_STATE=2 but START_HOUR/STARTING_MAX_HP is missing. Forcing state reset.")
            SetServerVariable(BATTLE_STATE_VAR, 0)
            SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
            
            -- Running Crash Recovery for good measure
            if selectedZone then
                 local battleZoneObj = GetZone(selectedZone.zoneID)
                 if battleZoneObj then
                     log_debug("[CampaignBattleHandler] Running CRASH RECOVERY (CORRUPTED STATE): Sweeping zone ", selectedZone.zoneName, " for stuck dynamic mobs.")
                     local mobs = battleZoneObj:getMobs()
                     for _, mob in pairs(mobs) do
                         -- *** FIX APPLIED HERE (Corrupted State path): Using pcall for robust object validation ***
                         local status, is_dynamic = pcall(mob.isDynamic, mob)
                         
                         if status and is_dynamic then
                             DespawnMob(mob:getID())
                         else
                             log_debug("Skipping invalid/stale mob object during corrupted state recovery sweep.")
                         end
                     end
                 end
            end
        end
    end

-- --- PHASE 1: PREPARATION CHECK (State 1) ---
    if battleState == 1 then
        local prepStartHour = GetServerVariable(BATTLE_PREP_START_HOUR_VAR) or -1

        -- *** NEW: RELOAD PERSISTED DATA FOR STATE 1 ***
        -- We must load the selected zone information from persistent variables
        -- because 'selectedZone' is only set during the State 0 'shouldStartBattle' check.
        local zoneIndex = GetServerVariable(SELECTED_ZONE_INDEX_VAR)
        local selectedZone = BATTLE_ZONES[zoneIndex] -- Assuming BATTLE_ZONES is available globally/in scope

        if not selectedZone then
            -- This means the state is corrupted or the data was lost. Force reset to State 0.
            log_error("[CampaignBattleHandler] CORRUPTED STATE: State 1 active but SELECTED_ZONE_INDEX_VAR is missing or invalid. Forcing reset to State 0.")
            SetServerVariable(BATTLE_STATE_VAR, 0)
            SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
            -- The State 0 block will run on the next tick and set CampaignBattleZone to 0.
            return
        end
        
        -- !!! FIX: Set server variable immediately upon entering a valid State 1, using the reloaded data.
        -- This ensures the variable is set even if the preparation check fails later (e.g., prepStartHour error).
        if GetServerVariable("CampaignBattleZone") ~= selectedZone.zoneID then
            SetServerVariable("CampaignBattleZone", selectedZone.zoneID)
            log_debug("[CampaignBattleHandler] Set CampaignBattleZone to Zone ID: ", selectedZone.zoneID, " (State 1: Preparation).")
        end
        -- !!! END FIX

        if prepStartHour ~= -1 then
            local hoursElapsed = calculateHoursElapsed(prepStartHour, currentHour)
            local hoursRemaining = PREP_DURATION_HOURS - hoursElapsed

            if hoursElapsed >= PREP_DURATION_HOURS then
                -- *** TRANSITION TO ACTIVE BATTLE (State 2) ***
                log_debug("[CampaignBattleHandler] PREPARATION COMPLETE. Time to attack! Transitioning to State 2 (Active Fight).")
                
                -- 1. ANNOUNCE BATTLE START
                local message = string.format(MESSAGES.BATTLE_START_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                broadcastCampaignAnnouncement(message, true)

                -- 2. SPAWN ARMY
                -- Set the official fight start hour and transition state
                SetServerVariable(BATTLE_START_HOUR_VAR, currentHour)
                SetServerVariable(BATTLE_STATE_VAR, 2)
                
                -- Spawn the army in the selected zone. This function now sets TOTAL_STARTING_MAX_HP_VAR.
                local battleZoneObj = GetZone(selectedZone.zoneID)
                if battleZoneObj then
                    spawnArmy(battleZoneObj, selectedZone, selectedUnit, currentHour)
                    
                    -- *** NEW DEFENDER COUNT ANNOUNCEMENT (After BATTLE START) ***
                    local playersInZone = battleZoneObj:getPlayers()
                    local playerCount = #playersInZone
                    local defenderMessage = string.format(MESSAGES.DEFENDER_COUNT_FMT, playerCount)
                    broadcastCampaignAnnouncement(defenderMessage, false) 
                    
                else
                    log_debug("[CampaignBattleHandler] ERROR: Zone object missing during attack! Aborting battle.")
                    SetServerVariable(BATTLE_STATE_VAR, 0)
                    SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
                    -- NOTE: CampaignBattleZone is still set to the ID, but State 0 on the next tick will fix it.
                end
                
                -- Reset the chance since a battle has started
                currentBattleChance = INITIAL_BATTLE_CHANCE
                
                return
            else
                log_debug("[CampaignBattleHandler] Battle is in PREPARATION (State 1). ", hoursElapsed, " of ", PREP_DURATION_HOURS, " hours elapsed. ", hoursRemaining, " hours remaining.")
                
                -- Announce the preparation status again every hour during the prep phase
                -- We only use the separator here if it's the first hour of prep, but since the prep announcement
                -- already uses it, we just send the defender count again for continuous updates.
                local battleZoneObj = GetZone(selectedZone.zoneID)
                local playersInZone = battleZoneObj and battleZoneObj:getPlayers() or {}
                local playerCount = #playersInZone
                
                local defenderMessage = string.format(MESSAGES.DEFENDER_COUNT_FMT, playerCount)
                broadcastCampaignAnnouncement(defenderMessage, false)

                -- The server variable is now set at the top of the State 1 block.
                
                return -- Preparation continuing, exit the function.
            end
        else
            -- Corrupted state: State 1 but start hour missing
            log_debug("[CampaignBattleHandler] CORRUPTED STATE DETECTED. BATTLE_STATE=1 but PREP_START_HOUR is missing. Forcing state reset.")
            SetServerVariable(BATTLE_STATE_VAR, 0)
            SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
        end
    end


    -- --- PHASE 0: INACTIVE / COOLDOWN / CHANCE CHECK (State 0) ---
    if battleState == 0 then
        
        -- Load and log the last result if one exists
        local lastResult = GetServerVariable(LAST_BATTLE_RESULT_VAR)
        if lastResult then
            local resultStr = (lastResult == 1 and "Player Victory") or (lastResult == 2 and "Enemy Victory/Timeout") or "Unknown"
            log_debug("[CampaignBattleHandler] Last Battle Result: ", resultStr, " (", lastResult, ")")
        end
        
        -- !!! REQUIREMENT: Set server variable to 0 in State 0
        if GetServerVariable("CampaignBattleZone") ~= 0 then
            SetServerVariable("CampaignBattleZone", 0)
            log_debug("[CampaignBattleHandler] Set CampaignBattleZone to 0 (State 0: Inactive/Cooldown).")
        end
        
        -- COOLDOWN CHECK (starts AFTER battle ends)
        local lastBattleEndHour = GetServerVariable(LAST_BATTLE_END_HOUR_VAR) or -1
        local hoursElapsed = 0
        if lastBattleEndHour ~= -1 then
            hoursElapsed = calculateHoursElapsed(lastBattleEndHour, currentHour)
        end
        
        -- Check if the minimum cooldown period has passed.
        if lastBattleEndHour ~= -1 and hoursElapsed <= BATTLE_COOLDOWN_HOURS then
            log_debug("[CampaignBattleHandler] Campaign Battle is on COOLDOWN. ", hoursElapsed, " hours have passed. Need > ", BATTLE_COOLDOWN_HOURS, " hours.")
            
            -- The chance still increases during the cooldown period.
            local newChance = math.min(100, currentBattleChance + HOURLY_CHANCE_INCREASE)
            log_debug("[CampaignBattleHandler] Increasing chance on cooldown from ", currentBattleChance, "% to ", newChance, "%.")
            currentBattleChance = newChance
            return -- Exit the function, do not run the chance check.
        end
        
        -- CHANCE CHECK
        log_debug("[CampaignBattleHandler] Checking for Campaign Battle. Current hour: ", currentHour, ":00. Chance: ", currentBattleChance, "%.")
        local shouldStartBattle = math.random(1, 100) <= currentBattleChance
        
        if shouldStartBattle then
            -- Randomly select and persist the battle configuration
            local zoneIndex = math.random(1, #BATTLE_ZONES)
            -- FIX 20: Corrected logic to select army and unit from the chosen army
            local armyIndex = math.random(1, #ARMIES) 
            
            local selectedZone = BATTLE_ZONES[zoneIndex]
            local selectedArmy = ARMIES[armyIndex]

            -- Defensive check 1: Ensure zone and army were selected successfully
            if not selectedZone or not selectedArmy then
                log_error("[CampaignBattleHandler] Failed to select valid Zone or Army configuration. Zone Index: " .. zoneIndex .. ", Army Index: " .. armyIndex)
                return
            end
            
            local unitIndex = math.random(1, #selectedArmy.units) -- Select unit from the chosen army
            local selectedUnit = selectedArmy.units[unitIndex]

            -- Defensive check 2: Ensure unit was selected successfully
            if not selectedUnit then
                log_error("[CampaignBattleHandler] Failed to select valid Unit configuration. Unit Index: " .. unitIndex)
                return
            end

            updateGlobalAnnouncementState(selectedZone, selectedArmy, selectedUnit)

            local displayZoneName = currentBattleLocationName
            local attackingArmyName = currentAttackingArmyName
            local attackingUnitName = currentAttackingUnitName
            
            local battleZoneObj = GetZone(selectedZone.zoneID)
            
            if battleZoneObj then
                -- *** START PREPARATION PHASE (State 1) ***
                log_debug("[CampaignBattleHandler] Starting PREPARATION PHASE (State 1). Duration: ", PREP_DURATION_HOURS, " hours.")

                -- Persist the choice
                SetServerVariable(SELECTED_ZONE_INDEX_VAR, zoneIndex)
                SetServerVariable(SELECTED_ARMY_INDEX_VAR, armyIndex)
                SetServerVariable(SELECTED_UNIT_INDEX_VAR, unitIndex)
                SetServerVariable(BATTLE_PREP_START_HOUR_VAR, currentHour)
                SetServerVariable(BATTLE_STATE_VAR, 1)
                SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 0) -- Reset timeout announcement flag

                -- 1. ANNOUNCE PREPARATION START (with separator)
                local prepMessage = string.format(MESSAGES.PREP_START_FMT, attackingArmyName, attackingUnitName, displayZoneName, PREP_DURATION_HOURS)
                broadcastCampaignAnnouncement(prepMessage, true)

                -- 2. ANNOUNCE DEFENDER COUNT (without separator) - Now happens on PREP START
                local playersInZone = battleZoneObj:getPlayers()
                local playerCount = #playersInZone
                local defenderMessage = string.format(MESSAGES.DEFENDER_COUNT_FMT, playerCount)
                broadcastCampaignAnnouncement(defenderMessage, false)

                -- The next hourly tick will hit State 1, which will set the CampaignBattleZone variable.
                
            else
                -- FIX 20: Added return to stop execution if GetZone fails, preventing the nil error later.
                log_debug("[CampaignBattleHandler] ERROR: Could not find zone object for zoneID ", selectedZone.zoneID, ". Aborting battle.")
                return 
            end
            
            log_debug("[CampaignBattleHandler] Campaign Battle chance check successful! Preparation started.")
            
            -- Do NOT reset chance yet. It resets when the fight starts in State 1 -> State 2 transition.
        else
            local newChance = math.min(100, currentBattleChance + HOURLY_CHANCE_INCREASE)
            log_debug("[CampaignBattleHandler] Campaign Battle check failed this hour. Increasing chance from ", currentBattleChance, "% to ", newChance, "%.")
            currentBattleChance = newChance
        end
    end

end)

return m
