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

-- Toggle AFK Check
local ENABLE_AFK_CHECK = false

--In game hour = 2.5 minutes
--In game day = 57.5 minutes

-- Battle chance configuration
local INITIAL_BATTLE_CHANCE = 1    -- Initial chance in percent (e.g., 10%) --1
local HOURLY_CHANCE_INCREASE = 1    -- Increase in percent per hour if no battle starts --1
local BATTLE_COOLDOWN_HOURS = 6   -- Cooldown in hours after a battle ends --6
local PREP_DURATION_HOURS = 1       -- Duration of the preparation phase --1
local BATTLE_DURATION_HOURS = 6     -- Duration of the actual FIGHT in game hours --6


-- NEW: Win condition based on collective HP reduction
local HP_REDUCTION_WIN_THRESHOLD = 25 -- If collective HP is below this % of STARTING HP when time runs out, players win.

-- Unit Level and HP Configuration
local BATTLE_LEVEL_COMMANDER = 125
local BATTLE_LEVEL_REGULAR = 119

-- HPP (HP Percent) Modifiers for Battle Units
local COMMANDER_HPP_MOD = 10000 
local REGULAR_HPP_MOD = 5000     
--------------------------------------------------------------------------------

-- =============================================================================
-- NEW: END OF BATTLE RESOURCE REDUCTION CONFIGURATION
-- =============================================================================
-- Flat amount to reduce each resource pool by at the end of a battle.
-- Values are direct point reductions.
local RESOURCE_REDUCTION_CONFIG = {
    WIN = {
        CampaignRecon = 5,          
        CampaignResources = 5,      
        CampaignSupplies = 5,       
        CampaignFortifications = 2,  
    },
    LOSS = {
        CampaignRecon = 50,         
        CampaignResources = 50,     
        CampaignSupplies = 50,      
        CampaignFortifications = 10, 
    }
}

-- Global Quantity Configuration
local COMMANDER_QTY = 1     -- One commander per unit


-- NEW: Fortification-based Modifiers
-- These bonuses are applied if the 'CampaignFortifications' server variable is at or below the threshold.
local FORTIFICATION_BONUS_THRESHOLD = 800
local FORTIFICATION_BONUS_REGULARS_MIN = 1  -- Minimum additional regulars to spawn
local FORTIFICATION_BONUS_REGULARS_MAX = 3  -- Maximum additional regulars to spawn
local FORTIFICATION_HPP_BUFF_MOD = 200      -- Additional HPP to grant both Commanders and Regulars


-- Additional Geometry Configuration
local SAFE_SPAWN_BUFFER = 4         -- Extra padding added to fort width for exclusion zone
local MOB_Y_OFFSET = 1.5            -- Small offset to place mob slightly above fort center Y
local MAX_SPAWN_DISTANCE = 25      -- Max distance from fort center (X/Z) mobs will spawn

-- =============================================================================
-- PLAYER CONTRIBUTION CONFIGURATION
-- =============================================================================

-- Multipliers for points awarded per event. Adjust these values to fine-tune score weighting.
local POINT_MULTIPLIERS = {
    ABILITY_TAKE = 1,    -- Points for using a Job Ability (JA) or Job Trait (JT) -- Check JOB_ABILITIES_TO_TRACK for list
    DAMAGE_DONE_HIT = 1, -- Points for a successful damage done
    CRITICAL_TAKE = 1,  -- Points awarded when the mob takes a critical hit
    MAGIC_USE = 1,      -- Points for using a Spell (Ninjutsu, White/Black Magic, etc.)
}

-- Unique CharVar identifiers for each event type (used to track player contributions)
local CONTRIBUTION_VARS = {
    ABILITY_USE = 'PB_AbilityUseCount',
    DAMAGE_DONE_HIT = 'PB_DmgDoneCount',
    CRITICAL_TAKE = 'PB_CriticalTakeCount',
    MAGIC_USE = 'PB_MagicUseCount',
}

local TRACKED_MAGIC_GROUPS = {
    [xi.magic.spellGroup.BLACK]     = true,
    [xi.magic.spellGroup.BLUE]      = true,
    [xi.magic.spellGroup.NINJUTSU]  = true,
    [xi.magic.spellGroup.SUMMONING] = true,
    [xi.magic.spellGroup.WHITE]     = true,
    [xi.magic.spellGroup.GEOMANCY]  = true,
    [xi.magic.spellGroup.SONG]      = true,
    -- Add any other groups you want to track here
}

local TRACKED_DAMAGE_TYPES = {
    [xi.damageType.NONE]        = true,
    [xi.damageType.PIERCING]    = true,
    [xi.damageType.SLASHING]    = true,
    [xi.damageType.BLUNT]       = true,
    [xi.damageType.HTH]         = true,
    [xi.damageType.ELEMENTAL]   = true, -- Generic Element
    [xi.damageType.FIRE]        = true,
    [xi.damageType.ICE]         = true,
    [xi.damageType.WIND]        = true,
    [xi.damageType.EARTH]       = true,
    [xi.damageType.THUNDER]     = true,
    [xi.damageType.WATER]       = true,
    [xi.damageType.LIGHT]       = true,
    [xi.damageType.DARK]        = true,
}


