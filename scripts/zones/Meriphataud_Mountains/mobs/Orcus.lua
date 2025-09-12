-----------------------------------
--  VNM: Orcus (antlion)
-----------------------------------
---@type TMobEntity
local entity = {}

local antlion_ambush_mixin = require('scripts/mixins/families/antlion_ambush')

local PIT_AMBUSH_ID     = 278
local WS_EXIT_LISTENER  = 'ORCUS_AMBUSH_WS_EXIT'

entity.onMobInitialize = function(mob)
    xi.voidwalker.onMobInitialize(mob)
    antlion_ambush_mixin(mob)
end

entity.onMobSpawn = function(mob)
    xi.voidwalker.onMobSpawn(mob)

    if mob:getLocalVar('[VoidWalker]PopedAt') == 0 then
        mob:despawn()
        return
    end

    mob:removeListener(WS_EXIT_LISTENER)
    mob:setLocalVar('ORCUS_OPEN_AMBUSH', 0)
end

entity.onMobEngaged = function(mob, target)
    if mob:getLocalVar('[VoidWalker]PopedAt') == 0 then
        return -- only special behavior for VW spawns
    end

    if mob:getLocalVar('ORCUS_OPEN_AMBUSH') == 1 then
        return -- already executed opener
    end
    mob:setLocalVar('ORCUS_OPEN_AMBUSH', 1)

    mob:setAutoAttackEnabled(false)

    mob:removeListener(WS_EXIT_LISTENER)
    mob:addListener('WEAPONSKILL_STATE_EXIT', WS_EXIT_LISTENER, function(m, skillId)
        if skillId == PIT_AMBUSH_ID then
            m:setAutoAttackEnabled(true)
            m:removeListener(WS_EXIT_LISTENER)
        end
    end)

    mob:useMobAbility(PIT_AMBUSH_ID)
end

entity.onMobFight = function(mob, target)
    if mob:getLocalVar('[VoidWalker]PopedAt') == 0 then
        return
    end
    xi.voidwalker.onMobFight(mob, target)
end

entity.onMobDisengage = function(mob)
    xi.voidwalker.onMobDisengage(mob)
    mob:removeListener(WS_EXIT_LISTENER)
    mob:setLocalVar('ORCUS_OPEN_AMBUSH', 0)
end

entity.onMobDespawn = function(mob)
    xi.voidwalker.onMobDespawn(mob)
    mob:removeListener(WS_EXIT_LISTENER)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.ORCUS_TROPHY_HUNTER)
    xi.voidwalker.onMobDeath(mob, player, optParams, xi.keyItem.BLACK_ABYSSITE)
    xi.hunts.checkHunt(mob, player, 550)
    mob:removeListener(WS_EXIT_LISTENER)
end

return entity
