-- =============================================================================
-- file: StrongholdBattles.lua
-- desc: This script handles the spawning of stronghold battles. It is designed
--       to be triggered manually (e.g., from an NPC), while the battle
--       conclusion (timeout) is still handled by the hourly game timer.
--       This is an extraction from the more complex CampaignBattleHandler.
-- =============================================================================

-- Required modules for functionality.
require("modules/module_utils")
require("scripts/utils/utils")

-- =============================================================================
-- SERVER VARIABLES
-- [StrongholdBattle]BattleState          : Tracks the current stronghold battle state (0=Inactive, 2=Active).
-- [StrongholdBattle]BattleFightStartHour : Hour (0-23) the fight started.
-- [StrongholdBattle]BattleTimeoutAnnounced : 1 if timeout was announced.
-- [StrongholdBattle]SelectedZoneIndex    : Index of the selected battle zone.
-- [StrongholdBattle]TotalStartingMaxHP   : Total max HP of all mobs at start.
-- CampaignFortifications                 : Global fortification score.
-- CampaignRecon                          : Global recon score.
-- CampaignResources                      : Global resources score.
-- CampaignSupplies                       : Global supplies score.
-- CampaignTideScore                      : Global tide score.
-- [CampaignBattleHandler]BattleState     : Tracks regular campaign battle state (checked to prevent overlap).
--
-- CHARACTER VARIABLES
-- SHB_AbilityUseCount                    : Tracks ability usage contribution points.
-- SHB_DmgDoneCount                       : Tracks damage done contribution points.
-- SHB_CriticalTakeCount                  : Tracks critical hits taken contribution points.
-- SHB_MagicUseCount                      : Tracks magic usage contribution points.
-- StrongholdMegaBossKills                : Tracks number of mega boss kills for the player.
-- SHB_DonatedResources                   : Flag (1) if player donated resources.
-- SHB_DonatedSupplies                    : Flag (1) if player donated supplies.
-- SHB_CompletedRecon                     : Flag (1) if player completed recon.
-- CampaignMSG                            : Setting (0=ON, 1=OFF) for campaign announcements.
-- =============================================================================

---@type Module
local m = Module:new('StrongholdBattles')

-- =============================================================================
-- CONFIGURATION
-- =============================================================================

local ENABLE_DEBUG_LOGS = false

-- Battle duration in game hours.
local BATTLE_DURATION_HOURS = 12 -- 30 mins

-- Win condition: If collective mob HP is below this % of STARTING HP when time runs out, players win.
local HP_REDUCTION_WIN_THRESHOLD = 0

-- Unit Level and HP Configuration
local BATTLE_LEVEL_COMMANDER = 125
local BATTLE_LEVEL_REGULAR = 119

-- HPP (HP Percent) Modifiers for Battle Units
local MANTELET_HPP_MOD = 7000
local BELFRY_HPP_MOD = 5000
local REGULAR_HPP_MOD = 4000

-- Minimum resource requirements to start a battle
local MIN_RECON_SCORE = 600
local MIN_RESOURCES = 800
local MIN_SUPPLIES = 800
local MIN_TIDE_SCORE = 60

-- Cost to start a battle (deducted from server variables)
local BATTLE_START_COST_RECON = 75
local BATTLE_START_COST_RESOURCES = 75
local BATTLE_START_COST_SUPPLIES = 75

-- Fortification changes on battle outcome
local FORTIFICATION_GAIN_ON_WIN = 100
local FORTIFICATION_LOSS_ON_DEFEAT = 15
local TIDE_SCORE_GAIN_ON_WIN = 5

-- Maximum resource values for display purposes
local MAX_RECON_SCORE = 1000
local MAX_RESOURCES = 1000
local MAX_SUPPLIES = 1000
local MAX_TIDE_SCORE = 100
local MAX_FORTIFICATIONS = 1000

-- Rank requirement to start a stronghold battle (must have one of these KIs)
local REQUIRED_RANK_KIS = {
    xi.ki.ALLIED_RIBBON_OF_BRAVERY,
    xi.ki.MYTHRIL_STAR,
    xi.ki.STEELKNIGHT_EMBLEM,
    xi.ki.WINGS_OF_INTEGRITY,
    xi.ki.DAWNLIGHT_MEDAL,
    xi.ki.ALLIED_RIBBON_OF_GLORY,
    xi.ki.GOLDEN_STAR,
    xi.ki.HOLYKNIGHT_EMBLEM,
    xi.ki.WINGS_OF_HONOR,
    xi.ki.MEDAL_OF_ALTANA,
}



-- Mob spawn geometry
local SAFE_SPAWN_BUFFER = 4
local MOB_Y_OFFSET = 1.5
local MAX_SPAWN_DISTANCE = 25

-- The zone that will host the hourly check timer.
local EVENT_HOST_ZONE_NAME = 'East_Ronfaure_[S]'

-- =============================================================================
-- MEGA BOSS CONFIGURATION
-- =============================================================================
local ENABLE_MEGA_BOSS = true
local MEGA_BOSS_LEVEL = 130
local MEGA_BOSS_HPP_MOD = 8000
local MEGA_BOSS_DMG_MOD = 150
local MEGA_BOSS_ATT_MOD = 350
local MEGA_BOSS_ACC_MOD = 150
local MEGA_BOSS_EVA_MOD = 50
local MEGA_BOSS_MEVA_MOD = 750
local MEGA_BOSS_BONUS_FORTIFICATION = 50
local MEGA_BOSS_BONUS_ALLIED_NOTES = 2000
local MEGA_BOSS_KILL_COUNT_VAR = 'StrongholdMegaBossKills'

-- =============================================================================
-- PLAYER CONTRIBUTION CONFIGURATION (from CampaignBattle.lua)
-- =============================================================================
local LISTENER_ID_PREFIX = 'STRONGHOLD_POINT_TRACKER_'

-- Point values for different actions
local POINT_MULTIPLIERS = {
    ABILITY_TAKE = 1,
    DAMAGE_DONE_HIT = 1,
    CRITICAL_TAKE = 1,
    MAGIC_USE = 1,
}

-- CharVars used to store player scores for the current battle
local CONTRIBUTION_VARS = {
    ABILITY_USE = 'SHB_AbilityUseCount',
    DAMAGE_DONE_HIT = 'SHB_DmgDoneCount',
    CRITICAL_TAKE = 'SHB_CriticalTakeCount',
    MAGIC_USE = 'SHB_MagicUseCount',
}

-- Allied Notes reward for participation (POINT-BASED)
local ALLIED_NOTES_PER_POINT = 5
local PLAYER_VICTORY_BONUS_MULTIPLIER = 1.25
local MAX_ALLIED_NOTES_REWARD = 2500 -- Maximum notes a player can get from the main battle phase.

-- Configuration for which actions grant points
local TRACKED_MAGIC_GROUPS = {
    [xi.magic.spellGroup.BLACK]     = true,
    [xi.magic.spellGroup.BLUE]      = true,
    [xi.magic.spellGroup.NINJUTSU]  = true,
    [xi.magic.spellGroup.SUMMONING] = true,
    [xi.magic.spellGroup.WHITE]     = true,
    [xi.magic.spellGroup.GEOMANCY]  = true,
    [xi.magic.spellGroup.SONG]      = true,
}

