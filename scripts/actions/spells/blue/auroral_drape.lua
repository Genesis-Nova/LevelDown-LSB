-----------------------------------
-- Spell: Auroral Drape
-- Silences and blinds enemies within range.
-- Spell cost: 51 MP
-- Monster Type: Empty
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: INT +3 CHR +2
-- Level: 84
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Combos: Fast Cast
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.EMPTY
    params.attackType = xi.attackType.MAGICAL
    params.skillType = xi.skill.BLUE_MAGIC
    params.attribute = xi.mod.INT

    local typeEffectOne = xi.effect.BLINDNESS
    local typeEffectTwo = xi.effect.SILENCE
    local power = 60
    local tick = 0
    local duration = 60

    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist >= 0.5 then
        target:addStatusEffect(typeEffectOne, power, tick, duration * resist)
        target:addStatusEffect(typeEffectTwo, power, tick, duration * resist)
end
    return typeEffectOne, typeEffectTwo
end

return spellObject
