-----------------------------------
-- Spell: Scouring Spate
-- Deals water damage to enemies within range. Additional effect: Weakens attacks.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Water)
-- Blue Magic Points: 8
-- Stat Bonus: MP +30, MND +8
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Defense Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTALS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.MND
    params.multiplier = 1
    params.tMultiplier = 1.5
    params.duppercap = 49
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.8
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.ATTACK_DOWN
    local power = 2
    local tick = 0
    local duration = 180

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    