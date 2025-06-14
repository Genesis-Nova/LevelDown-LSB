-----------------------------------
-- Spell: Paralyzing Triad
-- Delivers a threefold attack. Additional effect: Paralysis. Damage varies with TP.
-- Spell cost: 33 MP
-- Monster Type: Elemental
-- Spell Type: Physical
-- Blue Magic Points: 6
-- Stat Bonus: HP -10 STR +4 DEX +4
-- Level: 99
-- Casting Time: 1 seconds
-- Recast Time: 15 seconds
-- Magic Bursts on:  Gravitation
-- Combos: Skillchain Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ELEMENTAL
    params.tpmod = TPMOD_ACC
    params.tpmod = TPMOD_ATT
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.GRAVITATION
    params.attribute = xi.mod.INT
    params.numhits = 3
    params.multiplier = 3
    params.tMultiplier = 1.25
    params.duppercap = 19
    params.str_wsc = 0.7
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.PARALYSIS
    local power = 2500
    local tick = 0
    local duration = 60

    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return xi.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
