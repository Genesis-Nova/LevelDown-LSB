-----------------------------------
-- Trust: Ygnas
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/utils/utils") -- file dir changed
require("scripts/globals/weaponskills")
-----------------------------------
local m = Module:new('ygnas')

local trustToReplaceName = 'ygnas'


m:addOverride(string.format('xi.actions.spells.trust.%s.onMobSpawn', trustToReplaceName), function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    -- Increase HP & MP
    mob:addMod(xi.mod.HP, mob:getMainLvl() * 10)
    mob:addMod(xi.mod.MP, mob:getMainLvl() * 10)
    mob:updateHealth()
    mob:addHP(mob:getMaxHP())
    mob:addMP(mob:getMaxMP())

    mob:addMod(xi.mod.CURE_CAST_TIME, 50)
    mob:addMod(xi.mod.CURE_POTENCY, 50)
    mob:addMod(xi.mod.CURE2MP_PERCENT, 5)
    mob:addMod(xi.mod.FASTCAST, 50)
    mob:addMod(xi.mod.UFASTCAST, 50)
    mob:addMod(xi.mod.REGAIN, 50)
    mob:addMod(xi.mod.REFRESH, mob:getMainLvl() / 20)
    mob:addMod(xi.mod.SUBLIMATION_BONUS, mob:getMainLvl() / 11)

    --advanced cure logic

    mob:addGambit(ai.t.PARTY, {ai.c.HPP_LT, 45}, {ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE})
    if mob:getMainLvl() >= 41 then
        mob:addGambit(ai.t.TANK,  {ai.c.HPP_LT, 75}, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE_III})
        mob:addGambit(ai.t.PARTY, {ai.c.HPP_LT, 66}, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE_III})
    elseif mob:getMainLvl() >= 21 then
        mob:addGambit(ai.t.TANK,  {ai.c.HPP_LT, 75}, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE_II})
        mob:addGambit(ai.t.PARTY, {ai.c.HPP_LT, 66}, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE_II})
    else
        mob:addGambit(ai.t.TANK,  {ai.c.HPP_LT, 75}, {ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE})
        mob:addGambit(ai.t.PARTY, {ai.c.HPP_LT, 66}, {ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE})
    end


    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.SLEEP_I             }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.SLEEP_II            }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE})
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.AFFLATUS_SOLACE }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.AFFLATUS_SOLACE })
    mob:addGambit(ai.t.PARTY, {ai.c.NOT_STATUS, xi.effect.PROTECT         }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spellFamily.PROTECTRA})
    mob:addGambit(ai.t.PARTY, {ai.c.NOT_STATUS, xi.effect.SHELL           }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spellFamily.SHELLRA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.POISON              }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.PARALYSIS           }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.BLINDNESS           }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.SILENCE             }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.PETRIFICATION       }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS, xi.effect.DISEASE             }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA})
    mob:addGambit(ai.t.SELF,  {ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE   }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE})
    mob:addGambit(ai.t.PARTY, {ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE   }, {ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE})

    mob:addListener('COMBAT_TICK', 'YGNAS_CTICK', function(mobArg)
        local isBusy   = false
        local act      = mobArg:getCurrentAction()

        if
            act == xi.action.MOBABILITY_START or
            act == xi.action.MOBABILITY_USING or
            act == xi.action.MOBABILITY_FINISH or
            act == xi.action.MAGIC_START or
            act == xi.action.MAGIC_CASTING or
            act == xi.action.MAGIC_START
        then
            isBusy = true
        end

        if
            isBusy == false
        then
            local party = mobArg:getMaster():getPartyWithTrusts()
            local mlvl  = mobArg:getMainLvl()
            for i, v in ipairs(party) do
                if
                    os.time() > mobArg:getLocalVar("SmartCuraga") and
                    v:getHPP() <= 75
                then
                    mobArg:setLocalVar("ExecCuraga", mobArg:getLocalVar("ExecCuraga") + 1)
                end
            end

            if mobArg:getLocalVar("ExecCuraga") >= 3 then
                if
                    mobArg:getMainLvl() >= 41 and
                    mobArg:getMP() >= 180
                then
                    mobArg:castSpell(9, mobArg)
                elseif
                    mobArg:getMainLvl() >= 21 and
                    mobArg:getMP() >= 120
                then
                    mobArg:castSpell(8, mobArg)
                elseif
                    mobArg:getMainLvl() >= 6 and
                    mobArg:getMP() >= 60
                then
                    mobArg:castSpell(7, mobArg)
                end
                mobArg:setLocalVar("ExecCuraga", 0)
                mobArg:setLocalVar("SmartCuraga", os.time() + 3)
            else
                mobArg:setLocalVar("ExecCuraga", 0)
            end

            if
                mobArg:getHPP() > 50 and
                mobArg:getMPP() < 100 and
                not mobArg:hasStatusEffect(xi.effect.SUBLIMATION_ACTIVATED) and
                not mobArg:hasStatusEffect(xi.effect.SUBLIMATION_COMPLETE)
            then
                mobArg:useJobAbility(233, mobArg)
            end

            if
                mobArg:getMPP() < 25 and
                mobArg:hasStatusEffect(xi.effect.SUBLIMATION_COMPLETE)
            then
                mobArg:useJobAbility(233, mobArg)
            end

            if not mobArg:hasStatusEffect(xi.effect.BLINK) then
                mobArg:castSpell(53, mobArg)
            end

            if not mobArg:hasStatusEffect(xi.effect.STONESKIN) then
                mobArg:castSpell(54, mobArg)
            end
        end
    end)
    mob:setAutoAttackEnabled(false)
