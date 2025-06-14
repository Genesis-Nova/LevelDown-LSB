-----------------------------------
-- Spell: Blinding Fulgor
-- Deals light damage to enemies within range. Additional effect: Flash
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Light)
-- Blue Magic Points: 8
-- Stat Bonus: HP +40, STR +4, DEX +4, AGI +4
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Magic Evasion Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTALS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.STR
    params.attribute = xi.mod.DEX
    params.attribute= xi.mod.AGI
    params.multiplier = .75
    params.tMultiplier = 1.0
    params.duppercap = 75
    params.str_wsc = 0.3
    params.dex_wsc = 0.3
    params.vit_wsc = 0.0
    params.agi_wsc = 0.3
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.FLASH
    local power = 1
    local tick = 0
    local duration = 30
    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    