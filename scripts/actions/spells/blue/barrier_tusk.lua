-----------------------------------
-- Spell: Barrier Tank
-- Reduces the amount of damage you take
-- Spell cost: 41 MP
-- Monster Type: Beast
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: HP+15, MP-15, VIT+3
-- Level: 91
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Combos: Max HP Boost
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local typeEffect = xi.effect.DEFENSE_BOOST
    local power = 57.5 -- 57.5%
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 90)

    if not target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end

return spellObject
