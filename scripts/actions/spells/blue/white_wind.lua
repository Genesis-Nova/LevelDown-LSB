-----------------------------------
-- Spell: White Wind
-- Restores HP of all party members within area of effect.
-- Spell cost: 145 MP
-- Monster Type: Dragons
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 5
-- Stat Bonus: HP+5, AGI+1
-- Level: 94
-- Casting Time: 7 seconds
-- Recast Time: 20 seconds
-----------------------------------
-- Combos: Auto regen
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.minCure = 100
    params.divisor0 = 0.6666
    params.constant0 = -50
    params.powerThreshold1 = 280
    params.divisor1 = 3
    params.constant1 = 85
    params.powerThreshold2 = 459
    params.divisor2 = 8.5
    params.constant2 = 144.6666

    return xi.spells.blue.useCuringSpell(caster, target, spell, params)
end

return spellObject