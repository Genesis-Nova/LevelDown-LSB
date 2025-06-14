-----------------------------------
-- Spell: Amorphic Spikes
-- Delivers a fivefold attack. damage varies with TP

-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.AMORPHS
    params.tpmod = xi.spells.blue.tpMod.DMG
    params.bonus = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonus = caster:getMod(xi.mod.ATT) * .7
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonus = caster:getMod(xi.mod.ATT) * .7
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.PIERCING
    params.scattr = xi.skillchainType.GRAVITATION
    params.scattr2 = xi.skillchainType.TRANSFIXION
    params.attribute = xi.mod.INT
    params.attribute = xi.mod.MND
    params.numhits = 5
    params.multiplier = 2.45
    params.tp150 = 1.375
    params.tp300 = 2
    params.azuretp = 0.625
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