local TRACKED_DAMAGE_TYPES = {
    [xi.damageType.NONE]        = true,
    [xi.damageType.PIERCING]    = true,
    [xi.damageType.SLASHING]    = true,
    [xi.damageType.BLUNT]       = true,
    [xi.damageType.HTH]         = true,
    [xi.damageType.ELEMENTAL]   = true,
    [xi.damageType.FIRE]        = true,
    [xi.damageType.ICE]         = true,
    [xi.damageType.WIND]        = true,
    [xi.damageType.EARTH]       = true,
    [xi.damageType.THUNDER]     = true,
    [xi.damageType.WATER]       = true,
    [xi.damageType.LIGHT]       = true,
    [xi.damageType.DARK]        = true,
}

-- A compact list of Job Ability IDs to track for contribution points.
local trackedAbilityIds = {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
    33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61,
    62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 109, 110, 120, 121, 134,
    135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157,
    158, 159, 160, 161, 162, 163, 164, 165, 166, 195, 196, 197, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 220,
    221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243,
    244, 245, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271,
    272, 273, 274, 275, 276, 277, 278, 279, 284, 285, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302,
    303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325,
    326, 327, 328, 329, 330, 331, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352,
}

-- Programmatically create the lookup table for faster checks.
local JOB_ABILITIES_TO_TRACK = {}
for _, id in ipairs(trackedAbilityIds) do
    JOB_ABILITIES_TO_TRACK[id] = true
end
-- To save memory, we can clear the temporary list after it's used.
trackedAbilityIds = nil

-- =============================================================================
-- PERSISTENT STATE VARIABLES (SERVER VARS)
-- =============================================================================
local STRONGHOLD_BATTLE_STATE_VAR = '[StrongholdBattle]BattleState'               -- 0=Inactive, 2=Active
local STRONGHOLD_BATTLE_START_HOUR_VAR = '[StrongholdBattle]BattleFightStartHour' -- Hour (0-23) the fight started.
local STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR = '[StrongholdBattle]BattleTimeoutAnnounced' -- 1 if timeout was announced.
local STRONGHOLD_SELECTED_ZONE_INDEX_VAR = '[StrongholdBattle]SelectedZoneIndex'
local STRONGHOLD_TOTAL_STARTING_MAX_HP_VAR = '[StrongholdBattle]TotalStartingMaxHP'
local CAMPAIGN_FORTIFICATIONS_VAR = 'CampaignFortifications'

-- =============================================================================
-- LOCALIZED MESSAGES
-- =============================================================================
local MESSAGES = {
    SEPARATOR = '----------------[STRONGHOLD Assault]----------------',
    BATTLE_START_FMT = '[ASSAULT] An assault on %s has begun!',
    BATTLE_END_FMT = '[VICTORY] The assault of %s has been successful!',
    BATTLE_TIMEOUT_FMT = '[DEFEAT] The assault on %s has failed!',
    HP_REDUCTION_VICTORY_FMT = '[VICTORY] The assault of %s has been successful!',
    CAMPAIGN_BATTLE_ACTIVE = "There's a battle happening now! We can't spare the forces right now.",
    BATTLE_ALREADY_ACTIVE = "A battle is already in progress. Please wait until it has concluded.",
    BATTLE_START_ERROR = "An error occurred while trying to start the battle. Please check the server console.",
    INSUFFICIENT_RESOURCES_GENERAL = "We cannot launch an assault at this time. Our stockpiles are running low!",
    INSUFFICIENT_CONTRIBUTION = "You must contribute to the war effort before leading an assault.",
    MISSING_RESOURCES_DONATION = " - You have not donated to Resources.",
    MISSING_SUPPLIES_DONATION = " - You have not donated to Supplies.",
    MISSING_RECON_MISSION = " - You have not completed a Reconnaissance mission.",
    INSUFFICIENT_RANK = "Your rank is not high enough to initiate a stronghold assault.",
    PLAYER_REWARD_NOTES_FMT = '[REWARD] You earned %d Allied Notes! Finish the fight! Defeat the Commander!',
    PLAYER_REWARD_NOTES_FINAL_FMT = '[REWARD] You earned %d Allied Notes for your efforts in the assault!',
    MEGA_BOSS_BONUS_NOTES_FMT = '[REWARD] You earned a bonus of %d Allied Notes for defeating the stronghold commander!',
    MEGA_BOSS_KILL_RECORDED_FMT = "Your victory against the stronghold commander has been recorded! (Total: %d)",
    INSUFFICIENT_RESOURCES_FMT = "%s - %d/%d (%d needed)",
}

-- Localized messages for the Vanguard Capt. NPC
local NPC_MESSAGES = {
    noActiveBattlePortal = "There is no active stronghold assault at this time.",
    battlePortalCoordError = "An error occurred while trying to teleport. The destination is unknown.",
    readyForBattle = "Report back when you're ready for battle.",
}

-- Teleport locations corresponding to the BATTLE_ZONES table
local WarpLocations = {
    [92] = { name = 'Beadeaux (S)', zone = xi.zone.BEADEAUX_S, x = -222.4111, y = 0.8124, z = -97.4378, rot = 20 },
    [85] = { name = 'La Vaule (S)', zone = xi.zone.LA_VAULE_S, x = 101.5542, y = -4.7485, z = -140.0167, rot = 125 },
    [99] = { name = 'Castle Oztroja (S)', zone = xi.zone.CASTLE_OZTROJA_S, x = -141.9425, y = 0.1849, z = -14.6866, rot = 35 },
    [138] = { name = 'Castle Zvahl Bailey (S)', zone = xi.zone.CASTLE_ZVAHL_BAILEYS_S, x = 46.4416, y = -24.000, z = 20.1962, rot = 0 },
    -- Add other warp locations here if more BATTLE_ZONES are added
}


-- =============================================================================
-- ENEMY ARMY AND ZONE CONFIGURATION
-- =============================================================================

