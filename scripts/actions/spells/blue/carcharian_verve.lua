-----------------------------------
-- Spell: Carcharian Verve
-- Enhances attack and magic attack. Reduces spell interruption rate.
-- Spell cost: 65 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 
-- Stat Bonus: 
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Attack Bonus
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
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 90)
    local returnEffect = xi.effect.MAGIC_ATK_BOOST
    local mabPower = caster:getMod(xi.mod.MATT) * .2
    local attPower = caster:getMod(xi.mod.ATT) * .2

    local actionOne   = target:addStatusEffect(xi.effect.MAGIC_ATK_BOOST, mabPower, 0, 60)
    local actionTwo   = target:addStatusEffect(xi.effect.ATTACK_BOOST, attPower, 0, 60)
    local actionThree = target:addStatusEffect(xi.effect.AQUAVEIL, 10, 0, 900)


    if not actionOne and not actionTwo and not actionThree then -- all statuses fail to apply
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    elseif not actionOne and actionTwo and actionThree then -- the first status fails to apply
        returnEffect = xi.effect.MAGIC_ATK_BOOST
    elseif actionOne and actionThree and not actionTwo then -- the second status fails to apply
        returnEffect = xi.effect.ATTACK_BOOST
    elseif actionOne and actionTwo and not actionThree then -- the third status fails to apply
        returnEffect = xi.effect.AQUAVEIL
    end

    return returnEffect
end

return spellObject
    