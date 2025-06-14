-----------------------------------
-- Spell: Retinal Glare
-- Deals light damage to enemies in a fan-shaped area originating from the caster. Additional effect: Flash.
-- Spell cost: 26 MP
-- Monster Type: Plantoid
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: MP +15 INT +3
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 45 seconds
-- Combos: Conserve MP
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.PLANTOID
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.INT
    params.multiplier = 1
    params.tMultiplier = 1
    params.duppercap = 1
    params.azuretp = 1.5
    params.azureBonus = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.1
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0


    params.addedEffect = xi.effect.FLASH
    local power = 2500
    local tick = 0
    local duration = 15

    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