local BATTLE_ZONES = {
    {
        zoneName = 'La_Vaule_[S]',
        zoneID = 85,
        fortCenterPos = { y = -3.88 }, -- Central ground height for this battle area
        regulars = { unitname = "Elite Guard", look = '0000740200000000000000000000000000000000', groupid = 89, zoneid = 84, hpp = REGULAR_HPP_MOD, level = BATTLE_LEVEL_REGULAR },
        manteletSpawns = {
            { x = 82.9140, y = -3.8898, z = -137.9975, rot = 160 },
            { x = 80.1650, y = -3.7674, z = -115.6226, rot = 291 },
            { x = 59.2393, y = -8.5263, z = -128.1013, rot = 116 },
            { x = 71.0625, y = -8.1345, z = -157.2440, rot = 206 },
        },
        megaBoss = {
            unitname = "Mega Boss",
            pos = { x = 93.6775, y = -5.9346, z = -168.2275, rot = 160 },
            look = '0000f10700000000000000000000000000000000', groupid = 83, zoneid = 81, entityFlags = 159
        },
    },
    {
        zoneName = 'Beadeaux_[S]',
        zoneID = 92,
        fortCenterPos = { y = 1.00 }, -- Central ground height for this battle area
        regulars = { unitname = "Elite Guard", look = '0000920200000000000000000000000000000000', groupid = 103, zoneid = 91, hpp = REGULAR_HPP_MOD, level = BATTLE_LEVEL_REGULAR },
        manteletSpawns = {
            { x = -178.6302, y = 1.00, z = -93.7492, rot = 160 },
            { x = -166.2728, y = 1.00, z = -116.2696, rot = 291 },
            { x = -152.7044, y = 1.00, z = -109.0192, rot = 116 },
            { x = -167.6902, y = 1.00, z = -86.7133, rot = 206 },
        },
        megaBoss = {
            unitname = "Mega Boss",
            pos = { x = -141.9065, y = 1.000, z = -106.1991, rot = 128 },
            look = '00006b0800000000000000000000000000000000', groupid = 85, zoneid = 88, entityFlags = 159
        },
    },
    {
        zoneName = 'Castle_Oztroja_[S]',
        zoneID = 99,
        fortCenterPos = { y = 0.250 }, -- Central ground height for this battle area
        regulars = { unitname = "Elite Guard", look = '00001f0800000000000000000000000000000000', groupid = 98, zoneid = 95, hpp = REGULAR_HPP_MOD, level = BATTLE_LEVEL_REGULAR },
        manteletSpawns = {
            { x = -118.1339, y = 0.25, z = -38.7452, rot = 112 },
            { x = -123.7779, y = 0.25, z = 15.8865, rot = 167 },
            { x = -77.0063, y = 0.25, z = -17.0777, rot = 116 },
            { x = -83.4804, y = 0.25, z = 11.5552, rot = 206 },
        },
        megaBoss = {
            unitname = "Mega Boss",
            pos = { x = -99.3834, y = 0.25, z = -8.8782, rot = 244 },
            look = '0000210800000000000000000000000000000000', groupid = 93, zoneid = 95, entityFlags = 159
        },
    },
    {
        zoneName = 'Castle_Zvahl_Baileys_[S]',
        zoneID = 138,
        fortCenterPos = { y = -24.05 }, -- Central ground height for this battle area
        regulars = { unitname = "Elite Guard", look = '0000a90800000000000000000000000000000000', groupid = 88 , zoneid = 137, hpp = REGULAR_HPP_MOD, level = BATTLE_LEVEL_REGULAR },
        manteletSpawns = {
            { x = 99.7412, y = -24.0500 , z = -20.1728, rot = 187 },
            { x = 99.7412, y = -24.0500 , z = 54.6853, rot = 187 },
            { x = 76.4792, y = -24.0500 , z = 20.5915, rot = 187 },
            { x = 134.7855, y = -24.0500, z = 20.5915, rot = 187 },


        },
        megaBoss = {
            unitname = "Mega Boss",
            pos = { x = 101.4319, y = -24.0190, z = 20.4088, rot = 254 },
            look = '0000a90800000000000000000000000000000000', groupid = 88, zoneid = 137, entityFlags = 159
        },
    },
}

-- Define the new units that are common across all battles
local STAGED_UNITS = {
    MANTELET = { unitname = "Confed. Mantelet", look = '0000180900000000000000000000000000000000', groupid = 94, zoneid = 85, qty = 4, hpp = MANTELET_HPP_MOD },
    BELFRY   = { unitname = "Confed. Belfry",   look = '0000100900000000000000000000000000000000', groupid = 96, zoneid = 85, qty = 2, hpp = BELFRY_HPP_MOD },
}

-- Global variables to track mob counts during a battle
local battleMobCount = 0
local mobsDefeatedCount = 0

-- =============================================================================
-- UTILITY FUNCTIONS
-- =============================================================================

-- Helper for logging
local function log_debug(...)
    if ENABLE_DEBUG_LOGS then
        local parts = {"[DEBUG] [StrongholdBattle]"}
        for i = 1, select('#', ...) do
            table.insert(parts, tostring(select(i, ...)))
        end
        print(table.concat(parts, " "))
    end
end

-- Helper to get display name for a zone
local function getDisplayZoneName(zoneName)
    return zoneName:gsub('_', ' ')
end

-- Broadcasts a message to all players
local function broadcastAnnouncement(message, includeSeparator)
    local includeSep = includeSeparator == nil or includeSeparator
    for i = 1, 299 do
        local zone = GetZone(i)
        if zone then
            for _, member in pairs(zone:getPlayers()) do
                if member:getCharVar("CampaignMSG") ~= 1 then
                    if includeSep then
                        member:printToPlayer(MESSAGES.SEPARATOR, xi.msg.channel.SYSTEM_3)
                    end
                    member:printToPlayer(message, xi.msg.channel.SYSTEM_3)
                end
            end
        end
    end
end

-- Despawns all mobs associated with the current battle
local function despawnAllBattleMobs(battleZoneObj)
    if not battleZoneObj then
        log_debug("Despawn failed: battleZoneObj is nil.")
        return
    end
    log_debug("Despawning all campaign mobs in zone: ", battleZoneObj:getName())
    local despawnedCount = 0
    for _, mob in pairs(battleZoneObj:getMobs()) do
        if mob and mob:getLocalVar('IsStrongholdMob') == 1 then
            DespawnMob(mob:getID())
            despawnedCount = despawnedCount + 1
        end
    end
    log_debug("Despawn complete. Removed ", despawnedCount, " mobs.")
end

-- Calculates hours elapsed, handling 24-hour wrap-around
local function calculateHoursElapsed(startHour, currentHour)
    local diff = currentHour - startHour
    if diff < 0 then
        diff = diff + 24
    end
    return diff
end

-- Deep copies a table to prevent modifying the original configuration
local function deepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == 'table' then
            copy[key] = deepCopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

-- Loads the battle configuration from server variables
local function loadPersistedBattleConfig()
    local zoneIndex = GetServerVariable(STRONGHOLD_SELECTED_ZONE_INDEX_VAR) or 0

    if zoneIndex == 0 then
        return nil
    end

    local selectedZone = BATTLE_ZONES[zoneIndex]

    if not selectedZone then
        log_debug("ERROR: Persisted indices point to invalid config. Resetting state.")
        SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
        return nil
    end

    return selectedZone
end

-- Calculates mob stat modifiers based on CampaignRecon score
local function calculateReconModifiers()
    local reconScore = tonumber(GetServerVariable("CampaignRecon")) or 1000
    reconScore = math.max(0, math.min(1000, reconScore))
    local penaltyFactor = (1000 - reconScore) / 1000
    local maxStatBonus = 500
    local maxLevelBonus = 5
    local statBonus = math.floor(maxStatBonus * penaltyFactor)
    local levelBonus = math.floor(maxLevelBonus * penaltyFactor)
    return statBonus, levelBonus
end

--- Increases the CampaignTideScore on a battle win.
local function applyTideScoreWinBonus()
    local currentTide = tonumber(GetServerVariable("CampaignTideScore")) or 0
    local newTide = math.min(MAX_TIDE_SCORE, currentTide + TIDE_SCORE_GAIN_ON_WIN)
    SetServerVariable("CampaignTideScore", newTide)
    log_debug("Player win (Final). Tide Score increased by ", TIDE_SCORE_GAIN_ON_WIN, ". New value: ", newTide)
end

---Helper function to increment a specific charVar for a player.
---@param player CPlayer The player to award points to.
---@param varName string The charVar key (e.g., 'SHB_AbilityUseCount').
---@param multiplier number The point value for this event.
local function trackPlayerContribution(player, varName, multiplier)
    if player and player:isPC() then
        local currentScore = player:getCharVar(varName) or 0
        local newScore = currentScore + multiplier
        player:setCharVar(varName, newScore)
        -- The log below can be uncommented for detailed point tracking, but it is very spammy.
        -- log_debug(string.format("[Score] Player %s gained %d points for %s. Total: %d", player:getName(), multiplier, varName, newScore))
    end