-- Create a lookup table for the specific abilities we want to award CONTRIBUTION points for.
local JOB_ABILITIES_TO_TRACK = {
    [1] 	= true, -- MIGHTY_STRIKES
    [2] 	= true, -- HUNDRED_FISTS
    [3] 	= true, -- BENEDICTION
    [4] 	= true, -- MANAFONT
    [5] 	= true, -- CHAINSPELL
    [6] 	= true, -- PERFECT_DODGE
    [7] 	= true, -- INVINCIBLE
    [8] 	= true, -- BLOOD_WEAPON
    [9] 	= true, -- FAMILIAR
    [10] 	= true, -- SOUL_VOICE
    [11] 	= true, -- EAGLE_EYE_SHOT
    [12] 	= true, -- MEIKYO_SHISUI
    [14] 	= true, -- MIJIN_GAKURE
    [15] 	= true, -- SPIRIT_SURGE
    [16] 	= true, -- ASTRAL_FLOW
    [17] 	= true, -- BERSERK
    [18] 	= true, -- WARCRY
    [19] 	= true, -- DEFENDER
    [20] 	= true, -- AGGRESSOR
    [21] 	= true, -- PROVOKE
    [22] 	= true, -- FOCUS
    [23] 	= true, -- DODGE
    [24] 	= true, -- CHAKRA
    [25] 	= true, -- BOOST
    [26] 	= true, -- COUNTERSTANCE
    [27] 	= true, -- STEAL
    [28] 	= true, -- FLEE
    [29] 	= true, -- HIDE
    [30] 	= true, -- SNEAK_ATTACK
    [31] 	= true, -- MUG
    [32] 	= true, -- SHIELD_BASH
    [33] 	= true, -- HOLY_CIRCLE
    [34] 	= true, -- SENTINEL
    [35] 	= true, -- SOULEATER
    [36] 	= true, -- ARCANE_CIRCLE
    [37] 	= true, -- LAST_RESORT
    [38] 	= true, -- CHARM
    [39] 	= true, -- GAUGE
    [40] 	= true, -- TAME
    [41] 	= true, -- PET_COMMANDS
    [42] 	= true, -- SCAVENGE
    [43] 	= true, -- SHADOWBIND
    [44] 	= true, -- CAMOUFLAGE
    [45] 	= true, -- SHARPSHOT
    [46] 	= true, -- BARRAGE
    [47] 	= true, -- CALL_WYVERN
    [48] 	= true, -- THIRD_EYE
    [49] 	= true, -- MEDITATE
    [50] 	= true, -- WARDING_CIRCLE
    [51] 	= true, -- ANCIENT_CIRCLE
    [52] 	= true, -- JUMP
    [53] 	= true, -- HIGH_JUMP
    [54] 	= true, -- SUPER_JUMP
    [55] 	= true, -- FIGHT
    [56] 	= true, -- HEEL
    [57] 	= true, -- LEAVE
    [58] 	= true, -- SIC
    [59] 	= true, -- STAY
    [60] 	= true, -- DIVINE_SEAL
    [61] 	= true, -- ELEMENTAL_SEAL
    [62] 	= true, -- TRICK_ATTACK
    [63] 	= true, -- WEAPON_BASH
    [64] 	= true, -- REWARD
    [65] 	= true, -- COVER
    [66] 	= true, -- SPIRIT_LINK
    [67] 	= true, -- ENRAGE
    [68] 	= true, -- CHI_BLAST
    [69] 	= true, -- CONVERT
    [70] 	= true, -- ACCOMPLICE
    [71] 	= true, -- CALL_BEAST
    [72] 	= true, -- UNLIMITED_SHOT
    [73] 	= true, -- DISMISS
    [74] 	= true, -- ASSAULT
    [75] 	= true, -- RETREAT
    [76] 	= true, -- RELEASE
    [77] 	= true, -- BLOOD_PACT_RAGE
    [78] 	= true, -- RAMPART
    [79] 	= true, -- AZURE_LORE
    [80] 	= true, -- CHAIN_AFFINITY
    [81] 	= true, -- BURST_AFFINITY
    [82] 	= true, -- WILD_CARD
    [83] 	= true, -- PHANTOM_ROLL
    [84] 	= true, -- FIGHTERS_ROLL
    [85] 	= true, -- MONKS_ROLL
    [86] 	= true, -- HEALERS_ROLL
    [87] 	= true, -- WIZARDS_ROLL
    [88] 	= true, -- WARLOCKS_ROLL
    [89] 	= true, -- ROGUES_ROLL
    [90] 	= true, -- GALLANTS_ROLL
    [91] 	= true, -- CHAOS_ROLL
    [92] 	= true, -- BEAST_ROLL
    [93] 	= true, -- CHORAL_ROLL
    [94] 	= true, -- HUNTERS_ROLL
    [95] 	= true, -- SAMURAI_ROLL
    [96] 	= true, -- NINJA_ROLL
    [97] 	= true, -- DRACHEN_ROLL
    [98] 	= true, -- EVOKERS_ROLL
    [99] 	= true, -- MAGUSS_ROLL
    [100] 	= true, -- CORSAIRS_ROLL
    [101] 	= true, -- PUPPET_ROLL
    [102] 	= true, -- DANCERS_ROLL
    [103] 	= true, -- SCHOLARS_ROLL
    [104] 	= true, -- BOLTERS_ROLL
    [105] 	= true, -- CASTERS_ROLL
    [106] 	= true, -- COURSERS_ROLL
    [107] 	= true, -- BLITZERS_ROLL
    [108] 	= true, -- TACTICIANS_ROLL
    [109] 	= true, -- DOUBLE_UP
    [110] 	= true, -- QUICK_DRAW
    [111] 	= true, -- FIRE_SHOT
    [112] 	= true, -- ICE_SHOT
    [113] 	= true, -- WIND_SHOT
    [114] 	= true, -- EARTH_SHOT
    [115] 	= true, -- THUNDER_SHOT
    [116] 	= true, -- WATER_SHOT
    [117] 	= true, -- LIGHT_SHOT
    [118] 	= true, -- DARK_SHOT
    [119] 	= true, -- RANDOM_DEAL
    [120] 	= true, -- OVERDRIVE
    [121] 	= true, -- ACTIVATE
    [122] 	= true, -- REPAIR
    [123] 	= true, -- DEPLOY
    [124] 	= true, -- DEACTIVATE
    [125] 	= true, -- RETRIEVE
    [126] 	= true, -- FIRE_MANEUVER
    [127] 	= true, -- ICE_MANEUVER
    [128] 	= true, -- WIND_MANEUVER
    [129] 	= true, -- EARTH_MANEUVER
    [130] 	= true, -- THUNDER_MANEUVER
    [131] 	= true, -- WATER_MANEUVER
    [132] 	= true, -- LIGHT_MANEUVER
    [133] 	= true, -- DARK_MANEUVER
    [134] 	= true, -- WARRIORS_CHARGE
    [135] 	= true, -- TOMAHAWK
    [136] 	= true, -- MANTRA
    [137] 	= true, -- FORMLESS_STRIKES
    [138] 	= true, -- MARTYR
    [139] 	= true, -- DEVOTION
    [140] 	= true, -- ASSASSINS_CHARGE
    [141] 	= true, -- FEINT
    [142] 	= true, -- FEALTY
    [143] 	= true, -- CHIVALRY
    [144] 	= true, -- DARK_SEAL
    [145] 	= true, -- DIABOLIC_EYE
    [146] 	= true, -- FERAL_HOWL
    [147] 	= true, -- KILLER_INSTINCT
    [148] 	= true, -- NIGHTINGALE
    [149] 	= true, -- TROUBADOUR
    [150] 	= true, -- STEALTH_SHOT
    [151] 	= true, -- FLASHY_SHOT
    [152] 	= true, -- SHIKIKOYO
    [153] 	= true, -- BLADE_BASH
    [154] 	= true, -- DEEP_BREATHING
    [155] 	= true, -- ANGON
    [156] 	= true, -- SANGE
    [157] 	= true, -- BLOOD_PACT_WARD
    [158] 	= true, -- HASSO
    [159] 	= true, -- SEIGAN
    [160] 	= true, -- CONVERGENCE
    [161] 	= true, -- DIFFUSION
    [162] 	= true, -- SNAKE_EYE
    [163] 	= true, -- FOLD
    [164] 	= true, -- ROLE_REVERSAL
    [165] 	= true, -- VENTRILOQUY
    [166] 	= true, -- TRANCE
    [167] 	= true, -- SAMBAS
    [168] 	= true, -- WALTZES
    [169] 	= true, -- DRAIN_SAMBA
    [170] 	= true, -- DRAIN_SAMBA_II
    [171] 	= true, -- DRAIN_SAMBA_III
    [172] 	= true, -- ASPIR_SAMBA
    [173] 	= true, -- ASPIR_SAMBA_II
    [174] 	= true, -- HASTE_SAMBA
    [175] 	= true, -- CURING_WALTZ
    [176] 	= true, -- CURING_WALTZ_II
    [177] 	= true, -- CURING_WALTZ_III
    [178] 	= true, -- CURING_WALTZ_IV
    [179] 	= true, -- HEALING_WALTZ
    [180] 	= true, -- DIVINE_WALTZ
    [181] 	= true, -- SPECTRAL_JIG
    [182] 	= true, -- CHOCOBO_JIG
    [183] 	= true, -- JIGS
    [184] 	= true, -- STEPS
    [185] 	= true, -- FLOURISHES_I
    [186] 	= true, -- QUICKSTEP
    [187] 	= true, -- BOX_STEP
    [188] 	= true, -- STUTTER_STEP
    [189] 	= true, -- ANIMATED_FLOURISH
    [190] 	= true, -- DESPERATE_FLOURISH
    [191] 	= true, -- REVERSE_FLOURISH
    [192] 	= true, -- VIOLENT_FLOURISH
    [193] 	= true, -- BUILDING_FLOURISH
    [194] 	= true, -- WILD_FLOURISH
    [195] 	= true, -- TABULA_RASA
    [196] 	= true, -- LIGHT_ARTS
    [197] 	= true, -- DARK_ARTS
    [198] 	= true, -- FLOURISHES_II
    [199] 	= true, -- MODUS_VERITAS
    [200] 	= true, -- PENURY
    [201] 	= true, -- CELERITY
    [202] 	= true, -- RAPTURE
    [203] 	= true, -- ACCESSION
    [204] 	= true, -- PARSIMONY
    [205] 	= true, -- ALACRITY
    [206] 	= true, -- EBULLIENCE
    [207] 	= true, -- MANIFESTATION
    [208] 	= true, -- STRATAGEMS
    [209] 	= true, -- VELOCITY_SHOT
    [210] 	= true, -- SNARL
    [211] 	= true, -- RETALIATION
    [212] 	= true, -- FOOTWORK
    [213] 	= true, -- DESPOIL
    [214] 	= true, -- PIANISSIMO
    [215] 	= true, -- SEKKANOKI
    [216] 	= true, -- ELEMENTAL_SIPHON
    [217] 	= true, -- SUBLIMATION
    [218] 	= true, -- ADDENDUM_WHITE
    [219] 	= true, -- ADDENDUM_BLACK
    [220] 	= true, -- COLLABORATOR
    [221] 	= true, -- SABER_DANCE
    [222] 	= true, -- FAN_DANCE
    [223] 	= true, -- NO_FOOT_RISE
    [224] 	= true, -- ALTRUISM
    [225] 	= true, -- FOCALIZATION
    [226] 	= true, -- TRANQUILITY
    [227] 	= true, -- EQUANIMITY
    [228] 	= true, -- ENLIGHTENMENT
    [229] 	= true, -- AFFLATUS_SOLACE
    [230] 	= true, -- AFFLATUS_MISERY
    [231] 	= true, -- COMPOSURE
    [232] 	= true, -- YONIN
    [233] 	= true, -- INNIN
    [234] 	= true, -- AVATARS_FAVOR
    [235] 	= true, -- READY
    [236] 	= true, -- RESTRAINT
    [237] 	= true, -- PERFECT_COUNTER
    [238] 	= true, -- MANA_WALL
    [239] 	= true, -- DIVINE_EMBLEM
    [240] 	= true, -- NETHER_VOID
    [241] 	= true, -- DOUBLE_SHOT
    [242] 	= true, -- SENGIKORI
    [243] 	= true, -- FUTAE
    [244] 	= true, -- SPIRIT_JUMP
    [245] 	= true, -- PRESTO
    [246] 	= true, -- DIVINE_WALTZ_II
    [247] 	= true, -- FLOURISHES_III
    [248] 	= true, -- CLIMACTIC_FLOURISH
    [249] 	= true, -- LIBRA
    [250] 	= true, -- TACTICAL_SWITCH
    [251] 	= true, -- BLOOD_RAGE
    [252] 	= true, -- IMPETUS
    [253] 	= true, -- DIVINE_CARESS
    [254] 	= true, -- SACROSANCTITY
    [255] 	= true, -- ENMITY_DOUSE
    [256] 	= true, -- MANAWELL
    [257] 	= true, -- SABOTEUR
    [258] 	= true, -- SPONTANEITY
    [259] 	= true, -- CONSPIRATOR
    [260] 	= true, -- SEPULCHER
    [261] 	= true, -- PALISADE
    [262] 	= true, -- ARCANE_CREST
    [263] 	= true, -- SCARLET_DELIRIUM
    [264] 	= true, -- SPUR
    [265] 	= true, -- RUN_WILD
    [266] 	= true, -- TENUTO
    [267] 	= true, -- MARCATO
    [268] 	= true, -- BOUNTY_SHOT
    [269] 	= true, -- DECOY_SHOT
    [270] 	= true, -- HAMANOHA
    [271] 	= true, -- HAGAKURE
    [272] 	= true, -- ISSEKIGAN
    [273] 	= true, -- DRAGON_BREAKER
    [274] 	= true, -- SOUL_JUMP
    [275] 	= true, -- STEADY_WING
    [276] 	= true, -- MANA_CEDE
    [277] 	= true, -- EFFLUX
    [278] 	= true, -- UNBRIDLED_LEARNING
    [279] 	= true, -- TRIPLE_SHOT
    [280] 	= true, -- ALLIES_ROLL
    [281] 	= true, -- MISERS_ROLL
    [282] 	= true, -- COMPANIONS_ROLL
    [283] 	= true, -- AVENGERS_ROLL
    [284] 	= true, -- COOLDOWN
    [285] 	= true, -- DEUX_EX_AUTOMATA
    [286] 	= true, -- CURING_WALTZ_V
    [287] 	= true, -- FEATHER_STEP
    [288] 	= true, -- STRIKING_FLOURISH
    [289] 	= true, -- TERNARY_FLOURISH
    [290] 	= true, -- PERPETUANCE
    [291] 	= true, -- IMMANENCE
    [292] 	= true, -- SMITING_BREATH
    [293] 	= true, -- RESTORING_BREATH
    [294] 	= true, -- KONZEN_ITTAI
    [295] 	= true, -- BULLY
    [296] 	= true, -- MAINTENANCE
    [297] 	= true, -- BRAZEN_RUSH
    [298] 	= true, -- INNER_STRENGTH
    [299] 	= true, -- ASYLUM
    [300] 	= true, -- SUBTLE_SORCERY
    [301] 	= true, -- STYMIE
    [302] 	= true, -- LARCENY
    [303] 	= true, -- INTERVENE
    [304] 	= true, -- SOUL_ENSLAVEMENT
    [305] 	= true, -- UNLEASH
    [306] 	= true, -- CLARION_CALL
    [307] 	= true, -- OVERKILL
    [308] 	= true, -- YAEGASUMI
    [309] 	= true, -- MIKAGE
    [310] 	= true, -- FLY_HIGH
    [311] 	= true, -- ASTRAL_CONDUIT
    [312] 	= true, -- UNBRIDLED_WISDOM
    [313] 	= true, -- CUTTING_CARDS
    [314] 	= true, -- HEADY_ARTIFICE
    [315] 	= true, -- GRAND_PAS
    [316] 	= true, -- CAPER_EMISSARIUS
    [317] 	= true, -- BOLSTER
    [318] 	= true, -- SWIPE
    [319] 	= true, -- FULL_CIRCLE
    [320] 	= true, -- LASTING_EMANATION
    [321] 	= true, -- ECLIPTIC_ATTRITION
    [322] 	= true, -- COLLIMATED_FERVOR
    [323] 	= true, -- LIFE_CYCLE
    [324] 	= true, -- BLAZE_OF_GLORY
    [325] 	= true, -- DEMATERIALIZE
    [326] 	= true, -- THEURGIC_FOCUS
    [327] 	= true, -- CONCENTRIC_PULSE
    [328] 	= true, -- MENDING_HALATION
    [329] 	= true, -- RADIAL_ARCANA
    [330] 	= true, -- ELEMENTAL_SFORZO
    [331] 	= true, -- RUNE_ENCHANTMENT
    [332] 	= true, -- IGNIS
    [333] 	= true, -- GELUS
    [334] 	= true, -- FLABRA
    [335] 	= true, -- TELLUS
    [336] 	= true, -- SULPOR
    [337] 	= true, -- UNDA
    [338] 	= true, -- LUX
    [339] 	= true, -- TENEBRAE
    [340] 	= true, -- VALLATION
    [341] 	= true, -- SWORDPLAY
    [342] 	= true, -- LUNGE
    [343] 	= true, -- PFLUG
    [344] 	= true, -- EMBOLDEN
    [345] 	= true, -- VALIANCE
    [346] 	= true, -- GAMBIT
    [347] 	= true, -- LIEMENT
    [348] 	= true, -- ONE_FOR_ALL
    [349] 	= true, -- RAYKE
    [350] 	= true, -- BATTUTA
    [351] 	= true, -- WIDENED_COMPASS
    [352] 	= true, -- ODYLLIC_SUBTERFUGE
    [353] 	= true, -- WARD
    [354] 	= true, -- EFFUSION
    [355] 	= true, -- CHOCOBO_JIG_II
    [356] 	= true, -- RELINQUISH
    [357] 	= true, -- VIVACIOUS_PULSE
    [358] 	= true, -- CONTRADANCE
    [359] 	= true, -- APOGEE
    [360] 	= true, -- ENTRUST
    [361] 	= true, -- BESTIAL_LOYALTY
    [362] 	= true, -- CASCADE
    [363] 	= true, -- CONSUME_MANA
    [364] 	= true, -- NATURALISTS_ROLL
    [365] 	= true, -- RUNEISTS_ROLL
    [366] 	= true, -- CROOKED_CARDS
    [367] 	= true, -- SPIRIT_BOND
    [368] 	= true, -- MAJESTY
    [369] 	= true, -- HEALING_RUBY
    [370] 	= true, -- POISON_NAILS
    [371] 	= true, -- SHINING_RUBY
    [372] 	= true, -- GLITTERING_RUBY
    [373] 	= true, -- METEORITE
    [374] 	= true, -- HEALING_RUBY_II
    [375] 	= true, -- SEARING_LIGHT
    [376] 	= true, -- HOLY_MIST
    [377] 	= true, -- SOOTHING_RUBY
    [378] 	= true, -- REGAL_SCRATCH
    [379] 	= true, -- MEWING_LULLABY
    [380] 	= true, -- EARIE_EYE
    [381] 	= true, -- LEVEL_QM_HOLY
    [382] 	= true, -- RAISE_II
    [383] 	= true, -- RERAISE_II
    [384] 	= true, -- ALTANAS_FAVOR
    [385] 	= true, -- MOONLIT_CHARGE
    [386] 	= true, -- CRESCENT_FANG
    [387] 	= true, -- LUNAR_CRY
    [388] 	= true, -- LUNAR_ROAR
    [389] 	= true, -- ECLIPTIC_GROWL
    [390] 	= true, -- ECLIPTIC_HOWL
    [391] 	= true, -- ECLIPSE_BITE
    [392] 	= true, -- HOWLING_MOON
    [393] 	= true, -- LUNAR_BAY
    [394] 	= true, -- HEAVENWARD_HOWL
    [395] 	= true, -- IMPACT
    [396] 	= true, -- PUNCH
    [397] 	= true, -- FIRE_II
    [398] 	= true, -- BURNING_STRIKE
    [399] 	= true, -- DOUBLE_PUNCH
    [400] 	= true, -- CRIMSON_HOWL
    [401] 	= true, -- FIRE_IV
    [402] 	= true, -- FLAMING_CRUSH
    [403] 	= true, -- METEOR_STRIKE
    [404] 	= true, -- INFERNO
    [405] 	= true, -- INFERNO_HOWL
    [406] 	= true, -- CONFLAG_STRIKE
    [407] 	= true, -- ROCK_THROW
    [408] 	= true, -- STONE_II
    [409] 	= true, -- ROCK_BUSTER
    [410] 	= true, -- MEGALITH_THROW
    [411] 	= true, -- EARTHEN_WARD
    [412] 	= true, -- STONE_IV
    [413] 	= true, -- MOUNTAIN_BUSTER
    [414] 	= true, -- GEOCRUSH
    [415] 	= true, -- EARTHEN_FURY
    [416] 	= true, -- EARTHEN_ARMOR
    [417] 	= true, -- CRAG_THROW
    [418] 	= true, -- BARRACUDA_DIVE
    [419] 	= true, -- WATER_II
    [420] 	= true, -- TAIL_WHIP
    [421] 	= true, -- SPRING_WATER
    [422] 	= true, -- SLOWGA
    [423] 	= true, -- WATER_IV
    [424] 	= true, -- SPINNING_DIVE
    [425] 	= true, -- GRAND_FALL
    [426] 	= true, -- TIDAL_WAVE
    [427] 	= true, -- TIDAL_ROAR
    [428] 	= true, -- SOOTHING_CURRENT
    [429] 	= true, -- CLAW
    [430] 	= true, -- AERO_II
    [431] 	= true, -- WHISPERING_WIND
    [432] 	= true, -- HASTEGA
    [433] 	= true, -- AERIAL_ARMOR
    [434] 	= true, -- AERO_IV
    [435] 	= true, -- PREDATOR_CLAWS
    [436] 	= true, -- WIND_BLADE
    [437] 	= true, -- AERIAL_BLAST
    [438] 	= true, -- FLEET_WIND
    [439] 	= true, -- HASTEGA_II
    [440] 	= true, -- AXE_KICK
    [441] 	= true, -- BLIZZARD_II
    [442] 	= true, -- FROST_ARMOR
    [443] 	= true, -- SLEEPGA
    [444] 	= true, -- DOUBLE_SLAP
    [445] 	= true, -- BLIZZARD_IV
    [446] 	= true, -- RUSH
    [447] 	= true, -- HEAVENLY_STRIKE
    [448] 	= true, -- DIAMOND_DUST
    [449] 	= true, -- DIAMOND_STORM
    [450] 	= true, -- CRYSTAL_BLESSING
    [451] 	= true, -- SHOCK_STRIKE
    [452] 	= true, -- THUNDER_II
    [453] 	= true, -- ROLLING_THUNDER
    [454] 	= true, -- THUNDERSPARK
    [455] 	= true, -- LIGHTNING_ARMOR
    [456] 	= true, -- THUNDER_IV
    [457] 	= true, -- CHAOTIC_STRIKE
    [458] 	= true, -- THUNDERSTORM
    [459] 	= true, -- JUDGMENT_BOLT
    [460] 	= true, -- SHOCK_SQUALL
    [461] 	= true, -- VOLT_STRIKE
    [462] 	= true, -- HEALING_BREATH_IV
    [463] 	= true, -- HEALING_BREATH
    [464] 	= true, -- HEALING_BREATH_II
    [465] 	= true, -- HEALING_BREATH_III
    [466] 	= true, -- REMOVE_POISON
    [467] 	= true, -- REMOVE_BLINDNESS
    [468] 	= true, -- REMOVE_PARALYSIS
    [469] 	= true, -- FLAME_BREATH
    [470] 	= true, -- FROST_BREATH
    [471] 	= true, -- GUST_BREATH
    [472] 	= true, -- SAND_BREATH
    [473] 	= true, -- LIGHTNING_BREATH
    [474] 	= true, -- HYDRO_BREATH
    [475] 	= true, -- SUPER_CLIMB
    [476] 	= true, -- REMOVE_CURSE
    [477] 	= true, -- REMOVE_DISEASE
    [478] 	= true, -- CAMISADO
    [479] 	= true, -- SOMNOLENCE
    [480] 	= true, -- NIGHTMARE
    [481] 	= true, -- ULTIMATE_TERROR
    [482] 	= true, -- NOCTOSHIELD
    [483] 	= true, -- DREAM_SHROUD
    [484] 	= true, -- NETHER_BLAST
    [485] 	= true, -- CACODEMONIA
    [486] 	= true, -- RUINOUS_OMEN
    [487] 	= true, -- NIGHT_TERROR
    [488] 	= true, -- PAVOR_NOCTURNUS
    [489] 	= true, -- BLINDSIDE
    [490] 	= true, -- DECONSTRUCTION
    [491] 	= true, -- CHRONOSHIFT
    [492] 	= true, -- ZANTETSUKEN
    [493] 	= true, -- PERFECT_DEFENSE
    [494] 	= true, -- FOOT_KICK
    [495] 	= true, -- DUST_CLOUD
    [496] 	= true, -- WHIRL_CLAWS
    [497] 	= true, -- HEAD_BUTT
    [498] 	= true, -- DREAM_FLOWER
    [499] 	= true, -- WILD_OATS
    [500] 	= true, -- LEAF_DAGGER
    [501] 	= true, -- SCREAM
    [502] 	= true, -- ROAR
    [503] 	= true, -- RAZOR_FANG
    [504] 	= true, -- CLAW_CYCLONE
    [505] 	= true, -- TAIL_BLOW
    [506] 	= true, -- FIREBALL
    [507] 	= true, -- BLOCKHEAD
    [508] 	= true, -- BRAINCRUSH
    [509] 	= true, -- INFRASONICS
    [510] 	= true, -- SECRETION
    [511] 	= true, -- LAMB_CHOP
    [512] 	= true, -- RAGE
    [513] 	= true, -- SHEEP_CHARGE
    [514] 	= true, -- SHEEP_SONG
    [515] 	= true, -- BUBBLE_SHOWER
    [516] 	= true, -- BUBBLE_CURTAIN
    [517] 	= true, -- BIG_SCISSORS
    [518] 	= true, -- SCISSOR_GAURD
    [519] 	= true, -- METALLIC_BODY
    [520] 	= true, -- NEEDLESHOT
    [521] 	= true, -- RANDOM_NEEDLES
    [522] 	= true, -- FROGKICK
    [523] 	= true, -- SPORE
    [524] 	= true, -- QUEASYSHROOM
    [525] 	= true, -- NUMBSHROOM
    [526] 	= true, -- SHAKESHROOM
    [527] 	= true, -- SILENCE_GAS
    [528] 	= true, -- DARK_SPORE
    [529] 	= true, -- POWER_ATTACK
    [530] 	= true, -- HI_FREQ_FIELD
    [531] 	= true, -- RHINO_ATTACK
    [532] 	= true, -- RHINO_GAURD
    [533] 	= true, -- SPOIL
    [534] 	= true, -- CURSED_SPHERE
    [535] 	= true, -- VENOM
    [536] 	= true, -- SANDBLAST
    [537] 	= true, -- SANDPIT
    [538] 	= true, -- VENOM_SPRAY
    [539] 	= true, -- MANDIBULAR_BITE
    [540] 	= true, -- SOPORIFIC
    [541] 	= true, -- GLOEOSUCCUS
    [542] 	= true, -- PALSY_POLLEN
    [543] 	= true, -- GEIST_WALL
    [544] 	= true, -- NUMBING_NOISE
    [545] 	= true, -- NIMBLE_SNAP
    [546] 	= true, -- CYCLOTAIL
    [547] 	= true, -- TOXIC_SPIT
    [548] 	= true, -- DOUBLE_CLAW
    [549] 	= true, -- GRAPPLE
    [550] 	= true, -- SPINNING_TOP
    [551] 	= true, -- FILAMENTED_HOLD
    [552] 	= true, -- CHAOTIC_EYE
    [553] 	= true, -- BLASTER
    [554] 	= true, -- SUCTION
    [555] 	= true, -- DRAINKISS
    [556] 	= true, -- SNOW_CLOUD
    [557] 	= true, -- WILD_CARROT
    [558] 	= true, -- SUDDEN_LUNGE
    [559] 	= true, -- SPIRAL_SPIN
    [560] 	= true, -- NOISOME_POWDER
    [561] 	= true, -- ACID_MIST
    [562] 	= true, -- TP_DRAINKISS
    [563] 	= true, -- SCYTHE_TAIL
    [564] 	= true, -- RIPPER_FANG
    [565] 	= true, -- CHOMP_RUSH
    [566] 	= true, -- CHARGED_WHISKER
    [567] 	= true, -- PURULENT_OOZE
    [568] 	= true, -- CORROSIVE_OOZE
    [569] 	= true, -- BACK_HEEL
    [570] 	= true, -- JETTATURA
    [571] 	= true, -- CHOKE_BREATH
    [572] 	= true, -- FANTOD
    [573] 	= true, -- TORTOISE_STOMP
    [574] 	= true, -- HARDEN_SHELL
    [575] 	= true, -- AQUA_BREATH
    [576] 	= true, -- WING_SLAP
    [577] 	= true, -- BEAK_LUNGE
    [578] 	= true, -- INTIMIDATE
    [579] 	= true, -- RECOIL_DIVE
    [580] 	= true, -- WATER_WALL
    [581] 	= true, -- SENSILLA_BLADES
    [582] 	= true, -- TEGMINA_BUFFET
    [583] 	= true, -- MOLTING_PLUMAGE
    [584] 	= true, -- SWOOPING_FRENZY
    [585] 	= true, -- SWEEPING_GOUGE
    [586] 	= true, -- ZEALOUS_SNORT
    [587] 	= true, -- PENTAPECK
    [588] 	= true, -- TICKLING_TENDRILS
    [589] 	= true, -- STINK_BOMB
    [590] 	= true, -- NECTAROUS_DELUGE
    [591] 	= true, -- NEPENTHIC_PLUNGE
    [592] 	= true, -- SOMERSAULT
    [593] 	= true, -- PACIFYING_RUBY
    [594] 	= true, -- FOUL_WATERS
    [595] 	= true, -- PESTILENT_PLUME
    [596] 	= true, -- PECKING_FLURRY
    [597] 	= true, -- SICKLE_SLASH
    [598] 	= true, -- ACID_SPRAY
    [599] 	= true, -- SPIDER_WEB
    [600] 	= true, -- REGAL_GASH
    [601] 	= true, -- INFECTED_LEECH
    [602] 	= true, -- GLOOM_SPRAY
    [603] 	= true, -- DISEMBOWEL
    [604] 	= true, -- EXTIRPATING_SALVO
    [605] 	= true, -- CLARSACH_CALL
    [606] 	= true, -- WELT
    [607] 	= true, -- KATABATIC_BLADES
    [608] 	= true, -- LUNATIC_VOICE
    [609] 	= true, -- ROUNDHOUSE
    [610] 	= true, -- CHINOOK
    [611] 	= true, -- BITTER_ELEGY
    [612] 	= true, -- SONIC_BUFFET
    [613] 	= true, -- TORNADO_II
    [614] 	= true, -- WINDS_BLESSING
    [615] 	= true, -- HYSTERIC_ASSAULT
}

