-----------------------------------
-- Trust: kupofried
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('kupofried')

m:addOverride("xi.actions.spells.trust.kupofried.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, { power = 6, origin = trust, tick = 3, subType = xi.effect.CORSAIRS_ROLL, subPower = 120, tier = xi.auraTarget.ALLIES, flag = xi.effectFlag.AURA })

    trust:setAutoAttackEnabled(false)
    trust:setUnkillable(true)
end)

return m