end

--- Checks if the player has at least one of the required campaign rank key items.
--- @param player CPlayer The player to check.
--- @return boolean True if the player has a required KI, false otherwise.
local function playerHasRequiredRank(player)
    if not player then return false end

    for _, ki_id in ipairs(REQUIRED_RANK_KIS) do
        if player:hasKeyItem(ki_id) then
            return true -- Found a required KI, no need to check further
        end
    end
    return false -- Did not find any of the required KIs
end

--- Resets participation counters for all players in the battle zone.
--- @param zone CZone The zone where the battle is starting.
local function resetParticipationCounters(zone)
    log_debug("Resetting participation point counters for all players in zone ", zone:getName())
    for _, p in pairs(zone:getPlayers()) do
        if p and p:isPC() then
            for _, varName in pairs(CONTRIBUTION_VARS) do
                p:setCharVar(varName, 0)
            end
        end
    end
end


--- Awards Allied Notes to players based on their participation score.
--- @param zone CZone The zone where the battle took place.
--- @param battleWon boolean True if the players won the battle.
--- @param hoursElapsed number The number of hours the battle lasted.
--- @param isFinalReward boolean True if this is the final reward distribution for the battle.
local function awardParticipationRewards(zone, battleWon, hoursElapsed, isFinalReward)
    if not zone then return end
    isFinalReward = isFinalReward or false
    log_debug("Awarding participation rewards. Battle Won: ", tostring(battleWon), " Final Reward: ", tostring(isFinalReward))

    local rewardMultiplier = 1.0
    if battleWon then
        rewardMultiplier = rewardMultiplier * PLAYER_VICTORY_BONUS_MULTIPLIER
    end

    for _, player in pairs(zone:getPlayers()) do
        if player and player:isPC() then
            local totalPoints = 0
            -- Tally score from all contribution variables and reset them
            for _, varName in pairs(CONTRIBUTION_VARS) do
                local score = player:getCharVar(varName) or 0
                totalPoints = totalPoints + score
                player:setCharVar(varName, 0) -- Reset after tallying
            end

            if totalPoints > 0 then
                local baseNotes = totalPoints * ALLIED_NOTES_PER_POINT
                local finalNotes = math.floor(baseNotes * rewardMultiplier)
                finalNotes = math.min(finalNotes, MAX_ALLIED_NOTES_REWARD)

                if finalNotes > 0 then
                    player:addCurrency("allied_notes", finalNotes)
                    local msg
                    if isFinalReward then
                        msg = string.format(MESSAGES.PLAYER_REWARD_NOTES_FINAL_FMT, finalNotes)
                    else
                        msg = string.format(MESSAGES.PLAYER_REWARD_NOTES_FMT, finalNotes)
                    end
                    player:printToPlayer(msg, xi.msg.channel.SYSTEM_3)
                    log_debug(string.format("Awarded %d Allied Notes to %s for %d participation points.", finalNotes, player:getName(), totalPoints))
                end
            else
                log_debug(string.format("Player %s has 0 participation points. No reward.", player:getName()))
            end
        end
    end

    -- Also reset for any players who might have left the zone
    for i = 1, 299 do -- Assuming 299 is max zone ID
        local other_zone = GetZone(i)
        if other_zone then
            for _, p in pairs(other_zone:getPlayers()) do
                if p and p:isPC() then
                    for _, varName in pairs(CONTRIBUTION_VARS) do
                        if p:getCharVar(varName) > 0 then p:setCharVar(varName, 0) end
                    end
                end
            end
        end
    end
end
-- =============================================================================
-- ARMY SPAWNING LOGIC
-- =============================================================================

