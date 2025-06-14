-----------------------------------
-- Spell: Mighty Guard
-- Increases own defense, magic defense, attack speed and gradually restores own HP.
-- Spell cost: 299 MP
-- Monster Type: Dragons
-- Spell Type: Magical (Light)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 9 seconds
-- Recast Time: 30 seconds
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or
    caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
        return 0
    else
        return spell:setMsg(xi.msg.basic.STATUS_PREVENTS)
    end
end
spellObject.onSpellCast = function(caster, target, spell)
    local blueSkill = utils.clamp(caster:getSkillLevel(xi.skill.BLUE_MAGIC), 0, 500)
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 300)

    local returnEffect = xi.effect.DEFENSE_BOOST


    local actionOne   = caster:addStatusEffect(xi.effect.DEFENSE_BOOST, 25, 3, duration, false)
    local actionTwo   = caster:addStatusEffect(xi.effect.HASTE, 15, 3, duration, false)
    local actionThree = caster:addStatusEffect(xi.effect.REGEN, 30, 3, duration, false)
    local actionFour  = caster:addStatusEffect(xi.effect.MAGIC_DEF_BOOST, 15, 3, duration, false)

    if not actionOne and not actionTwo and not actionThree and not actionFour then -- all statuses fail to apply
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    elseif not actionOne and actionTwo and actionThree and actionFour then -- the first status fails to apply
        returnEffect = xi.effect.DEFENSE_BOOST
    elseif actionOne and actionThree and actionFour and not actionTwo then -- the second status fails to apply
        returnEffect = xi.effect.HASTE
    elseif actionOne and actionTwo and actionFour and not actionThree then -- the third status fails to apply
        returnEffect = xi.effect.REGEN
    elseif actionOne and actionTwo and actionThree and not actionFour then -- the third status fails to apply
        returnEffect = xi.effect.MAGIC_DEF_BOOST
    end

    return returnEffect
end
return spellObject