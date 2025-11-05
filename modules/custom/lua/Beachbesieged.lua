-- Sea Monster Event System
-- This script manages a dynamic sea monster event in various zones of the game.
-- It handles mob spawning, wave progression, player participation, rewards, and loss conditions.

-- Required modules for script functionality
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/utils/utils") -- file dir changed

-- Localization table for all messages
local messages = {
    -- System messages for errors/warnings
    SpawnAreaNotDefined = "Error: Spawn area not defined for this zone.",
    ConfrontationActive = "There's no time to chat! There are monsters about!",
    InventoryFull = "Make space in your inventory first!",
    NotEnoughPoints = "Not enough points! Kill more sea monsters and come back and talk! ",
    NotEnoughJobPoints = "You don't have enough Job Points! Requires %d job points.",
    JobPointsDeducted = "%d Job Points deducted for the battle.",

    -- Event messages
    WaveIncoming = "HERE THEY COME! Wave %d of %d starting!",
    WavesDefeatedBonus = "VICTORY! You defeated all the sea monsters!",
    TimeExpiredLoss = "DEFEAT! The sea monsters have escaped back to the depths to regroup!",

    -- NPC Dialogue
    NpcHelpMe = "Help me stop the monsters and I'll share my loot with you!",
    NpcPointsInfo = "You have %d points to spend.",
    MobClaimed = " WATCH OUT! A monster is coming for %s!",
}

-- Configuration for confrontation timers and sequential claiming
local BASE_TIME_PER_WAVE = 240 -- seconds per wave for each wave timer (used for mob despawn in a wave)
local INITIAL_CLAIM_DELAY_SECONDS = 30 -- Initial delay in seconds before the first mob is claimed
local DELAY_BETWEEN_CLAIMS_SECONDS = 25 -- Delay in seconds between subsequent mob claims
local POST_LOSS_CONFRONTATION_DURATION_SECONDS = 3 -- Time in seconds after an explicit wave loss for the confrontation effect to fully wear off

-- Global declarations for menu pages
local menu = {} -- Main Menu Title
local SMmainMenuPage = {}
local SMbattleSelectorPage1 = {}
local SMbattleSelectorPage2 = {}
local SMRewardsPage1 = {} -- Page 1 Rewards
local SMRewardsPage2 = {} -- Page 2 Rewards
local SMRewardsPage3 = {} -- Page 3 Rewards
local SMRewardsPage4 = {} -- Page 4 Rewards
local SMRewardsPage5 = {} -- Page 5 Rewards
local SMRewardsPage6 = {} -- Page 6 Rewards

-- Global function for delayed menu sending
local function delaySendMenu(player)
    player:timer(50, function(p) p:customMenu(menu) end) -- Closes anonymous function for timer
end

--EVENT REWARDS
-- https://www.bg-wiki.com/ffxi/Mog_Kupon
--https://www.bg-wiki.com/ffxi/Category:Mog_Pell
local rewardOptions = {
    { item = 9152, cost = 250, 	 name = "Rainbow Mog Pell" }, -- Holiday/Costume Gear and Furniture
	{ item = 8715, cost = 250, 	 name = "Green Mog Pell" }, -- Holiday/Costume Gear and Exp Rings
	{ item = 9174, cost = 250, 	 name = "Marble Mog Pell" }, -- NM Statues
	{ item = 9158, cost = 500, 	 name = "Ochre Mog Pell" }, -- Trusts
	{ item = 8714, cost = 600, 	 name = "Red Mog Pell" }, -- Trusts & Augment Stuff & Style Lock Gear
	{ item = 9166, cost = 700, 	 name = "Silver Mog Pell" }, -- Ambuscade Vouchers/Mats, JSE Capes, Furniture
	{ item = 8716, cost = 700, 	 name = "Gold Mog Pell" }, -- Rems 1-5 x3, 50k CP/IS/AN/Bayld/Guild Points, Classic HNM items
	{ item = 8794, cost = 750, 	 name = "Kupon I-Mat" },
	{ item = 3442, cost = 1000,  name = "Kupon I-Seal" },
	{ item = 3625, cost = 2500,  name = "Blacksmith's Stall" },
    { item = 3626, cost = 2500,  name = "Goldsmith's Stall" },
	{ item = 3627, cost = 2500,  name = "Boneworker's Stall" },
    { item = 3628, cost = 2500,  name = "Weaver's Stall" },
	{ item = 3629, cost = 2500,  name = "Culinarian's Stall" },
    { item = 3630, cost = 2500,  name = "Tanner's Stall" },
	{ item = 3631, cost = 2500,  name = "Fishermen's Stall" },
	{ item = 3632, cost = 2500,  name = "Carpenter's Stall" },
    { item = 3633, cost = 2500,  name = "Alchemist's Stall" },
}

local possibleMobs = {
    { groupId = 6,   groupZoneId = 57,  name = "Sea Monster", look = 1729 }, -- Giant Orobon
    { groupId = 8,   groupZoneId = 57,  name = "Sea Monster", look = 1731 }, -- Angler Orobon
    { groupId = 15,  groupZoneId = 58,  name = "Sea Monster", look =  353 }, -- Blue/White Sea Monk
    { groupId = 8,   groupZoneId = 217, name = "Sea Monster", look =  352 }, -- Orange Sea Monk (Jasconius)
    { groupId = 8,   groupZoneId = 3,   name = "Sea Monster", look = 1361 }, -- Urganite
	{ groupId = 9,   groupZoneId = 265, name = "Sea Monster", look = 2560 }, -- Urganite
	{ groupId = 14,  groupZoneId = 267, name = "Sea Monster", look = 2223 }, -- Slobbering Ruszor
}

local possibleBosses = {
    { groupId = 14, groupZoneId = 170,  name = "Abyssal Serpent", 	look = '00001b0300000000000000000000000000000000' }, -- Leviathan_Prime_HTBF, lvl 100 | 50k HP @ base
    { groupId = 90, groupZoneId = 54,   name = "Pactbound Ghoul", 	look = '0600c50600000000000000000000000000000000' }, --  -- 510k @ 600%
    { groupId = 63, groupZoneId = 79,   name = "Chasm Wretch",   	look = '0000800600000000000000000000000000000000' }, -- Experimental_Lamia, lvl 115 | 85k HP @ base - 590k @ 600% HPP
    { groupId = 62, groupZoneId = 79,   name = "Brinefather",    	look = '0000f00600000000000000000000000000000000' }, -- Mahjlaef_the_Paintorn, lvl 115 | 85k HP @ base - 590k @ 600% HPP
--    { groupId = 50,  groupZoneId = 112, name = "Abyssal Slug", 		look = '0000400100000000000000000000000000000000' }, --  HP too high
--	  { groupId = 69,  groupZoneId = 51, name = "Testing", look = 1863 }, -- Gulool_Ja_Ja -- 491k @ 600% -- missing animation
--	  { groupId = 53,  groupZoneId = 118, name = "Globulus Prime", look = 2060 }, -- Botulus Rex -- 1M @ 600% -- missing animation?
}

-- Define spawn areas for each zone
local zoneSpawnAreas = {
    [103] = { -- Valkurm Dunes (H-9)
        {x=270, y=4, z=-170},
        {x=236, y=4, z=-170},
        {x=236, y=4, z=-158},
        {x=270, y=4, z=-158},
    },
    [120] = { -- Sauromugue Champaign (K-5)
        {x=406.72, y=38.22, z=449.56},
        {x=405.72, y=39.6,  z=436.7},
        {x=356.22, y=40.16, z=446.66},
        {x=356.22, y=40.16, z=433.1681},
    },
    [260] = { -- Yahse Hunting Grounds (K-9)
        {x=371.0, y=4.5, z=-176},
        {x=357.0, y=4.0, z=-176},
        {x=368.0, y=4.0, z=-200.0},
        {x=360.0, y=4.0, z=-200.0},
    },
    [44] = { -- Purgonorgo Isle (H-11)
        {x=645, y=0.2, z=57.3},
        {x=645, y=0.3, z=31},
        {x=636.8, y=0.3, z=37.8},
        {x=630.7, y=0.2, z=53.75},
    },
}

local function randomPointInTriangle(p1, p2, p3)
    local r1, r2 = math.random(), math.random()
    if r1 + r2 > 1 then r1 = 1 - r1; r2 = 1 - r2 end
    return {
        x = p1.x + r1 * (p2.x - p1.x) + r2 * (p3.x - p1.x),
        z = p1.z + r1 * (p2.z - p1.z) + r2 * (p3.z - p1.z)
    }
end

local function getRandomSpawnPointInQuad(points)
    local p1, p2, p3, p4 = points[1], points[2], points[3], points[4]
    local triangle = math.random(2)
    local pos = (triangle == 1) and randomPointInTriangle(p1, p2, p3) or randomPointInTriangle(p1, p3, p4)
    pos.y = (p1.y + p2.y + p3.y + p4.y) / 4
    pos.rot = math.random(0, 255)
    return pos
end

local function applyMobStats(mob, isBoss, difficultyMultiplier)
    if isBoss then
        mob:addMod(xi.mod.HPP, 400)
        mob:addMod(xi.mod.DEF, 200)
        mob:addMod(xi.mod.ACC, 500)
        mob:addMod(xi.mod.MEVA, 400)
        mob:addMod(xi.mod.MDEF, 400)
        for _, stat in ipairs({xi.mod.STR, xi.mod.VIT, xi.mod.INT, xi.mod.MND, xi.mod.CHR, xi.mod.AGI, xi.mod.DEX}) do
            mob:addMod(stat, 100)
        end
        -- print(string.format("[SEA MONSTER EVENT] Applied BOSS stats to mob %s (ID:%d).", mob:getName(), mob:getID()))
    else
        mob:addMod(xi.mod.HPP, 175 * difficultyMultiplier)
        mob:addMod(xi.mod.DEF, 15 * difficultyMultiplier)
        mob:addMod(xi.mod.ACC, 150 * difficultyMultiplier)
		mob:setMobMod(xi.mobMod.TP_USE_CHANCE, 500) -- set TP use at 50% chance
        for _, stat in ipairs({xi.mod.STR, xi.mod.VIT, xi.mod.INT, xi.mod.MND, xi.mod.CHR, xi.mod.AGI, xi.mod.DEX}) do
            mob:addMod(stat, 10 * difficultyMultiplier)
        end
        -- print(string.format("[SEA MONSTER EVENT] Applied standard stats (mult: %d) to mob %s (ID:%d).", difficultyMultiplier, mob:getName(), mob:getID()))
    end
end

---@param mobs table
---@return nil
xi.confrontation.despawnMobs = function(mobs)
    -- print("[SEA MONSTER EVENT] Despawning all mobs related to confrontation.")
    for _, mob in ipairs(mobs) do
        if mob and mob:isSpawned() then
            DespawnMob(mob:getID())
            -- print(string.format("[SEA MONSTER EVENT] Despawned mob %s (ID:%d).", mob:getName(), mob:getID()))
        else
            -- print(string.format("[SEA MONSTER EVENT] Attempted to despawn mob ID %s, but it was not spawned or valid.", tostring(mob and mob:getID() or "N/A")))
        end
    end
end

-- Ensure xi.confrontation.lookup is initialized only once, if it doesn't already exist.
-- This ensures multiple initializations don't overwrite it.
xi.confrontation = xi.confrontation or {}
xi.confrontation.lookup = xi.confrontation.lookup or {}