--- Spawns the commander and regular units for a selected enemy unit.
--- @param zone CZone The zone object where the battle will take place.
--- @param selectedZone table The configuration table for the zone.
--- @param battleFightStartHour number The hour (0-23) the fight officially started.
local function spawnArmy(zone, selectedZone, battleFightStartHour)
    zone:setLocalVar("StrongholdStage", 0)

    -- Use the central Y coordinate plus an offset for a reliable spawn height.
    local safeY = selectedZone.fortCenterPos.y + MOB_Y_OFFSET

    -- Initial mob count is just the first wave. This will be updated as new waves spawn.
    battleMobCount = 4 -- Start with 4 Mantelets
    mobsDefeatedCount = 0
    SetServerVariable(STRONGHOLD_TOTAL_STARTING_MAX_HP_VAR, 0)

    local function insertUnit(unitConfig, mobLevel, onDeathCallback, spawnPos, isMegaBoss)
        local entityFlags = unitConfig.entityFlags or 0

        local totalQty = unitConfig.qty or 1
        if totalQty == 0 then return end

        local unitName = unitConfig.unitname
        local rawLook = unitConfig.look
        local hppModValue = unitConfig.hpp or 5000 -- Use unit-specific HPP, default to 5000
        
        for i = 1, totalQty do
            local final_x, final_y, final_z, final_rot
            if spawnPos then
                -- Use a provided spawn position (e.g., for subsequent waves)
                final_x = spawnPos.x + math.random(-1, 1)
                final_y = spawnPos.y or safeY -- Use Y from spawnPos if available, otherwise default
                final_z = spawnPos.z + math.random(-1, 1)
                final_rot = spawnPos.rot or math.random(0, 255)
            else
                -- Use the pre-defined spawn point from the config for the initial Mantelet wave
                local spawnPoint = selectedZone.manteletSpawns[i]
                final_x, final_y, final_z, final_rot = spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.rot
            end
            local unitNamez = string.char(0x94) .. unitName

            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = unitNamez,
                look = rawLook,
                x = final_x,
                y = final_y,
                z = final_z,
                rotation = final_rot,
                groupId = unitConfig.groupid,
                groupZoneId = unitConfig.zoneid,
                entityFlags = entityFlags,
                allegiance = 0,
                widescan = 1,

                onMobSpawn = function(mob_spawned)
                    local statBonus, levelBonus = calculateReconModifiers()
                    mob_spawned:setMobLevel(mobLevel + levelBonus)
                    mob_spawned:addMod(xi.mod.HPP, hppModValue)
                    mob_spawned:updateHealth()
                    mob_spawned:addHP(mob_spawned:getMaxHP())

                    local finalMaxHP = mob_spawned:getMaxHP()
                    local currentTotal = GetServerVariable(STRONGHOLD_TOTAL_STARTING_MAX_HP_VAR) or 0
                    SetServerVariable(STRONGHOLD_TOTAL_STARTING_MAX_HP_VAR, currentTotal + finalMaxHP)

                    if isMegaBoss then
                        -- Apply Mega Boss specific stats and mobmods
                        log_debug("Applying Mega Boss specific stats and mods.")
                        mob_spawned:addMod          (xi.mod.DMG, MEGA_BOSS_DMG_MOD + statBonus)
                        mob_spawned:addMod          (xi.mod.ATT, MEGA_BOSS_ATT_MOD + statBonus)
                        mob_spawned:addMod          (xi.mod.ACC, MEGA_BOSS_ACC_MOD + (statBonus * 2))
                        mob_spawned:addMod          (xi.mod.EVA, MEGA_BOSS_EVA_MOD + statBonus)
                        mob_spawned:addMod          (xi.mod.MEVA, MEGA_BOSS_MEVA_MOD + statBonus)
                        mob_spawned:setMod          (xi.mod.SILENCERES, 100) 
                        mob_spawned:setMod          (xi.mod.STUNRES, 100) 
                        mob_spawned:setMod          (xi.mod.BINDRES, 100) 
                        mob_spawned:setMod          (xi.mod.GRAVITYRES, 100) 
                        mob_spawned:setMod          (xi.mod.SLEEPRES, 100) 
                        mob_spawned:setMod          (xi.mod.POISONRES, 100) 
                        mob_spawned:setMod          (xi.mod.PARALYZERES, 100) 
                        mob_spawned:setMod          (xi.mod.LULLABYRES, 100) 
                        mob_spawned:setMobMod       (xi.mobMod.ROAM_DISTANCE, 40)
                        mob_spawned:setMobMod       (xi.mobMod.NO_DROPS, 1)
                        mob_spawned:setMobMod       (xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
                        mob_spawned:setMobMod       (xi.mobMod.CHECK_AS_NM, 1)
                        mob_spawned:addStatusEffect (xi.effect.BLAZE_SPIKES, 50, 0, 0)
                        mob_spawned:addStatusEffect (xi.effect.REGEN, 350, 3, 0)
                        mob_spawned:addStatusEffect (xi.effect.REGAIN, 50, 3, 0)
                        mob_spawned:addStatusEffect (xi.effect.ENFIRE_II, 100, 0, 0)                       
                        
                    else
                        -- Apply regular mob stats
                        mob_spawned:addMod(xi.mod.DMG, 1 + statBonus)
                        mob_spawned:addMod(xi.mod.ATT, 1 + statBonus)
                        mob_spawned:addMod(xi.mod.ACC, 1 + (statBonus * 2))
                        mob_spawned:addMod(xi.mod.EVA, 1 + statBonus)
                        mob_spawned:setMobMod(xi.mobMod.ROAM_DISTANCE, 25)
                        mob_spawned:setMobMod(xi.mobMod.NO_DROPS, 1)
                        mob_spawned:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
                        mob_spawned:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                    end

                    -- Apply stationary/petrification mods only to Mantelets and Belfries
                    if unitName == STAGED_UNITS.MANTELET.unitname or unitName == STAGED_UNITS.BELFRY.unitname then
                        --Mods meant to stop the Mantelets and Belfries from TPing or doing anything 
                        mob_spawned:setAutoAttackEnabled(false)
                        mob_spawned:setMobMod(xi.mobMod.TP_USE_CHANCE, 0)
                        mob_spawned:setMobMod(xi.mobMod.ATTACK_SKILL_LIST, 0)
                        mob_spawned:setMobMod(xi.mobMod.SKILL_LIST, 0)
                        mob_spawned:setMobMod(xi.mobMod.SPELL_LIST, 0)
                        mob_spawned:setMobMod(xi.mobMod.NO_AGGRO, 1)
                        mob_spawned:setMobMod(xi.mobMod.NO_MOVE, 1)
                        mob_spawned:setMobMod(xi.mobMod.NO_LINK, 1)
                        mob_spawned:setMobMod(xi.mobMod.MAGIC_COOL, 0)
                        mob_spawned:setMobMod(xi.mobMod.MAGIC_DELAY, 9999)
                        mob_spawned:addStatusEffect(xi.effect.PETRIFICATION, 1, 0, 9999)

                        mob_spawned:addStatusEffect(xi.effect.BLAZE_SPIKES, 100, 0, 0)
                    end

                    mob_spawned:setLocalVar('BattleStartHour', battleFightStartHour)
                    mob_spawned:setLocalVar('IsStrongholdMob', 1)
                end,

                onMobFight = function(mob_fought, target)
                    if target and target:isPC() then
                        -- Add listeners only once per mob
                        if mob_fought:getLocalVar('listeners_added') == 1 then return end
                        mob_fought:setLocalVar('listeners_added', 1)

                        mob_fought:addListener('ABILITY_TAKE', LISTENER_ID_PREFIX .. 'ABILITY_TAKE', function(caster, mobTarget, ability, action)
                            if caster and caster:isPC() and ability and JOB_ABILITIES_TO_TRACK[ability:getID()] then
                                trackPlayerContribution(caster, CONTRIBUTION_VARS.ABILITY_USE, POINT_MULTIPLIERS.ABILITY_TAKE)
                            end
                        end)

                        mob_fought:addListener('TAKE_DAMAGE', LISTENER_ID_PREFIX .. 'TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                            if attacker and attacker:isPC() and damage > 0 and TRACKED_DAMAGE_TYPES[damageType] then
                                trackPlayerContribution(attacker, CONTRIBUTION_VARS.DAMAGE_DONE_HIT, POINT_MULTIPLIERS.DAMAGE_DONE_HIT)
                            end
                        end)

                        mob_fought:addListener('CRITICAL_TAKE', LISTENER_ID_PREFIX .. 'CRITICAL_TAKE', function(mob, attacker, ...)
                            trackPlayerContribution(attacker, CONTRIBUTION_VARS.CRITICAL_TAKE, POINT_MULTIPLIERS.CRITICAL_TAKE)
                        end)

                        mob_fought:addListener('MAGIC_TAKE', LISTENER_ID_PREFIX .. 'MAGIC_USE', function(mobTarget, caster, spell)
                            if caster and caster:isPC() and spell and spell:tookEffect() and TRACKED_MAGIC_GROUPS[spell:getSpellGroup()] then
                                trackPlayerContribution(caster, CONTRIBUTION_VARS.MAGIC_USE, POINT_MULTIPLIERS.MAGIC_USE)
                            end
                        end)
                        log_debug("Added contribution listeners to mob ID: " .. mob_fought:getID())
                    end
                end,

                onMobDeath = onDeathCallback,

                releaseIdOnDisappear = true,
                specialSpawnAnimation = true,
            })
            
            if mob then
                log_debug(string.format("Spawning mob '%s' (ID: %d) in zone %d at pos (%.2f, %.2f, %.2f)", unitName, mob:getID(), zone:getID(), final_x, final_y, final_z))
                mob:setSpawn(final_x, final_y, final_z, final_rot)
                mob:spawn()
            else
                log_debug("CRITICAL ERROR: Mob entity failed to spawn for unit:", unitName)
            end
        end
    end

    -- Define the death callbacks for each stage
    local onRegularDeath = function(mob_dead, killer)
        mobsDefeatedCount = mobsDefeatedCount + 1
        log_debug("A regular unit died. Total defeated: ", mobsDefeatedCount, "/", battleMobCount)        
        if mobsDefeatedCount >= battleMobCount then
            local battleZone = GetZone(mob_dead:getZoneID())
            if not battleZone then
                log_debug("ERROR: Could not get zone object in onRegularDeath. Aborting.")
                return
            end

            local displayZoneName = getDisplayZoneName(battleZone:getName())

            -- Award participation rewards for PHASE 1 WIN
            local startHour = mob_dead:getLocalVar('BattleStartHour') or VanadielHour()
            local isFinal = not (ENABLE_MEGA_BOSS and selectedZone.megaBoss)
            awardParticipationRewards(battleZone, true, calculateHoursElapsed(startHour, VanadielHour()), isFinal)

            -- Player win (phase 1): Increase fortifications
            local currentForts = tonumber(GetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR)) or 0
            local newForts = math.min(MAX_FORTIFICATIONS, currentForts + FORTIFICATION_GAIN_ON_WIN)
            SetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR, newForts)
            log_debug("Player win (Phase 1). Fortifications increased by ", FORTIFICATION_GAIN_ON_WIN, ". New value: ", newForts)

            -- Spawn the Mega Boss if enabled
            if ENABLE_MEGA_BOSS and selectedZone.megaBoss then
                log_debug("All regular mobs defeated. Spawning Mega Boss.")

                local onMegaBossDeath = function(boss_mob, boss_killer)
                    log_debug("Mega Boss has been defeated!")
                    broadcastAnnouncement(string.format(MESSAGES.BATTLE_END_FMT, displayZoneName))

                    -- Award Bonus Fortifications
                    local forts = tonumber(GetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR)) or 0
                    local newForts = math.min(MAX_FORTIFICATIONS, forts + MEGA_BOSS_BONUS_FORTIFICATION)
                    SetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR, newForts)
                    log_debug("Mega Boss defeated. Fortifications increased by bonus ", MEGA_BOSS_BONUS_FORTIFICATION, ". New value: ", newForts)

                    applyTideScoreWinBonus()

                    -- Award Bonus Allied Notes and Kill Count to participating players
                    for _, p in pairs(battleZone:getPlayers()) do
                        if p and p:isPC() then
                            -- Check for participation in the boss fight by tallying points
                            local totalBossPoints = 0
                            for _, varName in pairs(CONTRIBUTION_VARS) do
                                totalBossPoints = totalBossPoints + (p:getCharVar(varName) or 0)
                            end

                            if totalBossPoints > 0 then
                                -- Award bonus notes for participation
                                p:addCurrency("allied_notes", MEGA_BOSS_BONUS_ALLIED_NOTES)
                                p:printToPlayer(string.format(MESSAGES.MEGA_BOSS_BONUS_NOTES_FMT, MEGA_BOSS_BONUS_ALLIED_NOTES), xi.msg.channel.SYSTEM_3)

                                -- Award kill count
                                local currentKills = p:getCharVar(MEGA_BOSS_KILL_COUNT_VAR) or 0
                                p:setCharVar(MEGA_BOSS_KILL_COUNT_VAR, currentKills + 1)
                                p:printToPlayer(string.format(MESSAGES.MEGA_BOSS_KILL_RECORDED_FMT, currentKills + 1), xi.msg.channel.SYSTEM_3)
                                log_debug("Awarded Mega Boss kill credit to %s. New total: %d", p:getName(), currentKills + 1)
                            end
                        end
                    end

                    -- End the battle
                    SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
                    SetServerVariable(STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR, 1)
                    boss_mob:timer(1000, function(m_despawn) DespawnMob(m_despawn:getID()) end)
                end

                local bossConfig = deepCopy(selectedZone.megaBoss)
                bossConfig.qty = 1
                bossConfig.hpp = MEGA_BOSS_HPP_MOD

                insertUnit(bossConfig, MEGA_BOSS_LEVEL, onMegaBossDeath, bossConfig.pos, true)
                battleMobCount = battleMobCount + 1
                log_debug("Mega Boss spawned. Total mob count is now: ", battleMobCount)
            else
                -- No mega boss, end battle here
                broadcastAnnouncement(string.format(MESSAGES.BATTLE_END_FMT, displayZoneName))
                applyTideScoreWinBonus()
                SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
                SetServerVariable(STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR, 1)
                battleMobCount = 0
                mobsDefeatedCount = 0
            end
        end
        mob_dead:timer(1000, function(m_despawn) DespawnMob(m_despawn:getID()) end)
    end

    local onBelfryDeath = function(mob_dead, killer)
        mobsDefeatedCount = mobsDefeatedCount + 1
        log_debug("A Belfry died. Total defeated: ", mobsDefeatedCount, "/", battleMobCount)
        
        log_debug("Spawning 2 regulars.")
        
        -- Spawn 2 regulars from the selected unit
        local regularsToSpawn = deepCopy(selectedZone.regulars)
        regularsToSpawn.qty = 2
        battleMobCount = battleMobCount + regularsToSpawn.qty
        log_debug("Updating total battle mob count to: ", battleMobCount)
        
        -- Spawn regulars at the location of the defeated Belfry
        insertUnit(regularsToSpawn, regularsToSpawn.level, onRegularDeath, mob_dead:getPos(), false)
        
        -- Check for win condition after potentially spawning new mobs
        if mobsDefeatedCount >= battleMobCount then
            onRegularDeath(mob_dead, killer) -- Trigger the final win logic
        else
            mob_dead:timer(1000, function(m_despawn) DespawnMob(m_despawn:getID()) end)
        end
    end
    
    local onManteletDeath = function(mob_dead, killer)
        mobsDefeatedCount = mobsDefeatedCount + 1
        log_debug("A Mantelet died. Total defeated: ", mobsDefeatedCount, "/", battleMobCount)
        
        log_debug("Spawning 2 Belfries.")

        -- Spawn 2 Belfries
        local belfryConfig = deepCopy(STAGED_UNITS.BELFRY)
        belfryConfig.qty = 1 -- We will spawn them one by one to control position
        battleMobCount = battleMobCount + 2 -- Manually update total count
        log_debug("Updating total battle mob count to: ", battleMobCount)

        -- Spawn Belfries at different offsets from the defeated Mantelet
        local pos1 = mob_dead:getPos()
        pos1.x = pos1.x - 2 -- Spawn first one to the west
        insertUnit(belfryConfig, BATTLE_LEVEL_COMMANDER, onBelfryDeath, pos1, false)
        local pos2 = mob_dead:getPos()
        pos2.x = pos2.x + 2 -- Spawn second one to the east
        insertUnit(belfryConfig, BATTLE_LEVEL_COMMANDER, onBelfryDeath, pos2, false)
        
        mob_dead:timer(1000, function(m_despawn) DespawnMob(m_despawn:getID()) end)
    end

    -- Start the battle by spawning the first wave
    log_debug("Spawning initial wave of Mantelets at pre-defined locations.")
    local manteletConfig = deepCopy(STAGED_UNITS.MANTELET)
    insertUnit(manteletConfig, BATTLE_LEVEL_COMMANDER, onManteletDeath, nil, false)

    log_debug("Initial army spawn complete.")
