-----------------------------------
-- Spell: Whirl of Rage
-- Damage varies with TP
-- Spell cost: 73 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR +2, DEX +2
-- Level: 83
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Scission, Detonation
-- Combos: Zanshin
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCANA
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.DETONATION
    params.scattr = xi.skillchainType.SCISSION
    params.numhits = 1
    params.multiplier = 3.0
    params.tp150 = 4.0
    params.tp300 = 4.0
    params.tp350 = 4.25
    params.azuretp = 2.53125
    params.duppercap = 35
    params.str_wsc = 0.7
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0
    params.ignorefstrcap = true -- Whirl of Rage doesn't have an fSTR cap
    params.effect = xi.effect.STUN

    local power    = 1
    local tick     = 0
    local duration = 5
    local damage   = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)
    return damage
end

return spellObject