xi.confrontation.check = function(lookupKey)
    local lookup = xi.confrontation.lookup[lookupKey]

    if not lookup then
        -- print(string.format("[SEA MONSTER EVENT] Confrontation lookup for key %s not found. Aborting check.", tostring(lookupKey)))
        return
    end

    local players = {}
    for _, id in ipairs(lookup.registeredPlayerIds) do
        local player = GetPlayerByID(id)
        if player then
            table.insert(players, player)
        end
    end

    local mobs = {}
    for _, id in ipairs(lookup.mobIds) do
        local mob = GetMobByID(id)
        if mob then
            table.insert(mobs, mob)
        end
    end

    local validPlayerCount = 0
    for _, member in ipairs(players) do
        -- A player is considered 'valid' if they are alive AND still have the
        -- CONFRONTATION status effect AND their CharVar matches the confrontation ID.
        if member:isAlive() and member:hasStatusEffect(xi.effect.CONFRONTATION) and member:getCharVar("ConfrontationID") == lookupKey then
            validPlayerCount = validPlayerCount + 1
        end
    end

    local validMobCount = 0
    for _, mob_in_list in pairs(mobs) do
        -- Check if mob has the CONFRONTATION effect and its registered with the current confrontation.
        -- We no longer check the 'power' parameter of the mob's effect, just its presence.
        if mob_in_list and mob_in_list:isAlive() and mob_in_list:hasStatusEffect(xi.effect.CONFRONTATION) then
            validMobCount = validMobCount + 1
        end
    end

    -- print(string.format("[SEA MONSTER EVENT] Checking confrontation %s: Players alive: %d, Mobs alive: %d.", lookupKey, validPlayerCount, validMobCount))

    local isConfrontationOver = false
    local didWin = false
    local didLose = false

    -- Check for loss conditions
    if validPlayerCount == 0 then
        didLose = true
        isConfrontationOver = true
        -- print(string.format("[SEA MONSTER EVENT] Confrontation %s ended: No valid players remaining.", lookupKey))
    elseif lookup.timeLimit and os.time() > lookup.timeLimit then
        didLose = true
        isConfrontationOver = true
        -- print(string.format("[SEA MONSTER EVENT] Confrontation %s ended: Time limit expired.", lookupKey))
    elseif lookup.didLoseExplicitly then -- New flag for wave timer loss
        didLose = true
        isConfrontationOver = true
        -- print(string.format("[SEA MONSTER EVENT] Confrontation %s ended: Wave timer expired on final wave.", lookupKey))
    end

    -- Check for win condition only if not already lost
    if not didLose and validMobCount == 0 then
        if lookup.currentWave == lookup.waveCount then
            didWin = true
            isConfrontationOver = true
            -- print(string.format("[SEA MONSTER EVENT] Confrontation %s ended: All mobs defeated, all waves cleared.", lookupKey))
        end
    end

    if isConfrontationOver then
        -- print(string.format("[SEA MONSTER EVENT] Finalizing confrontation %s. Win: %s, Loss: %s.", lookupKey, tostring(didWin), tostring(didLose)))
        for _, member in ipairs(players) do
            member:delStatusEffect(xi.effect.CONFRONTATION)
            -- Only clear CharVar for player characters, trusts might not have it or need it cleared
            if member:isPC() then
                member:setCharVar("ConfrontationID", 0)
                -- print(string.format("[SEA MONSTER EVENT] Cleared ConfrontationID for player %s.", member:getName()))
            end

            if didWin and type(lookup.onWin) == 'function' then
                lookup.onWin(member)
            elseif didLose and type(lookup.onLose) == 'function' then
                lookup.onLose(member)
            end
        end
        if didLose then
            -- Despawn any remaining mobs only if it was a loss.
            -- This correctly handles the mobs that remained when didLoseExplicitly was set.
            xi.confrontation.despawnMobs(mobs)
        end
        -- Cancel any pending wave timers too
        if lookup.waveDespawnTimerId then
            lookup.npc:cancelTimer(lookup.waveDespawnTimerId)
            -- print(string.format("[SEA MONSTER EVENT] Cancelled wave despawn timer for confrontation %s.", lookupKey))
        end
        xi.confrontation.lookup[lookupKey] = nil
        -- print(string.format("[SEA MONSTER EVENT] Confrontation %s removed from lookup table.", lookupKey))
    else -- Confrontation is still ongoing, re-schedule check
        lookup.npc:timer(1000, function() -- Continue checking every 1 second
            xi.confrontation.check(lookupKey)
        end)
        -- print(string.format("[SEA MONSTER EVENT] Re-scheduling check for confrontation %s.", lookupKey))
    end
end

local function onConfrontationWin(player)
    -- print(string.format("[SEA MONSTER EVENT] Player %s won the confrontation.", player:getName()))
    -- Display the win message to the player here, ensuring it's only sent once per winning player.
    player:printToPlayer(messages.WavesDefeatedBonus, xi.msg.channel.SYSTEM_3)
    -- This function will be called for each player in the confrontation
    -- The bonus points for wave completion are handled in spawnSeaMonsters.
end

local function onConfrontationLose(player)
    -- print(string.format("[SEA MONSTER EVENT] Player %s lost the confrontation.", player:getName()))
    -- This function will be called for each player in the confrontation
    player:printToPlayer(messages.TimeExpiredLoss, xi.msg.channel.SYSTEM_3)
end

-- Helper function to check for active confrontations in a zone
local function isConfrontationActiveInZone(zoneIDToCheck)
    -- print(string.format("[SEA MONSTER EVENT] Checking for active confrontation in zone ID %d.", zoneIDToCheck))
    for confrID, lookupData in pairs(xi.confrontation.lookup) do
        if lookupData.npc and lookupData.npc:getZoneID() == zoneIDToCheck then
            if next(lookupData.mobIds) then
                for _, mobID in ipairs(lookupData.mobIds) do
                    local mob = GetMobByID(mobID)
                    if mob and mob:isSpawned() and mob:isAlive() then
                        -- print(string.format("[SEA MONSTER EVENT] Active confrontation %s found in zone %d with mob %s (ID:%d).", confrID, zoneIDToCheck, mob:getName(), mob:getID()))
                        return true -- An active mob exists for this confrontation in this zone
                    end
                end
            end
        end
    end
    -- print(string.format("[SEA MONSTER EVENT] No active confrontations found in zone ID %d.", zoneIDToCheck))
    return false -- No active confrontations found in the zone
end