end

-- =============================================================================
-- PUBLIC TRIGGER FUNCTION
-- =============================================================================

--- This function is intended to be called from an NPC's onTrigger event to start a battle.
--- @param player Player The player who triggered the event.
--- @param npc NPC The NPC that was triggered.
function m:startStrongholdBattle(player, npc)
    -- Prerequisite checks for starting an assault
    local hasDonatedResources = player:getCharVar('SHB_DonatedResources') == 1
    local hasDonatedSupplies = player:getCharVar('SHB_DonatedSupplies') == 1
    local hasCompletedRecon = player:getCharVar('SHB_CompletedRecon') == 1

    if not hasDonatedResources or not hasDonatedSupplies or not hasCompletedRecon then
        player:printToPlayer(MESSAGES.INSUFFICIENT_CONTRIBUTION, 0, npc:getPacketName())
        if not hasDonatedResources then
            player:printToPlayer(MESSAGES.MISSING_RESOURCES_DONATION, 0, npc:getPacketName())
        end
        if not hasDonatedSupplies then
            player:printToPlayer(MESSAGES.MISSING_SUPPLIES_DONATION, 0, npc:getPacketName())
        end
        if not hasCompletedRecon then
            player:printToPlayer(MESSAGES.MISSING_RECON_MISSION, 0, npc:getPacketName())
        end
        return
    end

    -- Crash Protection: Check for a stale battle state before starting a new one.
    local battleState = tonumber(GetServerVariable(STRONGHOLD_BATTLE_STATE_VAR)) or 0
    if battleState > 0 then
        log_debug("Found active battle state. Investigating for crash recovery...")
        cleanupStaleBattle(player, npc)
        -- Re-check state after cleanup attempt
        battleState = tonumber(GetServerVariable(STRONGHOLD_BATTLE_STATE_VAR)) or 0
    end
    -- Check if a regular Campaign Battle is active
    local campaignBattleState = tonumber(GetServerVariable('[CampaignBattleHandler]BattleState')) or 0
    if campaignBattleState > 0 then
        player:printToPlayer(MESSAGES.CAMPAIGN_BATTLE_ACTIVE, 0, npc:getPacketName())
        return
    end

    -- Final check after potential cleanup
    if battleState > 0 then
        player:printToPlayer(MESSAGES.BATTLE_ALREADY_ACTIVE, 0, npc:getPacketName())
        return
    end
    
    -- Check for minimum resource requirements
    local reconScore = tonumber(GetServerVariable("CampaignRecon")) or 0
    local resources = tonumber(GetServerVariable("CampaignResources")) or 0
    local supplies = tonumber(GetServerVariable("CampaignSupplies")) or 0
    local tideScore = tonumber(GetServerVariable("CampaignTideScore")) or 0

    local canStart = (reconScore >= MIN_RECON_SCORE) and
                     (resources >= MIN_RESOURCES) and
                     (supplies >= MIN_SUPPLIES) and
                     (tideScore >= MIN_TIDE_SCORE)

    if not canStart then
        player:printToPlayer(MESSAGES.INSUFFICIENT_RESOURCES_GENERAL, 0, npc:getPacketName())
        if reconScore < MIN_RECON_SCORE then
            player:printToPlayer(string.format(MESSAGES.INSUFFICIENT_RESOURCES_FMT, "Recon Score", reconScore, MAX_RECON_SCORE, MIN_RECON_SCORE), 0, npc:getPacketName())
        end
        if resources < MIN_RESOURCES then
            player:printToPlayer(string.format(MESSAGES.INSUFFICIENT_RESOURCES_FMT, "Resources", resources, MAX_RESOURCES, MIN_RESOURCES), 0, npc:getPacketName())
        end
        if supplies < MIN_SUPPLIES then
            player:printToPlayer(string.format(MESSAGES.INSUFFICIENT_RESOURCES_FMT, "Supplies", supplies, MAX_SUPPLIES, MIN_SUPPLIES), 0, npc:getPacketName())
        end
        if tideScore < MIN_TIDE_SCORE then
            player:printToPlayer(string.format(MESSAGES.INSUFFICIENT_RESOURCES_FMT, "Tide Score", tideScore, MAX_TIDE_SCORE, MIN_TIDE_SCORE), 0, npc:getPacketName())
        end
        return
    end

    -- Deduct the costs for starting the battle
    log_debug(string.format("Deducting battle start costs. Recon: -%d, Resources: -%d, Supplies: -%d", BATTLE_START_COST_RECON, BATTLE_START_COST_RESOURCES, BATTLE_START_COST_SUPPLIES))
    local newRecon = math.max(0, reconScore - BATTLE_START_COST_RECON)
    local newResources = math.max(0, resources - BATTLE_START_COST_RESOURCES)
    local newSupplies = math.max(0, supplies - BATTLE_START_COST_SUPPLIES)

    SetServerVariable("CampaignRecon", newRecon)
    SetServerVariable("CampaignResources", newResources)
    SetServerVariable("CampaignSupplies", newSupplies)

    -- Randomly select battle parameters
    local zoneIndex = math.random(1, #BATTLE_ZONES)
    local selectedZone = BATTLE_ZONES[zoneIndex]

    local battleZoneObj = GetZone(selectedZone.zoneID)
    if not battleZoneObj then
        player:printToPlayer(MESSAGES.BATTLE_START_ERROR, 0, npc:getPacketName())
        log_debug("ERROR: Could not find zone object for zoneID ", selectedZone.zoneID, ". Aborting battle.")
        return
    end

    log_debug("Starting Stronghold Battle manually.")

    -- Persist the choice
    SetServerVariable(STRONGHOLD_SELECTED_ZONE_INDEX_VAR, zoneIndex)

    local currentHour = VanadielHour()
    SetServerVariable(STRONGHOLD_BATTLE_START_HOUR_VAR, currentHour)
    SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 2) -- Go directly to active battle state
    SetServerVariable(STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR, 0)

    -- Announce and spawn
    local displayZoneName = getDisplayZoneName(selectedZone.zoneName)

    local message = string.format(MESSAGES.BATTLE_START_FMT, displayZoneName)
    broadcastAnnouncement(message, true)

    -- Reset participation counters for players present at the start
    resetParticipationCounters(battleZoneObj)

    spawnArmy(battleZoneObj, selectedZone, currentHour)
