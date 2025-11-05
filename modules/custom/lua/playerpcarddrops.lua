--[[
  VW Mob Death Overrides Script - Converted to Module

  Goal: Loot eligibility is determined by a CONTINUOUS ENMITY SNAPSHOT taken 
  inside onMobFight. The snapshot is updated with the current list of 
  contributors on every execution of onMobFight to ensure no contributors 
  are missed during quick kills (e.g., 100% to 0% in 0% to 100% in one hit).
--]]

-- --- REQUIRED MODULES ---
require("modules/module_utils")
require("scripts/globals/npc_util")

-- 0. DEBUG TOGGLE
local DEBUG_ENABLED = false -- Set to false to disable all debug messages (including setup messages below)

-- --- CONFIGURABLE DROP RATES (PERCENTAGES) ---
local ROLL1_CHANCE_PERCENT = 100 -- Guaranteed Drop (Main Job Card)
local ROLL2_CHANCE_PERCENT = 60  -- Additional Drop (Main Job Card)
local ROLL3_CHANCE_PERCENT = 40   -- Rare Additional Drop (Main Job Card)
-- ---------------------------------------------

-- --- CONFIGURABLE DROP TYPES (1/true = Main Job Card, 0/false = Random Job Card) ---
-- Set these to 1 or true for the card to match the player's main job.
-- Set to 0 or false for a random card from the available pool (JOB_CARD_DROPS).
local ROLL1_DROPS_MAIN_JOB = 1 
local ROLL2_DROPS_MAIN_JOB = 1  
local ROLL3_DROPS_MAIN_JOB = 1  
-- ----------------------------------------------------------------------------------

-- --- CONFIGURABLE ROLL ENABLES (1/true = Enabled, 0/false = Disabled) ---
-- Use these toggles to completely enable or disable each individual loot roll.
local ROLL1_ENABLED = 1
local ROLL2_ENABLED = 1
local ROLL3_ENABLED = 1
-- -------------------------------------------------------------------------


-- 1. Instantiate the Module object
local M = Module:new('playerpcarddrops')

-- Local table to store player names who contributed, indexed by Mob ID. 
-- The list is populated continuously by onMobFight.
M.enmitySnapshots = {} 

-- --- Job Card Drops (Single source of truth) ---
local JOB_CARD_DROPS = {
    [ 1] = 9281, [ 2] = 9282, [ 3] = 9283, [ 4] = 9284, [ 5] = 9285, 
    [ 6] = 9286, [ 7] = 9287, [ 8] = 9288, [ 9] = 9289, [10] = 9290, 
    [11] = 9291, [12] = 9292, [13] = 9293, [14] = 9294, [15] = 9295, 
    [16] = 9296, [17] = 9297, [18] = 9298, [19] = 9299, [20] = 9300, 
    [21] = 9301, [22] = 9302,
}

-- Helper function to retrieve the specific job card ID
local function getJobCardId(jobId)
    -- Returns the card ID for the specified job, defaults to the first one if jobID is invalid
    return JOB_CARD_DROPS[jobId] or JOB_CARD_DROPS[1]
end

-- Define the mobs and the specific zones where the override should be applied.
local vw_mob_data = {
    { mob = 'Krabkatoa', zones = { 'East_Ronfaure', 'Jugner_Forest', 'East_Ronfaure_[S]', 'Jugner_Forest_[S]' } },
    { mob = 'Blobdingnag', zones = { 'North_Gustaberg', 'Pashhow_Marshlands', 'North_Gustaberg_[S]', 'Pashhow_Marshlands_[S]' } },
    { mob = 'Orcus', zones = { 'West_Sarutabaruta', 'Meriphataud_Mountains', 'West_Sarutabaruta_[S]', 'Meriphataud_Mountains_[S]' } },
    { mob = 'Verthandi', zones = { 'Rolanberry_Fields', 'Batallia_Downs', 'Sauromugue_Champaign', 'Rolanberry_Fields_[S]', 'Batallia_Downs_[S]', 'Sauromugue_Champaign_[S]' } },
    { mob = 'Dawon', zones = { 'Konschtat_Highlands', 'La_Theine_Plateau', 'Tahrongi_Canyon' } },
    { mob = 'Lord_Ruthven', zones = { 'Beaucedine_Glacier', 'Xarcabard', 'Beaucedine_Glacier_[S]', 'Xarcabard_[S]' } },
}

