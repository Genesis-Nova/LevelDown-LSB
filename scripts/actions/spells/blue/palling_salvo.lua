-----------------------------------
-- Spell: Palling Salvo
-- Deals dark damage to enemies within range. Additional effect: Bio
-- Spell cost: 175 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 7
-- Stat Bonus: DEX +6, AGI +6
-- Level: 99
-- Casting Time: 2 seconds
-- Recast Time: 45 seconds
-- Combos: Tenacity
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.attribute = xi.mod.AGI
    params.multiplier = 1
    params.tMultiplier = 1.37
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.6
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.BIO
    local power = 5
    local tick = 10
    local duration = 90

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    