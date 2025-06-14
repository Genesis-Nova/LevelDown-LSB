-----------------------------------
-- Spell: O. Counterstance
-- Increases the caster's chance of countering.
-- Spell cost: 18 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 5
-- Stat Bonus: HP +10 STR +3 VIT +3 DEX -2 AGI -2
-- Level: 98
-- Casting Time: 4.5 seconds
-- Recast Time: 120 seconds
-----------------------------------
-- Combos: Counter
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0

end

spellObject.onSpellCast = function(caster, target, spell)



    local duration = 180
    local power = 1000
    local typeEffect = xi.effect.COUNTERSTANCE
    if not caster:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
    
    return typeEffect

end
return spellObject