-- NEW 30: Cumulative character variable for lifetime points earned.
local MAX_POINTS_PER_BATTLE = 500
local CUMULATIVE_SCORE_VAR = 'PB_TotalLifetimeScore' 

-- Global identifier prefix for listeners on the mob (used for addListener/removeListener)
local LISTENER_ID_PREFIX = 'CAMPAIGN_POINT_TRACKER_'

-- =============================================================================
-- REWARD CONFIGURATION
-- =============================================================================

-- TOGGLE: True = Award Job Points. False = Award Merit Points.
-- Note: EXP is always awarded if the player's main job level is < 99.
local AWARD_JOB_POINTS = true 

-- Base Conversion Multiplier: Final Score * REWARD_MULTIPLIER = Base Reward Amount
local REWARD_MULTIPLIER = 1 

-- NEW 31: Allied Notes Configuration
local ALLIED_NOTES_RATE = 10                    -- Base conversion rate: Final Score * ALLIED_NOTES_RATE
local ALLIED_NOTES_THRESHOLD = 750               -- If the base notes amount meets or exceeds this, apply the modifier
local ALLIED_NOTES_MODIFIER = 5               -- Modifier applied if the threshold is met
local MAX_ALLIED_NOTES_REWARD = 1500             -- Maximum Allied Notes per player, regardless of score.

-- BONUS: Multiplier applied to Base Reward if the players achieve a Victory (1.5 = 50% bonus)
local PLAYER_VICTORY_BONUS_MULTIPLIER = 1.25

-- Maximum limits for each reward type per player, regardless of score.
local MAX_JOB_POINTS_REWARD = 100
local MAX_MERIT_POINTS_REWARD = 0
local MAX_EXP_REWARD = 20000

-- =============================================================================
-- RESTRICTED WEAPONS CONFIGURATION
-- =============================================================================
local RESTRICTED_WEAPONS = {
    [xi.item.KRAKEN_CLUB] = true, -- Kraken Club
    [xi.item.MERCURIAL_KRIS] = true, -- Mercurial Kris 18020
    [xi.item.JOYEUSE] = true, -- Joyeuse 17652
    [xi.item.OCTAVE_CLUB] = true, -- Octave Club 18852
    [17813] = true, -- Soboro 17813
    [xi.item.RIDILL] = true, -- 
}


-- =============================================================================
-- NEW: REWARD SCALING CONFIGURATION
-- =============================================================================
local DURATION_REWARD_SCALING = {
    -- { hours = X, multiplier = Y } -> If battle duration is <= X hours, reward is multiplied by Y.
    { hours = 2, multiplier = 1 }, -- If battle duration is 2 hours or less, players get 50% of JP/EXP.
    { hours = 3, multiplier = 1 }, -- If battle duration is 3 hours, players get 75% of JP/EXP.
    -- Any duration over 3 hours will automatically receive 100% of the reward.
}
-- =======================================

