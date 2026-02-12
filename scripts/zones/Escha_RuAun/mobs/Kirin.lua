-----------------------------------
-- Area: Escha RuAun
--  Mob: Kirin
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:setUntargetable(false)
end

entity.onMobFight = function(mob, target)
    -- captures show cure v repeatedly every 15 sec below 50% health
    if
        mob:getHPP() <= 50
    then
        local pos = mob:getPos()
        local kouryu = GetMobByID(ID.mob.KOURYU)

        if kouryu then
            DespawnMob(mob:getID())
            SpawnMob(kouryu:getID()):updateEnmity(target)
            kouryu:setPos(pos.x, pos.y, pos.z, pos.rot)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
