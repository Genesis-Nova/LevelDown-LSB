-----------------------------------
-- Custom HTBF Starter Module
-- NPC: Veridical_Conflux (Selbina)
-----------------------------------
require("scripts/globals/npc_util")
require("modules/module_utils")
require("scripts/utils/utils")
require("scripts/globals/battlefield")

local m = Module:new("CustomHTBFStarter")

--[[
    VARIABLE DEFINITIONS

    Server Variables:
    - HTBF_Battlefield_Active: (Integer: 0 or 1) A global lock to prevent multiple parties from using any battlefield at the same time.
      Set to 1 when a battle starts, 0 when it ends or is reset.

    Zone Local Variables (on the battlefield zone):
    - HTBF_Mob_Engaged: (Integer: 0 or 1) A flag indicating if the main mob has been engaged. Prevents entry after the fight begins.
    - ConfrontationStarted: (Integer: 0 or 1) A flag to ensure the confrontation setup logic runs only once per instance.
    - ActiveHTBF_ConfrontationID: (Integer) The unique ID of the currently active confrontation within the zone instance.

    Character Variables (on the player):
    - HTBF_Pending_Entry: (Integer) Stores the configId of the battlefield a player has chosen but not yet entered.
    - HTBF_Selected_Index: (Integer) Stores the configId of the battlefield the player is entering.
    - HTBF_Selected_Difficulty_Index: (Integer) Stores the difficulty index the player selected for the battlefield.
    - HTBF_Party_Size: (Integer) Stores the number of party members at the time of initiation.
    - HTBF_Party_Member_X: (Integer) Stores the ID of each party member (e.g., HTBF_Party_Member_1, HTBF_Party_Member_2).
    - HTBF_Entry_Time: (Integer - os.time()) A timestamp for when the player entered the battlefield, used for validation and cleanup of stale entries.
    - HTBF_Needs_Spawn: (Integer: 0 or 1) A flag for the first player entering to trigger the mob spawning logic.
    - HTBF_ConfrontationID: (Integer) The unique ID of the confrontation the player is currently part of.
    - customhtbf - (Integer) Accumulated HTBF points for the player.
    - HTBF_Attempts - (Integer) Total number of times the player has entered a battlefield.
    - HTBF_Rewards_Claimed - (Integer) Number of milestone rewards (every 25 attempts) the player has claimed.
]]

local debug = false
local blackStar = '\129\154' -- Filled Star
local ARENA_RADIUS = 60 -- Radius to check for players in the arena

local function debugPrint(msg)
    if debug then
        print("[CustomHTBFStarter] " .. msg)
    end
end

local modNames = {}
for k, v in pairs(xi.mod) do
    modNames[v] = k
end

local remUpgradeItems = {
    xi.item.RIFTBORN_BOULDER,
    xi.item.PLUTON,
    xi.item.BEITETSU,
}

local remsTales = {
    [1] = xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
    [2] = xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
    [3] = xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
    [4] = xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
    [5] = xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
    [6] = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,
    [7] = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,
    [8] = xi.item.COPY_OF_REMS_TALE_CHAPTER_8,
    [9] = xi.item.COPY_OF_REMS_TALE_CHAPTER_9,
    [10] = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,
}

local difficultyPoints = {
    [1] = 1, -- Very Easy
    [2] = 2, -- Easy
    [3] = 3, -- Normal
    [4] = 4, -- Difficult
    [5] = 5, -- Very Difficult
}

local function applyMobMods(mob, lookup)
    if mob:getLocalVar("HTBF_Mods_Applied") == 1 then return end
    mob:setLocalVar("HTBF_Mods_Applied", 1)

    if lookup.mobLevel then
        debugPrint("Setting mob level to " .. tostring(lookup.mobLevel))
        mob:setMobLevel(lookup.mobLevel)
    end

    if lookup.hppMod then
        debugPrint("Adding HPP mod: " .. tostring(lookup.hppMod))
        mob:addMod(xi.mod.HPP, lookup.hppMod)
        mob:updateHealth()
        mob:setHP(mob:getMaxHP())
    end

    local multiplier = lookup.statModMultiplier or 1.0

    if lookup.mobMods then
        for _, modData in ipairs(lookup.mobMods) do
            local val = modData.val
            local modID = modData.mod
            local targetVal = math.floor(val * multiplier)

            if modData.target then
                local current = 0
                if modID == xi.mod.STR then current = mob:getStat(xi.mod.STR)
                elseif modID == xi.mod.DEX then current = mob:getStat(xi.mod.DEX)
                elseif modID == xi.mod.VIT then current = mob:getStat(xi.mod.VIT)
                elseif modID == xi.mod.AGI then current = mob:getStat(xi.mod.AGI)
                elseif modID == xi.mod.INT then current = mob:getStat(xi.mod.INT)
                elseif modID == xi.mod.MND then current = mob:getStat(xi.mod.MND)
                elseif modID == xi.mod.CHR then current = mob:getStat(xi.mod.CHR)
                elseif modID == xi.mod.ATT then current = mob:getStat(xi.mod.ATT)
                elseif modID == xi.mod.DEF then current = mob:getStat(xi.mod.DEF)
                elseif modID == xi.mod.ACC then current = mob:getMod(xi.mod.ACC)
                elseif modID == xi.mod.EVA then current = mob:getStat(xi.mod.EVA)
                elseif modID == xi.mod.RATT then current = mob:getMod(xi.mod.RATT)
                elseif modID == xi.mod.RACC then current = mob:getMod(xi.mod.RACC)
                elseif modID == xi.mod.MATT then current = mob:getMod(xi.mod.MATT)
                elseif modID == xi.mod.MACC then current = mob:getMod(xi.mod.MACC)
                elseif modID == xi.mod.MEVA then current = mob:getMod(xi.mod.MEVA)
                elseif modID == xi.mod.MDEF then current = mob:getMod(xi.mod.MDEF)
                end
                local diff = targetVal - current
                mob:addMod(modID, diff)
                local modName = modNames[modID] or "Unknown"
                debugPrint(string.format("Target Mod: %s (%d). Base: %d. Target: %d. Diff: %d", modName, modID, current, targetVal, diff))
            elseif modData.set then
                    mob:setMod(modID, targetVal)
            else
                    mob:addMod(modID, targetVal)
            end
        end
        debugPrint("Applied mob mods.")
    end
end


