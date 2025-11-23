local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end

ensureTable('xi.zones.Leafallia.npcs.Meandering_Leafkin')

-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------
local m = Module:new("Meandering_Leafkin")

m:addOverride('xi.zones.Leafallia.npcs.Meandering_Leafkin.onTrade',function(player, npc, trade)
end)

m:addOverride('xi.zones.Leafallia.npcs.Meandering_Leafkin.onTrigger', function(player, npc)
    local order = player:getLocalVar('cabbageOrder')

    if
        order == 0 and
        npc:getID() == 17928208
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the first born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 1 and
        npc:getID() == 17928209
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the second born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 2 and
        npc:getID() == 17928210
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the third born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 3 and
        npc:getID() == 17928211
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the fourth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 4 and
        npc:getID() == 17928212
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the fifth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 5 and
        npc:getID() == 17928213
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the sixth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 6 and
        npc:getID() == 17928214
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the seventh born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 7 and
        npc:getID() == 17928215
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the eighth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 8 and
        npc:getID() == 17928216
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the ninth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 9 and
        npc:getID() == 17928217
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the tenth born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 10 and
        npc:getID() == 17928218
    then
        player:setLocalVar('cabbageOrder', order + 1)
        player:printToPlayer('I am the eleventh born talk to us in order!',0,'Meandering Leafkin')
    elseif
        order == 11 and
        npc:getID() == 17928219 --or
        --player:getGMLevel() > 0
    then
        player:setCharVar('cabbageOrder', 1)
        player:printToPlayer('I am the twelfth born I think Ygnas may want to fight you!',0,'Meandering Leafkin')
        player:printToPlayer('I will send you to our sibling!',0,'Meandering Leafkin')
        player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
        player:timer(5000, function()
            player:setPos(-449.5768, 0.3552, -99.7411, 132, 263)
        end)
    else
        player:printToPlayer('I am not the right leafkin!',0,'Meandering Leafkin')
        player:printToPlayer('You have to start over!',0,'Meandering Leafkin')
        player:printToPlayer('you have to talk to all 12 of us in order!',0,'Meandering Leafkin')
        player:setLocalVar('cabbageOrder', 0)
    end
end)

m:addOverride('xi.zones.Leafallia.npcs.Meandering_Leafkin.onEventUpdate', function(player, csid, option, npc)
end)

m:addOverride('xi.zones.Leafallia.npcs.Meandering_Leafkin.onEventFinish', function(player, csid, option, npc)
end)

return m