-- =======================================
-- CAMPAIGN SCORE VARIABLES
-- =======================================
local CAMPAIGN_SCORE_VAR = "CampaignTideScore"
local CAMPAIGN_SCORE_NEUTRAL = 50
local CAMPAIGN_SCORE_MIN = 0
local CAMPAIGN_SCORE_MAX = 100
local CAMPAIGN_SCORE_WIN_MODIFIER = 5
local CAMPAIGN_SCORE_LOSS_MODIFIER = -7

-- DYNAMIC REGULAR MOB SPAWN TIER CONFIGURATION (NEW)

-- Tier 0 (Low Score: 1-11)
local REGULAR_QTY_DEFAULT_MIN = 10
local REGULAR_QTY_DEFAULT_MAX = 10

-- Tier 1 (Medium Score: 12-14)
local REGULAR_QTY_TIER1_MIN = 12
local REGULAR_QTY_TIER1_MAX = 14

-- Tier 2 (High Score: 15-20)
local REGULAR_QTY_TIER2_MIN = 13
local REGULAR_QTY_TIER2_MAX = 16

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
-- NEW: A persistent, incrementing ID for each battle instance.
local CAMPAIGN_BATTLE_ID_VAR = '[CampaignBattleHandler]BattleID'
-- NEW: The CharVar where the last battle ID will be stored for each player.
local PLAYER_LAST_BATTLE_ID_VAR = 'PB_LastBattleID'
-- NEW: The dynamically calculated battle duration for the current battle.
local CURRENT_BATTLE_DURATION_VAR = '[CampaignBattleHandler]CurrentBattleDuration'
-- NEW: The random damage resistance types for the current battle.
local BATTLE_DAMAGE_RES_VAR_1 = '[CampaignBattleHandler]BattleDamageRes1'
local BATTLE_DAMAGE_RES_VAR_2 = '[CampaignBattleHandler]BattleDamageRes2'

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
-- LOCALIZED MESSAGES
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
    WEAPON_UNEQUIPPED = "[ILLEGAL WEAPON] Use a different mainhand weapon for this fight!",
    
    -- Allied Notes Reward Message (Used if primary reward = 0)
    PLAYER_REWARD_NOTES_FMT = '[REWARD] You earned %d Allied Notes for the battle in %s!',
}

-- =============================================================================
--KEY ITEM REWARD BONUSES (Ordered from lowest to highest rank)
-- =============================================================================
-- max_reward_mod: Multiplier for the maximum limits of all rewards (JP, Merits, EXP, Notes). (1.05 = +5% max reward)
-- notes_threshold_mod: Multiplier for the ALLIED_NOTES_THRESHOLD (0.95 = 5% discount, 500 * 0.95 = 475 threshold)
-- NOTE: The 'ki_name' is used for the lookup since xi.keyItem IDs are unknown outside the core system.

