-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Chigoe
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ARBOREAL_CHIGOE) do
    entity.phList[phId] = ID.mob.ASCENDED_CHIGOE
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
