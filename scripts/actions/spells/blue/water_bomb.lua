-----------------------------------
-- Spell: Water Bomb
-- Deals water damage to enemies within area of effect. Additional effect: Silence.
-- Spell cost: 67 MP
-- Monster Type: Beastman
-- Spell Type: Magical (Water)
-- Blue Magic Points: 2
-- Stat Bonus: MP+20, INT+4, MND+2, STR-3, WIT-3
-- Level: 92
-- Casting Time: 3 seconds
-- Recast Time: 32 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Conserve MP
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMAN
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.WATER
    params.attribute = xi.mod.INT
    params.multiplier = 1
    params.tMultiplier = 2.0
    params.duppercap = 30
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.7
    params.mnd_wsc = 0.1
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.SILENCE
    local power = 1
    local tick = 0
    local duration = 45

    local damage = xi.spells.blue.useMagicalSpell (caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject