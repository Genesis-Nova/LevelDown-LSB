require("modules/module_utils")
require("scripts/globals/npc_util")

local m = Module:new("trick_or_treat_adventure")

-- Define quest ID and variables
local QUEST_ID = 1234
local QUEST_ACTIVE_VAR = 'TrickOrTreatQuestActive'

-- Function to handle trading of candy
local function onTrade(player, npc, trade)
    local kidCandyMapping = {
        ['CandyGivenToKid_230DE_Kid 1'] = 6187,  -- ID for Kid 1 in Bastok
        ['CandyGivenToKid_230DE_Kid 2'] = 6188,  -- ID for Kid 2 in Bastok
        ['CandyGivenToKid_230DE_Kid 3'] = 6189,  -- ID for Kid 3 in Bastok
        ['CandyGivenToKid_235DE_Kid 1'] = 6187,  -- ID for Kid 1 in San d'Oria
        ['CandyGivenToKid_235DE_Kid 2'] = 6188,  -- ID for Kid 2 in San d'Oria
        ['CandyGivenToKid_235DE_Kid 3'] = 6189,  -- ID for Kid 3 in San d'Oria
        ['CandyGivenToKid_241DE_Kid 1'] = 6187,  -- ID for Kid 1 in Windurst
        ['CandyGivenToKid_241DE_Kid 2'] = 6188,  -- ID for Kid 2 in Windurst
        ['CandyGivenToKid_241DE_Kid 3'] = 6189   -- ID for Kid 3 in Windurst
    }

    local candyTraded = false
    local kidId = 'CandyGivenToKid_' .. npc:getZoneID() .. npc:getName()  -- Construct the full ID for the kid

    -- Check if the quest has started
    local questStatus = player:getCharVar(QUEST_ACTIVE_VAR)
    if questStatus == 0 then
        player:printToPlayer("I don't take candy from strangers.", 0, npc:getPacketName())
        return
    elseif questStatus == 2 then
        player:printToPlayer("You've already completed this quest and can't give out candy anymore.", xi.msg.channel.SYSTEM_3) 
        return
    end

    -- Check if the player has already traded candy to this kid
    local candyGiven = player:getCharVar(kidId)
    if candyGiven > 0 then
        player:printToPlayer("You have already given candy to this Trick or Treater.", xi.msg.channel.SYSTEM_3)
        return
    end

    local candyId = kidCandyMapping[kidId]  -- Get the corresponding candy ID for this kid
    if candyId and trade:hasItemQty(candyId, 1) then
        candyTraded = true
        -- Remove the candy from the player's inventory
        player:tradeComplete()
    else
        player:printToPlayer("What is that? That's not the kind of candy i want...", 0, npc:getPacketName())
        return
    end

    if candyTraded then
        player:setCharVar(kidId, 1)  -- Mark this kid as having received candy
        
        -- Check if all kids have received candy
        local kidsTable = {}
        local halloweenZones = {230, 235, 241}
        for _, zoneId in ipairs(halloweenZones) do
            local zone = GetZone(zoneId)
            local filteredEntities = zone:queryEntitiesByName('DE_Kid.*')
            for _, name in pairs(filteredEntities) do 
                table.insert(kidsTable, 'CandyGivenToKid_' .. zoneId .. name:getName())
            end
        end

        local candyGivenCount = {}
        for _, kidGivenCandy in pairs(kidsTable) do
            if player:getCharVar(kidGivenCandy) > 0 then
                table.insert(candyGivenCount, 1)
            end
        end

        local totalCandyGiven = #candyGivenCount

        if totalCandyGiven < 9 then
            player:printToPlayer("Trick or Treat? Thank you!", 0, npc:getPacketName())
        else
            player:printToPlayer("Trick or Treat? Thank you!", 0, npc:getPacketName())
            player:printToPlayer("All Kids have been given candy, Go see the Halloween Moogle", xi.msg.channel.SYSTEM_3)
            player:setCharVar('AllKidsGivenCandy', 1)  -- Mark that all kids have been given candy
        end
    end
end