end

-- =============================================================================
-- NPC TRIGGER LOGIC
-- =============================================================================

--- Shows a confirmation menu before starting the assault.
--- @param player CPlayer The player to show the menu to.
--- @param npc CNpc The NPC object.
local function showConfirmationMenu(player, npc)
    local confirmMenu = {}
    confirmMenu.title = "Are you sure? An Alliance is required"
    confirmMenu.options = {
        { "Yes [75 Recon/Supplies/Resources]", function(p)
            m:startStrongholdBattle(p, npc)
        end },
        { "No", function(p)
            -- Do nothing, menu closes. The player can re-trigger the NPC if they wish.
        end }
    }
    player:timer(50, function(p)
        p:customMenu(confirmMenu)
    end)
end

--- Handles the onTrigger event for the Vanguard Capt. NPC.
--- @param player CPlayer The player who triggered the NPC.
--- @param npc CNpc The NPC that was triggered.
local function onVanguardCaptTrigger(player, npc)
    local battleState = tonumber(GetServerVariable(STRONGHOLD_BATTLE_STATE_VAR)) or 0

    if battleState > 0 then
        -- A battle is active, so this NPC becomes a teleporter.
        local zoneIndex = tonumber(GetServerVariable(STRONGHOLD_SELECTED_ZONE_INDEX_VAR)) or 0
        if zoneIndex == 0 then
            player:printToPlayer(NPC_MESSAGES.battlePortalCoordError, 0, npc:getPacketName())
            return
        end

        local battleZone = m:getBattleZoneByIndex(zoneIndex)
        if not battleZone then
            player:printToPlayer(NPC_MESSAGES.battlePortalCoordError, 0, npc:getPacketName())
            return
        end

        local targetLocation = WarpLocations[battleZone.zoneID]
        if targetLocation then
            player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
            player:timer(1000, function() player:setPos(targetLocation.x, targetLocation.y, targetLocation.z, targetLocation.rot, targetLocation.zone) end)
        else
            player:printToPlayer(NPC_MESSAGES.battlePortalCoordError, 0, npc:getPacketName())
        end
    else
        -- No battle is active, check rank before offering to start one.
        if not playerHasRequiredRank(player) then
            player:printToPlayer(MESSAGES.INSUFFICIENT_RANK, 0, npc:getPacketName())
            return
        end

        -- Offer to start one.
        local menu = {}
        menu.title = "Vanguard Captain"
        menu.options = {}

        table.insert(menu.options, { "Initiate a stronghold assault.", function(p)
            showConfirmationMenu(p, npc)
        end })

        table.insert(menu.options, { "Never mind.", function(p)
            p:printToPlayer(NPC_MESSAGES.readyForBattle, 0, npc:getPacketName())
        end })

        -- Use a timer to prevent menu conflicts, similar to CustStatusNPC.lua
        player:timer(50, function(p)
            p:customMenu(menu)
        end)
    end
