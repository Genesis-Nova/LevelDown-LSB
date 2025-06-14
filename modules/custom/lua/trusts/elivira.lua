-----------------------------------
-- Trust: elivira
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('elivira')


m:addOverride("xi.actions.spells.trust.elivira.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.EVOKERS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.EVOKERS_ROLL })  -- Refresh
    trust:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.WARLOCKS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.WARLOCKS_ROLL }) -- Magic Accuracy
    trust:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.RATTACK, 0, 0 }, 10)

    -- Notable: Uses a balance of melee and ranged attacks.
    -- TODO: Observe his WS behaviour on retail
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.WSACC, power*3)
    trust:addMod(xi.mod.ACC, power*2)   
end)

return m
