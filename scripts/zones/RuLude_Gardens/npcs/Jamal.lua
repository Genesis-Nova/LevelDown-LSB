-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Jamal
-----------------------------------
---@type TNpcEntity
local entity = {}

local trustSpellsObtained = {896,897,898,899,900,901,902,903,904,905,917}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
 for i = 1, #trustSpellsObtained do
   if player:hasSpell(trustSpellsObtained[i]) then
      npc:setLocalVar('TrustsObtained', npc:getLocalVar('TrustsObtained') + 1)
    end
 end
    if npc:getLocalVar('TrustsObtained') == 11 then
       npcUtil.giveKeyItem(player, xi.keyItem.BUNDLE_OF_HALF_INSCRIBED_SCROLLS)
    else
       player:startEvent(10246)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity