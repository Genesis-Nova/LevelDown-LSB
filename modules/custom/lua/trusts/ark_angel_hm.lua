-----------------------------------
-- Trust: aahm
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/utils/utils") -- file dir changed
require("scripts/globals/weaponskills")
-----------------------------------
local m = Module:new('ark_angel_hm')

m:addOverride("xi.actions.spells.trust.aahm.onMobSpawn", function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    local aahmLevel = mob:getMainLvl()

    -- Increase HP & MP
    mob:setMod(xi.mod.HP, 9 * aahmLevel)
    mob:updateHealth()
    mob:addHP(mob:getMaxHP())

    local power = mob:getMainLvl() * 2
    mob:addMod(xi.mod.MATT, power)
    mob:addMod(xi.mod.MACC, power)
    mob:addMod(xi.mod.DEF, power)
    mob:addMod(xi.mod.MDEF, power)
    mob:addMod(xi.mod.ATT, power)
    mob:addMod(xi.mod.ACC, power * 4)
    mob:addMod(xi.mod.STORETP, 50)
    mob:addMod(xi.mod.DOUBLE_ATTACK, 25)
    mob:addMod(xi.mod.TRIPLE_ATTACK, 10)
    mob:addMod(xi.mod.FASTCAST, 45)
    mob:addMod(xi.mod.UTSUSEMI_BONUS, 1)

    mob:addListener('WEAPONSKILL_USE', 'AAHM_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3706 then -- Cross Reaper
            -- Apathy Strikes!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Shadows are represented by xi.effect.COPY_IMAGE, but with different icons depending on the tier
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.COPY_IMAGE }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI })
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.BLINDNESS }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI }, 60)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.SLOW }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO }, 60)

    -- DD Mode
    mob:addGambit(ai.t.SELF, { ai.c.PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK })
    mob:addGambit(ai.t.SELF, { ai.c.PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN })
    mob:addGambit(ai.t.TANK, { ai.c.HPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })

    -- Tank Mode
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_PT_HAS_TANK, 0 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.YONIN })
    mob:addGambit(ai.t.MASTER, { ai.c.HPP_LT, 50 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE })
    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end)

    -- Chant Du Cygne
    xi.module.ensureTable("xi.actions.mobskills.chant_du_cygne")
        m:addOverride("xi.actions.mobskills.chant_du_cygne.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.chant_du_cygne.onMobWeaponSkill", function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = 2
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.CRIT_VARIES, 1, 2, 3)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    -- Around 700 damage from AA HM
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
        end)

return m