-- New helper function to handle sequential mob claiming
local function startSequentialClaiming(confrontationID, player, initialDelaySeconds, delayBetweenClaimsSeconds)
    -- print(string.format("[SEA MONSTER EVENT] Starting sequential claiming for confrontation %d by player %s.", confrontationID, player:getName()))
    local lookup = xi.confrontation.lookup[confrontationID]
    if not lookup then
        -- print(string.format("[SEA MONSTER EVENT] Failed to start sequential claiming: Confrontation %d lookup not found.", confrontationID))
        return
    end
    if #lookup.mobIds == 0 then
        -- print(string.format("[SEA MONSTER EVENT] No mobs to claim for confrontation %d.", confrontationID))
        return
    end

    local mobIndex = 1

    local function claimNextMob()
        if mobIndex <= #lookup.mobIds then
            local mobIDToClaim = lookup.mobIds[mobIndex]
            local mob = GetMobByID(mobIDToClaim)

            -- Find all active players with the current confrontation effect
            local activeClaimers = {}
            for _, pID in ipairs(lookup.registeredPlayerIds) do
                local p = GetPlayerByID(pID)
                if p then
                    -- Check for the presence of the effect and then verify the CharVar
                    local hasConfrontationEffect = p:hasStatusEffect(xi.effect.CONFRONTATION)
                    local charVarConfrontationID = p:getCharVar("ConfrontationID")
                    -- print(string.format("[SEA MONSTER EVENT] Player %s (ID:%d) isAlive: %s, has CONFRONTATION: %s, CharVar ID: %s (Expected: %s)", p:getName(), p:getID(), tostring(p:isAlive()), tostring(hasConfrontationEffect), tostring(charVarConfrontationID), tostring(confrontationID)))
                    
                    if p:isAlive() and hasConfrontationEffect and charVarConfrontationID == confrontationID then
                        table.insert(activeClaimers, p)
                    else
                        -- Log if a player is skipped and why
                        -- if not p:isAlive() then
                            -- print(string.format("[SEA MONSTER EVENT] Player %s (ID:%d) skipped from claiming: Not alive.", p:getName(), p:getID()))
                        -- elseif not hasConfrontationEffect then
                            -- print(string.format("[SEA MONSTER EVENT] Player %s (ID:%d) skipped from claiming: Missing CONFRONTATION effect.", p:getName(), p:getID()))
                        -- elseif charVarConfrontationID ~= confrontationID then
                            -- print(string.format("[SEA MONSTER EVENT] Player %s (ID:%d) skipped from claiming: Mismatched CharVar ID (%s) vs Expected (%s).", p:getName(), p:getID(), tostring(charVarConfrontationID), tostring(confrontationID)))
                        -- end
                    end
                end
            end

            if mob and mob:isSpawned() and mob:isAlive() then
                if #activeClaimers > 0 then
                    -- Select a random player from the active claimers list
                    local randomClaimer = activeClaimers[math.random(#activeClaimers)]
                    mob:updateClaim(randomClaimer)
                    
                    -- Broadcast claim message to all active participants
                    for _, p in ipairs(activeClaimers) do
                        if p:isPC() then -- Only send to player characters
                            p:printToPlayer(string.format(messages.MobClaimed, randomClaimer:getName()), xi.msg.channel.SYSTEM_3)
                        end
                    end
                    -- print(string.format("[SEA MONSTER EVENT] Mob %s (ID:%d) claimed for random player %s (ID:%d). Message broadcast to all active participants.", mob:getName(), mob:getID(), randomClaimer:getName(), randomClaimer:getID()))
                else
                    -- print(string.format("[SEA MONSTER EVENT] No active players found with CONFRONTATION effect for mob %s (ID:%d). Skipping claim.", mob:getName(), mob:getID()))
                end
            else
                -- print(string.format("[SEA MONSTER EVENT] Mob ID %d (index %d) no longer valid for claiming.", mobIDToClaim, mobIndex))
            end

            mobIndex = mobIndex + 1
            if mobIndex <= #lookup.mobIds then
                -- Schedule the next claim with the specified delay
                lookup.npc:timer(delayBetweenClaimsSeconds * 1000, claimNextMob) -- Convert seconds to milliseconds
            else
                -- print(string.format("[SEA MONSTER EVENT] All mobs in current wave (%d/%d) of confrontation %d have been claimed.", lookup.currentWave, lookup.waveCount, confrontationID))
            end
        else
            -- print(string.format("[SEA MONSTER EVENT] Sequential claiming finished for confrontation %d.", confrontationID))
        end
    end

    -- Start the first claim after the initial delay
    -- print(string.format("[SEA MONSTER EVENT] First mob claim scheduled in %d seconds for confrontation %d.", initialDelaySeconds, confrontationID))
    lookup.npc:timer(initialDelaySeconds * 1000, claimNextMob) -- Convert seconds to milliseconds
end


local function spawnSeaMonsters(player, spawnCount, waveCount, waveWinBonus, level, difficultyMultiplier, npcRef, jpCost)
    -- print(string.format("[SEA MONSTER EVENT] Initiating spawnSeaMonsters for player %s. Waves: %d, Mobs per wave: %d, Level: %d, Difficulty: %d, JP Cost: %d.",
        -- player:getName(), waveCount, spawnCount, level, difficultyMultiplier, jpCost))

    local zoneID = player:getZoneID()
    local spawnArea = zoneSpawnAreas[zoneID]

    if not spawnArea then
        player:printToPlayer(messages.SpawnAreaNotDefined, xi.msg.channel.SYSTEM_3)
        -- print("ERROR: spawnArea is nil for zoneID: " .. zoneID)
        return
    end

    -- JP Cost Check and Deduction
    if jpCost and jpCost > 0 then
        local currentJobID = player:getMainJob() -- Get the player's current main job ID
        local currentJp = player:getJobPoints(currentJobID) -- Get JP for that job

        if currentJp < jpCost then
            player:printToPlayer(string.format(messages.NotEnoughJobPoints, jpCost), xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s does not have enough JP. Required: %d, Has: %d.", player:getName(), jpCost, currentJp))
            return -- Abort if not enough JP
        end

        player:delJobPoints(currentJobID, jpCost) -- Deduct JP
        player:printToPlayer(string.format(messages.JobPointsDeducted, jpCost), xi.msg.channel.SYSTEM_3)
        -- print(string.format("[SEA MONSTER EVENT] Deducted %d JP from player %s.", jpCost, player:getName()))
    end

    local zoneOrInstance = player:getInstance() or player:getZone()
    local confrontationID = math.random(1, 1000000) -- Unique ID for this confrontation
    -- print(string.format("[SEA MONSTER EVENT] Generated new confrontation ID: %d.", confrontationID))

	-- Determine participants: check for party with trusts first, then alliance, then solo player
	local partyAllianceCheck = player:checkSoloPartyAlliance()

	-- Determine participants based on the new check
	local participants
	if partyAllianceCheck == 2 then
		-- Use their alliance if the check returns 2
		participants = player:getAlliance()
	else
		-- Otherwise, use their party with trusts
		participants = player:getPartyWithTrusts()
	end

    -- Calculate confrontation duration based on number of waves
    local confrontationDuration = waveCount * BASE_TIME_PER_WAVE
    -- print(string.format("[SEA MONSTER EVENT] Total confrontation duration set to %d seconds.", confrontationDuration))

    local registeredPlayerIds = {}
    for _, p in ipairs(participants) do
        -- print(string.format("[SEA MONSTER EVENT] Processing participant %s (ID:%d). IsPC: %s", p:getName(), p:getID(), tostring(p:isPC())))
        -- Apply status effect to all participants (player and trusts)
        if p then
            table.insert(registeredPlayerIds, p:getID())
            -- Apply CONFRONTATION effect with duration 0 (persistent) and power 1 (generic)
            p:addStatusEffect(xi.effect.CONFRONTATION, 1, 0, 0)
            
            -- Check if forceUpdateEffect exists before calling it
            if p.forceUpdateEffect then
                p:forceUpdateEffect(xi.effect.CONFRONTATION)
                -- print(string.format("[SEA MONSTER EVENT] Force updated CONFRONTATION effect for %s (ID:%d).", p:getName(), p:getID()))
            else
                -- print(string.format("[SEA MONSTER EVENT] WARNING: forceUpdateEffect not available for %s (ID:%d).", p:getName(), p:getID()))
            end
            
            if p:isPC() then
                p:setCharVar("ConfrontationID", confrontationID) -- Store unique ID in CharVar for player
                -- print(string.format("[SEA MONSTER EVENT] Registered player %s (ID:%d) for confrontation %d.", p:getName(), p:getID(), confrontationID))
            else
                -- For trusts/NPCs, we still apply the effect but don't set a CharVar
                -- print(string.format("[SEA MONSTER EVENT] Applied CONFRONTATION effect to trust/NPC %s (ID:%d).", p:getName(), p:getID()))
            end
        end
    end

    xi.confrontation.lookup[confrontationID] = {
        registeredPlayerIds = registeredPlayerIds,
        mobIds = {}, -- Will be populated as mobs spawn
        npc = npcRef, -- Pass the NPC that started it for zone/timer checks
        timeLimit = os.time() + confrontationDuration, -- The overall time limit for the event
        onWin = onConfrontationWin,
        onLose = onConfrontationLose,
        currentWave = 1,
        waveCount = waveCount,
        spawnCount = spawnCount,
        level = level,
        difficultyMultiplier = difficultyMultiplier,
        waveWinBonus = waveWinBonus, -- Store waveWinBonus here
        waveDespawnTimerId = nil, -- New: To store the ID of the per-wave despawn timer
        didLoseExplicitly = false, -- New: Flag to indicate loss due to wave timer expiration
    }

    local currentConfrontation = xi.confrontation.lookup[confrontationID]

    local function spawnWave(waveNumber)
        -- Send "Wave Incoming" message to all registered player characters.
        for _, pID in ipairs(currentConfrontation.registeredPlayerIds) do
            local p = GetPlayerByID(pID)
            if p and p:isPC() then -- Only send to player characters, not trusts
                p:printToPlayer(string.format(messages.WaveIncoming, waveNumber, currentConfrontation.waveCount), xi.msg.channel.SYSTEM_3)
            end
        end
        -- print(string.format("[SEA MONSTER EVENT] Spawning wave %d for confrontation %d.", waveNumber, confrontationID))

        local mobTable = (waveNumber == currentConfrontation.waveCount and currentConfrontation.waveCount > 1) and { possibleBosses[math.random(#possibleBosses)] } or possibleMobs
        local count = (waveNumber == currentConfrontation.waveCount and currentConfrontation.waveCount > 1) and 1 or currentConfrontation.spawnCount
        -- print(string.format("[SEA MONSTER EVENT] Wave %d will spawn %d mobs.", waveNumber, count))

        -- Cancel previous wave's timer if it exists
        if currentConfrontation.waveDespawnTimerId then
            currentConfrontation.npc:cancelTimer(currentConfrontation.waveDespawnTimerId)
            currentConfrontation.waveDespawnTimerId = nil
            -- print(string.format("[SEA MONSTER EVENT] Cancelled previous wave timer for confrontation %d.", confrontationID))
        end

        -- Set a new timer for the current wave
        currentConfrontation.waveDespawnTimerId = currentConfrontation.npc:timer(BASE_TIME_PER_WAVE * 1000, function() -- Timer in ms
            local confr = xi.confrontation.lookup[confrontationID]
            if confr and confr.currentWave == waveNumber and #confr.mobIds > 0 then
                -- FIX: Explicitly mark as loss and call check. We must NOT manually despawn mobs or clear the mob list here.
                -- Rely on xi.confrontation.check (which uses the didLose flag) to handle cleanup and despawn.
                -- If we manually despawn/clear here, the final check sees validMobCount=0 and incorrectly triggers a Win.
                
                -- print(string.format("[SEA MONSTER EVENT] Wave %d timer expired for confrontation %d with mobs remaining. Setting as explicit loss.", waveNumber, confrontationID))
                confr.didLoseExplicitly = true -- Set flag to indicate loss due to timer expiration
                
                -- Force the overall confrontation time limit to expire soon (just in case the flag check fails)
                confr.timeLimit = os.time() + POST_LOSS_CONFRONTATION_DURATION_SECONDS

                -- Trigger a check to see if the overall confrontation should end (which will see didLoseExplicitly=true)
                xi.confrontation.check(confrontationID)
            end
        end)
        -- print(string.format("[SEA MONSTER EVENT] Set new wave timer for %d seconds for wave %d of confrontation %d.", BASE_TIME_PER_WAVE, waveNumber, confrontationID))


        for i = 1, count do
            local mobData = mobTable[math.random(#mobTable)]
            local pos = getRandomSpawnPointInQuad(spawnArea)

            local mob = zoneOrInstance:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = mobData.name,
                look = mobData.look,
                groupId = mobData.groupId,
                groupZoneId = mobData.groupZoneId,
                releaseIdOnDisappear = true, -- prevent zone from running out of DE IDs when event is run for long periods
                -- Removed x, y, z, rotation, and spawn = true from here. These will be set by mob:setSpawn() and mob:spawn().

                onMobSpawn = function(spawned_mob)
                    spawned_mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                    spawned_mob:setMobLevel(currentConfrontation.level)
                    -- Modified print statement to use 'pos' variables which are guaranteed to be valid
                    -- print(string.format("[SEA MONSTER EVENT] Mob %s (ID:%d, Look:%d) spawned at (%.2f, %.2f, %.2f). Level: %d.",
                        -- spawned_mob:getName(), spawned_mob:getID(), spawned_mob:getModelId(),
                        -- pos.x, pos.y, pos.z, currentConfrontation.level))

                    local isBoss = (waveNumber == currentConfrontation.waveCount and currentConfrontation.waveCount > 1)
                    applyMobStats(spawned_mob, isBoss, currentConfrontation.difficultyMultiplier)

                    -- Apply CONFRONTATION effect with generic power 1 for mobs
                    spawned_mob:addStatusEffect(xi.effect.CONFRONTATION, 1, 0, confrontationDuration)
                    -- print(string.format("[SEA MONSTER EVENT] Applied CONFRONTATION effect (power 1) to mob %s (ID:%d).", spawned_mob:getName(), spawned_mob:getID()))

                    spawned_mob:addStatusEffect(xi.effect.ENWATER_II, 100, 0, 0)
                    spawned_mob:addStatusEffect(xi.effect.REGEN, 100, 3, 0)
					spawned_mob:setMod(xi.mod.MOVE_SPEED_OVERRIDE, 20) -- Makes mob move very slow
                    -- print(string.format("[SEA MONSTER EVENT] Applied ENWATER_II and REGEN to mob %s (ID:%d).", spawned_mob:getName(), spawned_mob:getID()))

					--Sets the mob HP to 100% after the added HP
                    spawned_mob:timer(10, function(m) m:setHP(m:getMaxHP()) end)
                end,

                onMobDeath = function(mob_on_death, killer)
                    -- print(string.format("[SEA MONSTER EVENT] Mob %s (ID:%d) died. Killer: %s (ID:%d).",
                        -- mob_on_death:getName(), mob_on_death:getID(), killer and killer:getName() or "UNKNOWN", killer and killer:getID() or 0))

                    -- Remove mob ID from the current confrontation's mob list
                    local initialMobCount = #currentConfrontation.mobIds
                    for i, id in ipairs(currentConfrontation.mobIds) do
                        if id == mob_on_death:getID() then
                            table.remove(currentConfrontation.mobIds, i)
                            -- print(string.format("[SEA MONSTER EVENT] Removed mob ID %d from confrontation %d's active list.", id, confrontationID))
                            break
                        end
                    end
                    local finalMobCount = #currentConfrontation.mobIds
                    -- if initialMobCount == finalMobCount then
                        -- print(string.format("[SEA MONSTER EVENT] Warning: Died mob %s (ID:%d) was not found in active mob list for confrontation %d.", mob_on_death:getName(), mob_on_death:getID(), confrontationID))
                    -- end


                    -- Only update CharVar for player characters
                    if killer and killer:isPC() and killer.getCharVar then
                        local current = killer:getCharVar("SeaMonsterKills")
                        killer:setCharVar("SeaMonsterKills", current + currentConfrontation.difficultyMultiplier)
                        -- print(string.format("[SEA MONSTER EVENT] Player %s gained %d points. Total points: %d.",
                            -- killer:getName(), currentConfrontation.difficultyMultiplier, killer:getCharVar("SeaMonsterKills")))
                    end

                    -- If all mobs for this confrontation are defeated
                    if #currentConfrontation.mobIds == 0 then
                        -- print(string.format("[SEA MONSTER EVENT] All mobs in wave %d of confrontation %d defeated.", currentConfrontation.currentWave, confrontationID))
                        -- Wave cleared, cancel the wave timer
                        if currentConfrontation.waveDespawnTimerId then
                            currentConfrontation.npc:cancelTimer(currentConfrontation.waveDespawnTimerId)
                            currentConfrontation.waveDespawnTimerId = nil -- Clear the reference
                            -- print(string.format("[SEA MONSTER EVENT] Cancelled wave timer for confrontation %d after wave clear.", confrontationID))
                        end

                        if currentConfrontation.currentWave < currentConfrontation.waveCount then
                            currentConfrontation.currentWave = currentConfrontation.currentWave + 1
                            spawnWave(currentConfrontation.currentWave)
                        else
                            -- All waves completed, apply bonus if applicable
                            if currentConfrontation.waveCount > 1 then
                                -- print(string.format("[SEA MONSTER EVENT] All waves completed for confrontation %d. Applying bonus points.", confrontationID))
                                for _, pID in ipairs(currentConfrontation.registeredPlayerIds) do
                                    local p = GetPlayerByID(pID)
                                    -- Only apply bonus to player characters
                                    if p and p:isPC() then
                                        local pts = p:getCharVar("SeaMonsterKills")
                                        p:setCharVar("SeaMonsterKills", pts + currentConfrontation.waveWinBonus)
                                        -- Removed the direct print to player here to avoid duplicate messages.
                                        -- The message is now handled by onConfrontationWin.
                                        -- print(string.format("[SEA MONSTER EVENT] Player %s received %d bonus points for completing all waves. Total points: %d.",
                                            -- p:getName(), currentConfrontation.waveWinBonus, p:getCharVar("SeaMonsterKills")))
                                    end
                                end
                            end
                            -- Immediately check to end confrontation as all mobs are gone
                            xi.confrontation.check(confrontationID)
                        end
                    else
                        -- print(string.format("[SEA MONSTER EVENT] %d mobs remaining in wave %d of confrontation %d.", #currentConfrontation.mobIds, currentConfrontation.currentWave, confrontationID))
                        -- Mobs still remain in the current wave/confrontation, just re-check for time/player status
                        xi.confrontation.check(confrontationID)
                    end
                end,
            })

            table.insert(currentConfrontation.mobIds, mob:getID()) -- Add mob ID to lookup table
            mob:setSpawn(pos.x, pos.y, pos.z, pos.rot) -- Re-added explicit spawn position setting
            mob:setDropID(0)
            mob:setMobMod(xi.mobMod.NO_DROPS, 1)
            mob:spawn() -- Re-added explicit mob spawning call
            -- print(string.format("[SEA MONSTER EVENT] Added mob %s (ID:%d) to confrontation %d's mob list. Current list size: %d.", mob:getName(), mob:getID(), confrontationID, #currentConfrontation.mobIds))
        end
        -- After all mobs are spawned for the current wave, initiate sequential claiming
        startSequentialClaiming(confrontationID, player, INITIAL_CLAIM_DELAY_SECONDS, DELAY_BETWEEN_CLAIMS_SECONDS)
    end

    spawnWave(currentConfrontation.currentWave)
    xi.confrontation.check(confrontationID) -- Start the central check timer
    -- print(string.format("[SEA MONSTER EVENT] Initial wave spawned and central check timer started for confrontation %d.", confrontationID))
end

-- Menu Setup
menu = { title = 'Thar be monsters!', options = SMmainMenuPage }


-- Start of Page Setup
-- Page 1: Main Menu (Spend Points, Battle Selector)
SMmainMenuPage = {
    { 'Spend My Points', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Spend My Points'.", player:getName()))
        menu.options = SMRewardsPage1 -- Leads to the new page 4 (Rewards 1)
        delaySendMenu(player)
    end },
    { 'Battle Selector', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Battle Selector'.", player:getName()))
        menu.options = SMbattleSelectorPage1 -- Leads to the new page 2 (First Wave Battles)
        delaySendMenu(player)
    end },
    { 'Leave', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Leave' from main menu.", player:getName()))
    end },
}

-- Page 2: First set of wave battles
--local function spawnSeaMonsters(player, spawnCount, waveCount, waveWinBonus, level, difficultyMultiplier, npcRef, jpCost)
SMbattleSelectorPage1 = {
    { 'Hurricane (3 waves)', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Hurricane (3 waves)'.", player:getName()))
        local zoneID = player:getZoneID()
        if isConfrontationActiveInZone(zoneID) then
            player:printToPlayer(messages.ConfrontationActive, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Denied start: Confrontation already active in zone %d for player %s.", zoneID, player:getName()))
            return
        end
        spawnSeaMonsters(player, 5, 3, 3, 125, 3, GetNPCByID(player:getCharVar("CurrentNPCID")), 12)
    end },
    { 'Typhoon (5 waves)', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Typhoon (5 waves)'.", player:getName()))
        local zoneID = player:getZoneID()
        if isConfrontationActiveInZone(zoneID) then
            player:printToPlayer(messages.ConfrontationActive, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Denied start: Confrontation already active in zone %d for player %s.", zoneID, player:getName()))
            return
        end
        spawnSeaMonsters(player, 5, 5, 5, 125, 3, GetNPCByID(player:getCharVar("CurrentNPCID")), 19)
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from battle selector.", player:getName()))
        menu.options = SMbattleSelectorPage2 -- Leads to the new page 3 (Next Wave Battles)
        delaySendMenu(player)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from battle selector.", player:getName()))
        menu.options = SMmainMenuPage -- Leads back to the main menu
        delaySendMenu(player)
    end },
    { 'Leave', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Leave' from battle selector.", player:getName()))
    end },
}

-- Page 3: Next set of wave battles
--local function spawnSeaMonsters(player, spawnCount, waveCount, waveWinBonus, level, difficultyMultiplier, npcRef, jpCost)
SMbattleSelectorPage2 = {
    { 'Abyssal Vortex (7 waves)', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Abyssal Vortex (7 waves)'.", player:getName()))
        local zoneID = player:getZoneID()
        if isConfrontationActiveInZone(zoneID) then
            player:printToPlayer(messages.ConfrontationActive, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Denied start: Confrontation already active in zone %d for player %s.", zoneID, player:getName()))
            return
        end
        spawnSeaMonsters(player, 5, 7, 8, 125, 3, GetNPCByID(player:getCharVar("CurrentNPCID")), 24)
    end },
    { 'Coral Cataclysm (10 waves)', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Coral Cataclysm (10 waves)'.", player:getName()))
        local zoneID = player:getZoneID()
        if isConfrontationActiveInZone(zoneID) then
            player:printToPlayer(messages.ConfrontationActive, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Denied start: Confrontation already active in zone %d for player %s.", zoneID, player:getName()))
            return
        end
        spawnSeaMonsters(player, 5, 10, 12, 125, 3, GetNPCByID(player:getCharVar("CurrentNPCID")), 32)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from page 3 (battle selector).", player:getName()))
        menu.options = SMbattleSelectorPage1 -- Leads back to the first set of wave battles
        delaySendMenu(player)
    end },
    { 'Leave', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Leave' from page 3 (battle selector).", player:getName()))
    end },
}

-- Page 4: Rewards (Page 1)
SMRewardsPage1 = {
    { rewardOptions[1].name .. " (" .. rewardOptions[1].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[1].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[1].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[1].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[1].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[1].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[1].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[1].name, pts, rewardOptions[1].cost))
        end
    end },
    { rewardOptions[2].name .. " (" .. rewardOptions[2].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[2].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[2].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[2].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[2].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[2].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[2].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[2].name, pts, rewardOptions[2].cost))
        end
    end },
    { rewardOptions[3].name .. " (" .. rewardOptions[3].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[3].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[3].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[3].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[3].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[3].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[3].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[3].name, pts, rewardOptions[3].cost))
        end
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from rewards.", player:getName()))
        menu.options = SMRewardsPage2 -- Leads to the new page 5 (Rewards 2)
        delaySendMenu(player)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from rewards (page 1).", player:getName()))
        menu.options = SMmainMenuPage -- Leads back to the main menu
        delaySendMenu(player)
    end },
}

-- Page 5: Rewards (Page 2)
SMRewardsPage2 = {
    { rewardOptions[4].name .. " (" .. rewardOptions[4].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[4].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[4].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[4].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[4].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[4].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[4].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[4].name, pts, rewardOptions[4].cost))
        end
    end },
    { rewardOptions[5].name .. " (" .. rewardOptions[5].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[5].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[5].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[5].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[5].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[5].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[5].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[5].name, pts, rewardOptions[5].cost))
        end
    end },
    { rewardOptions[6].name .. " (" .. rewardOptions[6].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[6].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[6].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[6].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[6].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[6].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[6].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[6].name, pts, rewardOptions[6].cost))
        end
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from rewards (page 2).", player:getName()))
        menu.options = SMRewardsPage3 -- Leads to the new page 6 (Rewards 3)
        delaySendMenu(player)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from rewards (page 2).", player:getName()))
        menu.options = SMRewardsPage1 -- Leads back to Rewards 1
        delaySendMenu(player)
    end },
}

-- Page 6: Rewards (Page 3)
SMRewardsPage3 = {
    { rewardOptions[7].name .. " (" .. rewardOptions[7].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[7].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[7].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[7].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[7].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[7].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[7].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[7].name, pts, rewardOptions[7].cost))
        end
    end },
    { rewardOptions[8].name .. " (" .. rewardOptions[8].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[8].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[8].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[8].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[8].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[8].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[8].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[8].name, pts, rewardOptions[8].cost))
        end
    end },
    { rewardOptions[9].name .. " (" .. rewardOptions[9].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[9].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[9].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[9].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[9].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[9].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[9].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[9].name, pts, rewardOptions[9].cost))
        end
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from rewards (page 3).", player:getName()))
        menu.options = SMRewardsPage4 -- Leads to the new page 7 (Rewards 4)
        delaySendMenu(player)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from rewards (page 3).", player:getName()))
        menu.options = SMRewardsPage2 -- Leads back to Rewards 2
        delaySendMenu(player)
    end },
}

