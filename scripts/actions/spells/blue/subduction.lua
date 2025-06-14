-----------------------------------
-- Spell: Subduction
-- Deals wind damage to enemies within range. Additional effect: Weight
-- Spell cost: 24 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 6
-- Stat Bonus: MP +25, VIT +6, INT +6
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 5 seconds
-- Combos: Magic Attack Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
        return 0
    
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCANA
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WIND
    params.attribute = xi.mod.VIT
    params.attribute = xi.mod.STR
    params.multiplier = 1.63
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.1
    params.dex_wsc = 0.0
    params.vit_wsc = 0.1
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.WEIGHT
    local power = 5
    local tick = 3
    local duration = 90

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    