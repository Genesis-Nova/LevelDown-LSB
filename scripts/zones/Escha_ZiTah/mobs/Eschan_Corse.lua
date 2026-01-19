-----------------------------------
-- Area: Escha Zitah
--  Mob: Eschan Corse
-- Note: PH for Muut
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
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
        xi.mob.phOnDespawn(mob, ID.mob.MUUT, 15, 4800, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