-- Page 7: Rewards (Page 4)
SMRewardsPage4 = {
    { rewardOptions[10].name .. " (" .. rewardOptions[10].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[10].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[10].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[10].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[10].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[10].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[10].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[10].name, pts, rewardOptions[10].cost))
        end
    end },
    { rewardOptions[11].name .. " (" .. rewardOptions[11].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[11].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[11].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[11].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[11].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[11].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[11].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[11].name, pts, rewardOptions[11].cost))
        end
    end },
	{ rewardOptions[12].name .. " (" .. rewardOptions[12].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[12].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[12].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[12].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[12].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[12].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[12].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[12].name, pts, rewardOptions[12].cost))
        end
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from rewards (page 4).", player:getName()))
        menu.options = SMRewardsPage5 -- Leads to the new page 8 (Rewards 5)
        delaySendMenu(player)
    end },
    { 'Back', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back' from rewards (page 4).", player:getName()))
        menu.options = SMRewardsPage3 -- Leads back to Rewards 3
        delaySendMenu(player)
    end },
    { 'Main Menu', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Main Menu' from rewards (page 4).", player:getName()))
        menu.options = SMmainMenuPage -- Leads back to the main menu
        delaySendMenu(player)
    end },
}

-- Page 8: Rewards (Page 5)
SMRewardsPage5 = {
    { rewardOptions[13].name .. " (" .. rewardOptions[13].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[13].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[13].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[13].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[13].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[13].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[13].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[13].name, pts, rewardOptions[13].cost))
        end
    end },
    { rewardOptions[14].name .. " (" .. rewardOptions[14].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[14].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[14].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[14].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[14].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[14].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[14].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[14].name, pts, rewardOptions[14].cost))
        end
    end },
	{ rewardOptions[15].name .. " (" .. rewardOptions[15].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[15].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[15].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[15].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[15].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[15].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[15].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[15].name, pts, rewardOptions[15].cost))
        end
    end },
    { 'Next Page', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Next Page' from rewards (page 5).", player:getName()))
        menu.options = SMRewardsPage6 -- Leads to the new page 9 (Rewards 6)
        delaySendMenu(player)
    end },
    { 'Back to Start', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back to Start' from rewards (page 5).", player:getName()))
        menu.options = SMRewardsPage1 -- Leads back to Rewards 1
        delaySendMenu(player)
    end },
    { 'Main Menu', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Main Menu' from rewards (page 5).", player:getName()))
        menu.options = SMmainMenuPage -- Leads back to the main menu
        delaySendMenu(player)
    end },
}