local battlefieldConfig = {
    -- [Option ID] = { name = "Battlefield Name", requiredKI = KeyItem ID, teleport = { x, y, z, rot, zoneId }, mobName = "MobNameInIDs" }
    [1] = {
        enabled = true,
        name = blackStar .. "Divine Interference",
        requiredKI = xi.ki.DIVINE_PHANTOM_GEM,
        mobName = "Alexander",
        confrontationId = 1000,
        mobAbilityPermissions = {
            -- [Skill ID] = { name = "Skill Name", difficulties = { [1]=Very Easy, [2]=Easy, [3]=Normal, [4]=Difficult, [5]=Very Difficult } }
            [2141] = { name = "radiant_sacrament",  difficulties = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true } },
            [2142] = { name = "mega_holy",          difficulties = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true } },
            [2143] = { name = "perfect_defense",    difficulties = { [1]=false, [2]=false, [3]=false, [4]=true, [5]=true } },
            [2144] = { name = "divine_spear",       difficulties = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true } },
            [2145] = { name = "gospel_of_the_lost", difficulties = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true } },
            [2146] = { name = "void_of_repentance", difficulties = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true } },
            [2147] = { name = "divine_judgment",    difficulties = { [1]=false, [2]=false, [3]=false, [4]=true, [5]=true } },
        },
        remChapters = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = false,
            [5] = false,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
        },
        teleport = { x = -700, y = -17.1414, z = -174.8004, rot = 192, zoneId = xi.zone.WALK_OF_ECHOES_P1 },
        timeLimit = 30, -- Minutes
        zoneName = "Walk_of_Echoes_[P1]",
        mobMods = {
            { mod = xi.mod.STR, val = 150, target = true },
            { mod = xi.mod.VIT, val = 150, target = true },
            { mod = xi.mod.INT, val = 150, target = true },
            { mod = xi.mod.MND, val = 150, target = true },
            { mod = xi.mod.CHR, val = 150, target = true },
            { mod = xi.mod.AGI, val = 150, target = true },
            { mod = xi.mod.DEX, val = 150, target = true },
            { mod = xi.mod.DEF, val = 700, target = true },
            { mod = xi.mod.RATT, val = 450, target = true },
            { mod = xi.mod.RACC, val = 450, target = true },
            { mod = xi.mod.ACC, val = 450, target = true },
            { mod = xi.mod.ATT, val = 350, target = true },
            { mod = xi.mod.MATT, val = 250, target = true },
            { mod = xi.mod.MACC, val = 250, target = true },
            { mod = xi.mod.MEVA, val = 700, target = true },
            { mod = xi.mod.MDEF, val = 700, target = true },
            { mod = xi.mod.EVA, val = 1344, target = true },
        },
        difficulties = {
            { name = "Very Easy (Lvl: 113)",      mobName = "Alexander", mobLevel = 119, hppMod = 0, dropRateBonus = 0, statModMultiplier = 0.5, personalLoot = { remCount = 1, remItemCount = 0 } },
            { name = "Easy (Lvl: 116)",         mobName = "Alexander",  mobLevel = 124, hppMod = 66.7, dropRateBonus = 10, statModMultiplier = 0.6, personalLoot = { remCount = 1, remItemCount = 1 } },
            { name = "Normal (Lvl: 119)",       mobName = "Alexander",  mobLevel = 129, hppMod = 150, dropRateBonus = 20, statModMultiplier = 0.7, personalLoot = { remCount = 2, remItemCount = 1 } },
            { name = "Difficult (Lvl: 119+)",     mobName = "Alexander",  mobLevel = 134, hppMod = 200, dropRateBonus = 40, statModMultiplier = 0.85, personalLoot = { remCount = 3, remItemCount = 2 } },
            { name = "Very Difficult (Lvl: ???)", mobName = "Alexander", mobLevel = 140, hppMod = 366.7, dropRateBonus = 90, statModMultiplier = 1.0, personalLoot = { remCount = 4, remItemCount = 2 } },
        },
        lootDelay = 10, -- Seconds
        loot = {
            --Unique Materials
            {
                --{ itemId = xi.item.EXALTED_LOG,             chance = 150 }, -- Exalted Log
                --{ itemId = xi.item.HEPATIZON_ORE,           chance = 150 }, -- Hepatizon Ore
                --{ itemId = xi.item.MALIYAKALEYA_ORB,        chance = 150 }, -- Maliyakaleya Coral
                --{ itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,  chance = 150 }, -- Beryllium Ore
                --{ itemId = xi.item.SIFS_LOCK,               chance = 150 }, -- Sif's Lock
            },
            --Weapons
            {
                { itemId = xi.item.SACRO_BULWARK,        chance = 10 }, -- Sacro Bulwark
            },
            --Armor
            {
                { itemId = xi.item.SACRO_GORGET,        chance = 10 }, -- Sacro Gorget
                { itemId = xi.item.SACRO_CORD,          chance = 10 }, -- Sacro Cord
                { itemId = xi.item.SACRO_MANTLE,        chance = 10 }, -- Sacro Mantle
                { itemId = xi.item.SACRO_BREASTPLATE,   chance = 10 }, -- Sacro Breastplate
            },
        }
    },
    [2] = {
        enabled = true,
        name = blackStar .. "Champion of the Dawn",
        requiredKI = xi.ki.CHAMPION_PHANTOM_GEM,
        mobName = "Cait_Sith",
        confrontationId = 2000,
        mobAbilityPermissions = {
            -- Placeholders
        },
        remChapters = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = false,
            [5] = false,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
        },
        teleport = { x = -700, y = -17.1414, z = -174.8004, rot = 192, zoneId = xi.zone.WALK_OF_ECHOES_P1 },
        timeLimit = 30,
        zoneName = "Walk_of_Echoes_[P1]",
        mobMods = {
            { mod = xi.mod.STR, val = 200, target = true },
            { mod = xi.mod.VIT, val = 200, target = true },
            { mod = xi.mod.INT, val = 274, target = true },
            { mod = xi.mod.MND, val = 200, target = true },
            { mod = xi.mod.CHR, val = 200, target = true },
            { mod = xi.mod.AGI, val = 200, target = true },
            { mod = xi.mod.DEX, val = 200, target = true },
            { mod = xi.mod.DEF, val = 200, target = true },
            { mod = xi.mod.RATT, val = 250, target = true },
            { mod = xi.mod.ACC, val = 375, target = true },
            { mod = xi.mod.ATT, val = 275, target = true },
            { mod = xi.mod.MATT, val = 250, target = true },
            { mod = xi.mod.MACC, val = 250, target = true },
            { mod = xi.mod.MEVA, val = 700, target = true },
            { mod = xi.mod.MDEF, val = 700, target = true },
            { mod = xi.mod.EVA, val = 1400, target = true },
        },
        difficulties = {
            { name = "Very Easy (Lvl: 113)",      mobName = "Cait_Sith", mobLevel = 119, hppMod = 0, dropRateBonus = 0, statModMultiplier = 0.5, personalLoot = { remCount = 1, remItemCount = 0 } },
            { name = "Easy (Lvl: 116)",         mobName = "Cait_Sith",  mobLevel = 124, hppMod = 66.7, dropRateBonus = 10, statModMultiplier = 0.6, personalLoot = { remCount = 1, remItemCount = 1 } },
            { name = "Normal (Lvl: 119)",       mobName = "Cait_Sith",  mobLevel = 129, hppMod = 150, dropRateBonus = 20, statModMultiplier = 0.7, personalLoot = { remCount = 2, remItemCount = 1 } },
            { name = "Difficult (Lvl: 119+)",     mobName = "Cait_Sith",  mobLevel = 134, hppMod = 200, dropRateBonus = 40, statModMultiplier = 0.85, personalLoot = { remCount = 3, remItemCount = 2 } },
            { name = "Very Difficult (Lvl: ???)", mobName = "Cait_Sith", mobLevel = 140, hppMod = 366.7, dropRateBonus = 90, statModMultiplier = 1.0, personalLoot = { remCount = 4, remItemCount = 2 } },
        },
        lootDelay = 10,
        loot =  {
            --Unique Materials
            {
                --{ itemId = xi.item.EXALTED_LOG,             chance = 150 }, -- Exalted Log
            },
            --Weapons
            {
                { itemId = xi.item.CATH_PALUG_HAMMER,        chance = 10 },
                { itemId = xi.item.CATH_PALUG_STONE,         chance = 10 }, 
            },
            --Armor
            {
                { itemId = xi.item.CATH_PALUG_CROWN,        chance = 10 }, 
                { itemId = xi.item.CATH_PALUG_RING,         chance = 10 }, 
                { itemId = xi.item.CATH_PALUG_EARRING,      chance = 10 }, 

            },
        }
    },
    [3] = {
        enabled = false,
        name = blackStar .. "A Stygian Pact",
        requiredKI = xi.ki.STYGIAN_PACT_PHANTOM_GEM,
        mobName = "Odin_Prime",
        mobAbilityPermissions = {
            -- Placeholders
        },
        remChapters = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = false,
            [5] = false,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
        },
        teleport = { x = -700, y = -17.1414, z = -174.8004, rot = 192, zoneId = xi.zone.WALK_OF_ECHOES_P1 },
        timeLimit = 30,
        zoneName = "Walk_of_Echoes_[P1]",
        mobMods = {
            { mod = xi.mod.STR, val = 200, target = true },
            { mod = xi.mod.VIT, val = 200, target = true },
            { mod = xi.mod.INT, val = 274, target = true },
            { mod = xi.mod.MND, val = 200, target = true },
            { mod = xi.mod.CHR, val = 200, target = true },
            { mod = xi.mod.AGI, val = 200, target = true },
            { mod = xi.mod.DEX, val = 200, target = true },
            { mod = xi.mod.DEF, val = 200, target = true },
            { mod = xi.mod.RATT, val = 250, target = true },
            { mod = xi.mod.ACC, val = 375, target = true },
            { mod = xi.mod.ATT, val = 275, target = true },
            { mod = xi.mod.MATT, val = 250, target = true },
            { mod = xi.mod.MACC, val = 250, target = true },
            { mod = xi.mod.MEVA, val = 700, target = true },
            { mod = xi.mod.MDEF, val = 700, target = true },
            { mod = xi.mod.EVA, val = 1400, target = true },
        },
        difficulties = {
            { name = "Very Easy (Lvl: 113)",      mobName = "Odin_Prime", mobLevel = 119, hppMod = 0, dropRateBonus = 0, statModMultiplier = 0.5, personalLoot = { remCount = 1, remItemCount = 0 } },
            { name = "Easy (Lvl: 116)",         mobName = "Odin_Prime",  mobLevel = 124, hppMod = 26, dropRateBonus = 10, statModMultiplier = 0.6, personalLoot = { remCount = 1, remItemCount = 1 } },
            { name = "Normal (Lvl: 119)",       mobName = "Odin_Prime",  mobLevel = 129, hppMod = 51.67, dropRateBonus = 20, statModMultiplier = 0.7, personalLoot = { remCount = 2, remItemCount = 1 } },
            { name = "Difficult (Lvl: 119+)",     mobName = "Odin_Prime",  mobLevel = 134, hppMod = 95, dropRateBonus = 40, statModMultiplier = 0.85, personalLoot = { remCount = 3, remItemCount = 2 } },
            { name = "Very Difficult (Lvl: ???)", mobName = "Odin_Prime", mobLevel = 140, hppMod = 120, dropRateBonus = 90, statModMultiplier = 1.0, personalLoot = { remCount = 4, remItemCount = 2 } },
        },
        lootDelay = 10,
        loot =  {
            --Unique Materials
            {
                --{ itemId = xi.item.EXALTED_LOG,             chance = 150 }, -- Exalted Log
            },
            --Weapons
            {
                { itemId = xi.item.CAIT_PALUG_HAMMER,        chance = 10 },
                { itemId = xi.item.CATH_PALUG_STONE,         chance = 10 }, 
            },
            --Armor
            {
                { itemId = xi.item.CATH_PALUG_CROWN,        chance = 10 }, 
                { itemId = xi.item.CATH_PALUG_RING,         chance = 10 }, 
                { itemId = xi.item.CATH_PALUG_EARRING,      chance = 10 }, 

            },
        }
    },    
    -- Add more battlefields here
}

