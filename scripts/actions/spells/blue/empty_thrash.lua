-----------------------------------
-- Spell: Empty Thrash
-- Delivers an area attack. Accuracy varies with TP.
-- Spell cost: 33 MP
-- Monster Type: Empty
-- Spell Type: Physical
-- Blue Magic Points: 3
-- Stat Bonus: STR +3 CHR -2
-- Level: 87
-- Casting Time: 0.5 seconds
-- Recast Time: 45.75 seconds
-- Magic Bursts on: Compression / Scission 
-- Combos: Double Attack / Triple Attack
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.EMPTY
    params.tpmod = TPMOD_ACC
    params.tpmod = TPMOD_ATT
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.COMPRESSION
    params.scattr2 = xi.skillchainType.SCISSION
    params.attribute = xi.mod.DEX
    params.numhits = 1
    params.multiplier = 3.0
    params.tMultiplier = 2
    params.duppercap = 19
    params.str_wsc = 0.7
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0


    damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)

    return damage
end

return spellObject
