----------------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
----------------------------------------

local m = Module:new("ValEnmityNPC")
local itemz =
{
[1] = { trade = {{20682, 1}}, reward = 10, var = '[VEN]_Flyssa' }, -- Flyssa +1 - Shedu UNM - 20682
[2] = { trade = {{13566, 1}}, reward = 10, var = '[VEN]_DRing' }, -- Defending Ring - Behemoth or UNM Behemoth - 13566
[3] = { trade = {{25635, 1}}, reward = 7, var = '[VEN]_Loess' }, -- Loess Barbuta (NQ) - Hidhaegg UNM - 25635
[4] = { trade = {{26989, 1}}, reward = 7, var = '[VEN]_Caballarius' }, -- Caballarius Gauntlets +1 -- 26989
[5] = { trade = {{14915, 1}}, reward = 6, var = '[VEN]_ValorHands' }, -- Valor Gauntlets +1 - 14915
[6] = { trade = {{27611, 1}}, reward = 5, var = '[VEN]_Philidor' }, -- Philidor Mantle - Escha Ru'Aun T1 - 27611
[7] = { trade = {{15965, 1}}, reward = 5, var = '[VEN]_EtherE' }, -- Ethereal Earring - Login Campaign 1000pts - 15965
}

m:addOverride('xi.zones.Throne_Room_[S].Zone.onInitialize', function(zone)
    super(zone)

    local Valaineral = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Valaineral',
        look = 3014,
        x = 0,
        y = 0.0000,
        z = 0,
        rotation = 21,
        widescan = 1,

        onTrade = function(player, npc, trade)
            local item = trade:getItem(0)
            local retItem = item:getName(tostring())
            local hatevalue = player:getCharVar('ValHate')

            if hatevalue == 50 then
                player:printToPlayer('There is nothing more I can offer, my abilities have been perfected....', 0, npc:getPacketName())
            else
                local tradedCombo = 0
                for k, v in pairs(itemz) do
                    if npcUtil.tradeHasExactly(trade, v.trade) then
                        tradedCombo = k
                        if player:getCharVar(v.var) == 1 then
                            player:printToPlayer('You have already traded me this item, come back when you have something', 0, npc:getPacketName())
                            player:printToPlayer('new to offer me....', 0, npc:getPacketName())
                        else
                            player:confirmTrade()
                            player:setCharVar('ValHate', hatevalue + v.reward)
                            player:setCharVar(v.var, 1)
                            player:printToPlayer(string.format('Thank you for the %s, my current Enmity is now %s', retItem, hatevalue + v.reward), 0, npc:getPacketName())
                        end
                        break
                    end
                end
                if tradedCombo == 0 then
                    player:printToPlayer('Don’t try to fool me, this isn’t what I asked for....', 0, npc:getPacketName())
                end
            end
        end,

        onTrigger = function(player, npc)
            local Flyssa = player:getCharVar('[VEN]_Flyssa') == 0 and 'Flyssa +1,' or ''
            local DRing = player:getCharVar('[VEN]_DRing') == 0 and 'Defending Ring,' or ''
            local Loess = player:getCharVar('[VEN]_Loess') == 0 and 'Loess Barbuta,' or ''
            local Caballarius = player:getCharVar('[VEN]_Caballarius') == 0 and 'Caballarius Gauntlets +1,' or ''
            local ValorHands = player:getCharVar('[VEN]_ValorHands') == 0 and 'Valor Gauntlets +1,' or ''
            local Philidor = player:getCharVar('[VEN]_Philidor') == 0 and 'Philidor Mantle,' or ''
            local EtherE  = player:getCharVar('[VEN]_EtherE') == 0 and 'Ethereal Earring,' or ''

            local hatevalue = player:getCharVar('ValHate')

            if hatevalue <= 0 then
                player:printToPlayer('I dream of one day becoming a great Paladin! To do that I need better armor.', 0, npc:getPacketName())
                player:printToPlayer('Give me some new armor and I will wear it proudly on the battlefield with you!', 0, npc:getPacketName())
                player:printToPlayer('I will accept the following pieces to enhance my tanky ways:', 0, npc:getPacketName())
                player:printToPlayer('Flyssa +1, Defending Ring, Loess Barbuta,', 0, npc:getPacketName())
                player:printToPlayer('Caballarius Gauntlets +1, Valor Gauntlets +1, Philidor Mantle, and a Ethereal Earring', 0, npc:getPacketName())
            elseif hatevalue <= 49 then
                player:printToPlayer(string.format('I am on my way to becoming a turtle. My current Enmity is %s.', hatevalue), 0, npc:getPacketName())
                player:printToPlayer('You can trade me the following items:', 0, npc:getPacketName())
                player:printToPlayer(string.format('%s %s %s %s %s %s %s', Flyssa, DRing, Loess, Caballarius, ValorHands, Philidor, EtherE), 0, npc:getPacketName())
            elseif hatevalue == 50 then
                player:printToPlayer(string.format('You have made me a better Paladin. My current enmity is %s.', hatevalue), 0, npc:getPacketName())
                player:printToPlayer('I do not believe I can exceed my current limits.', 0, npc:getPacketName())
                player:setCharVar('[VEN]_Flyssa', 0)
                player:setCharVar('[VEN]_DRing', 0)
                player:setCharVar('[VEN]_Loess', 0)
                player:setCharVar('[VEN]_Caballarius', 0)
                player:setCharVar('[VEN]_Philidor', 0)
                player:setCharVar('[VEN]_EtherE', 0)
            end
        end,
    })

    utils.unused(Valaineral)
end)

return m