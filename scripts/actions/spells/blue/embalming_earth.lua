-----------------------------------
-- Spell: Embalming Earth
-- Deals Earth damage to enemies within range. Additional effect : Slow
-- Spell cost: 57 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 6
-- Stat Bonus: STR +6
-- Level: 99
-- Casting Time: 4.5 seconds
-- Recast Time: 24 seconds
-- Combos: Attack Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LIZARDS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.EARTH
    params.attribute = xi.mod.INT
    params.multiplier = 1
    params.tMultiplier = 1.0
    params.duppercap = 1
    params.azuretp = 1.5
    params.azureBonus = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.7
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0


    params.addedEffect = xi.effect.SLOW
    local power = 2500
    local tick = 0
    local duration = 180

    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
