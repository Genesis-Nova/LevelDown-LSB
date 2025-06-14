-----------------------------------
-- Spell: Delta Thrust
-- Delivers a threefold attack on a single target. Additional effect: Plague
-- Spell cost: 28 MP
-- Monster Type: Lizards
-- Spell Type: Physical
-- Blue Magic Points: 2
-- Stat Bonus: HP +15 MP -5 INT -1
-- Level: 89
-- Casting Time: 0.5 seconds
-- Recast Time: 15 seconds
-- Magic Bursts on: Liquefacation / Detonation
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.LIZARDS
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.LIQUEFACATION
    params.scattr2 = xi.skillchainType.DETONATION
    params.attribute = xi.mod.DEX
    params.numhits = 3
    params.multiplier = 3.0
    params.tMultiplier = 2.0
    params.duppercap = 89
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.7
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.addedEffect = xi.effect.PLAGUE
    local power = 30
    local tick = 0
    local duration = 60

    damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)
    return damage
end

return spellObject