local KI_REWARD_BONUS_CONFIG = {
    -- ki_name (string used for player:hasKeyItem check) = { max_reward_mod, notes_threshold_mod }
    { ki_name = 'BRONZE_RIBBON_OF_SERVICE', max_reward_mod = 0.5, notes_threshold_mod = 1.0000 }, --Lowest Rank
    { ki_name = 'BRONZE_STAR',              max_reward_mod = 0.6, notes_threshold_mod = 0.9816 },
    { ki_name = 'COPPER_EMBLEM_OF_SERVICE', max_reward_mod = 0.7, notes_threshold_mod = 0.9632 },
    { ki_name = 'BRASS_WINGS_OF_SERVICE',   max_reward_mod = 0.8, notes_threshold_mod = 0.9447 },
    { ki_name = 'STARLIGHT_MEDAL',          max_reward_mod = 1.0, notes_threshold_mod = 0.9263 },
    { ki_name = 'BRASS_RIBBON_OF_SERVICE',  max_reward_mod = 1.0, notes_threshold_mod = 0.9079 },
    { ki_name = 'STERLING_STAR',            max_reward_mod = 1.1, notes_threshold_mod = 0.8895 },
    { ki_name = 'IRON_EMBLEM_OF_SERVICE',   max_reward_mod = 1.2, notes_threshold_mod = 0.8711 },
    { ki_name = 'MYTHRIL_WINGS_OF_SERVICE', max_reward_mod = 1.3, notes_threshold_mod = 0.8526 },
    { ki_name = 'MOONLIGHT_MEDAL',          max_reward_mod = 1.4, notes_threshold_mod = 0.8342 },
    { ki_name = 'ALLIED_RIBBON_OF_BRAVERY', max_reward_mod = 1.5, notes_threshold_mod = 0.8158 },
    { ki_name = 'MYTHRIL_STAR',             max_reward_mod = 1.6, notes_threshold_mod = 0.7974 },
    { ki_name = 'STEELKNIGHT_EMBLEM',        max_reward_mod = 1.6, notes_threshold_mod = 0.7789 },
    { ki_name = 'WINGS_OF_INTEGRITY',       max_reward_mod = 1.7, notes_threshold_mod = 0.7605 },
    { ki_name = 'DAWNLIGHT_MEDAL',          max_reward_mod = 1.7, notes_threshold_mod = 0.7421 },
    { ki_name = 'ALLIED_RIBBON_OF_GLORY',   max_reward_mod = 1.8, notes_threshold_mod = 0.7237 },
    { ki_name = 'GOLDEN_STAR',              max_reward_mod = 1.8, notes_threshold_mod = 0.7053 },
    { ki_name = 'HOLYKNIGHT_EMBLEM',       max_reward_mod = 1.9, notes_threshold_mod = 0.6868 },
    { ki_name = 'WINGS_OF_HONOR',           max_reward_mod = 1.9, notes_threshold_mod = 0.6684 },
    { ki_name = 'MEDAL_OF_ALTANA',          max_reward_mod = 2.0, notes_threshold_mod = 0.6500 } -- Highest Rank
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
                regulars = { unitname = "SHB-Stormer",    look = '00000f0100000000000000000000000000000000', groupid = 97, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowfang Battalion",
                commander = { unitname = "Shadowfang",      look = '0000e50200000000000000000000000000000000', groupid = 100, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "SFB-Void",       look = '0000bb0100000000000000000000000000000000', groupid = 101, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadoweye Battalion",
                commander = { unitname = "Shadoweye",       look = '0000090100000000000000000000000000000000', groupid = 102, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "SEB-Gnat",       look = '0000dc0700000000000000000000000000000000', groupid = 103, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowwing Battalion",
                commander = { unitname = "Shadowwing",      look = '0000b10800000000000000000000000000000000', groupid = 84, zoneid = 136, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "SWB-Enrager",    look = '0000b10800000000000000000000000000000000', groupid = 85, zoneid = 136, qty = REGULARS_QTY },
            },
            {
                unitname = "Shadowsoul Battalion",
                commander = { unitname = "Shadowsoul",      look = '0000a90800000000000000000000000000000000', groupid = 88, zoneid = 137, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "SSB-Devourer",   look = '0000a50100000000000000000000000000000000', groupid = 89, zoneid = 137, qty = REGULARS_QTY },
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
                regulars = { unitname = "SHH-Protector",  look = '0000fa0700000000000000000000000000000000', groupid = 75, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gwajboj's' Gutrenders",
                commander = { unitname = "1-Eyed Gwajoboj", look = '00001b0800000000000000000000000000000000', groupid = 76, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GBG-Trooper",    look = '0000fa0700000000000000000000000000000000', groupid = 77, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Spinebeak Horde",
                commander = { unitname = "DeathLord Roj",   look = '0000ff0700000000000000000000000000000000', groupid = 78, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "SBH-Chopper",    look = '0000fd0700000000000000000000000000000000', groupid = 79, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Clan Reaper",
                commander = { unitname = "Warmachine",      look = '0000ac0100000000000000000000000000000000', groupid = 80, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "CR-Grunt",       look = '0000030800000000000000000000000000000000', groupid = 82, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Moonfang Pack",
                commander = { unitname = "Alpha Anders",    look = '0000f10700000000000000000000000000000000', groupid = 83, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "MFP-Warrior",    look = '0000f10700000000000000000000000000000000', groupid = 85, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gnadgad's Dismemberment Brigade",
                commander = { unitname = "Poisonhand", look = '0000010800000000000000000000000000000000', groupid = 86, zoneid = 81, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GDB-Grappler",   look = '0000000800000000000000000000000000000000', groupid = 87, zoneid = 81, qty = REGULARS_QTY },
            },
            {
                unitname = "Gudrud's' Shieldchewers",

                commander = { unitname = "Gudrud",          look = '0000180400000000000000000000000000000000', groupid = 91, zoneid = 82, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GSC-Impaler",    look = '00006c0200000000000000000000000000000000', groupid = 92, zoneid = 82, qty = REGULARS_QTY },
            },
            {
                unitname = "Prozpuz' Throatrippers",
                commander = { unitname = "3-Eyed Prozpuz",  look = '0000040800000000000000000000000000000000', groupid = 88, zoneid = 83, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "PTR-Predator",   look = '0000030800000000000000000000000000000000', groupid = 89, zoneid = 83, qty = REGULARS_QTY },
            },
            {
                unitname = "Gochakzuk's Gravemakers",
                commander = { unitname = "Dirty Gochakuk", look = '0000190400000000000000000000000000000000', groupid = 88, zoneid = 84, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GGM-Charmer",    look = '0000740200000000000000000000000000000000', groupid = 89, zoneid = 84, qty = REGULARS_QTY },
            },
        },
    },

    -- Quadav Shieldwarriors Forces Army
    {
        name = "Quadav Shieldwarriors Force",
        units = {
            {
                unitname = "Di'Dha Elite Guard",
                commander = { unitname = "Dha Adamanfist", look = '00000e0300000000000000000000000000000000', groupid = 83, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "DEG-Guard",      look = '00009f0200000000000000000000000000000000', groupid = 84, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Waughroon Armored Division",
                commander = { unitname = "Dho 100-fist", look = '00006b0800000000000000000000000000000000', groupid = 85, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "WAD-Heavyshell",  look = '0000440800000000000000000000000000000000', groupid = 86, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Beadeaux Vanguard",
                commander = { unitname = "Vyu Headhunter",  look = '0000510800000000000000000000000000000000', groupid = 87, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "BV-Vanguard",    look = '0000490800000000000000000000000000000000', groupid = 88, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Qulun Armored Division",
                commander = { unitname = "BiGho Headtaker", look = '00004c0800000000000000000000000000000000', groupid = 89, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "QAD-Heavyshell",  look = '0000490800000000000000000000000000000000', groupid = 90, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Go'Bhu Elite Raiders",
                commander = { unitname = "Bhu Herohunter",  look = '00001d0400000000000000000000000000000000', groupid = 91, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GR-Raider",      look = '00009b0200000000000000000000000000000000', groupid = 92, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "Dadough Vanguard",
                commander = { unitname = "Bho Venomtail",   look = '00001f0400000000000000000000000000000000', groupid = 93, zoneid = 88, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "DV-Vanguard",    look = '00009a0200000000000000000000000000000000', groupid = 94, zoneid = 88, qty = REGULARS_QTY },
            },
            {
                unitname = "No'Mho Elite Guard",
                commander = { unitname = "Mho Redarmor",    look = '00001e0400000000000000000000000000000000', groupid = 91, zoneid = 89, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "NEG-Guard",      look = '0000990200000000000000000000000000000000', groupid = 92, zoneid = 89, qty = REGULARS_QTY },
            },
            {
                unitname = "Gi'Ghi Elite Guard",
                commander = { unitname = "Ghi Chopper", look = '0000440800000000000000000000000000000000', groupid = 90, zoneid = 90, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "GG-Guard",       look = '0000440800000000000000000000000000000000', groupid = 92, zoneid = 90, qty = REGULARS_QTY },
            },
            {
                unitname = "Vhuud Vanguard",
                commander = { unitname = "GaDho Softstep",  look = '0000940200000000000000000000000000000000', groupid = 101, zoneid = 91, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "VV-Vanguard",    look = '0000920200000000000000000000000000000000', groupid = 103, zoneid = 91, qty = REGULARS_QTY },
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
                regulars = { unitname = "Div. Templar",   look = '00005f0200000000000000000000000000000000', groupid = 90, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Disseminators",
                commander = { unitname = "Moo Ouzi",        look = '0000430800000000000000000000000000000000', groupid = 91, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Sower",     look = '00001c0800000000000000000000000000000000', groupid = 92, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Assassins",
                commander = { unitname = "Muu Buxu",        look = '0000210800000000000000000000000000000000', groupid = 93, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Assassin",  look = '00001f0800000000000000000000000000000000', groupid = 94, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Ascetics",
                commander = { unitname = "Dee Xalmo",       look = '0000240800000000000000000000000000000000', groupid = 95, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Ascetic",   look = '0000220800000000000000000000000000000000', groupid = 96, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Plenilune Ronin",
                commander = { unitname = "Kazan",       look = '00003b0400000000000000000000000000000000', groupid = 97, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Ronin",  look = '00001f0800000000000000000000000000000000', groupid = 98, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Inspirers",
                commander = { unitname = "Vuu Puqu",        look = '0000510200000000000000000000000000000000', groupid = 99, zoneid = 95, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Inspirer",  look = '00003d0400000000000000000000000000000000', groupid = 100, zoneid = 95, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Sentinels",
                commander = { unitname = "Yuu Mjuu",        look = '00003c0400000000000000000000000000000000', groupid = 74, zoneid = 96, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Sentinel",  look = '0000470200000000000000000000000000000000', groupid = 76, zoneid = 96, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Inciters",
                commander = { unitname = "Vaa Oozu",        look = '0000220800000000000000000000000000000000', groupid = 93, zoneid = 97, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars = { unitname = "Div. Inciter",   look = '00001c0800000000000000000000000000000000', groupid = 95, zoneid = 97, qty = REGULARS_QTY },
            },
            {
                unitname = "Divine Paradigms",
                commander = { unitname = "Yaa Haqa",        look = '00004d0200000000000000000000000000000000', groupid = 89, zoneid = 98, qty = COMMANDER_QTY, entityFlags = 157 },
                regulars =  { unitname = "Div. Priest",   look = '00003d0400000000000000000000000000000000', groupid = 90, zoneid = 98, qty = REGULARS_QTY },
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

-- =======================================
-- CAMPAIGN SCORE CONFIGURATION AND LOGIC
-- =======================================

--- Helper function to update and clamp the campaign score based on the outcome.
---@param modifier number The value to add or subtract from the current score.
local function updateCampaignScore(modifier)
    -- Attempt to retrieve the current score. Default to neutral if not set.
    -- FIX: Convert the server variable to a number. It is stored as a string.
    -- If it's nil (not set), tonumber will return nil, and the 'or' will default it.
    local currentScore = tonumber(GetServerVariable(CAMPAIGN_SCORE_VAR))
    
    -- REVISED LOGIC: Only initialize to neutral (10) if the variable is missing (nil).
    if currentScore == nil then 
        currentScore = CAMPAIGN_SCORE_NEUTRAL
        log_debug("[CampaignBattleHandler] Campaign Score initialized to neutral: " .. currentScore)
    end
    
    local newScore = currentScore + modifier
    
    -- Clamp the score to the defined min/max limits (1-20)
    newScore = math.max(CAMPAIGN_SCORE_MIN, math.min(CAMPAIGN_SCORE_MAX, newScore))

    if newScore ~= currentScore then
        SetServerVariable(CAMPAIGN_SCORE_VAR, newScore)
        log_debug(string.format("[CampaignBattleHandler] Campaign Score updated from %d (Modifier: %d) to %d. (Range: %d-%d)", 
                            currentScore, modifier, newScore, CAMPAIGN_SCORE_MIN, CAMPAIGN_SCORE_MAX))
    else
        log_debug(string.format("[CampaignBattleHandler] Campaign Score remained at %d (Modifier: %d) - Clamped by limits.", currentScore, modifier))
    end
    
    return newScore
end

-- =======================================
-- CAMPAIGN TIDE QUANTITY MODIFIERS
-- =======================================

--- Calculates the number of regular mobs to spawn based on the current campaign score.
--- This will override the default quantity for the 'Regulars' unit type.
---@return number The randomly calculated quantity for regular mobs.
local function calculateRegularsQuantity()
    local score = GetServerVariable(CAMPAIGN_SCORE_VAR)
    
    -- Default to neutral if not set (which means 10, based on updateCampaignScore logic)
    if score == nil then
        score = CAMPAIGN_SCORE_NEUTRAL
    end
    
    local min_qty, max_qty
    
    -- Tier 2: Score 81-100 (Highest Tier)
    if score >= 81 and score <= CAMPAIGN_SCORE_MAX then
        min_qty = REGULAR_QTY_TIER2_MIN
        max_qty = REGULAR_QTY_TIER2_MAX
        log_debug(string.format("[CampaignBattleHandler] Score Tier 2 (Score 81-%d): High Regulars Qty (%d-%d).", CAMPAIGN_SCORE_MAX, REGULAR_QTY_TIER2_MIN, REGULAR_QTY_TIER2_MAX))
    -- Tier 1: Score 61-80 (Medium Tier)
    elseif score >= 61 and score <= 80 then
        min_qty = REGULAR_QTY_TIER1_MIN
        max_qty = REGULAR_QTY_TIER1_MAX
        log_debug(string.format("[CampaignBattleHandler] Score Tier 1 (Score 61-80): Medium Regulars Qty (%d-%d).", REGULAR_QTY_TIER1_MIN, REGULAR_QTY_TIER1_MAX))
    else -- Score 0-60 (Default/Low Tier)
        min_qty = REGULAR_QTY_DEFAULT_MIN
        max_qty = REGULAR_QTY_DEFAULT_MAX
        log_debug(string.format("[CampaignBattleHandler] Score Tier 0 (Score 0-60): Default Regulars Qty (%d-%d).", REGULAR_QTY_DEFAULT_MIN, REGULAR_QTY_DEFAULT_MAX))
    end
    
    local final_qty = math.random(min_qty, max_qty)
    log_debug(string.format("[CampaignBattleHandler] Campaign Score %d -> Calculated Regulars Qty: %d (Random from %d-%d).", 
                            score, final_qty, min_qty, max_qty))
    
    return final_qty
end

---@nodiscard
---Calculates the actual battle duration based on the CampaignFortifications server variable.
---The base duration is BATTLE_DURATION_HOURS.
---@return number The calculated battle duration in hours.
local function getDynamicBattleDuration()
    local fortificationScore = tonumber(GetServerVariable("CampaignFortifications")) or 0
    local duration = BATTLE_DURATION_HOURS -- Start with the base duration

    if fortificationScore > 900 then
        duration = duration + 2
        log_debug(string.format("[Battle Duration] Fortifications at %d (>900). Adding 2 hours. New duration: %d.", fortificationScore, duration))
    elseif fortificationScore > 700 then
        duration = duration + 1
        log_debug(string.format("[Battle Duration] Fortifications at %d (>700). Adding 1 hour. New duration: %d.", fortificationScore, duration))
    else
        log_debug(string.format("[Battle Duration] Fortifications at %d (<=700). No duration modification. Duration: %d.", fortificationScore, duration))
    end
    return duration
end


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
function log_info(...)
    local status, err = pcall(print, "INFO: " .. createLogString(...))
    if not status then
        print("ERROR (log_info fallback): Failed to log: " .. tostring(err) .. "\n")
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

-- Error level logging.
function log_error(...)
    local status, err = pcall(print, "ERROR: " .. createLogString(...))
    if not status then
        print("ERROR (log_error fallback): Failed to log: " .. tostring(err) .. "\n")
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
---@param battleZoneObj CZone The zone object where the battle took place.
local function despawnAllBattleMobs(battleZoneObj)
	if not battleZoneObj then
		log_debug("[CampaignBattleHandler] Despawn failed: battleZoneObj is nil.")
		return
	end

	log_debug("[CampaignBattleHandler] Despawning all campaign mobs in zone: ", battleZoneObj:getName())
	local despawnedCount = 0
	
	for _, mob in pairs(battleZoneObj:getMobs()) do
		-- Check if the mob is a campaign mob (alive or dead).
		if mob and mob:getLocalVar('IsCampaignMob') == 1 then
			DespawnMob(mob:getID())
			log_debug("Despawned campaign mob ID: " .. mob:getID() .. " (Unit: " .. mob:getName() .. ").")
			despawnedCount = despawnedCount + 1
		end
	end
	log_debug("[CampaignBattleHandler] Despawn complete. Removed ", despawnedCount, " mobs.")
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

-- Utility function for deep copying tables, ensuring that unit modifications 
-- are isolated to the current battle and do not corrupt the global ARMIES table.
---@nodiscard
---Performs a deep copy of a table.
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
        -- *** CRITICAL FIX: DEEP COPY THE UNIT CONFIGURATION ***
        -- This ensures that when we modify the .qty later, we only modify this temporary copy,
        -- not the global ARMIES table, and that the spawned unit gets the correct reference.
        selectedUnit = deepCopy(selectedArmy.units[unitIndex])
    end

    if not selectedZone or not selectedArmy or not selectedUnit then
        log_debug("[CampaignBattleHandler] ERROR: Persisted indices point to invalid config. Resetting state.")
        SetServerVariable(BATTLE_STATE_VAR, 0)
        SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
        SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
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

---@nodiscard
---Calculates stat and level modifiers based on the CampaignRecon server variable.
---A lower recon score results in stronger mobs.
---@return number statBonus The bonus to apply to DMG, ATT, ACC, EVA mods.
---@return number levelBonus The bonus to apply to the mob's level.
local function calculateReconModifiers()
    -- Get the recon score, default to 1000 (max recon) if not set.
    local reconScore = tonumber(GetServerVariable("CampaignRecon")) or 1000

    -- Ensure score is within bounds 0-1000
    reconScore = math.max(0, math.min(1000, reconScore))

    -- Calculate a penalty factor from 0.0 (at 1000 recon) to 1.0 (at 0 recon)
    -- This represents how much of the max penalty should be applied.
    local penaltyFactor = (1000 - reconScore) / 1000

    -- Define the maximum possible bonus for stats and levels.
    -- This is the bonus that will be applied at 0 recon score.
    local maxStatBonus = 500  -- This will turn a -500 mod into 0 at 0 recon.
    local maxLevelBonus = 5   -- Mobs will be up to 5 levels higher at 0 recon.

    -- Calculate the actual bonus to apply by scaling the max bonus by the penalty factor.
    local statBonus = math.floor(maxStatBonus * penaltyFactor)
    local levelBonus = math.floor(maxLevelBonus * penaltyFactor)

    log_debug(string.format("[Recon] Recon Score: %d. Penalty Factor: %.2f. Stat Bonus: +%d, Level Bonus: +%d.",
        reconScore, penaltyFactor, statBonus, levelBonus))

    return statBonus, levelBonus
end

---
---Applies flat reductions to global campaign resources after a battle.
---The reduction amounts are determined by the battle outcome (win/loss).
---@param isPlayerVictory boolean True if players won, false if they lost.
local function applyEndOfBattleReductions(isPlayerVictory)
    local outcome = isPlayerVictory and "WIN" or "LOSS"
    local reductionAmounts = RESOURCE_REDUCTION_CONFIG[outcome]

    log_debug(string.format("[Resource Reduction] Applying reductions for a player %s.", outcome))

    for varName, amount in pairs(reductionAmounts) do
        if amount > 0 then
            -- Get current value, default to 0 if not set
            local currentValue = tonumber(GetServerVariable(varName)) or 0
            
            -- Calculate the amount to reduce
            local reductionAmount = amount
            
            -- Calculate the new value and ensure it doesn't go below zero
            local newValue = math.max(0, currentValue - reductionAmount)

            if newValue ~= currentValue then
                SetServerVariable(varName, newValue)
                log_debug(string.format("[Resource Reduction] Reduced %s by %d points. Old: %d, New: %d.",
                    varName, reductionAmount, currentValue, newValue))
            else
                log_debug(string.format("[Resource Reduction] No change for %s. Current value is %d.", varName, currentValue))
            end
        end
    end
end


-- =============================================================================
-- INACTIVITY AND DEMOTION CONFIGURATION
-- =============================================================================
local INACTIVITY_GRACE_PERIOD_BATTLES = 56 -- Approx. 4 IRL days (14 battles/day * 2)
local BATTLES_PER_DAY = 14 -- Used to calculate penalty per day.

local DEMOTION_FLAG_VAR = 'PB_DemotionFlag' -- CharVar to prevent multiple demotions. (1 = Demoted)

-- The campaign medal Key Item IDs and their required lifetime scores, indexed by rank (1 to 20).
local CAMPAIGN_RANKS = {
    [1] =  {     ki_id = xi.ki.BRONZE_RIBBON_OF_SERVICE,   threshold = 1000 },   -- ~5 battles from start
    [2] =  {     ki_id = xi.ki.BRONZE_STAR,                threshold = 2000 },   -- ~5 battles from rank 1
    [3] =  {     ki_id = xi.ki.COPPER_EMBLEM_OF_SERVICE,   threshold = 3200 },   -- ~6 battles from rank 2
    [4] =  {     ki_id = xi.ki.BRASS_WINGS_OF_SERVICE,     threshold = 4600 },   -- ~7 battles from rank 3
    [5] =  {     ki_id = xi.ki.STARLIGHT_MEDAL,            threshold = 6200 },   -- ~8 battles from rank 4
    [6] =  {     ki_id = xi.ki.BRASS_RIBBON_OF_SERVICE,    threshold = 8000 },   -- ~9 battles from rank 5
    [7] =  {     ki_id = xi.ki.STERLING_STAR,              threshold = 10000 },  -- ~10 battles from rank 6
    [8] =  {     ki_id = xi.ki.IRON_EMBLEM_OF_SERVICE,     threshold = 12200 },  -- ~11 battles from rank 7
    [9] =  {     ki_id = xi.ki.MYTHRIL_WINGS_OF_SERVICE,   threshold = 14600 },  -- ~12 battles from rank 8
    [10] = {     ki_id = xi.ki.MOONLIGHT_MEDAL,             threshold = 17200 },  -- ~13 battles from rank 9
    [11] = {     ki_id = xi.ki.ALLIED_RIBBON_OF_BRAVERY,    threshold = 20000, inactivity_penalty_percent = 0.0018 }, -- ~8 Days to demote
    [12] = {     ki_id = xi.ki.MYTHRIL_STAR,                threshold = 23000, inactivity_penalty_percent = 0.0020 },
    [13] = {     ki_id = xi.ki.STEELKNIGHT_EMBLEM,           threshold = 26200, inactivity_penalty_percent = 0.0022 },
    [14] = {     ki_id = xi.ki.WINGS_OF_INTEGRITY,          threshold = 29600, inactivity_penalty_percent = 0.0024 },
    [15] = {     ki_id = xi.ki.DAWNLIGHT_MEDAL,             threshold = 33200, inactivity_penalty_percent = 0.0026 },
    [16] = {     ki_id = xi.ki.ALLIED_RIBBON_OF_GLORY,      threshold = 37000, inactivity_penalty_percent = 0.0028 },
    [17] = {     ki_id = xi.ki.GOLDEN_STAR,                 threshold = 41000, inactivity_penalty_percent = 0.0030 },
    [18] = {     ki_id = xi.ki.HOLYKNIGHT_EMBLEM,          threshold = 45000, inactivity_penalty_percent = 0.0032 },
    [19] = {     ki_id = xi.ki.WINGS_OF_HONOR,              threshold = 49000, inactivity_penalty_percent = 0.0034 },
    [20] = {     ki_id = xi.ki.MEDAL_OF_ALTANA,             threshold = 53000, inactivity_penalty_percent = 0.0036 }, -- ~5 Days to demote
}

--- Gets the player's highest campaign rank based on the KIs they possess.
---@param player Player The player to check.
---@return number The player's rank (1-20), or 0 if they have no rank.
local function getPlayerCampaignRank(player)
    -- Iterate backwards from the highest rank to find the first medal they have.
    for i = #CAMPAIGN_RANKS, 1, -1 do
        local rankData = CAMPAIGN_RANKS[i]
        if player:hasKeyItem(rankData.ki_id) then
            return i -- Return the rank number
        end
    end
    return 0 -- No rank found
end

--- Checks if a player's score has dropped below a medal threshold and removes the KI.
---@param player Player The player to check.
---@param currentScore number The player's new, potentially penalized score.
---@return number|nil The ID of the key item that was removed, or nil if no demotion.
local function checkForDemotion(player, currentScore)
    local demotedMedalId = nil
    -- Iterate backwards from the highest rank to find the first medal they have but no longer qualify for.
    for i = #CAMPAIGN_RANKS, 1, -1 do
        local rankData = CAMPAIGN_RANKS[i]
        local medalId = rankData.ki_id
        local requiredScore = rankData.threshold

        if player:hasKeyItem(medalId) and currentScore < requiredScore then
            -- npcUtil.delKeyItem(player, medalId) -- Key item removal is now handled by CustEvalNPC.lua
            demotedMedalId = medalId
            log_debug("Demotion Detected: Score %d is less than threshold %d for KI %d. KI will be removed by the Campaign Judge.", currentScore, requiredScore, medalId)
            return demotedMedalId -- Return immediately after the first (highest) demotion
        end
    end
    return nil
end

--- Finds the rank data for a given Key Item ID.
---@param medalId number The KI ID of the medal.
---@return table|nil The rank data table from CAMPAIGN_RANKS, or nil if not found.
local function getRankDataByMedalId(medalId)
    if not medalId then return nil end
    for _, rankData in ipairs(CAMPAIGN_RANKS) do
        if rankData.ki_id == medalId then
            return rankData
        end
    end
    return nil
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
---@param battleDurationHours number The total duration of the battle in hours.
local function awardBattleRewards(zone, isPlayerVictory, battleDurationHours)
    log_debug(MESSAGES.SEPARATOR)
    log_debug("[REWARDS] Starting reward calculation. Player Victory: ", tostring(isPlayerVictory), ". Battle Duration: ", battleDurationHours, " hours.")


    local allPlayers = zone:getPlayers()
    local rewardMultiplier = REWARD_MULTIPLIER

    -- *** Determine the JP/EXP scaling multiplier based on battle duration ***
    local durationRewardMultiplier = 1.0 -- Default to 100%
    local durationRewardLog = "100% (Full Duration)"
    -- Sort the scaling table to ensure we check from lowest hours to highest
    table.sort(DURATION_REWARD_SCALING, function(a, b) return a.hours < b.hours end)
    for _, scale in ipairs(DURATION_REWARD_SCALING) do
        if battleDurationHours <= scale.hours then
            durationRewardMultiplier = scale.multiplier
            durationRewardLog = string.format("%.0f%% (Duration <= %d hours)", durationRewardMultiplier * 100, scale.hours)
            break -- Stop at the first matching tier
        end
    end
    log_debug("[REWARDS] JP/EXP Reward Scaling Factor: ", durationRewardLog)

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
            -- *** INACTIVITY PENALTY LOGIC (MOVED HERE) ***
            -- This check runs BEFORE the player's score for the current battle is tallied.
            local currentBattleID = GetServerVariable(CAMPAIGN_BATTLE_ID_VAR) or 0
            local playerLastBattleID = player:getCharVar(PLAYER_LAST_BATTLE_ID_VAR) or 0
            local missedBattles = currentBattleID - playerLastBattleID

            if missedBattles >= INACTIVITY_GRACE_PERIOD_BATTLES and player:getCharVar(DEMOTION_FLAG_VAR) == 0 then
                local playerRank = getPlayerCampaignRank(player)
                log_debug("Inactivity detected for %s. Rank: %d. Missed Battles: %d (Grace: %d).", player:getName(), playerRank, missedBattles, INACTIVITY_GRACE_PERIOD_BATTLES)

                if playerRank >= 11 and CAMPAIGN_RANKS[playerRank].inactivity_penalty_percent then
                    local currentLifetimeScore = player:getCharVar(CUMULATIVE_SCORE_VAR) or 0
                    local battlesToPenalize = missedBattles - INACTIVITY_GRACE_PERIOD_BATTLES

                    if battlesToPenalize > 0 then
                        -- The penalty is per battle missed over the grace period.
                        local penaltyPercentPerBattle = CAMPAIGN_RANKS[playerRank].inactivity_penalty_percent / BATTLES_PER_DAY
                        local totalPenaltyPercent = battlesToPenalize * penaltyPercentPerBattle
                        local scoreToLose = math.floor(currentLifetimeScore * totalPenaltyPercent)

                        local newLifetimeScore = math.max(0, currentLifetimeScore - scoreToLose)
                        player:setCharVar(CUMULATIVE_SCORE_VAR, newLifetimeScore)

                        log_debug("Penalty applied to %s. Battles penalized: %d. Total Penalty: %.2f%%. Score Lost: %d. New Score: %d",
                                  player:getName(), battlesToPenalize, totalPenaltyPercent * 100, scoreToLose, newLifetimeScore)

                    end
                end
            end

            local totalPoints = 0
            
            -- Tally score from all contribution variables and reset them
            for event, varName in pairs(CONTRIBUTION_VARS) do
                local score = player:getCharVar(varName) or 0
                totalPoints = totalPoints + score
                -- Cleanup: Reset the charVar immediately after fetching it
                player:setCharVar(varName, 0)
            end

            -- Check for demotion after score penalty but BEFORE awarding new points
            local demotedMedalId = checkForDemotion(player, player:getCharVar(CUMULATIVE_SCORE_VAR))
            if demotedMedalId then
                player:setCharVar(DEMOTION_FLAG_VAR, 1)
                log_debug("Player %s demoted. Lost KI %d. Setting %s to 1.", player:getName(), demotedMedalId, DEMOTION_FLAG_VAR)

                local lostRankData = getRankDataByMedalId(demotedMedalId)
                if lostRankData then
                    local rankThreshold = lostRankData.threshold
                    local scoreFloor = math.floor(rankThreshold * 0.90)
                    local currentLifetimeScore = player:getCharVar(CUMULATIVE_SCORE_VAR)

                    -- 1. Enforce the score floor
                    if currentLifetimeScore < scoreFloor then
                        player:setCharVar(CUMULATIVE_SCORE_VAR, scoreFloor)
                        log_debug("Enforcing score floor for %s. Score adjusted from %d to %d.", player:getName(), currentLifetimeScore, scoreFloor)
                    end

                    -- 2. Cap the points from the current battle
                    local maxPointsToAward = (rankThreshold - 1) - player:getCharVar(CUMULATIVE_SCORE_VAR)
                    totalPoints = math.min(totalPoints, math.max(0, maxPointsToAward))
                    log_debug("Capping points for demoted player %s. Max points to award: %d. Actual points awarded: %d.", player:getName(), maxPointsToAward, totalPoints)
                end
                player:printToPlayer("Please visit the Campaign Judge regarding your service medal.", xi.msg.channel.SYSTEM_3) -- User requested message
            end

            -- *** NEW 34: Apply Key Item Bonuses to Max Rewards and Notes Threshold ***
            local kiBonus = findHighestRankKIModifier(player)
            local pointsToReward = totalPoints -- Base points remain unmodified as per user request
            local notesThreshold = ALLIED_NOTES_THRESHOLD -- Start with base threshold
            local maxRewardMod = 0.5 -- Default: 50% max limit for players with no KI

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
                    -- Use the modified max limit and apply duration scaling
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
                        finalRewardAmount = math.floor(math.max(0, math.min(calculatedReward, remainingSpace)) * durationRewardMultiplier)
                        
                        primaryRewardAction = function(amount) 
                            local job = player:getMainJob()
                            if amount > 0 then
                                player:addJobPoints(job, amount)
                            end
                        end
                    else
                        primaryRewardName = "Merit Points"
                        -- Use the modified max limit and apply duration scaling
                        finalRewardAmount = math.floor(math.min(baseRewardAmount, modifiedMaxMeritPoints) * durationRewardMultiplier)
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

                -- *** NEW: Set the battle ID for the participating player ***
                -- Get the current battle ID from the server variable
                local currentBattleID = GetServerVariable(CAMPAIGN_BATTLE_ID_VAR) or 0
                if currentBattleID > 0 then
                    player:setCharVar(PLAYER_LAST_BATTLE_ID_VAR, currentBattleID)
                    log_debug(string.format("[REWARDS] %s assigned Last Battle ID: %d", player:getName(), currentBattleID))
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
-- DYNAMIC ENTITY SPAWNING (MODIFIED)
-- =======================================

---Spawns the commander and regular units for a selected enemy unit around the battle location.
---@param zone CZone The zone object where the battle will take place.
---@param selectedZone table The configuration table for the zone (contains SPAWN_AREA).
---@param selectedUnit table The configuration table for the enemy unit to spawn.
---@param battleFightStartHour number The hour (0-23) the fight officially started.
local function spawnArmy(zone, selectedZone, selectedUnit, battleFightStartHour)
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

    -- *******************************************************************
    -- *** DYNAMIC QUANTITY & HPP MODIFICATION LOGIC ***
    -- *******************************************************************
    -- 1. Get base quantity from Campaign Tide score
    local dynamicRegularsQty = calculateRegularsQuantity()
    log_debug(string.format("[CampaignBattleHandler] Base Regulars Qty from Tide Score: %d", dynamicRegularsQty))

    -- 2. Check for and apply Fortification bonuses
    local fortificationScore = tonumber(GetServerVariable("CampaignFortifications")) or 0
    local commanderHpp = COMMANDER_HPP_MOD
    local regularHpp = REGULAR_HPP_MOD

    if fortificationScore <= FORTIFICATION_BONUS_THRESHOLD then
        local bonusRegulars = math.random(FORTIFICATION_BONUS_REGULARS_MIN, FORTIFICATION_BONUS_REGULARS_MAX)
        dynamicRegularsQty = dynamicRegularsQty + bonusRegulars
        commanderHpp = commanderHpp + FORTIFICATION_HPP_BUFF_MOD
        regularHpp = regularHpp + FORTIFICATION_HPP_BUFF_MOD
        log_debug(string.format("[Fortification Bonus] Fortifications at %d (<= %d). Adding %d regulars. Buffing HPP by %d.",
            fortificationScore, FORTIFICATION_BONUS_THRESHOLD, bonusRegulars, FORTIFICATION_HPP_BUFF_MOD))
    end

    -- *** SET GLOBAL LUA STATE VARIABLES FOR MOB TRACKING ***
    -- This now includes regulars from Tide Score and Fortification Bonus
    selectedUnit.regulars.qty = dynamicRegularsQty
    battleMobCount = selectedUnit.commander.qty + dynamicRegularsQty
    mobsDefeatedCount = 0
    
    -- Retrieve the dynamically calculated battle duration for this instance
    local currentBattleDuration = tonumber(GetServerVariable(CURRENT_BATTLE_DURATION_VAR)) or BATTLE_DURATION_HOURS
    if currentBattleDuration == 0 then -- Safety check, should not happen if set correctly
        currentBattleDuration = BATTLE_DURATION_HOURS
        log_error("[CampaignBattleHandler] CURRENT_BATTLE_DURATION_VAR was 0 or not set in spawnArmy. Defaulting to BATTLE_DURATION_HOURS.")
    end
    
    -- FIX 26: Reset the persistent Max HP tracker before spawning any mobs.
    SetServerVariable(TOTAL_STARTING_MAX_HP_VAR, 0)
    
    log_debug("[CampaignBattleHandler] Battle started at hour: ", battleFightStartHour, ". Will last for ", BATTLE_DURATION_HOURS, " hours.")
    
    ---@private
    ---Function to generate a random coordinate (X or Z) that is OUTSIDE the exclusion zone.
    local function generateSafeCoord(center, halfWidth)
        -- ... (function body remains unchanged) ...
        -- The two valid outer ranges are:
        local outerRangeMin1 = center - MAX_SPAWN_DISTANCE
        local outerRangeMax1 = center - halfSafeWidth
        local outerRangeMin2 = center + halfSafeWidth
        local outerRangeMax2 = center + MAX_SPAWN_DISTANCE

        local range1Size = outerRangeMax1 - outerRangeMin1
        local range2Size = outerRangeMax2 - outerRangeMin2
        local totalRange = range1Size + range2Size

        if totalRange <= 0 then
            log_debug("Warning: Spawn range too small, spawning at edge of exclusion zone.")
            return center + halfWidth * (math.random() > 0.5 and 1 or -1)
        end

        local randomDistance = math.random() * totalRange
        
        local finalCoord
        if randomDistance <= range1Size then
            finalCoord = outerRangeMin1 + randomDistance
        else
            finalCoord = outerRangeMin2 + (randomDistance - range1Size)
        end
        
        return finalCoord
    end
    
    ---@private
    ---Spawn function for both commander and regulars, now including optional entityFlags.
    local function insertUnit(unitConfig, mobLevel, entityFlags, hppModValue)
        local totalQty = unitConfig.qty
        local unitName = unitConfig.outfitname or unitConfig.unitname 
        local rawLook = unitConfig.look 
        
        -- *** NEW DIAGNOSTIC LINE ***
        log_debug(string.format("[CampaignBattleHandler] DIAGNOSTIC: %s received Qty: %d. Proceeding to spawn.", unitName, totalQty))

        log_debug(string.format("Spawning %d instances of %s (Level: %d)", 
                               totalQty, unitName, mobLevel))

        for i = 1, totalQty do
            -- !!! DYNAMIC SAFE SPAWN LOGIC !!!
            local final_x = generateSafeCoord(centerX, halfSafeWidth)
            local final_z = generateSafeCoord(centerZ, halfSafeWidth)
            local final_y = safeY 

            local final_rot = math.random(0, 255)

            local unitNamez = string.char(0x94) .. unitName -- Add campaign symbol to name

            local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = unitNamez,
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

                    -- Get bonuses from recon score
                    local statBonus, levelBonus = calculateReconModifiers()

                    -- Apply level bonus
                    mob:setMobLevel(mobLevel + levelBonus)

                    -- NEW: Apply two random battle-wide resistances
                    local resistanceMods = {
                        [1] = { name = "SLASH", mod = xi.mod.SLASH_SDT },
                        [2] = { name = "PIERCE", mod = xi.mod.PIERCE_SDT },
                        [3] = { name = "IMPACT", mod = xi.mod.IMPACT_SDT },
                        [4] = { name = "HTH", mod = xi.mod.HTH_SDT },
                    }

                    local resIndex1 = GetServerVariable(BATTLE_DAMAGE_RES_VAR_1)
                    local resIndex2 = GetServerVariable(BATTLE_DAMAGE_RES_VAR_2)
                    local appliedResistances = {}

                    if resIndex1 and resIndex1 > 0 and resistanceMods[resIndex1] then
                        local resData = resistanceMods[resIndex1]
                        mob:setMod(resData.mod, 1000) -- 1000 = 100% resistance
                        table.insert(appliedResistances, resData.name .. " (1000)")
                    end

                    if resIndex2 and resIndex2 > 0 and resistanceMods[resIndex2] then
                        local resData = resistanceMods[resIndex2]
                        mob:setMod(resData.mod, 500) -- 500 = 50% resistance
                        table.insert(appliedResistances, resData.name .. " (500)")
                    end

                    if #appliedResistances > 0 then
                        log_debug(unitName .. " (ID: " .. mob:getID() .. ") applied resistances: " .. table.concat(appliedResistances, ", ") .. ".")
                        end

                    --update and increase Commander/Regulars HPP
                    mob:addMod(xi.mod.HPP, hppModValue)
                    mob:updateHealth()
                    mob:addHP(mob:getMaxHP())

                    -- Calculate and persist the total Max HP after all mods for the win condition baseline
                    local finalMaxHP = mob:getMaxHP()
                    local currentTotal = GetServerVariable(TOTAL_STARTING_MAX_HP_VAR) or 0
                    SetServerVariable(TOTAL_STARTING_MAX_HP_VAR, currentTotal + finalMaxHP)
                    
                    log_debug(unitName .. " (ID: " .. mob:getID() .. ") Final Max HP: " .. finalMaxHP .. ". Persistent Total HP updated to: " .. (currentTotal + finalMaxHP))

                    -- Set misc stats and mods, applying the recon bonus
                    mob:addMod(xi.mod.DMG, -100 + statBonus)
                    mob:addMod(xi.mod.ATT, -100 + statBonus)
                    mob:addMod(xi.mod.ACC, -100 + (statBonus * 2)) -- ACC gets double the bonus
                    mob:addMod(xi.mod.EVA, -300 + statBonus)
                    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 25) 
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

--=============================
--LISTENERS
--=============================

                onMobFight = function(mob, target)
                    -- Add contribution listeners only if the target is a player
                    if target and target:isPC() then

                        -- ABILITY_USE: Entity (player), Target (mob), Ability ID/Object, action
                        mob:addListener('ABILITY_TAKE', LISTENER_ID_PREFIX .. 'ABILITY_TAKE', function(caster, mobTarget, ability, action)

                            -- Check 1: Ensure the caster ('player') is a Player Character (PC) and exists.
                            if not caster or not caster:isPC() then 
                                return
                            end
                            
                            -- Check 2: Ensure the 'ability' object is valid
                            if not ability then
                                return
                            end

                            -- Extract ability ID safely
                            local abilityID = ability:getID()
                            
                            -- Check 3: Verify the numerical abilityID is in our specific lookup table (Job Abilities only).
                            if abilityID > 0 and JOB_ABILITIES_TO_TRACK[abilityID] then
                                -- If the ability is tracked, award the player contribution points.
                                trackPlayerContribution(caster, CONTRIBUTION_VARS.ABILITY_TAKE, POINT_MULTIPLIERS.ABILITY_TAKE)
                            end
                        end)
------------------
--                        mob:addListener('TAKE_DAMAGE', LISTENER_ID_PREFIX .. 'TAKE_DAMAGE_ALL', function(mob, damage, attacker, attackType, damageType)
--
--                            -- Check if damage type is one of the known types using the lookup table
--                            local isDamage = TRACKED_DAMAGE_TYPES[damageType]
--    Removed manually per Gemini                        
--                            -- Check if damage came from a player, if damage > 0, and if the damage type is valid
--                            if attacker and attacker:isPC() and damage > 0 and isDamage then
--                                -- Use the DAMAGE_DONE_HIT CharVar/Multiplier for generic damage events
--                                trackPlayerContribution(attacker, CONTRIBUTION_VARS.DAMAGE_DONE_HIT, POINT_MULTIPLIERS.DAMAGE_DONE_HIT)
-------------------
                        mob:addListener('TAKE_DAMAGE', LISTENER_ID_PREFIX .. 'TAKE_DAMAGE_ALL', function(mob, damage, attacker, attackType, damageType)                            
                            if attacker and attacker:isPC() then
                                -- Check for restricted weapons
                                local main_weapon_id = attacker:getEquipID(xi.slot.MAIN)
                                if RESTRICTED_WEAPONS[main_weapon_id] then
                                    attacker:unequipItem(xi.slot.MAIN)
                                    attacker:printToPlayer(MESSAGES.WEAPON_UNEQUIPPED, xi.msg.channel.SYSTEM_2)
                                end

                                --Uncomment if wanting to bad weapons for sub hand as well

                                --local sub_weapon_id = attacker:getEquipID(xi.slot.SUB)
                                --if RESTRICTED_WEAPONS[sub_weapon_id] then
                                --    attacker:unequipItem(xi.slot.SUB)
                                --    attacker:printToPlayer(MESSAGES.WEAPON_UNEQUIPPED, xi.msg.channel.SYSTEM_2)
                                --end

                                -- Original contribution tracking logic
                                local isDamage = TRACKED_DAMAGE_TYPES[damageType]
                                if damage > 0 and isDamage then
                                    trackPlayerContribution(attacker, CONTRIBUTION_VARS.DAMAGE_DONE_HIT, POINT_MULTIPLIERS.DAMAGE_DONE_HIT)
                                end
                            end
                        end)

                        -- CRITICAL_TAKE: Target (mob), Attacker (player)
                        mob:addListener('CRITICAL_TAKE', LISTENER_ID_PREFIX .. 'CRITICAL_TAKE', function(mob, attacker, ...)
                            trackPlayerContribution(attacker, CONTRIBUTION_VARS.CRITICAL_TAKE, POINT_MULTIPLIERS.CRITICAL_TAKE)
                        end)

                        -- MAGIC_USE: Entity (player), Target (mob), Spell, action
                        mob:addListener('MAGIC_TAKE', LISTENER_ID_PREFIX .. 'MAGIC_USE', function(mobTarget, caster, spell)
                            -- Safety check: Only track contribution if the caster is a Player Character (PC).
                            if not caster or not caster:isPC() then
                                return
                            end

                            -- Safety check: Check if the 'spell' object is valid
                            if not spell then
                                return
                            end

                            -- CRITICAL: Only award points if the spell successfully took effect (not resisted/missed).
                            if not spell:tookEffect() then
                                return
                            end

                            -- Use getSpellGroup() to get the category.
                            local spellGroup = spell:getSpellGroup() 
                            
                            -- Check for tracking eligibility using the hash lookup table.
                            local isTrackedMagic = TRACKED_MAGIC_GROUPS[spellGroup]

                            if isTrackedMagic then
                                -- Track contribution for the successful spell that took effect.
                                trackPlayerContribution(caster, CONTRIBUTION_VARS.MAGIC_USE, POINT_MULTIPLIERS.MAGIC_USE)
                            end
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
                            -- 2. Award rewards (True = Player Victory). Calculate duration.
                            local fightStartHour = mob:getLocalVar('BattleStartHour') or VanadielHour()
                            local currentHour = VanadielHour()
                            local duration = calculateHoursElapsed(fightStartHour, currentHour)
                            awardBattleRewards(battleZoneObj, true, duration)
                        end

                        -- *** END BATTLE STATE AND START COOLDOWN ***
                        SetServerVariable(BATTLE_STATE_VAR, 0) -- Back to inactive/cooldown
                        -- Cooldown starts on the hour the battle ends
                        SetServerVariable(LAST_BATTLE_END_HOUR_VAR, VanadielHour()) 
                        SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
                        SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
                        SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Prevents timeout logic from triggering

                        -- *** LOG BATTLE RESULT: PLAYER WIN (Total Defeat) ***
                        SetServerVariable(LAST_BATTLE_RESULT_VAR, 1) -- 1 = Player Win
                        log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Player Victory (1) via Total Defeat.")

                        -- *** UPDATE CAMPAIGN SCORE (Player Win) ***
                        updateCampaignScore(CAMPAIGN_SCORE_WIN_MODIFIER)

                        -- NEW: Apply resource reductions for player win
                        applyEndOfBattleReductions(true)

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
    insertUnit(selectedUnit.commander, BATTLE_LEVEL_COMMANDER, commanderFlags, commanderHpp)

    -- 2. Spawn Regular Units (now using the dynamically calculated quantity)
    local regularsFlags = 0 
    insertUnit(selectedUnit.regulars, BATTLE_LEVEL_REGULAR, regularsFlags, regularHpp)

    log_debug("[CampaignBattleHandler] Army spawn complete. Mobs will despawn after ", currentBattleDuration, " game hours.")
end

-- =============================================================================
-- AFK CHECK FUNCTIONS
-- =============================================================================

local function warpPlayerToHangOut(player)
    -- Inject action packet for animation (replace animation ID as needed)
    player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
    -- Delay warp using a timer
    player:timer(1000, function(p)
        -- Warp the player to their hang out (Mog Garden)
        p:setPos(341.4659, -0.4111, -582.4335, 191, 280)
    end)
end

local function performAfkCheck(player)
    if not ENABLE_AFK_CHECK then
        return
    end

    if not player:isEngaged() then
        return
    end

    -- Present menu
    local menu =
    {
        title = 'AFK Check: Are you AFK? (30s)',
        onStart = function(playerArg)
            playerArg:setLocalVar('CAPTCHA', 1)
        end,

        options = {
            {
                "No",
                function(playerArg)
                    playerArg:printToPlayer('AFK Check passed', xi.msg.channel.SYSTEM_3)
                    playerArg:setLocalVar('CAPTCHA', 0)
                end,
            },
        },
        onCancelled = function(playerArg)
            playerArg:printToPlayer('AFK Check failed!', xi.msg.channel.SYSTEM_3)
            warpPlayerToHangOut(playerArg)
        end,
    }
    player:customMenu(menu)

    -- Add timer
    player:timer(30000, function(playerArg)
        if playerArg:getLocalVar('CAPTCHA') == 1 then
            playerArg:printToPlayer('AFK Check timed out!', xi.msg.channel.SYSTEM_3)
            warpPlayerToHangOut(playerArg)
        end
    end)
end

-- =======================================
-- HOURLY EVENT and SPAWN LOGIC
-- =======================================

---Main logic for the hourly event. This function is triggered by the onGameHour event
---for the specific zone it is hooked into.
---@param zone CZone
m:addOverride('xi.zones.' .. EVENT_HOST_ZONE_NAME .. '.Zone.onGameHour', function(zone)
    log_debug("[CampaignBattleHandler] onGameHour triggered for " .. EVENT_HOST_ZONE_NAME .. ".")
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
        -- Retrieve the dynamically calculated battle duration for this instance
        local currentBattleDuration = tonumber(GetServerVariable(CURRENT_BATTLE_DURATION_VAR)) or BATTLE_DURATION_HOURS
        if currentBattleDuration == 0 then -- Safety check, should not happen if set correctly
            currentBattleDuration = BATTLE_DURATION_HOURS
            log_error("[CampaignBattleHandler] CURRENT_BATTLE_DURATION_VAR was 0 or not set in State 2. Defaulting to BATTLE_DURATION_HOURS.")
        end

        local startHour = GetServerVariable(BATTLE_START_HOUR_VAR) or -1
        local totalStartingMaxHP = GetServerVariable(TOTAL_STARTING_MAX_HP_VAR) or 0

        if startHour ~= -1 and totalStartingMaxHP > 0 then
            local hoursElapsed = calculateHoursElapsed(startHour, currentHour)

            -- Check if the elapsed hours meets or exceeds the dynamically set duration
            if hoursElapsed >= currentBattleDuration then
                log_debug("[CampaignBattleHandler] BATTLE TIMEOUT: Active fight duration of ", currentBattleDuration, " hours expired. Checking outcome.")

                local battleZoneObj = GetZone(selectedZone.zoneID)
                local totalCurrentHP = 0
                if battleZoneObj then
                    for _, mob in pairs(battleZoneObj:getMobs()) do
                        if mob and mob:getLocalVar('IsCampaignMob') == 1 and mob:isAlive() then
                            totalCurrentHP = totalCurrentHP + mob:getHP()
                        end
                    end
                end

                local remainingHPRatio = totalCurrentHP / totalStartingMaxHP
                local remainingHPPercent = remainingHPRatio * 100
                log_debug(string.format("[CampaignBattleHandler] Collective Mob HP Check: %d / %d (%.2f%% remaining). Threshold: %d%%.",
                                    totalCurrentHP, totalStartingMaxHP, remainingHPPercent, HP_REDUCTION_WIN_THRESHOLD))

                -- Check for HP REDUCTION VICTORY
                if remainingHPPercent < HP_REDUCTION_WIN_THRESHOLD then
                    -- --- HP REDUCTION VICTORY (Player Win) ---
                    log_debug("[CampaignBattleHandler] HP REDUCTION VICTORY: Collective HP below threshold! Forcing Player Win.")

                    local message = string.format(MESSAGES.HP_REDUCTION_VICTORY_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                    broadcastCampaignAnnouncement(message)

                    -- Log and clean player scores
                    if battleZoneObj then
                        debugLogBattleResults(battleZoneObj)
                        awardBattleRewards(battleZoneObj, true, currentBattleDuration)
                    end

                    -- *** UPDATE CAMPAIGN SCORE (Player Win) ***
                    updateCampaignScore(CAMPAIGN_SCORE_WIN_MODIFIER)

                    -- NEW: Apply resource reductions for player win
                    applyEndOfBattleReductions(true)

                    -- End Battle State and Start Cooldown
                    SetServerVariable(BATTLE_STATE_VAR, 0)
                    SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
                    SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Prevents timeout logic from triggering
                    SetServerVariable(LAST_BATTLE_RESULT_VAR, 1) -- 1 = Player Win
                    log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Player Victory (1) via HP Reduction.")

                    -- Despawn all remaining mobs using the targeted zone object.
                    despawnAllBattleMobs(battleZoneObj)

                    return
                else
                    -- --- ORIGINAL TIMEOUT LOGIC (Enemy Win) - falls through if no HP Reduction Victory ---
                    if GetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR) == 0 then
                        local message = string.format(MESSAGES.BATTLE_TIMEOUT_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                        broadcastCampaignAnnouncement(message)
                        SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 1) -- Mark as announced
                    else
                        log_debug("[CampaignBattleHandler] Timeout already announced. Skipping announcement.")
                    end

                    local isPlayerVictory = false -- Enemy Win/Timeout means players lost
                    if selectedZone then
                        local battleZoneObj = GetZone(selectedZone.zoneID)
                        if battleZoneObj then
                            debugLogBattleResults(battleZoneObj)
                            awardBattleRewards(battleZoneObj, isPlayerVictory, currentBattleDuration)
                        end
                    end

                    SetServerVariable(BATTLE_STATE_VAR, 0) -- Force state back to 0
                    SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour) -- Start cooldown
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
                    SetServerVariable(LAST_BATTLE_RESULT_VAR, 2) -- 2 = Enemy Win/Timeout
                    log_debug("[CampaignBattleHandler] BATTLE RESULT LOGGED: Enemy Victory/Timeout (2).")
                    updateCampaignScore(CAMPAIGN_SCORE_LOSS_MODIFIER)
                    applyEndOfBattleReductions(false)
                    despawnAllBattleMobs(battleZoneObj)
                    return
                end
            else
                log_debug("[CampaignBattleHandler] Battle is Active (State 2). ", hoursElapsed, " of ", currentBattleDuration, " fighting hours elapsed. Continuing.")

                -- Perform AFK Check if not the first hour
                if hoursElapsed > 0 then
                    local battleZoneObj = GetZone(selectedZone.zoneID)
                    if battleZoneObj then
                        for _, player in pairs(battleZoneObj:getPlayers()) do
                            if player:isPC() then
                                performAfkCheck(player)
                            end
                        end
                    end
                end

                return -- Battle is active and not timed out, exit the function.
            end
        else
            -- EMERGENCY FIX: If BATTLE_STATE_VAR is 2 but START_HOUR or STARTING_MAX_HP is missing,
            -- this means the state is corrupted. Force cleanup.
            log_debug("[CampaignBattleHandler] CORRUPTED STATE DETECTED. BATTLE_STATE=2 but START_HOUR/STARTING_MAX_HP is missing. Forcing state reset.")
            SetServerVariable(BATTLE_STATE_VAR, 0)
            SetServerVariable(LAST_BATTLE_END_HOUR_VAR, currentHour)
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
            
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
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
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
                -- FIX: Use BATTLE_START_FMT, as BATTLE_START_FMT_DURATION does not exist.
                local message = string.format(MESSAGES.BATTLE_START_FMT, currentAttackingArmyName, currentAttackingUnitName, currentBattleLocationName)
                broadcastCampaignAnnouncement(message, true)

                -- 2. SPAWN ARMY
                -- Set the official fight start hour and transition state
                SetServerVariable(BATTLE_START_HOUR_VAR, currentHour)
                SetServerVariable(BATTLE_STATE_VAR, 2)
                
                local battleZoneObj = GetZone(selectedZone.zoneID)

                if battleZoneObj then
                    -- *** CALCULATE AND APPLY DYNAMIC REGULAR QUANTITY ***
                    local regulars_qty = calculateRegularsQuantity()
                    
                    -- CRITICAL: The logs show the previous key assignment was ignored (calculated 11, spawned 9).
                    -- You MUST confirm the exact key the 'spawnArmy' function uses to read the Regulars count.
                    -- If the key is 'regulars_qty', then the issue is in spawnArmy. 
                    -- If the key is, for example, 'REGULARS_QTY', you need to change the line below.
                    selectedUnit.regulars_qty = regulars_qty 
                    
                    -- Spawn the army in the selected zone. This function now sets TOTAL_STARTING_MAX_HP_VAR.
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
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
                    SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
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
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, 0) -- Clear battle resistances
            SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, 0)
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
        
        -- Calculate dynamic hourly chance increase based on fortifications
        local hourlyChanceIncrease = HOURLY_CHANCE_INCREASE
        local fortificationScore = tonumber(GetServerVariable("CampaignFortifications")) or 0
        if fortificationScore > 900 then
            hourlyChanceIncrease = hourlyChanceIncrease + 1
            log_debug(string.format("[CampaignBattleHandler] Fortifications at %d (>900). Increasing hourly chance increase to %d.", fortificationScore, hourlyChanceIncrease))
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
            local newChance = math.min(100, currentBattleChance + hourlyChanceIncrease)
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

                -- NEW: Select and persist TWO random damage resistances for the battle
                local resistanceTypes = { "SLASH", "PIERCE", "IMPACT", "HTH" }
                local indices = {}
                for i = 1, #resistanceTypes do
                    table.insert(indices, i)
                end

                -- Shuffle the indices table to get two unique random indices
                for i = #indices, 2, -1 do
                    local j = math.random(i)
                    indices[i], indices[j] = indices[j], indices[i]
                end

                -- Take the first two shuffled indices and store them
                local selectedResistanceIndex1 = indices[1]
                local selectedResistanceIndex2 = indices[2]
                SetServerVariable(BATTLE_DAMAGE_RES_VAR_1, selectedResistanceIndex1)
                SetServerVariable(BATTLE_DAMAGE_RES_VAR_2, selectedResistanceIndex2)
                log_debug("[CampaignBattleHandler] Selected random resistances for this battle: " .. resistanceTypes[selectedResistanceIndex1] .. " and " .. resistanceTypes[selectedResistanceIndex2])

                -- Persist the choice
                SetServerVariable(SELECTED_ZONE_INDEX_VAR, zoneIndex)
                SetServerVariable(SELECTED_ARMY_INDEX_VAR, armyIndex)
                SetServerVariable(SELECTED_UNIT_INDEX_VAR, unitIndex)
                SetServerVariable(BATTLE_PREP_START_HOUR_VAR, currentHour)
                SetServerVariable(BATTLE_STATE_VAR, 1)
                SetServerVariable(BATTLE_TIMEOUT_ANNOUNCED_VAR, 0) -- Reset timeout announcement flag

                -- *** NEW: Increment and set the global battle ID ***
                local currentBattleID = (GetServerVariable(CAMPAIGN_BATTLE_ID_VAR) or 0) + 1
                SetServerVariable(CAMPAIGN_BATTLE_ID_VAR, currentBattleID)
                log_debug("[CampaignBattleHandler] New battle started. Battle ID incremented to: ", currentBattleID)

                -- Calculate and persist the dynamic battle duration
                local actualBattleDuration = getDynamicBattleDuration()
                SetServerVariable(CURRENT_BATTLE_DURATION_VAR, actualBattleDuration)
                log_debug("[CampaignBattleHandler] Calculated and set CURRENT_BATTLE_DURATION_VAR to: ", actualBattleDuration)

                -- *** NEW: Set the battle zone variable IMMEDIATELY upon selection ***
                SetServerVariable("CampaignBattleZone", selectedZone.zoneID)
                log_debug("[CampaignBattleHandler] Set CampaignBattleZone to Zone ID: ", selectedZone.zoneID, " (State 0 -> 1 Transition).")

                -- 1. ANNOUNCE PREPARATION START (with separator)
                local prepMessage = string.format(MESSAGES.PREP_START_FMT, attackingArmyName, attackingUnitName, displayZoneName, PREP_DURATION_HOURS)
                broadcastCampaignAnnouncement(prepMessage, true)

                -- 2. ANNOUNCE DEFENDER COUNT (without separator) - Now happens on PREP START
                local playersInZone = battleZoneObj:getPlayers()
                local playerCount = #playersInZone
                local defenderMessage = string.format(MESSAGES.DEFENDER_COUNT_FMT, playerCount)
                broadcastCampaignAnnouncement(defenderMessage, false)
                
            else
                -- FIX 20: Added return to stop execution if GetZone fails, preventing the nil error later.
                log_debug("[CampaignBattleHandler] ERROR: Could not find zone object for zoneID ", selectedZone.zoneID, ". Aborting battle.")
                return 
            end
            
            log_debug("[CampaignBattleHandler] Campaign Battle chance check successful! Preparation started.")
            
            -- Do NOT reset chance yet. It resets when the fight starts in State 1 -> State 2 transition.
        else
            local newChance = math.min(100, currentBattleChance + hourlyChanceIncrease)
            log_debug("[CampaignBattleHandler] Campaign Battle check failed this hour. Increasing chance from ", currentBattleChance, "% to ", newChance, "%.")
            currentBattleChance = newChance
        end
    end

end)

return m
