-----------------------------------
-- Spell: Sweeping Gouge
-- Delivers a twofold attack. Additional effect: Weakens defense. Duration of effect varies with TP.
-- Spell cost: 29 MP
-- Monster Type: Beast
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 6
-- Stat Bonus: HP +25, VIT +5
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 120 seconds
-- Combos: Lizard Killer
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.tpmod = xi.spells.blue.tpMod.ACC
    params.bonusacc = 0
    if caster:hasStatusEffect(xi.effect.AZURE_LORE) then
        params.bonusacc = 70
    elseif caster:hasStatusEffect(xi.effect.CHAIN_AFFINITY) then
        params.bonusacc = math.floor(caster:getTP() / 50)
    end

    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.IMPACTION
    params.attribute = xi.mod.VIT
    params.scattr = xi.skillchainType.LIGHT
    params.scattr2 = xi.skillchainType.FRAGMENTATION
    params.numhits = 1
    params.multiplier = 2.0
    params.tp150 = 1.78
    params.tp300 = 2.0
    params.azuretp = 1.78
    params.duppercap = 99
    params.str_wsc = 0.25
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.25
    params.chr_wsc = 0.0

    params.effect = xi.effect.DEFENSE_DOWN
    local power = 10
    local tick = 0
    local duration = 90
    if caster:getTP() >= 1500 and caster:getTP() < 3000 then
          duration = 112
    elseif caster:getTP() == 3000 then
          duration = 135
    elseif caster:hasStatusEffect(xi.effect.AZURE_LORE) then
          duration = 180
    end

    local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject