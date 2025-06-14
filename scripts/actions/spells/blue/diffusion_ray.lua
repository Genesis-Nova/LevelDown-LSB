-----------------------------------
-- Spell: Diffusion Ray
-- Deals light damage to enemies within a fan-shaped area originating from caster.
-- Spell cost: 238 MP
-- Monster Type: Archaic Machines
-- Spell Type: Magical (Light)
-- Blue Magic Points: 6
-- Stat Bonus: STR +5 VIT +7
-- Level: 99
-- Casting Time: 12 seconds
-- Recast Time: 45 seconds
-- Combos: Store TP
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.ARCHAICMACHINE
    params.tpmod = TPMOD_DAMAGE
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.LIGHT
    params.attribute = xi.mod.MND
    params.diff = 0
    params.bonus = 50 
    params.numhits = 1
    params.tmultiplier = 2
    params.tp150 = 1.5
    params.tp300 = 1.5
    params.azuretp = 1.5
    params.duppercap = 49
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.7
    params.chr_wsc = 0.0


        damage = xi.spells.blue.applySpellDamage(caster, target, spell, damage, params)


    return damage
end

return spellObject