-- Custom Confrontation Logic (inspired by Beachbesieged.lua)
xi.confrontation = xi.confrontation or {}
xi.confrontation.lookup = xi.confrontation.lookup or {}

local function onConfrontationLose(player)
    player:printToPlayer("Battlefield failed. Warping to Selbina.", xi.msg.channel.SYSTEM_3)
    if not player:isAlive() then
        player:setHP(1) -- Revive with 1 HP to prevent client desync on warp.
    end
    player:countdown(0)
    player:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
end

local function onConfrontationWin(player)
    local configIndex = player:getCharVar("HTBF_Selected_Index")
    local difficultyIndex = player:getCharVar("HTBF_Selected_Difficulty_Index")

    local points = difficultyPoints[difficultyIndex] or 0
    if points > 0 then
        local current = player:getCharVar("custhtbf")
        player:setCharVar("custhtbf", current + points)
        player:printToPlayer(string.format("You have earned %d HTBF points! (Total: %d)", points, current + points), xi.msg.channel.SYSTEM_3)
    end

    local config = battlefieldConfig[configIndex]
    if not config then return end
    local difficulty = config.difficulties[difficultyIndex]
    if not difficulty then return end
    local mobName = difficulty.mobName
    local dropRateBonus = difficulty.dropRateBonus or 0

    local zone = player:getZone()
    if not zone then return end

    -- This should only run once. Use a zone var to track.
    if zone:getLocalVar("HTBF_Win_Processed") == 1 then return end
    zone:setLocalVar("HTBF_Win_Processed", 1)

    -- Announce 3 minutes remaining
    local playersInZone = zone:getPlayers()
    for _, member in ipairs(playersInZone) do
        if member:isPC() then
            member:printToPlayer("You have 3 minutes before you are removed from the Battlefield.", xi.msg.channel.SYSTEM_3)
            member:setCharVar("HTBF_Entry_Time", os.time())
            member:countdown(180)
        end
    end

    local mobList = zone:queryEntitiesByName(mobName)
    local mob = mobList and mobList[1] -- The mob is dead, but we might need its object for addTreasure

    -- Try to get mob from lookup if query failed (mob might be dead/despawned state)
    local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
    if (not mob or not mob:isSpawned()) and confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
        local lookup = xi.confrontation.lookup[confrontationID]
        if lookup.mobIds and #lookup.mobIds > 0 then
            mob = GetMobByID(lookup.mobIds[1])
        end
    end

    -- Prepare data for delayed loot
    local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
    local registeredPlayerIds = {}
    if confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
        registeredPlayerIds = xi.confrontation.lookup[confrontationID].registeredPlayerIds
    end
    local personalLootConfig = difficulty.personalLoot
    local lootTable = config.loot
    local remChapters = config.remChapters

    -- Capture TH level immediately before the delay
    local thLevel = 0
    if mob and mob.getTHlevel then
        thLevel = mob:getTHlevel()
    end
    debugPrint("Captured TH Level: " .. tostring(thLevel))

    -- Delay loot by 5 seconds
    player:timer(5000, function(p_loot)
        local z = p_loot:getZone()
        if not z then return end

        local function everyoneHasItem(itemId)
            local party = p_loot:getParty() or { p_loot }
            for _, member in ipairs(party) do
                local hasIt = false
                for loc = 0, 17 do
                    if member:hasItem(itemId, loc) then
                        hasIt = true
                        break
                    end
                end
                if not hasIt then
                    debugPrint(string.format("Check failed: %s does not have item %d", member:getName(), itemId))
                    return false
                end
            end
            return true
        end
        
        -- Distribute Loot (Treasure Pool)
        if lootTable then
            debugPrint("Loot table found. Selecting loot...")
            
            debugPrint("Applying TH Level: " .. tostring(thLevel))
            
            -- Standard Logic for all difficulties
            for _, group in ipairs(lootTable) do
                -- Shuffle the group to prevent drop priority bias
                local shuffledGroup = {}
                for _, item in ipairs(group) do
                    table.insert(shuffledGroup, item)
                end
                for i = #shuffledGroup, 2, -1 do
                    local j = math.random(i)
                    shuffledGroup[i], shuffledGroup[j] = shuffledGroup[j], shuffledGroup[i]
                end

                for _, item in ipairs(shuffledGroup) do
                    local baseRate = (item.chance + dropRateBonus) * 10
                    local rate = xi.combat.treasureHunter.getDropRate(thLevel, baseRate)
                    debugPrint(string.format("Loot Check - ItemID: %s, TH Level: %d, Base Rate: %d, Modified Rate: %d", tostring(item.itemId), thLevel, baseRate, rate))

                    if math.random(1, 1000) <= rate then
                        if item.itemId and item.itemId ~= xi.item.NONE then
                            if item.itemId and not everyoneHasItem(item.itemId) then
                                debugPrint("Adding treasure: " .. tostring(item.itemId))
                                if mob then
                                    p_loot:addTreasure(item.itemId, mob)
                                end
                                break
                            else
                                debugPrint("Skipping treasure (Everyone has it): " .. tostring(item.itemId))
                            end
                        else
                            break
                        end
                    end
                end
            end
        end

        -- Distribute Personal Loot
        if personalLootConfig and #registeredPlayerIds > 0 then
            debugPrint("Distributing personal loot...")
            for _, p_id in ipairs(registeredPlayerIds) do
                local p = GetPlayerByID(p_id)
                if p and p:isPC() and p:getZoneID() == z:getID() then
                    -- Give Rems
                    if personalLootConfig.remCount > 0 and remChapters then
                        local validChapters = {}
                        for ch, enabled in pairs(remChapters) do
                            if enabled and remsTales[ch] then
                                table.insert(validChapters, remsTales[ch])
                            end
                        end

                        if #validChapters > 0 then
                            local drops = {}
                            for i = 1, personalLootConfig.remCount do
                                local itemId = validChapters[math.random(#validChapters)]
                                drops[itemId] = (drops[itemId] or 0) + 1
                            end

                            local itemsToGive = {}
                            for itemId, count in pairs(drops) do
                                table.insert(itemsToGive, { itemId, count })
                            end

                            npcUtil.giveItem(p, itemsToGive)
                        end
                    end

                    -- Give R/E/M items
                    if personalLootConfig.remItemCount > 0 and #remUpgradeItems > 0 then
                        for i = 1, personalLootConfig.remItemCount do
                            local randomItem = remUpgradeItems[math.random(#remUpgradeItems)]
                            if randomItem then
                                if not npcUtil.giveItem(p, { { randomItem, 1 } }) then
                                    break -- Stop trying to give items if inventory is full
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    -- 1 Minute Warning (2 minutes after win)
    player:timer(120000, function(p_timed)
        local zone = p_timed:getZone()
        if not zone or zone:getID() ~= config.teleport.zoneId then return end
        
        local playersInZone = zone:getPlayers()
        for _, member in ipairs(playersInZone) do
            if member:isPC() then
                member:printToPlayer("Battlefield will close in 1 minute. Any items remaining in your treasure pool will be lost.", xi.msg.channel.SYSTEM_3)
            end
        end
    end)

    -- Warp Out (3 minutes after win)
    player:timer(180000, function(p_timed)
        local zone = p_timed:getZone()
        if not zone or zone:getID() ~= config.teleport.zoneId then return end

        -- Re-fetch players in case some left
        local currentPlayers = zone:getPlayers()
        for _, member in ipairs(currentPlayers) do
            if member:isPC() then
                member:setCharVar("HTBF_Timer_Active", 0)
                member:printToPlayer("Battlefield closed. Warping to Selbina.", xi.msg.channel.SYSTEM_3)
                member:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
            end
        end
    end)
end

local function despawnAllBattleMobs(mobs)
    for _, mob in ipairs(mobs) do
        if mob and mob:isSpawned() then
            DespawnMob(mob:getID())
        end
    end
end

local function checkConfrontation(lookupKey)
    local lookup = xi.confrontation.lookup[lookupKey]
    if not lookup then return end

    local players = {}
    for _, id in ipairs(lookup.registeredPlayerIds) do
        local p = GetPlayerByID(id)
        if p then table.insert(players, p) end
    end

    local mobs = {}
    for _, id in ipairs(lookup.mobIds) do
        local m = GetMobByID(id)
        if m then table.insert(mobs, m) end
    end

    local validPlayerCount = 0
    for _, p in ipairs(players) do
        if p:isAlive() and p:getCharVar("HTBF_ConfrontationID") == lookupKey and p:getZoneID() == lookup.zoneId then
            validPlayerCount = validPlayerCount + 1
        end
    end

    local validMobCount = 0
    for _, m in ipairs(mobs) do
        if m:isAlive() then
            validMobCount = validMobCount + 1
        end
    end

    local isConfrontationOver = false
    local didWin = false
    local didLose = false

    -- Periodic Area Check (Every 2 seconds via timer loop)
        local playersInArena = 0
        local config = battlefieldConfig[lookup.configIndex]
        if config then
            for _, p in ipairs(players) do
                if p:getZoneID() == lookup.zoneId then
                    local dist = math.sqrt(math.pow(p:getXPos() - config.teleport.x, 2) + math.pow(p:getZPos() - config.teleport.z, 2))
                    if dist < ARENA_RADIUS then
                        playersInArena = playersInArena + 1
                    end
                end
            end
        end
        if playersInArena == 0 then
            debugPrint("Area check failed: No registered players found in arena radius. Forcing loss.")
            didLose = true
        end

    if not didLose and validPlayerCount == 0 then
        if lookup.wipeGrace and lookup.wipeGrace > 0 then
            if not lookup.wipeTimer then
                lookup.wipeTimer = GetSystemTime() + lookup.wipeGrace
                for _, p in ipairs(players) do
                    if p:isPC() then
                        p:printToPlayer("All players have been defeated. The battlefield will close in 2 minutes.", xi.msg.channel.SYSTEM_3)
                    end
                end
            end
            if GetSystemTime() > lookup.wipeTimer then
                didLose = true
            end
        else
            didLose = true
        end
    else
        lookup.wipeTimer = nil
    end

    if lookup.timeLimit and os.time() > lookup.timeLimit then
        didLose = true
    end

    if not didLose and #lookup.mobIds == 0 and validPlayerCount > 0 then
        didWin = true
    end

    if didWin or didLose then
        isConfrontationOver = true
    end

    if isConfrontationOver then
        for _, p in ipairs(players) do
            if p:isPC() then
                p:delStatusEffect(xi.effect.CONFRONTATION)
                p:setCharVar("HTBF_ConfrontationID", 0)
                if didWin and lookup.onWin then
                    lookup.onWin(p)
                elseif didLose then
                    p:setCharVar("HTBF_Timer_Active", 0)
                    p:countdown(0)
                    if lookup.onLose then
                        lookup.onLose(p)
                    end
                end
            end
        end
        if didLose then
            despawnAllBattleMobs(mobs)
        end
        if lookup.cleanUp then
            lookup.cleanUp(didLose)
        end
        xi.confrontation.lookup[lookupKey] = nil
    else
        -- Use the mob as the timer anchor. If it's dead, use a player.
        local anchor = (#mobs > 0 and mobs[1]) or (#players > 0 and players[1])
        if anchor and anchor:isSpawned() then
            anchor:timer(2000, function() checkConfrontation(lookupKey) end)
        else
            debugPrint("Confrontation check timer anchor lost. Forcing cleanup.")
            if lookup.cleanUp then lookup.cleanUp(true) end
            xi.confrontation.lookup[lookupKey] = nil
        end
    end
end

local function ensureTable(str)
    local parts = utils.splitStr(str, '.')
    local tbl = _G
    for _, part in ipairs(parts) do
        tbl[part] = tbl[part] or {}
        tbl = tbl[part]
    end
end

local helpers = {
    debugPrint = debugPrint,
    ensureTable = ensureTable,
    applyMobMods = applyMobMods,
    checkConfrontation = checkConfrontation
}

-- ============================================================================
-- 1. Mob Logic Injection
-- ============================================================================

-- Alexander_htbf Logic
local alexanderLogic = require("scripts/zones/Walk_of_Echoes_[P1]/mobs/HTBF_Alexander")
alexanderLogic(m, battlefieldConfig[1], helpers)

-- Cait_Sith Logic
local caitSithLogic = require("scripts/zones/Walk_of_Echoes_[P1]/mobs/HTBF_CaitSith")
caitSithLogic(m, battlefieldConfig[2], helpers)

-- Odin Logic
local odinLogic = require("scripts/zones/Walk_of_Echoes_[P1]/mobs/HTBF_CaitSith") --change to Odin when ready

odinLogic(m, battlefieldConfig[3], helpers)

-- ============================================================================
-- 2. Zone Logic Injection
-- ============================================================================

m:addOverride("xi.zones.Walk_of_Echoes_[P1].Zone.onInitialize", function(zone)
    -- Call original onInitialize if it exists
    pcall(function() super(zone) end)
    -- Initialize the zone variable to ensure it's not nil on first check
    zone:setLocalVar("ConfrontationStarted", 0)
end)

-- Walk of Echoes [P1] Zone In Logic
m:addOverride("xi.zones.Walk_of_Echoes_[P1].Zone.onZoneIn", function(player, prevZone)
    -- Call original onZoneIn if it exists (though Zone.lua usually returns -1 for cs)
    -- We can't easily call super() on a zone object override like this in all cores, 
    -- but we can just add our logic.
    local zone = GetZone(player:getZoneID())

    -- Check for unauthorized presence in arena (e.g. login after disconnect/end)
    if player:getCharVar("HTBF_Timer_Active") == 0 and player:getGMLevel() == 0 then
        for _, cfg in pairs(battlefieldConfig) do
            local dist = math.sqrt(math.pow(player:getXPos() - cfg.teleport.x, 2) + math.pow(player:getZPos() - cfg.teleport.z, 2))
            if dist < ARENA_RADIUS then
                player:printToPlayer("Clearing the Battlefield.", xi.msg.channel.SYSTEM_3)
                player:timer(4000, function(p_warp)
                    if p_warp then
                        p_warp:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
                    end
                end)
                return
            end
        end
    end
--
    debugPrint("onZoneIn triggered for player: " .. player:getName() .. ", checking for HTBF_Timer_Active.")

    -- Immediate status effect removal attempt
    player:dispelAllStatusEffect()

    -- Use a timer to delay the logic, preventing race conditions with charvar loading on zone change.
    player:timer(1000, function(p_timed)
        if p_timed:getCharVar("HTBF_Timer_Active") == 1 then
            p_timed:dispelAllStatusEffect()
            debugPrint("Dispelled status effects for " .. p_timed:getName())
            debugPrint("HTBF_Timer_Active is 1 for " .. p_timed:getName())
            local zone = p_timed:getZone()

            -- Use a zone variable to ensure confrontation is only started once.
            if zone:getLocalVar("ConfrontationStarted") == 1 then
                debugPrint("Confrontation already started, skipping for player " .. p_timed:getName())
                
                -- Failsafe: If confrontation is marked started but ID is invalid, reset.
                local activeID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
                if activeID == 0 or not xi.confrontation.lookup[activeID] then
                    debugPrint("Confrontation started but ID invalid/missing. Resetting zone vars.")
                    zone:setLocalVar("ConfrontationStarted", 0)
                    zone:setLocalVar("HTBF_Mob_Engaged", 0)
                    -- Allow fallthrough to spawn logic
                else
                    -- We are joining an existing battle, so we don't need to spawn.
                    -- Clear the flag to prevent issues if this player relogs later.
                    p_timed:setCharVar("HTBF_Needs_Spawn", 0)

                -- Late arrival handling
                local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
                if confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
                    local lookup = xi.confrontation.lookup[confrontationID]

                    -- Check if player is already registered
                    local isRegistered = false
                    for _, id in ipairs(lookup.registeredPlayerIds) do
                        if id == p_timed:getID() then
                            isRegistered = true
                            break
                        end
                    end

                    if not isRegistered then
                        debugPrint("Player " .. p_timed:getName() .. " is not registered for this confrontation. Denying entry.")
                        p_timed:setCharVar("HTBF_Timer_Active", 0)
                        return
                    end

                    -- Check if battle is already engaged (Prevent rejoin after disconnect/zone out)
                    local engagedState = zone:getLocalVar("HTBF_Mob_Engaged")
                    debugPrint("Checking engagement state for rejoin: " .. tostring(engagedState))
                    if engagedState == 1 then
                        p_timed:printToPlayer("The battle is engaged. You cannot rejoin.", xi.msg.channel.SYSTEM_3)
                        p_timed:setCharVar("HTBF_Timer_Active", 0)
                        p_timed:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
                        return
                    end

                    -- Take KI on entry
                    local configIndex = p_timed:getCharVar("HTBF_Selected_Index")
                    local config = battlefieldConfig[configIndex]
                    if config and p_timed:hasKeyItem(config.requiredKI) then
                        p_timed:delKeyItem(config.requiredKI)
                    end

                    -- Apply effects
                    p_timed:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = p_timed })
                    p_timed:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                    p_timed:setCharVar("HTBF_ConfrontationID", confrontationID)
                    local remaining = lookup.timeLimit - os.time()
                    if remaining > 0 then
                        p_timed:countdown(remaining)
                    end
                end

                return -- Exit if the battle has already been initiated.
                end
            end

            -- Check for stale entry (e.g. logging in after a battle finished/crash)
            local entryTime = p_timed:getCharVar("HTBF_Entry_Time")
            if os.time() - entryTime > 300 then -- 5 minutes expiration
                debugPrint("Stale HTBF entry detected for " .. p_timed:getName() .. ". Cleaning up.")
                p_timed:setCharVar("HTBF_Timer_Active", 0)
                p_timed:setCharVar("HTBF_Entry_Time", 0)
                p_timed:setCharVar("HTBF_Selected_Index", 0)
                p_timed:setCharVar("HTBF_Selected_Difficulty_Index", 0)
                p_timed:setCharVar("HTBF_ConfrontationID", 0)
                p_timed:dispelAllStatusEffect()
                p_timed:timer(4000, function(p_warp)
                    if p_warp then
                        p_warp:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
                    end
                end)
                return
            end

            local configIndex = p_timed:getCharVar("HTBF_Selected_Index")
            local config = battlefieldConfig[configIndex]
            
            -- Take KI on entry
            if config and p_timed:hasKeyItem(config.requiredKI) then
                p_timed:delKeyItem(config.requiredKI)
            end

            local difficultyIndex = p_timed:getCharVar("HTBF_Selected_Difficulty_Index") or 0

            if config and difficultyIndex > 0 then
                local difficulty = config.difficulties[difficultyIndex]
                if not difficulty then
                    debugPrint("Invalid difficulty index: " .. difficultyIndex)
                    return
                end
                local mobName = difficulty.mobName
                debugPrint("Config found for index: " .. tostring(configIndex) .. ", Difficulty: " .. difficulty.name)
                local mobID = nil
                local mobList = zone:queryEntitiesByName(mobName)
                if mobList and #mobList > 0 then
                    mobID = mobList[1]:getID()
                else
                    debugPrint("mobID NOT found via queryEntitiesByName for name: " .. mobName)
                end

                if mobID then
                    debugPrint("mobID found: " .. tostring(mobID))
                    local mob = GetMobByID(mobID)
                    if mob then
                        debugPrint("Mob entity found. isSpawned: " .. tostring(mob:isSpawned()))

                        -- Check if all party members are present
                        local partySize = p_timed:getCharVar("HTBF_Party_Size")
                        if partySize > 0 then
                            local membersPresent = 0
                            for i = 1, partySize do
                                local memberId = p_timed:getCharVar(string.format("HTBF_Party_Member_%d", i))
                                local member = GetPlayerByID(memberId)
                                if member and member:getZoneID() == zone:getID() then
                                    membersPresent = membersPresent + 1
                                end
                            end
                            if membersPresent < partySize then
                                p_timed:printToPlayer(string.format("Waiting for party members... (%d/%d)", membersPresent, partySize), xi.msg.channel.SYSTEM_3)
                                return
                            end
                        end
                        
                        if not mob:isSpawned() then
                            debugPrint("Spawning mob...")
                            
                            local registeredPlayerIds = {}
                            local playerList = {}
                            local partySize = p_timed:getCharVar("HTBF_Party_Size")

                            if partySize > 0 then
                                debugPrint("Found party size: " .. partySize)
                                for i = 1, partySize do
                                    local memberId = p_timed:getCharVar(string.format("HTBF_Party_Member_%d", i))
                                    if memberId > 0 then
                                        -- Always register the ID so they are allowed in
                                        table.insert(registeredPlayerIds, memberId)
                                        
                                        -- Try to get object to apply effect immediately if they are here
                                        local p = GetPlayerByID(memberId)
                                        if p then
                                            table.insert(playerList, p)
                                        end
                                    end
                                end
                            end

                            if #playerList == 0 then
                                playerList = { p_timed }
                                table.insert(registeredPlayerIds, p_timed:getID())
                                debugPrint("Party list was empty, using solo player as fallback.")
                            end

                            -- Clear arena of unauthorized players
                            local playersInZone = zone:getPlayers()
                            for _, pInZone in pairs(playersInZone) do
                                if pInZone:getGMLevel() == 0 then
                                    local dist = math.sqrt(math.pow(pInZone:getXPos() - config.teleport.x, 2) + math.pow(pInZone:getZPos() - config.teleport.z, 2))
                                    if dist < ARENA_RADIUS then
                                        local isAuthorized = false
                                        for _, authorizedP in ipairs(playerList) do
                                            if authorizedP:getID() == pInZone:getID() then
                                                isAuthorized = true
                                                break
                                            end
                                        end
                                        if not isAuthorized then
                                            pInZone:printToPlayer("Clearing the Battlefield.", xi.msg.channel.SYSTEM_3)
                                            pInZone:setPos(17.6757, -14.5586, 72.5541, 117, xi.zone.SELBINA)
                                        end
                                    end
                                end
                            end

                            zone:setLocalVar("ConfrontationStarted", 1)
                            zone:setLocalVar("HTBF_Mob_Engaged", 0) -- Ensure engaged flag is clear on spawn
                            debugPrint("Set ConfrontationStarted to 1")

                            SetServerVariable("HTBF_Battlefield_Active", 1)
                            debugPrint("Server variable HTBF_Battlefield_Active set to 1.")
                            
                            local confrontationID = config.confrontationId or math.random(1, 60000)
                            zone:setLocalVar("ActiveHTBF_ConfrontationID", confrontationID) -- Store in zone var for mob
                            debugPrint("ActiveHTBF_ConfrontationID set to: " .. confrontationID)

                            local timeLimitSeconds = config.timeLimit * 60

                            -- Apply to all present party members
                            for _, p in ipairs(playerList) do
                                p:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = p })
                                p:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                                p:setCharVar("HTBF_ConfrontationID", confrontationID)
                                p:countdown(timeLimitSeconds)
                            end

                            local combinedMobMods = {}
                            if config.mobMods then
                                for _, v in ipairs(config.mobMods) do table.insert(combinedMobMods, v) end
                            end
                            if difficulty.mobMods then
                                for _, v in ipairs(difficulty.mobMods) do table.insert(combinedMobMods, v) end
                            end

                            xi.confrontation.lookup[confrontationID] = {
                                registeredPlayerIds = registeredPlayerIds,
                                mobIds = { mobID },
                                timeLimit = os.time() + timeLimitSeconds,
                                wipeGrace = 120, -- 2 minute grace period on wipe
                                onLose = onConfrontationLose,
                                onWin = onConfrontationWin,
                                zoneId = config.teleport.zoneId,
                                mobLevel = difficulty.mobLevel,
                                hppMod = difficulty.hppMod,
                                difficultyIndex = difficultyIndex,
                                configIndex = configIndex,
                                statModMultiplier = difficulty.statModMultiplier or 1.0,
                                mobMods = combinedMobMods,
                                cleanUp = function(isLoss)
                                    debugPrint("Confrontation cleanup called. Resetting zone variables.")
                                    zone:setLocalVar("ConfrontationStarted", 0)
                                    zone:setLocalVar("HTBF_Win_Processed", 0)
                                    zone:setLocalVar("ActiveHTBF_ConfrontationID", 0)
                                    for _, pid in ipairs(registeredPlayerIds) do
                                        local p_cleanup = GetPlayerByID(pid)
                                        if p_cleanup then
                                            p_cleanup:setCharVar("HTBF_Party_Size", 0)
                                            for i = 1, 18 do -- Clear up to 18 party member slots
                                             p_cleanup:setCharVar(string.format("HTBF_Party_Member_%d", i), 0)
                                            end                            
                                        end
                                    end
                                    if isLoss then
                                        debugPrint("Battle was a loss. Clearing server lock immediately.")
                                        SetServerVariable("HTBF_Battlefield_Active", 0)
                                        
                                        end
                                    end
                            
                                }

                                SpawnMob(mobID)
                            end
                    else
                        debugPrint("GetMobByID returned nil for ID: " .. tostring(mobID))
                    end
                end
            end
        end
    end)
end)

m:addOverride("xi.zones.Walk_of_Echoes_[P1].Zone.onZoneOut", function(zone, player, newZoneId)
    -- Call original onZoneOut if it exists
    pcall(function() super(zone, player, newZoneId) end)

    if not player then return end

    -- Remove confrontation effect and ID immediately upon leaving
    player:delStatusEffect(xi.effect.CONFRONTATION)
    player:setCharVar("HTBF_ConfrontationID", 0)
    player:setCharVar("HTBF_Timer_Active", 0)
    player:setCharVar("HTBF_Needs_Spawn", 0)

    local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
    if confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
        local lookup = xi.confrontation.lookup[confrontationID]
        
        -- Remove player from registered list so they cannot rejoin
        for i, id in ipairs(lookup.registeredPlayerIds) do
            if id == player:getID() then
                table.remove(lookup.registeredPlayerIds, i)
                break
            end
        end

        -- Check if any registered players remain in the zone
        local remainingPlayers = 0
        local players = zone:getPlayers()
        for _, p in pairs(players) do
            -- We check if the player in the zone is in the registered list
            for _, id in ipairs(lookup.registeredPlayerIds) do
                if p:getID() == id then
                    remainingPlayers = remainingPlayers + 1
                    break
                end
            end
        end

        if remainingPlayers == 0 then
            debugPrint("No registered players remaining in zone. Cleaning up immediately.")
            
            local mobs = {}
            for _, id in ipairs(lookup.mobIds or {}) do
                local m = GetMobByID(id)
                if m then 
                    m:delStatusEffect(xi.effect.CONFRONTATION) -- Remove effect from mob
                    table.insert(mobs, m) 
                end
            end
            despawnAllBattleMobs(mobs) -- Despawn mobs
            if lookup.cleanUp then
                lookup.cleanUp(true) -- Treat as loss/reset
            end
            xi.confrontation.lookup[confrontationID] = nil

            SetServerVariable("HTBF_Battlefield_Active", 0)
            zone:setLocalVar("ConfrontationStarted", 0)
            zone:setLocalVar("ActiveHTBF_ConfrontationID", 0)
            zone:setLocalVar("HTBF_Mob_Engaged", 0)
        end
    end
end)

-- ============================================================================
-- 2. NPC Logic
-- ============================================================================

ensureTable("xi.zones.Selbina.npcs.Veridical_Conflux")

-- Forward declaration
local showConfirmationMenu
local onVeridicalConfluxTrigger -- Forward declaration for the main NPC trigger
local initiateBattle -- Forward declaration

-- Handles the actual teleportation and setup for a player entering the battlefield.
local function enterBattlefield(player, configId, npc)
    local config = battlefieldConfig[configId]
    if not config then
        debugPrint("Invalid configId passed to enterBattlefield: " .. tostring(configId))
        return
    end

    if config.enabled == false then
        player:printToPlayer("This battlefield is currently disabled.", xi.msg.channel.SYSTEM_3)
        player:setCharVar("HTBF_Pending_Entry", 0)
        return
    end

    -- Check if not leader, leader must be in zone
    local leader = player:getPartyLeader()
    if leader and leader:getID() ~= player:getID() then
        if leader:getZoneID() ~= config.teleport.zoneId then
            player:printToPlayer("The party leader must be in the battlefield before you can enter.", xi.msg.channel.SYSTEM_3)
            return
        end
    end

    -- Check if the battlefield is currently occupied to prevent race conditions
    if GetServerVariable("HTBF_Battlefield_Active") == 1 then
        -- Check if we are joining a party member who is already inside
        local canJoin = false
        local party = player:getParty() or { player }
        for _, member in ipairs(party) do
            if member:getZoneID() == config.teleport.zoneId then
                canJoin = true
                break
            end
        end

        if not canJoin then
            player:printToPlayer("The battlefield is currently occupied by another party. Please wait.", xi.msg.channel.SYSTEM_3)
            player:setCharVar("HTBF_Pending_Entry", 0)
            return
        end

        local bfZone = GetZone(config.teleport.zoneId)
        if bfZone and bfZone:getLocalVar("HTBF_Mob_Engaged") == 1 then
            player:printToPlayer("The battle has already begun. Entry is closed.", xi.msg.channel.SYSTEM_3)
            return
        end
    end

    if not player:hasKeyItem(config.requiredKI) then
        player:printToPlayer("You no longer have the required key item.", xi.msg.channel.SYSTEM_3)
        player:setCharVar("HTBF_Pending_Entry", 0) -- Clear the pending flag as they are no longer eligible.
        return
    end

    -- player:delKeyItem(config.requiredKI) -- Removed: Taken on zone in

    -- Set flags for onZoneIn to handle the timer and mob spawning
    player:setCharVar("HTBF_Timer_Active", 1)
    player:setCharVar("HTBF_Selected_Index", configId)
    player:setCharVar("HTBF_Pending_Entry", 0) -- Clear the pending flag
    player:setCharVar("HTBF_Entry_Time", os.time()) -- Set timestamp for entry validation
    player:setCharVar("HTBF_Needs_Spawn", 1) -- Flag to allow spawning mobs exactly once
    player:setCharVar("HTBF_Attempts", player:getCharVar("HTBF_Attempts") + 1)

    -- Notify party members if leader enters
    if leader and leader:getID() == player:getID() then
        local party = player:getParty()
        if party then
            for _, member in ipairs(party) do
                if member:getID() ~= player:getID() and member:getZoneID() == player:getZoneID() and member:getCharVar("HTBF_Pending_Entry") == configId then
                    if member:hasKeyItem(config.requiredKI) then
                        -- member:delKeyItem(config.requiredKI) -- Removed: Taken on zone in
                        member:setCharVar("HTBF_Timer_Active", 1)
                        member:setCharVar("HTBF_Selected_Index", configId)
                        member:setCharVar("HTBF_Pending_Entry", 0)
                        member:setCharVar("HTBF_Entry_Time", os.time())
                        member:setCharVar("HTBF_Needs_Spawn", 0)
                        member:setCharVar("HTBF_Attempts", member:getCharVar("HTBF_Attempts") + 1)
                        member:setPos(config.teleport.x, config.teleport.y, config.teleport.z, config.teleport.rot, config.teleport.zoneId)
                    else
                        member:printToPlayer("You are missing the required Key Item to enter!", xi.msg.channel.SYSTEM_3)
                    end
                end
            end
        end
    end

    debugPrint("Teleporting player to zoneId: " .. config.teleport.zoneId)
    player:setPos(config.teleport.x, config.teleport.y, config.teleport.z, config.teleport.rot, config.teleport.zoneId)
end

initiateBattle = function(player, npc, configId, difficultyIndex)
    -- Check for alliance
    if player:checkSoloPartyAlliance() == 2 then
        player:printToPlayer("You cannot enter with an alliance.", xi.msg.channel.SYSTEM_3)
        return
    end

    local config = battlefieldConfig[configId]
    if not config or config.enabled == false then
        player:printToPlayer("This battlefield is currently disabled.", xi.msg.channel.SYSTEM_3)
        return
    end

    local difficulty = config.difficulties[difficultyIndex]

    -- Initiation logic
    local party = player:getParty() or { player }
    local membersInZone = {}
    local missingKiMemberName = nil

    for _, member in ipairs(party) do
        if member:getZoneID() == player:getZoneID() then
            table.insert(membersInZone, member)
            if not member:hasKeyItem(config.requiredKI) then
                missingKiMemberName = member:getName()
                break
            end
        end
    end

    if missingKiMemberName then
        player:printToPlayer(string.format("%s is missing the required key item.", missingKiMemberName), xi.msg.channel.SYSTEM_3)
        return
    end

    -- Create a list of party member IDs to ensure everyone gets the confrontation effect
    local partyMemberIDs = {}
    for _, member in ipairs(membersInZone) do
        table.insert(partyMemberIDs, member:getID())
    end

    -- All eligible party members have the KI. Set pending status for all, but only show menu to leader.
    player:printToPlayer("Your party is eligible to enter.", xi.msg.channel.SYSTEM_3)
    for _, member in ipairs(membersInZone) do
        member:setCharVar("HTBF_Pending_Entry", tonumber(configId))
        member:setCharVar("HTBF_Selected_Difficulty_Index", difficultyIndex) -- Store the selected difficulty index
        member:setCharVar("HTBF_Party_Size", #partyMemberIDs)
        for i, partyMemberId in ipairs(partyMemberIDs) do
            member:setCharVar(string.format("HTBF_Party_Member_%d", i), partyMemberId)
        end
    end

    -- Show menu only to the player initiating (Leader)
    player:timer(50, function(p_timed)
        showConfirmationMenu(p_timed, npc, configId)
    end)
end

showDifficultyMenu = function(player, npc, configId, page)
    page = page or 1
    local config = battlefieldConfig[configId]
    if not config or not config.difficulties or config.enabled == false then
        player:printToPlayer("This battlefield is currently disabled or has no difficulty options configured.", xi.msg.channel.SYSTEM_3)
        return
    end

    local difficultyMenu = {
        title = "Select a Difficulty",
        options = {}
    }

    local itemsPerPage = 3
    local totalDifficulties = #config.difficulties

    -- Calculate indices for this page (Reverse order)
    local startIndex = totalDifficulties - ((page - 1) * itemsPerPage)
    local endIndex = math.max(1, startIndex - itemsPerPage + 1)

    -- Add navigation options
    if page > 1 then
        table.insert(difficultyMenu.options, { "Previous Page", function(p)
            p:timer(50, function(p_timed)
                showDifficultyMenu(p_timed, npc, configId, page - 1)
            end)
        end })
    else
        -- Add Back option on first page
        table.insert(difficultyMenu.options, { "Back", function(p)
            -- Re-trigger the NPC to show the main battlefield selection menu.
            p:timer(50, function(p_timed)
                onVeridicalConfluxTrigger(p_timed, npc)
            end)
        end })
    end

    -- Add difficulty options for this page
    for i = startIndex, endIndex, -1 do
        local difficulty = config.difficulties[i]
        table.insert(difficultyMenu.options, { difficulty.name, function(p)
            p:timer(50, function(p_timed)
                initiateBattle(p_timed, npc, configId, i)
            end)
        end })
    end

    -- Add Next Page option if there are more items
    if endIndex > 1 then
        table.insert(difficultyMenu.options, { "Next Page", function(p)
            p:timer(50, function(p_timed)
                showDifficultyMenu(p_timed, npc, configId, page + 1)
            end)
        end })
    end

    player:customMenu(difficultyMenu)
end

-- Displays the Yes/No menu for entering the battlefield.
showConfirmationMenu = function(player, npc, configId)
    -- Ensure configId is a number, as it might be passed as a string from a menu.
    if type(configId) == "string" then
        configId = tonumber(configId)
    end

    local config = battlefieldConfig[configId]
    if not config then
        debugPrint("Invalid configId passed to showConfirmationMenu: " .. tostring(configId))
        return
    end

    if config.enabled == false then
        player:printToPlayer("This battlefield is currently disabled.", xi.msg.channel.SYSTEM_3)
        player:setCharVar("HTBF_Pending_Entry", 0)
        return
    end

    local menu = {
        title = string.format("Enter %s?", config.name),
        options = {
            { "Yes", function(p)
                p:timer(50, function(p_timed)
                    enterBattlefield(p_timed, configId, npc)
                end)
            end },
            { "No", function(p)
                p:printToPlayer("You can speak to the Veridical Conflux again when you are ready.", xi.msg.channel.SYSTEM_3)
            end }
        }
    }
    player:customMenu(menu)
end

onVeridicalConfluxTrigger = function(player, npc)
    debugPrint("NPC Triggered by " .. player:getName())

    -- Check if player is already pending entry for a battlefield
    local pendingEntryId = player:getCharVar("HTBF_Pending_Entry")
    if pendingEntryId > 0 then
        debugPrint("Player has pending entry for battlefield ID: " .. pendingEntryId)
        player:timer(50, function(p_timed)
            showConfirmationMenu(p_timed, npc, pendingEntryId)
        end)
        return true
    end

    -- Check if the battlefield is currently occupied
    if GetServerVariable("HTBF_Battlefield_Active") == 1 then

--===
--===          
        local bfZone = GetZone(xi.zone.WALK_OF_ECHOES_P1)
        local isValidBattle = false

        if bfZone then
            -- Check if the lock is stale (no valid players in zone for the active confrontation)
            -- Find the active confrontation and clean it up properly.
            local activeConfrontationKey = nil
            for key, lookup in pairs(xi.confrontation.lookup or {}) do
                if lookup.zoneId == xi.zone.WALK_OF_ECHOES_P1 then
                    activeConfrontationKey = key
                    break
                end
            end

            if activeConfrontationKey then
                local lookup = xi.confrontation.lookup[activeConfrontationKey]
                
                -- Check if any registered players are actually in the zone
                for _, pid in ipairs(lookup.registeredPlayerIds) do
                    local p = GetPlayerByID(pid)
                    if p and p:getZoneID() == xi.zone.WALK_OF_ECHOES_P1 then
                        local cfg = battlefieldConfig[lookup.configIndex or 1]
                        if cfg then
                            local dist = math.sqrt(math.pow(p:getXPos() - cfg.teleport.x, 2) + math.pow(p:getZPos() - cfg.teleport.z, 2))
                            if dist < ARENA_RADIUS then
                                isValidBattle = true
                                break
                            end
                        end
                    end
                end

                if not isValidBattle then
                    debugPrint("Stale lock detected: Confrontation active but no players in zone. Forcing cleanup.")
                    local mobs = {}
                    for _, id in ipairs(lookup.mobIds or {}) do
                        local m = GetMobByID(id)
                        if m then table.insert(mobs, m) end
                    end
                    despawnAllBattleMobs(mobs)
                    if lookup.cleanUp then
                        lookup.cleanUp(true) -- isLoss = true, this will clear the server var
                    end
                    xi.confrontation.lookup[activeConfrontationKey] = nil
                end
            elseif not isValidBattle then
                debugPrint("Stale lock detected: Server var active but no confrontation lookup found. Forcing cleanup.")
                -- Failsafe: no confrontation object, but we know the zone is stale.
                -- Despawn any mob with the battle name and clear the lock.
                for _, config in pairs(battlefieldConfig) do
                    if config and config.difficulties and config.difficulties[1] and config.difficulties[1].mobName then
                        local mobName = config.difficulties[1].mobName
                        local mobList = bfZone:queryEntitiesByName(mobName)
                        if mobList and #mobList > 0 then
                            debugPrint("Stale cleanup: Despawning mobs with name: " .. mobName)
                            despawnAllBattleMobs(mobList)
                        end
                    end
                end
                SetServerVariable("HTBF_Battlefield_Active", 0)
            end
        end

        if isValidBattle then
            -- Zone is not empty, so it's genuinely occupied.
--===
--===               
            player:printToPlayer("The battlefield is currently occupied. Please wait.", xi.msg.channel.SYSTEM_3)
            return true
        end
    end

    -- Only the party leader can initiate a new battlefield entry process
    local leader = player:getPartyLeader()
    if leader and leader:getID() ~= player:getID() then
        player:printToPlayer("Only the party leader can start the battlefield.", xi.msg.channel.SYSTEM_3)
        return true
    end

    local menuOptions = {}
    for id, config in pairs(battlefieldConfig) do
        if config.enabled ~= false and player:hasKeyItem(config.requiredKI) then
            table.insert(menuOptions, { config.name, function(p)
                -- Show difficulty menu instead of directly initiating, with a delay
                p:timer(50, function(p_timed)
                    showDifficultyMenu(p_timed, npc, id)
                end)
            end})
        end
    end

    if #menuOptions == 0 then
        player:printToPlayer("You do not have the required key item to enter any battlefield.", xi.msg.channel.SYSTEM_3)
        return true
    end

    table.insert(menuOptions, { "Cancel", function(p) end })

    local menu = {
        title = "Select a Battlefield",
        options = menuOptions
    }
    
    player:customMenu(menu)
    return true
end

m:addOverride("xi.zones.Selbina.Zone.onInitialize", function(zone)
    pcall(function() super(zone) end)

    zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "HTBF Surveyor",
        look = "00008d0800000000000000000000000000000000",
        x = 10.9375,
        y = -14.5586,
        z = 67.2586,
        rotation = 244,
        widescan = 1,

        onTrigger = function(player, npc)
            local points = player:getCharVar("custhtbf")
            local attempts = player:getCharVar("HTBF_Attempts")
            local rewardsClaimed = player:getCharVar("HTBF_Rewards_Claimed")
            local availableRewards = math.floor(attempts / 25) - rewardsClaimed

            local title = string.format("Points: %d. Attempts: %d.", points, attempts)
            if availableRewards > 0 then
                title = title .. string.format(" You have %d free KI(s) available!", availableRewards)
            else
                title = title .. string.format(" 10pts/KI", points)
            end

            local menu = {
                title = title,
                options = {}
            }

            if availableRewards > 0 then
                table.insert(menu.options, {
                    "Claim Milestone Reward (Free KI)",
                    function(p)
                        local rewardMenu = { title = "Select a Key Item:", options = {} }
                        for id, config in pairs(battlefieldConfig) do
                            if config.enabled and not p:hasKeyItem(config.requiredKI) then
                                table.insert(rewardMenu.options, { config.name, function(p2)
                                    local curAttempts = p2:getCharVar("HTBF_Attempts")
                                    local curClaimed = p2:getCharVar("HTBF_Rewards_Claimed")
                                    if math.floor(curAttempts / 25) > curClaimed then
                                        p2:setCharVar("HTBF_Rewards_Claimed", curClaimed + 1)
                                        npcUtil.giveKeyItem(p2, config.requiredKI)
                                    else
                                        p2:printToPlayer("You do not have any rewards available.", xi.msg.channel.SYSTEM_3)
                                    end
                                end })
                            end
                        end
                        table.insert(rewardMenu.options, { "Cancel", function(p2) end })
                        p:customMenu(rewardMenu)
                    end
                })
            end

            for id, config in pairs(battlefieldConfig) do
                if config.enabled and not player:hasKeyItem(config.requiredKI) then
                    table.insert(menu.options, {
                        string.format("%s (10pts)", config.name),
                        function(p)
                            if p:getCharVar("custhtbf") >= 10 then
                                if not p:hasKeyItem(config.requiredKI) then
                                    p:setCharVar("custhtbf", p:getCharVar("custhtbf") - 10)
                                    npcUtil.giveKeyItem(p, config.requiredKI)
                                else
                                    p:printToPlayer("You already have that Key Item.", xi.msg.channel.SYSTEM_3)
                                end
                            else
                                p:printToPlayer("You do not have enough points.", xi.msg.channel.SYSTEM_3)
                            end
                        end
                    })
                end
            end

            table.insert(menu.options, { "Cancel", function(p) end })
            player:customMenu(menu)
        end,
    })
end)

m:addOverride("xi.zones.Selbina.npcs.Veridical_Conflux.onTrigger", onVeridicalConfluxTrigger)


return m
