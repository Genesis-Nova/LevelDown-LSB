----------------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
----------------------------------------

local m = Module:new("LionTHNPC")
local itemz =
{
[1] = { trade = {{20618, 1}}, reward = 3, var = '[LTH]_Sandung'}, -- Sandung obtained by ???
[2] = { trade = {{16480, 1}}, reward = 3, var = '[LTH]_ThiefsK'}, -- Thiefs Knife - obtained by AH or kill NM
[3] = { trade = {{25679, 1}}, reward = 2, var = '[LTH]_WhiteRara'}, -- White Rarab Cap +1 obtained with login points
[4] = { trade = {{14914, 1}}, reward = 2, var = '[LTH]_AssassArm'}, -- Assassins Armlet +1 obtained via upgrade
[5] = { trade = {{26987, 1}}, reward = 2, var = '[LTH]_PlunderArm'}, -- Plunderers Armlet +1 obtained via upgrade
[6] = { trade = {{27585, 1}}, reward = 1, var = '[LTH]_GorneyR'}, -- Gorney RIng obtained by content coompletion reward
[7] = { trade = {{28450, 1}}, reward = 1, var = '[LTH]_ChaacB'}, -- Chaac Belt obtained by killing NM
}


m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)

    local function thLevel(player)
      local thAdd = 0
        if player:getMainLvl() >= 90 then
           thAdd = thAdd +3
        elseif player:getMainLvl() >= 45 and player:getMainLvl() <= 89 then
           thAdd = thAdd +2
        elseif player:getMainLvl() >= 15 and player:getMainLvl() <= 44 then
           thAdd = thAdd +1
        end
      return thAdd
    end
    local Lion = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Lion II',
        look = '00003c0000000000000000000000000000000000',
        x = -26.8398,
        y = -0.0000,
        z = -16.0688,
        rotation = 21,
        widescan = 1,
        onTrade = function(player, npc, trade)
            local item = trade:getItem(0)
            local retItem = item:getName(tostring())
            local thvalue = player:getCharVar('LionTH')
            if player:getCharVar('LionTH') == 14 then
                   player:printToPlayer('There is nothing more i can offer, My treasure Hunter has been perfected....', 0, npc:getPacketName())
            elseif player:getCharVar('LionTH') ~= 14 then
                   local tradedCombo = 0
                   if tradedCombo == 0 then
                        for k, v in pairs(itemz) do
                            if npcUtil.tradeHasExactly(trade, v.trade) then
                               tradedCombo = k
                                if tradedCombo == k and player:getCharVar(v.var) == 1 then
                                   player:printToPlayer('You have already traded me this item, come back when you have something', 0, npc:getPacketName())
                                   player:printToPlayer('new to offer me....', 0, npc:getPacketName())
                                elseif tradedCombo == k and player:getCharVar(v.var) ~= 1 then
                                       player:confirmTrade()
                                       player:setCharVar('LionTH', thvalue + v.reward)
                                       player:setCharVar(v.var, 1)
                                       player:printToPlayer(string.format('Thank you for the %s, My current Treasure Hunter is now %s', retItem, thvalue + v.reward + thLevel(player)), 0, npc:getPacketName())
                                end break
                            end
                        end
                   end
            if tradedCombo == 0 then              
               player:printToPlayer('Dont try to fool me, this isnt what i asked for....', 0, npc:getPacketName())
            end     
        end
    end,

        onTrigger = function(player, npc)
        local Sandung = player:getCharVar('[LTH]_Sandung')
        local ThiefsK = player:getCharVar('[LTH]_ThiefsK')
        local WhiteRa = player:getCharVar('[LTH]_WhiteRara')
        local Assassi = player:getCharVar('[LTH]_AssassArm')
        local Plunder = player:getCharVar('[LTH]_PlunderArm')
        local GorneyR = player:getCharVar('[LTH]_GorneyR')
        local ChaacB  = player:getCharVar('[LTH]_ChaacB')

        if Sandung == 0 then
        Sandung = 'Sandung Dagger,'
        else
        Sandung = ''
        end
        if ThiefsK == 0 then
        ThiefsK = 'Thiefs Knife,'
        else
        ThiefsK = ''
        end
        if WhiteRa == 0 then
        WhiteRa = 'White Rarab Cap +1,'
        else
        WhiteRa = ''
        end
        if Assassi == 0 then
        Assassi = 'Assassins Armlet +1,'
        else
        Assassi = ''
        end
        if Plunder == 0 then
        Plunder = 'Plunderers Armlet +1,'
        else
        Plunder = ''
        end
        if GorneyR == 0 then
        GorneyR = 'Gorney Ring,'
        else
        GorneyR = ''
        end
        if ChaacB == 0 then
        ChaacB = 'Chaac Belt,'
        else
        ChaacB = ''
        end
             if player:getCharVar('LionTH') <= 0 then
                player:printToPlayer('I dream of one day becoming a great Thief! To do that i need better armor.', 0, npc:getPacketName())
                player:printToPlayer('Give me some new armor and i will wear it proudly on the battlefield with you!.', 0, npc:getPacketName())
                player:printToPlayer('I will accept the following pieces to enhance my shady ways! ', 0, npc:getPacketName())
                player:printToPlayer('Thiefs Knife, Sandung Dagger, White Rarab Cap +1, Assassins Armlet +1.', 0, npc:getPacketName())
                player:printToPlayer('Plunderers Armlet +1, Gorney Ring and a Chaac Belt.', 0, npc:getPacketName())
             elseif player:getCharVar('LionTH') >= 1  and player:getCharVar('LionTH') <= 13 then
                    player:printToPlayer(string.format('I am on my way to becoming a legend, My current Treasure Hunter is %s,', player:getCharVar('LionTH') + thLevel(player)), 0, npc:getPacketName())
                    player:printToPlayer(string.format('I still hunting for the following items;'), 0, npc:getPacketName())
                    player:printToPlayer(string.format('%s %s %s %s %s %s %s ',Sandung, ThiefsK, WhiteRa, Assassi, Plunder, GorneyR, ChaacB), 0, npc:getPacketName())
             elseif player:getCharVar('LionTH') == 14 then
                    player:printToPlayer(string.format('You have made me a better Thief, My current Treasure Hunter is %s,', player:getCharVar('LionTH') + thLevel(player)), 0, npc:getPacketName())
                    player:printToPlayer(string.format('I do not belive i can exceed my curent limits', player:getCharVar('LionTH')), 0, npc:getPacketName())
                    player:setCharVar('[LTH]_Sandung', 0)
                    player:setCharVar('[LTH]_ThiefsK', 0)
                    player:setCharVar('[LTH]_WhiteRara', 0)
                    player:setCharVar('[LTH]_AssassArm', 0)
                    player:setCharVar('[LTH]_PlunderArm', 0)
                    player:setCharVar('[LTH]_GorneyR', 0)
                    player:setCharVar('[LTH]_ChaacB', 0)
             end
        end,
    })
    utils.unused(Lion)
end)


return m