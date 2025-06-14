-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm17 (???)
-- Spawns Bukhis
-- !pos -201 -39 -265 217
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.BUHKIS, { xi.ki.INGROWN_TAURUS_NAIL, xi.ki.OSSIFIED_GARGOUILLE_HAND, xi.ki.IMBRUED_VAMPYR_FANG })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
