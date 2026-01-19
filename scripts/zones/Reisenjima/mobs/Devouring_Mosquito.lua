-----------------------------------
-- Area: Reisenjima
--  Mob: Devouring_Mosquito
-- Note: PH for Ascended_Mosquito
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    if not player:hasKeyItem(xi.ki.MOLLIFIER) then
        xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_MOSQUITO, 15, 4800, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