-- Function to print messages with a delay
local function printWithDelay(player, messages, delay, npc, callback)
    local index = 1
    
    local function printNext()
        if index <= #messages then
            player:printToPlayer(messages[index], 0, npc:getPacketName())
            index = index + 1
            player:timer(delay, printNext)  -- Schedule the next message
        else
            if callback then
                callback()  -- Call the callback function if provided
            end
        end
    end
    
    printNext()  -- Start the printing sequence
end

-- NPC interaction logic for the quest
local function onNPCInteraction(player, npc)
    local kidCandy = {
        'CandyGivenToKid_230DE_Kid 1',
        'CandyGivenToKid_230DE_Kid 2',
        'CandyGivenToKid_230DE_Kid 3',
        'CandyGivenToKid_235DE_Kid 1',
        'CandyGivenToKid_235DE_Kid 2',
        'CandyGivenToKid_235DE_Kid 3',
        'CandyGivenToKid_241DE_Kid 1',
        'CandyGivenToKid_241DE_Kid 2',
        'CandyGivenToKid_241DE_Kid 3'
    }
    
    local totalCount = 0
    for _, candyVar in ipairs(kidCandy) do
        if player:getCharVar(candyVar) > 0 then
            totalCount = totalCount + 1
        end
    end

    if player:getCharVar(QUEST_ACTIVE_VAR) == 1 and totalCount < 9 then
        player:printToPlayer("Found all the Kid's yet? kupo.", 0, npc:getPacketName())
    
    elseif player:getCharVar(QUEST_ACTIVE_VAR) == 1 and totalCount == 9 then
        local messages = {
            "You have given all the Trick or Treaters candy? kupo.",
            "That's wonderful! For showing some Halloween spirit here is a reward. kuupoo.",
            "Happy Halloween! kupo."
        }
        
        -- Print messages with a delay and reward callback
        printWithDelay(player, messages, 2000, npc, function()
            local rewardItem = 10065 -- Spectral Chair Mount ID
            if npcUtil.giveItem(player, rewardItem) then
                player:printToPlayer("You have received the Spectral Chair Mount!", xi.msg.channel.SYSTEM_3)
                player:setCharVar(QUEST_ACTIVE_VAR, 2)  -- Mark the quest as completed
                
                -- Remove AllKidsGivenCandy char_var
                player:setCharVar('AllKidsGivenCandy', 0)  -- Reset it to 0
                
                -- Reset all candy-given flags to 0 after the quest is completed
                for _, candyVar in ipairs(kidCandy) do
                    player:setCharVar(candyVar, 0)
                end
            else
                player:printToPlayer("You don't have enough space for the reward! kupo.", 0, npc:getPacketName())
				player:printToPlayer("Make sure you have room and talk to me again. kupo.", 0, npc:getPacketName())
            end
        end)  -- End of callback function

    elseif player:getCharVar(QUEST_ACTIVE_VAR) == 2 then
        -- Reset all candy-given flags when the quest is completed
        for _, candyVar in ipairs(kidCandy) do
            player:setCharVar(candyVar, 0)
        end
        player:printToPlayer("You have already completed the Trick or Treat Adventure this year! kupo.", 0, npc:getPacketName())
    
    else
        player:setCharVar(QUEST_ACTIVE_VAR, 1)

        -- Reset candy given variables
        for _, candyVar in ipairs(kidCandy) do
            player:setCharVar(candyVar, 0)
        end

        -- Prepare messages for the player
        local messages = {
            "Happy Halloween! Would you like to help hand out candy? kupo.",
            "There are 3 Kids Trick or Treating in each town that could use some Halloween cheer. kupo.",
            "A warning... the kids are a bit picky about the type of candy... Good luck kupo."
        }

        printWithDelay(player, messages, 1000, npc)
    end
end

