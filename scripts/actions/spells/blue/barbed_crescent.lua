-----------------------------------
-- Spell: Barbed Crescent
-- Damage varies with TP. Additional effect: Accuracy Down.
-- Spell cost: 52 MP
-- Monster Type: Undead
-- Spell Type: Physical
-- Blue Magic Points: 2
-- Stat Bonus: STR -3 DEX +4
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 22 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.UNDEAD
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.DISTORTION
    params.scattr2 = xi.skillchainType.LIQUEFACATION
    params.attribute = xi.mod.DEX
    params.numhits = 1
    params.multiplier = 3
    params.tMultiplier = 2.0
    params.duppercap = 89
    params.str_wsc = 0.0
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.addedEffect = xi.effect.ACCURACY_DOWN
    local power = 30
    local tick = 0
    local duration = 120

    damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)
    return damage
end

return spellObject
