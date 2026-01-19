-----------------------------------
-- Area: Reisenjima
--  Mob: Water_Elemental
-- Note: PH for Ascended_Ungeweder & Ascended_Gefyrst
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local random = math.random(1,2)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    if not player:hasKeyItem(xi.ki.MOLLIFIER) then
        if random == 1 then 
            xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_UNGEWEDER, 15, 4800, params)
        else
            xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_GEFYRST, 15, 4800, params)
        end
    end
end

entity.onMobDespawn = function(mob)

end

return entity
