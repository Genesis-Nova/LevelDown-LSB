-----------------------------------
-- Spell: Fantod
-- Enhances attack and magic attack.
-- Spell cost: 12 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: HP -10 DEX +2 AGI +2
-- Level: 99
-- Casting Time: .5 seconds
-- Recast Time: 10 seconds
-----------------------------------
-- Combos: Store TP
-----------------------------------
local effectz =
{
    {xi.effect.MAGIC_ATK_BOOST, 30, 180},
    {xi.effect.ATTACK_BOOST, 30, 180},
}

local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)



    local duration = 180
    local power = 30
    local apower = caster:getStat(xi.mod.ATT) *.3
    local typeEffect = xi.effect.MAGIC_ATK_BOOST
    local typeEffectone = xi.effect.ATTACK_BOOST
    if not caster:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    if not caster:addStatusEffect(typeEffectone, apower, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    
    return typeEffect, typeEffectone

end
return spellObject