-- --- CORE MODULE LOGIC (Applying Overrides) ---

for _, entry in pairs(vw_mob_data) do
    local mobName = entry.mob
    local targetZones = entry.zones

    for _, zoneName in pairs(targetZones) do
        local mobPath = string.format('xi.zones.%s.mobs.%s', zoneName, mobName)

        -- 0. onMobEngage: Simple debug message for engagement.
        M:addOverride(mobPath .. '.onMobEngage', function(mob, target)
            if DEBUG_ENABLED then
                local msg = string.format('[DEBUG:%s] Mob %s (ID %d) engaged. Loot pool will be determined by CONTINUOUS enmity snapshots.', 
                    M.name, mob:getName(), mob:getID())
                printf(msg)
            end
        end)
        
        -- Only print setup messages if debug is enabled
        if DEBUG_ENABLED then
            print(string.format('[VW Override] Added onMobEngage (Simple) function for %s in %s', mobName, zoneName))
        end
        
        -- 0.5. onMobFight: Capture the list of contributors on every call.
        M:addOverride(mobPath .. '.onMobFight', function(mob, target)
            -- MUST be called first to ensure original VW functionality (like triggers) works.
            xi.voidwalker.onMobFight(mob, target)
            
            local mobID = mob:getID()
            local currentZoneId = mob:getZoneID()
            
            -- Get the current, live enmity list from the mob
            local enmityList = mob:getEnmityList()
            local contributors = {}
            local hasContributors = false

            -- Iterate through the enmity list and capture the names of all contributing players
            for _, entry in ipairs(enmityList) do
                local entity = entry.entity
                
                -- Filter by PC, Level 99, and in the mob's zone to ensure eligibility for the snapshot
                if entity and entity:isPC() and entity:getMainLvl() >= 99 and entity:getZoneID() == currentZoneId then
                    table.insert(contributors, entity:getName())
                    hasContributors = true
                end
            end

            -- CRITICAL: Only update the snapshot if the current enmity list is NOT empty.
            if hasContributors then
                M.enmitySnapshots[mobID] = contributors
                if DEBUG_ENABLED then
                    -- Debug message reflecting continuous snapshot
                    local msg = string.format('[DEBUG:%s] Mob %s (ID %d) CONTINUOUS ENMITY SNAPSHOT taken. Captured %d contributors.', 
                        M.name, mob:getName(), mobID, #contributors)
                    printf(msg)
                end
            end

        end)

        -- Only print setup messages if debug is enabled
        if DEBUG_ENABLED then
            print(string.format('[VW Override] Added onMobFight (Continuous Enmity Snapshot) for %s in %s', mobName, zoneName))
        end

        -- 1. onMobDeath: Main loot execution uses the latest snapped list
        M:addOverride(mobPath .. '.onMobDeath', function(mob, player, optParams)
            
            local mobID = mob:getID()
            local currentMobName = mob:getName() 
            local currentZoneId = mob:getZoneID()
            
            if DEBUG_ENABLED then
                -- FIX: Using simple string concatenation to avoid string.format issues with the header
                local msg = '--- [DEBUG:' .. M.name .. '] Mob Death: ' .. currentMobName .. ' (' .. zoneName .. ') ---'
                printf(msg)
            end

            -- --- PRESERVED ORIGINAL LOGIC (Titles, Hunts, Listener) ---
            if mobName == 'Krabkatoa' then
                if player then player:addTitle(xi.title.KRABKATOA_STEAMER) end
                xi.hunts.checkHunt(mob, player, 544)
            elseif mobName == 'Orcus' then
                if player then player:addTitle(xi.title.ORCUS_TROPHY_HUNTER) end
                xi.hunts.checkHunt(mob, player, 550)
                -- NOTE: WS_EXIT_LISTENER must be defined in your environment
                mob:removeListener(WS_EXIT_LISTENER) 
            elseif mobName == 'Verthandi' then
                if player then player:addTitle(xi.title.VERTHANDI_ENSNARER) end
                xi.hunts.checkHunt(mob, player, 553)
            elseif mobName == 'Lord_Ruthven' then
                if player then player:addTitle(xi.title.RUTHVEN_ENTOMBER) end
                xi.hunts.checkHunt(mob, player, 556)
            end

            -- Universal VW Mob Death Call (REQUIRED FOR ALL VW MOBS)
            xi.voidwalker.onMobDeath(mob, player, optParams, xi.keyItem.BLACK_ABYSSITE)

            -- --- CUSTOM JOB CARD LOOT LOGIC ---
            
            local playersToLoot = {}
            -- Retrieve the LATEST snapshot captured during onMobFight
            local contributorNames = M.enmitySnapshots[mobID] or {}
            
            if DEBUG_ENABLED then
                local msg = string.format('[DEBUG:%s] Starting Loot Eligibility Check using latest Enmity Snapshot (Total: %d names).', M.name, #contributorNames)
                printf(msg)
            end
            
            -- 1. Determine the pool of players eligible for drops based on the snapped list
            for _, name in pairs(contributorNames) do
                -- Safely retrieve the current player object using their name
                local member = GetPlayerByName(name)
                
                -- Check if the player is still alive (in case they died *after* the last snapshot)
                -- Note: L99/in-zone status was already checked when the snapshot was created.
                if member and not member:isDead() then
                    -- The player's name being on the list means they generated enmity
                    table.insert(playersToLoot, member)
                elseif DEBUG_ENABLED then
                    local reason = 'Unknown'
                    if not member then reason = 'Player object not found'
                    elseif member and member:isDead() then reason = 'Dead'
                    else reason = 'Snapshot pre-check failed (should not happen)'
                    end
                    local msg = string.format('[DEBUG:%s] %s excluded from loot pool (Reason: %s).', M.name, name, reason)
                    printf(msg)
                end
            end
            
            -- Consolidated Loot Rolls for all eligible players
            if DEBUG_ENABLED then
                if #playersToLoot > 0 then
                    local msg = string.format('[DEBUG:%s] Starting Loot Rolls for %d ELIGIBLE players.', M.name, #playersToLoot)
                    printf(msg)
                else
                    local msg = string.format('[DEBUG:%s] No players were eligible for loot based on final enmity list.', M.name)
                    printf(msg)
                end
            end
            
            for _, member in pairs(playersToLoot) do
                local dropsGiven = 0
                local memberName = member:getName() 
                
                -- Determine the card ID based on the player's main job once for all rolls
                local mainJobCardId = getJobCardId(member:getMainJob())
                
                -- Helper function to decide which card ID to use for the roll based on the toggle
                local function resolveCardDrop(toggle)
                    -- Check if the toggle is explicitly 1 (number) or true (boolean)
                    if toggle == 1 or toggle == true then
                        return mainJobCardId
                    else
                        -- Random Card Drop: Pick a random index from the JOB_CARD_DROPS table
                        local randomJobId = math.random(1, #JOB_CARD_DROPS)
                        return JOB_CARD_DROPS[randomJobId]
                    end
                end

                -- ROLL 1: 100% Chance (Card type determined by ROLL1_DROPS_MAIN_JOB toggle)
                if ROLL1_ENABLED == 1 or ROLL1_ENABLED == true then
                    local cardId1 = resolveCardDrop(ROLL1_DROPS_MAIN_JOB)
                    if cardId1 then
                        npcUtil.giveItem(member, { { cardId1, 1 } })
                        dropsGiven = dropsGiven + 1
                        if DEBUG_ENABLED then
                            local type_msg = (ROLL1_DROPS_MAIN_JOB == 1 or ROLL1_DROPS_MAIN_JOB == true) and "Main Job" or "Random Job"
                            local msg = string.format('[DEBUG:%s] %s succeeded ROLL 1 (Guaranteed) and received %s Card ID: %d.', 
                                M.name, memberName, type_msg, cardId1)
                            printf(msg)
                        end
                    end
                elseif DEBUG_ENABLED then
                    local msg = string.format('[DEBUG:%s] %s ROLL 1 skipped (Disabled by toggle).', M.name, memberName)
                    printf(msg)
                end
                
                -- ROLL 2: 12 percent Chance (Card type determined by ROLL2_DROPS_MAIN_JOB toggle)
                if ROLL2_ENABLED == 1 or ROLL2_ENABLED == true then
                    local chanceRoll2 = math.random(1, 100)
                    local cardId2 = resolveCardDrop(ROLL2_DROPS_MAIN_JOB)
                    if DEBUG_ENABLED then 
                        local type_msg = (ROLL2_DROPS_MAIN_JOB == 1 or ROLL2_DROPS_MAIN_JOB == true) and "Main Job" or "Random Job"
                        local msg = string.format('[DEBUG:%s] %s ROLL 2 (%d percent chance). Roll result: %d/100. Potential Drop: %s Card ID %d.', 
                            M.name, memberName, ROLL2_CHANCE_PERCENT, chanceRoll2, type_msg, cardId2)
                        printf(msg)
                    end
                    
                    if chanceRoll2 <= ROLL2_CHANCE_PERCENT then 
                        if cardId2 then
                            npcUtil.giveItem(member, { { cardId2, 1 } })
                            dropsGiven = dropsGiven + 1
                            if DEBUG_ENABLED then 
                                local msg = string.format('[DEBUG:%s] %s succeeded ROLL 2 and received Job Card Item ID: %d.', M.name, memberName, cardId2)
                                printf(msg) 
                            end
                        end
                    elseif DEBUG_ENABLED then
                        local msg = string.format('[DEBUG:%s] %s failed ROLL 2.', M.name, memberName)
                        printf(msg)
                    end
                elseif DEBUG_ENABLED then
                    local msg = string.format('[DEBUG:%s] %s ROLL 2 skipped (Disabled by toggle).', M.name, memberName)
                    printf(msg)
                end
                
                -- ROLL 3: 5 percent Chance (Card type determined by ROLL3_DROPS_MAIN_JOB toggle)
                if ROLL3_ENABLED == 1 or ROLL3_ENABLED == true then
                    local chanceRoll3 = math.random(1, 100)
                    local cardId3 = resolveCardDrop(ROLL3_DROPS_MAIN_JOB)
                    if DEBUG_ENABLED then 
                        local type_msg = (ROLL3_DROPS_MAIN_JOB == 1 or ROLL3_DROPS_MAIN_JOB == true) and "Main Job" or "Random Job"
                        local msg = string.format('[DEBUG:%s] %s ROLL 3 (%d percent chance). Roll result: %d/100. Potential Drop: %s Card ID %d.', 
                            M.name, memberName, ROLL3_CHANCE_PERCENT, chanceRoll3, type_msg, cardId3)
                        printf(msg)
                    end
                    
                    if chanceRoll3 <= ROLL3_CHANCE_PERCENT then 
                        if cardId3 then
                            npcUtil.giveItem(member, { { cardId3, 1 } })
                            dropsGiven = dropsGiven + 1
                            if DEBUG_ENABLED then 
                                local msg = string.format('[DEBUG:%s] %s succeeded ROLL 3 and received Job Card Item ID: %d.', M.name, memberName, cardId3)
                                printf(msg) 
                            end
                        end
                    elseif DEBUG_ENABLED then
                        local msg = string.format('[DEBUG:%s] %s failed ROLL 3.', M.name, memberName)
                        printf(msg)
                    end
                elseif DEBUG_ENABLED then
                    local msg = string.format('[DEBUG:%s] %s ROLL 3 skipped (Disabled by toggle).', M.name, memberName)
                    printf(msg)
                end

                if DEBUG_ENABLED then
                    local msg = string.format('[DEBUG:%s] %s completed rolls, received %d total card(s).', M.name, memberName, dropsGiven)
                    printf(msg)
                end
            end
            
            -- --- CRITICAL: MEMORY CLEANUP ---
            M.enmitySnapshots[mobID] = nil -- Clean up the snapshot data
            -- --- End Custom Loot Logic ---
        end)

        -- Only print setup messages if debug is enabled
        if DEBUG_ENABLED then
            print(string.format('[VW Override] Added onMobDeath override for %s in %s', mobName, zoneName))
        end
    end
end

-- 3. Return the module object
return M
