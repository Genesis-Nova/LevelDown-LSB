-----------------------------------
-- Spell: Nat. Meditation
-- Enhances Attacks.
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 6
-- Stat Bonus: DEX +6
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 60 seconds
-----------------------------------
-- Combos: Accuracy Bonus
-----------------------------------

local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 60
    local attack = caster:getStat(xi.mod.ATT)
    local attBoost = attack * 0.2
    local typeEffect = xi.effect.ATTACK_BOOST
    caster:addStatusEffect(xi.effect.ATTACK_BOOST, attBoost, 0, duration)

return typeEffect
end
return spellObject
