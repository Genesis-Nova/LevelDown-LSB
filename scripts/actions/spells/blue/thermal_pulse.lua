-----------------------------------
-- Spell: Thermal Pulse
-- Deals Fire damage to enemies within area of effect. Additional effect: Blindness
-- Spell cost: 86 MP
-- Monster Type: VERMIN
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: VIT +2
-- Level: 86
-- Casting Time: 5.5 seconds
-- Recast Time: 70 seconds
-- Combos: Attack Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.FIRE
    params.attribute = xi.mod.INT
    params.multiplier = 1
    params.tMultiplier = 1
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.1
    params.agi_wsc = 0.0
    params.int_wsc = 0.7
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.BLINDNESS
    local power = 2500
    local tick = 0
    local duration = 60

    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