-- Function to insert NPCs into the zone
local function setupZone(zone, moogleData, kidsData)
    if not zone then
        error("Zone parameter is nil.")
    end

    -- Starter Moogle NPC
    for _, moogle in ipairs(moogleData) do
        zone:insertDynamicEntity({
            objtype = xi.objType.NPC,
            name = moogle.name,
            look = moogle.model,
            x = moogle.x,
            y = moogle.y,
            z = moogle.z,
			rotation = moogle.rot,
			widescan = 1,
            onTrigger = function(player, npc)
                local rotation = npc:getRotPos()
                npc:facePlayer(player, true)
                npc:timer(10000, function(npcArg)
                    npcArg:setRotation(rotation)
                end)

                -- Call the existing Moogle interaction logic here
                onNPCInteraction(player, npc)
            end,
        })
    end

    -- Kids NPCs
    for _, kid in ipairs(kidsData) do
        zone:insertDynamicEntity({
            objtype = xi.objType.NPC,
            name = kid.name,
            look = kid.model,
            x = kid.x,
            y = kid.y,
            z = kid.z,
			rotation = kid.rot,
			widescan = 1,
            onTrigger = function(player, npc)
                player:printToPlayer(kid.talkDialog, 0, npc:getPacketName())
                local rotation = npc:getRotPos()
                npc:facePlayer(player, true)
                npc:timer(5000, function(npcArg)
                    npcArg:setRotation(rotation)
                end)
            end,
            onTrade = function(player, npc, trade)
                local rotation = npc:getRotPos()
                npc:facePlayer(player, true)
                npc:timer(5000, function(npcArg)
                    npcArg:setRotation(rotation)
                end)

                onTrade(player, npc, trade)  -- Call the onTrade logic after rotation
            end
        })
    end
end

-- Define Halloween Moogle data
local moogleData = {
    {name = 'HalloweenMoogle', model = 2364, x = -257.3735, y = -12.0200, z = -71.1643, rot = 7, zone = 235},
    {name = 'HalloweenMoogle', model = 2364, x = -15.3884, y = 2.1000, z = -5.2602, rot = 24, zone = 230},
    {name = 'HalloweenMoogle', model = 2364, x = -13.0687, y = 2.7500, z = -70.6306, rot = 44, zone = 241}
}

-- Define Kids data for each zone
local bastokKids = {
    {name = 'Kid 1', model = 114, x = -216.2881, y = -2.4247, z = 60.3150, rot = 72, talkDialog = "Wow the scroll shop gave me a scroll of Meteor!"},
    {name = 'Kid 2', model = 118, x = -157.3198, y = -4.4199, z = -79.4690, rot = 218, talkDialog = "I got a rock......"},
    {name = 'Kid 3', model = 954, x = -330.3618, y = -10.3198, z = -159.4430, rot = 43, talkDialog = "I got a bunch of empty potion bottles last year from here....."}
}

local sanDorKids = {
    {name = 'Kid 1', model = 158, x = 98.8469, y = 1.0000, z = 103.6345, rot = 167, talkDialog = "They gave me a handful of beer nuts....."},
    {name = 'Kid 2', model = 155, x = 2.9505, y = -3.000, z = -28.5110, rot = 194, talkDialog = "Check out all the cool Halloween decorations!"},
    {name = 'Kid 3', model = 2701, x = -272.9033, y = -6.1990, z = 99.2855, rot = 122, talkDialog = "These rich people always have the best candy!"}
}

local windurstKids = {
    {name = 'Kid 1', model = 182, x = -45.4327, y = -1.2500, z = -118.2091, rot = 15, talkDialog = "Yay they gave me a ball of yarn!"},
    {name = 'Kid 2', model = 166, x = 25.6271, y = -4.2500, z = 89.2055, rot = 121, talkDialog = "I wonder if Dhalmel like candy?"},
    {name = 'Kid 3', model = 170, x = 124.1194, y = -6.2500, z = -132.2990, rot = 20, talkDialog = "This chocobo chocolate I found on the ground tastes funny...."}
}

-- Hook the initialization function for each zone
m:addOverride('xi.zones.Bastok_Markets.Zone.onInitialize', function(zone)
    super(zone)
    setupZone(zone, moogleData, bastokKids)
end)

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    super(zone)
    setupZone(zone, moogleData, sanDorKids)
end)

m:addOverride('xi.zones.Windurst_Woods.Zone.onInitialize', function(zone)
    super(zone)
    setupZone(zone, moogleData, windurstKids)
end)

return m