end)

    -- Deific Gambol
    xi.module.ensureTable("xi.actions.mobskills.deific_gambol")
        m:addOverride("xi.actions.mobskills.deific_gambol.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.deific_gambol.onMobWeaponSkill", function(target, mob, skill)
            local numhits = 1
            local accmod = 2
            local dmgmod = 4.5
            local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
            target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return dmg
        end)

    -- Sacred Caper
    xi.module.ensureTable("xi.actions.mobskills.Sacred Caper")
        m:addOverride("xi.actions.mobskills.Sacred Caper.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.Sacred Caper.onMobWeaponSkill", function(target, mob, skill)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.RASP, mob:getMainLvl() / 10, 3, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, 1, 0, 10)
            local damage = target:getMainLvl() * 10 + math.random(1, 27)
            target:takeDamage(damage, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return damage
        end)
    -- phototrophic_blessing
    xi.module.ensureTable("xi.actions.mobskills.phototrophic_blessing")
        m:addOverride("xi.actions.mobskills.phototrophic_blessing.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.phototrophic_blessing.onMobWeaponSkill", function(target, mob, skill)
            local tpFactor = utils.clamp(3 * (skill:getTP() - 1000) / 1000, 0, 6)
            local power    = 5 + tpFactor

            xi.mobskills.mobBuffMove(mob, xi.effect.REGEN, power, 3, 300)
            xi.mobskills.mobBuffMove(mob, xi.effect.DEFENSE_BOOST, 50, 0, 60)
            xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_DEF_BOOST, 50, 0, 60)
            -- Ygnas will heal slightly
            return xi.mobskills.mobHealMove(target, mob:getMaxHP() * 104 / 1024)
        end)
    -- phototrophic_wrath
    xi.module.ensureTable("xi.actions.mobskills.phototrophic_wrath")
        m:addOverride("xi.actions.mobskills.phototrophic_wrath.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.phototrophic_wrath.onMobWeaponSkill", function(target, mob, skill)
            xi.mobskills.mobBuffMove(mob, xi.effect.ATTACK_BOOST, 50, 0, 60)
            xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_ATK_BOOST, 50, 0, 60)
            skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.HASTE, 3000, 0, 60))
            return xi.effect.HASTE
        end)
return m
