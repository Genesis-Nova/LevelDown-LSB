-----------------------------------
-- Spell: Heavy Strike
-- Damage varies with TP.
-- Spell cost: 32 MP
-- Monster Type: Golem
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: ST+2
-- Level: 92
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Fragmentation/Transfixion
-- Combos: Double Attack, Triple Attack
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.GOLEM
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.FRAGMENTATION
    params.scattr2 = xi.skillchainType.TRANSFIXION
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 2.25
    params.tp300 = 3.5
    params.tp350 = 4.0
    params.azuretp = 1.5
    params.duppercap = 99
    params.str_wsc = .5
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
