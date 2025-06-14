-----------------------------------
-- Area: Rabao
--  NPC: Kedhareshvar
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
   -- player:startEvent(51)
  player:printToPlayer('Would you like to buy some Rusted Coins!', 0, 'Kedhareshvar')
    local delaySendMenu = function(player)
        player:timer(50, function(playerArg)
            playerArg:customMenu(menu)
        end)
    end
        local function getCost(player)
            local cost = 300000
            local nmhuntKC = {'[NMHunt]TOneKills', '[NMHunt]TTwoKills', '[NMHunt]TThreeKills','[NMHunt]TFourKills', '[NMHunt]TFiveKills', '[NMHunt]TSixKills'}
                if player:getCharVar('[VWNM]TKills') == 66 then
                   cost = cost - 10000
                end
            local totalCount = 0
                for i = 1, #nmhuntKC do
                    if player:getCharVar(nmhuntKC[i]) then
                       totalCount = totalCount + player:getCharVar(nmhuntKC[i])
                    end
                end
            local nmHuntCost = math.floor(totalCount / 50) * 50000
                   cost = cost - nmHuntCost + 50000
            return cost
        end
                local menu  = {}
                local rustycoins = {}
                local amount = getCost(player)
                menu =
                {
                    title = 'What would you like?',
                    options = {},
                }
                rustycoins =
                    {
                            4049,     amount,   -- rusty coins
                    }
                menu.options = xi.shop.general(player, rustycoins)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
