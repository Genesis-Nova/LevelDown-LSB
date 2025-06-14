-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Pyo_Zeni")

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)
    local Pyo = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Pyo',
        look = '01000605a9102c2068308140a950006000700000',
        x = -128.6847,
        y = 2.0000,
        z = 22.9286,
        rotation = 68,
        widescan = 1,

     onTrade = function(player, npc, trade)
        local count = trade:getItemCount()
        local impcurrency =
        {
        [ 1] = {trade = {{2184, count}}, zeniValue = 2}, -- Imperial Bronze Piece
        [ 2] = {trade = {{2185, count}}, zeniValue = 10}, -- Imperial Silver Piece
        [ 3] = {trade = {{2186, count}}, zeniValue = 20}, -- Imperial Mythril Piece
        [ 4] = {trade = {{2187, count}}, zeniValue = 100}, -- Imperial Gold Piece
        }
        local tradeditem  = 0
        local zeniValues  = 0
        local exchangefor = 0
            if tradeditem == 0 then 
              for k, v in pairs(impcurrency) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                   tradeditem = v.trade
                   zeniValues = v.zeniValue
                   exchangefor = math.floor(zeniValues * count)
                end
              end
            end

            if not npcUtil.tradeHasExactly(trade, tradeditem) then 
              player:printToPlayer('We do not accept those items for trade, try again', 0, 'Pyo')
            else
              player:tradeComplete()
              player:addCurrency('zeni_point', exchangefor)
              player:printToPlayer(string.format('You have been awarded %s Zeni.',exchangefor), 0, 'Pyo')
              player:printToPlayer(string.format('Your current Zeni balance is %s.',player:getCurrency('zeni_point')), 0, 'Pyo')
            end
     end,

        onTrigger = function(player, npc)
           player:printToPlayer('I am here to help you obtain more Zeni.', 0, 'Pyo')
           player:printToPlayer('If you would like more Zeni all you have to do is trade me some Imperial Currency!', 0, 'Pyo')
           player:printToPlayer('2 Zeni point will be awareded for every Imperial Bronze piece you trade me.', 0, 'Pyo')
           player:printToPlayer('10 Zeni points will be awareded for every Imperial Silver piece you trade me.', 0, 'Pyo')
           player:printToPlayer('20 Zeni points will be awareded for every Imperial Mythril piece you trade me.', 0, 'Pyo')
           player:printToPlayer('100 Zeni points will be awareded for every Imperial Gold piece you trade me.', 0, 'Pyo')
           player:printToPlayer(string.format('Your current Zeni balance is %s.',player:getCurrency('zeni_point')), 0, 'Pyo')
        end,
    })
    utils.unused(Pyo)
end)
return m