-- Page 9: Rewards (Page 6)
SMRewardsPage6 = {
    { rewardOptions[16].name .. " (" .. rewardOptions[16].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[16].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[16].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[16].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[16].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[16].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[16].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[16].name, pts, rewardOptions[16].cost))
        end
    end },
    { rewardOptions[17].name .. " (" .. rewardOptions[17].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[17].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[17].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[17].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[17].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[17].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[17].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[17].name, pts, rewardOptions[17].cost))
        end
    end },
	{ rewardOptions[18].name .. " (" .. rewardOptions[18].cost .. ")", function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s attempting to purchase %s.", player:getName(), rewardOptions[18].name))
        local pts = player:getCharVar("SeaMonsterKills")
        if pts >= rewardOptions[18].cost then
            if player:getFreeSlotsCount() > 0 then -- Check for free inventory slots
                if npcUtil.giveItem(player, rewardOptions[18].item) then
                    player:setCharVar("SeaMonsterKills", pts - rewardOptions[18].cost)
                    -- print(string.format("[SEA MONSTER EVENT] Player %s purchased %s. Points remaining: %d.", player:getName(), rewardOptions[18].name, player:getCharVar("SeaMonsterKills")))
                end
            else
                player:printToPlayer(messages.InventoryFull, xi.msg.channel.SYSTEM_3)
                -- print(string.format("[SEA MONSTER EVENT] Player %s inventory full for %s.", player:getName(), rewardOptions[18].name))
            end
        else
            player:printToPlayer(messages.NotEnoughPoints, xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s not enough points for %s. Has %d, Needs %d.", player:getName(), rewardOptions[18].name, pts, rewardOptions[18].cost))
        end
    end },
    { 'Back to Start', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Back to Start' from rewards (page 6).", player:getName()))
        menu.options = SMRewardsPage1 -- Leads back to Rewards 1
        delaySendMenu(player)
    end },
    { 'Main Menu', function(player)
        -- print(string.format("[SEA MONSTER EVENT] Player %s selected 'Main Menu' from rewards (page 6).", player:getName()))
        menu.options = SMmainMenuPage -- Leads back to the main menu
        delaySendMenu(player)
    end },
}


