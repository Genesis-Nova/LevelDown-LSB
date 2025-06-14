-----------------------------------
-- Spell: Goblin Rush
-- Delivers a threefold attack. Accuracy varies with TP.
-- Spell cost: 76 MP
-- Monster Type: Beastmen
-- Spell Type: Physical
-- Blue Magic Points: 3
-- Stat Bonus: HP +10 DEX +2 MND -3
-- Level: 81
-- Casting Time: 0.5 seconds
-- Recast Time: 25.5 seconds
-- Magic Bursts on: Fusion / Impaction 
-- Combos: Skillchain Bonus
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.tpmod = TPMOD_ACC
    params.tpmod = TPMOD_ATT
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.FUSION
    params.scattr2 = xi.skillchainType.IMPACTION
    params.attribute = xi.mod.DEX
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


    damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)

    return damage
end

return spellObject