end

-- =============================================================================
-- ZONE INITIALIZATION
-- =============================================================================

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    -- Call original onInitialize if it exists
    pcall(function() super(zone) end)

    log_debug("Spawning Vanguard Capt. in Mog Garden.")
    zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Vanguard Capt.",
        look = '010002033a103a203a303a403a50976100700000',
        x = 384.8033, y = 0.1429, z = -583.3672, rotation = 178,
        widescan = 1,
        onTrigger = onVanguardCaptTrigger,
    })
end)

--- Checks for and cleans up a stale/crashed battle.
--- @param player Player The player initiating the check.
--- @param npc NPC The NPC being interacted with.
local function cleanupStaleBattle(player, npc)
    local selectedZone = loadPersistedBattleConfig()
    if selectedZone then
        local battleZoneObj = GetZone(selectedZone.zoneID)
        if battleZoneObj then
            local activeMobsFound = false
            for _, mob in pairs(battleZoneObj:getMobs()) do
                if mob and mob:getLocalVar('IsStrongholdMob') == 1 then
                    activeMobsFound = true
                    break
                end
            end

            if not activeMobsFound then
                log_debug("Stale battle state found. No active mobs in zone. Cleaning up...")
                despawnAllBattleMobs(battleZoneObj) -- Clean up any potential stragglers
                SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
                log_debug("Stale battle cleaned up. It is now safe to start a new battle.")
            end
        else
            -- Zone not loaded, can't check for mobs. Assume it's stale and reset.
            log_debug("Stale battle state found, but zone is not loaded. Resetting state.")
            SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
        end
    else
        -- State is > 0 but no zone config is saved. This is a corrupted state.
        log_debug("Corrupted battle state found (state > 0 but no zone index). Resetting state.")
        SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
    end
end

--- This function exposes the BATTLE_ZONES table for external use.
--- @param index number The index of the zone to retrieve.
--- @return table|nil The zone configuration table or nil if not found.
function m:getBattleZoneByIndex(index)
    log_debug("getBattleZoneByIndex called with index: ", index)
    return BATTLE_ZONES[index]
end

-- =============================================================================
-- HOURLY TIMER FOR BATTLE END
-- =============================================================================

m:addOverride('xi.zones.' .. EVENT_HOST_ZONE_NAME .. '.Zone.onGameHour', function(zone)
    local currentHour = VanadielHour()
    local battleState = GetServerVariable(STRONGHOLD_BATTLE_STATE_VAR) or 0

    -- Only process if a battle is active
    if battleState ~= 2 then
        return
    end

    local selectedZone = loadPersistedBattleConfig()
    if not selectedZone then
        log_debug("Failed to load persisted state during hourly check. Resetting to Inactive (0).")
        SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
        return
    end

    local startHour = GetServerVariable(STRONGHOLD_BATTLE_START_HOUR_VAR) or -1
    local totalStartingMaxHP = GetServerVariable(STRONGHOLD_TOTAL_STARTING_MAX_HP_VAR) or 1 -- Prevent division by zero

    if startHour == -1 or totalStartingMaxHP <= 0 then
        log_debug("CORRUPTED STATE DETECTED. BATTLE_STATE=2 but START_HOUR/STARTING_MAX_HP is missing. Forcing state reset.")
        SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
        local battleZoneObj = GetZone(selectedZone.zoneID)
        if battleZoneObj then despawnAllBattleMobs(battleZoneObj) end
        return
    end

    local hoursElapsed = calculateHoursElapsed(startHour, currentHour)

    if hoursElapsed >= BATTLE_DURATION_HOURS then
        log_debug("BATTLE TIMEOUT: Active fight duration of ", BATTLE_DURATION_HOURS, " hours expired. Checking outcome.")

        local battleZoneObj = GetZone(selectedZone.zoneID)
        local totalCurrentHP = 0
        if battleZoneObj then
            for _, mob in pairs(battleZoneObj:getMobs()) do
                if mob and mob:getLocalVar('IsStrongholdMob') == 1 and mob:isAlive() then
                    totalCurrentHP = totalCurrentHP + mob:getHP()
                end
            end
        end

        local remainingHPRatio = totalCurrentHP / totalStartingMaxHP
        local remainingHPPercent = remainingHPRatio * 100
        log_debug("Collective Mob HP Check: ", totalCurrentHP, " / ", totalStartingMaxHP, " (", string.format("%.2f", remainingHPPercent), "%% remaining). Threshold: ", HP_REDUCTION_WIN_THRESHOLD, "%%.")
        
        -- Get battle duration for reward calculation
        local battleDuration = calculateHoursElapsed(startHour, currentHour)

        local displayZoneName = getDisplayZoneName(selectedZone.zoneName)
        local message = ""

        if remainingHPPercent < HP_REDUCTION_WIN_THRESHOLD then
            -- Player Win by HP Reduction
            log_debug("HP REDUCTION VICTORY: Collective HP below threshold! Forcing Player Win.")
            message = string.format(MESSAGES.HP_REDUCTION_VICTORY_FMT, displayZoneName)
            awardParticipationRewards(battleZoneObj, true, battleDuration, true)
            local currentForts = tonumber(GetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR)) or 0
            local newForts = math.min(MAX_FORTIFICATIONS, currentForts + FORTIFICATION_GAIN_ON_WIN)
            SetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR, newForts)
            log_debug("Player win by HP reduction. Fortifications increased by ", FORTIFICATION_GAIN_ON_WIN, ". New value: ", newForts)
            applyTideScoreWinBonus()
        else
            -- Enemy Win by Timeout
            log_debug("ENEMY VICTORY: Collective HP above threshold. Forcing Enemy Win.")
            if GetServerVariable(STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR) == 0 then
                message = string.format(MESSAGES.BATTLE_TIMEOUT_FMT, displayZoneName)
                awardParticipationRewards(battleZoneObj, false, battleDuration, true)
                local currentForts = tonumber(GetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR)) or 0
                SetServerVariable(CAMPAIGN_FORTIFICATIONS_VAR, math.max(0, currentForts - FORTIFICATION_LOSS_ON_DEFEAT))
                log_debug("Player loss by timeout. Fortifications decreased by ", FORTIFICATION_LOSS_ON_DEFEAT, ". New value: ", math.max(0, currentForts - FORTIFICATION_LOSS_ON_DEFEAT))
                SetServerVariable(STRONGHOLD_BATTLE_TIMEOUT_ANNOUNCED_VAR, 1)
            end
        end

        if message ~= "" then
            broadcastAnnouncement(message)
        end

        -- End the battle
        SetServerVariable(STRONGHOLD_BATTLE_STATE_VAR, 0)
        if battleZoneObj then
            despawnAllBattleMobs(battleZoneObj)
        end
    else
        log_debug("Battle is Active. ", hoursElapsed, " of ", BATTLE_DURATION_HOURS, " hours elapsed. Continuing.")
    end
end)

return m