-- Start NPC Setup
		local m = Module:new("Beachbesieged")
        -- print("[SEA MONSTER EVENT] Module 'Seamonsterattack' initialized.")

		-- Shared onTrigger logic with zone-specific lockout check
		local function survivorTrigger(player, npc)
            -- print(string.format("[SEA MONSTER EVENT] Survivor NPC (ID:%d) triggered by player %s (ID:%d).", npc:getID(), player:getName(), player:getID()))
			local zoneID = player:getZoneID()

            -- Store the NPC's ID in a CharVar so spawnSeaMonsters can retrieve it.
            player:setCharVar("CurrentNPCID", npc:getID())
            -- print(string.format("[SEA MONSTER EVENT] Stored CurrentNPCID %d for player %s.", npc:getID(), player:getName()))

            -- Use the new helper function for lockout check
            if isConfrontationActiveInZone(zoneID) then
                player:printToPlayer(messages.ConfrontationActive, 0, npc:getPacketName())
                -- print(string.format("[SEA MONSTER EVENT] Confrontation active in zone %d. Denying new interaction for player %s.", zoneID, player:getName()))
                return
            end

			player:printToPlayer(messages.NpcHelpMe, 0, npc:getPacketName())
			player:printToPlayer(string.format(messages.NpcPointsInfo, player:getCharVar("SeaMonsterKills")), xi.msg.channel.SYSTEM_3)
            -- print(string.format("[SEA MONSTER EVENT] Player %s has %d SeaMonsterKills points.", player:getName(), player:getCharVar("SeaMonsterKills")))
			menu.options = SMmainMenuPage
			delaySendMenu(player)
		end


		-- Zone 103 - Valkurm Dunes
		m:addOverride('xi.zones.Valkurm_Dunes.Zone.onInitialize', function(zone)
			super(zone)
			local npc = zone:insertDynamicEntity({
				objtype = xi.objType.NPC,
				name = 'Survivor',
				look = 2265,
				x = 240.47, y = 1.49, z = -148.72, rotation = 237,
				widescan = 1,
				onTrigger = survivorTrigger,
			})
			utils.unused(npc)
            -- Modified print statement to use hardcoded coordinates for initial spawn log
            -- print(string.format("[SEA MONSTER EVENT] Survivor NPC spawned in Valkurm Dunes (Zone 103) at (%.2f, %.2f, %.2f).", 240.47, 1.49, -148.72))
		end)

		-- Zone 44 - Sauromugue Champaign
		m:addOverride('xi.zones.Sauromugue_Champaign.Zone.onInitialize', function(zone)
			super(zone)
			local npc = zone:insertDynamicEntity({
				objtype = xi.objType.NPC,
				name = 'Survivor',
				look = 2265,
				x = 413.5, y = 38.8, z = 425.85, rotation = 88,
				widescan = 1,
				onTrigger = survivorTrigger,
			})
			utils.unused(npc)
            -- Modified print statement to use hardcoded coordinates for initial spawn log
            -- print(string.format("[SEA MONSTER EVENT] Survivor NPC spawned in Sauromugue Champaign (Zone 120) at (%.2f, %.2f, %.2f).", 413.5, 38.8, 425.85))
		end)

		-- Zone 44 - Abdhaljs_Isle-Purgonorgo
		m:addOverride('xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize', function(zone)
			super(zone)
			local npc = zone:insertDynamicEntity({
				objtype = xi.objType.NPC,
				name = 'Survivor',
				look = 2265,
				x = 627.3571, y = 0.0997, z = 24.1 , rotation = 207,
				widescan = 1,
				onTrigger = survivorTrigger,
			})
			utils.unused(npc)
            -- Modified print statement to use hardcoded coordinates for initial spawn log
            -- print(string.format("[SEA MONSTER EVENT] Survivor NPC spawned in Abdhaljs_Isle-Purgonorgo (Zone 44) at (%.2f, %.2f, %.2f).", 627.3571, 0.0997, 24.1))
		end)

		-- Zone 260 - Yahse Hunting Grounds
		m:addOverride('xi.zones.Yahse_Hunting_Grounds.Zone.onInitialize', function(zone)
			super(zone)
			local npc = zone:insertDynamicEntity({
				objtype = xi.objType.NPC,
				name = 'Survivor',
				look = 2265,
				x = 340.0, y = 4.1, z = -190.0, rotation = 64,
				widescan = 1,
				onTrigger = survivorTrigger,
			})
			utils.unused(npc)
            -- Modified print statement to use hardcoded coordinates for initial spawn log
            -- print(string.format("[SEA MONSTER EVENT] Survivor NPC spawned in Yahse Hunting Grounds (Zone 260) at (%.2f, %.2f, %.2f).", 340.0, 4.1, -190.0))
		end)


return m
