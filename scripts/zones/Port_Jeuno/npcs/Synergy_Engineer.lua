-----------------------------------
-- Area: Port Jeuno
--  NPC: Synergy_Engineer
-- !pos  -52 0 -11 246

--Contributed by Graves
-----------------------------------
local ID = zones[xi.zone.PORT_JEUNO]
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

local function handleQuantity(player, quantity)
    local random = math.random(1, 100)

    if random > 85 then
        quantity = 12
    elseif random > 65 then
        quantity = 9
    elseif random > 35 then
        quantity = 6
    else
        quantity = 3
    end

    return quantity
end

local function handleTradeSuccesful(player, itemId, quantity)
    player:tradeComplete();
    player:printToPlayer( "Engineer: Here you go, use it in the furnace.", 0xd );
    player:addItem(itemId,quantity);
    player:messageSpecial(ID.text.ITEM_OBTAINED, itemId);
end

entity.onTrade = function(player, npc, trade)
    --Initialize local variables.
    local itemId   = 0
    local quantity = 0

    -- *Seal of Genbu Scrap*
    if npcUtil.tradeHasExactly(trade, {xi.item.SEAL_OF_GENBU}) and player:getFreeSlotsCount() >= 1 then
        itemId   = xi.item.SEAL_OF_GENBU_SCRAP
        quantity = handleQuantity(player, quantity)

        handleTradeSuccesful(player, itemId, quantity)

    -- *Seal of Suzaku Scrap*
    elseif npcUtil.tradeHasExactly(trade, {xi.item.SEAL_OF_SUZAKU}) and player:getFreeSlotsCount() >= 1 then
        itemId   = xi.item.SEAL_OF_SUZAKU_SCRAP
        quantity = handleQuantity(player, quantity)

        handleTradeSuccesful(player, itemId, quantity)

    -- *Seal of Seiryu Scrap*
    elseif npcUtil.tradeHasExactly(trade, {xi.item.SEAL_OF_SEIRYU}) and player:getFreeSlotsCount() >= 1 then
        itemId   = xi.item.SEAL_OF_SEIRYU_SCRAP
        quantity = handleQuantity(player, quantity)

        handleTradeSuccesful(player, itemId, quantity)

    -- *Seal of Byakko Scrap*
    elseif npcUtil.tradeHasExactly(trade, {xi.item.SEAL_OF_BYAKKO}) and player:getFreeSlotsCount() >= 1 then
        itemId   = xi.item.SEAL_OF_BYAKKO_SCRAP
        quantity = handleQuantity(player, quantity)

        handleTradeSuccesful(player, itemId, quantity)

    else
        player:printToPlayer( "Engineer: Where the Scraps I seek.", 0xd );
    end
end

entity.onTrigger = function(player, npc)
    player:printToPlayer( "Engineer: So you want some Scaps?", 0xd );
    player:printToPlayer( "Engineer: Trade me God Seals, you the Scraps simple as that.", 0xd );
    player:printToPlayer( "Engineer: Trade 1 at a time I work slow.", 0xd );
    player:printToPlayer( "Engineer: Take your time, I will be here all week.", 0xd );
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity