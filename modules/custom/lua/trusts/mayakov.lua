-----------------------------------
-- Trust: mayakov
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('mayakov')


m:addOverride("xi.actions.spells.trust.mayakov.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addGambit(ai.t.PARTY, { ai.c.HPP_LT, 65 }, { ai.r.JA, ai.s.HIGHEST_WALTZ, xi.ja.CURING_WALTZ })
    trust:addGambit(ai.t.SELF, { ai.c.STATUS_FLAG, xi.effectFlag.WALTZABLE }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.HEALING_WALTZ })
    trust:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.SABER_DANCE }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SABER_DANCE })
	trust:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.ROGUES_ROLL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.ROGUES_ROLL }) -- CRIT HIT RATE
	trust:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.HASTE_SAMBA }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.HASTE_SAMBA })
	
	trust:addGambit(ai.t.TARGET, { ai.c.STATUS_LT, xi.effect.BEWILDERED_DAZE_1, 10 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PRESTO })
    trust:addGambit(ai.t.SELF, { ai.c.STATUS, xi.effect.PRESTO }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.FEATHER_STEP })
	
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.MDEF, power)
    trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.ACC, power * 4)
    trust:addMod(xi.mod.STORETP, 20)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

return m
