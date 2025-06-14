-----------------------------------
-- Spell: Erratic Flutter
-- Increases attack speed
-- Spell cost: 92 MP
-- Monster Type: VERMIN
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: HP +5 MP +15 AGI +5 CHR +5
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 45 seconds
-- Duration: 5 minutes
-----------------------------------
-- Combos: Fast Cast
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local typeEffect = xi.effect.HASTE
    local power = 3000 -- 30%
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 300)

    if not target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return typeEffect
end

return spellObject
