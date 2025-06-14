-----------------------------------
-- Trust: leonoyne
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('leonoyne')


m:addOverride("xi.actions.spells.trust.leonoyne.onSpellCast", function(caster, target, spell)
    local trust = caster:spawnTrust(spell:getID())

    trust:addGambit(ai.t.TARGET, { ai.c.READYING_WS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    trust:addGambit(ai.t.TARGET, { ai.c.READYING_MS, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    trust:addGambit(ai.t.TARGET, { ai.c.READYING_JA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    trust:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN })
    trust:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER })
    trust:addGambit(ai.t.SELF, { ai.c.ALWAYS, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT })
    trust:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD })
    trust:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER })

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power * 2)
    trust:addMod(xi.mod.MACC, power * 2)
    trust:addMod(xi.mod.DEF, power * 2)
    trust:addMod(xi.mod.MDEF, power * 2)
    trust:addMod(xi.mod.ATT, power * 3)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 20)
    trust:addMod(xi.mod.TRIPLE_ATTACK, 9)
    trust:addMod(xi.mod.STORETP, 100)
    trust:addMod(xi.mod.REFRESH, 3)
end)

return m
