-----------------------------------
-- Trust: elivira
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('elivira')


m:addOverride("xi.actions.spells.trust.elivira.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

	trust:addGambit(ai.t.MASTER, { ai.c.MPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.EVOKERS_ROLL })  -- Refresh if MP<50%
    trust:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.EVOKERS_ROLL or xi.effect.WARLOCKS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.WARLOCKS_ROLL })  -- Magic Accuracy Boost
    trust:addGambit(ai.t.PARTY, { ai.c.NOT_STATUS, xi.effect.WIZARDS_ROLL }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.WIZARDS_ROLL }) -- Magic Attack Bonus
    trust:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.RATTACK, 0, 0 }, 10)

	trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, { power = 6, origin = trust, tick = 3, subType = xi.effect.GEO_MAGIC_DEF_DOWN, subPower = 15, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA }) --custom Geo Mag Def Down -15
	
    -- Notable: Uses a balance of melee and ranged attacks.
    -- TODO: Observe his WS behaviour on retail
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.WSACC, power*3)
    trust:addMod(xi.mod.ACC, power*2) 
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25) 
end)

return m