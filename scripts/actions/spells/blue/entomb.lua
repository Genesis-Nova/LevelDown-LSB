-----------------------------------
-- Spell: Entomb
-- Deals earth damage to enemies within range. Additional effect: Petrification.
-- Spell cost: 116 MP
-- Monster Type: Elementals
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 8
-- Stat Bonus: MP +30, VIT +8
-- Level: 99
-- Casting Time: 5 seconds
-- Recast Time: 60 seconds
-- Combos: Defense Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0  
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTALS
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.EARTH
    params.attribute = xi.mod.VIT
    params.multiplier = 4.36
    params.diff = 1
    params.tMultiplier = 4.0
    params.tphitslanded = 1
    params.duppercap = 99
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.8
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.PETRIFICATION
    local power = 5
    local tick = 0
    local duration = 60

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    