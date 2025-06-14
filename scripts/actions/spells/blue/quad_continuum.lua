-----------------------------------
-- Spell: Quad. Continuum
-- Delivers a fourfold attack. Damage varies with TP.
-- Spell cost: 91 MP
-- Monster Type: Empty
-- Spell Type: Physical (Piercing)
-- Blue Magic Points: 4
-- Stat Bonus: DEX +3 CHR -2
-- Level: 85
-- Casting Time: 1 seconds
-- Recast Time: 31.75 seconds
-- Skillchain Element(s): Distortion / Scission 
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.EMPTY
    params.tpmod = TPMOD_DMG
    params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.PIERCING
    params.scattr = xi.skillchainType.DISTORTION
    params.scattr2 = xi.skillchainType.SCISSION
    params.numhits = 4
    params.multiplier = 3
    params.tp150 = 1.25
    params.tp300 = 2
    params.azuretp = 1.5
    params.duppercap = 100
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.7
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
