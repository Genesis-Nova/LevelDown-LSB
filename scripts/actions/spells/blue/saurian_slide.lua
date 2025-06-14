-----------------------------------
-- Spell: Saurian Slide
-- Additional effect: Weakens attacks. Damage varies with TP.
-- Spell cost: 109 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: INT+1
-- Level: 30
-- Casting Time: .5 seconds
-- Recast Time: 35 seconds
-- Skillchain Element(s): Fragmentation / Distortion
-- Combos: Inquartata
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.tpmod = TPMOD_ATTACK
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.SLASHING
    params.scattr = xi.skillchainType.FRAGMENTATION
    params.scattr2 = xi.skillchainType.DISTORTION
    params.numhits = 1
    params.multiplier = 3
    params.tp150 = 1.0
    params.tp300 = 2.0
    params.azuretp = 1.0
    params.duppercap = 94
    params.str_wsc = 0.7
    params.dex_wsc = 0.7
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local typeEffectOne = xi.effect.ATTACK_DOWN
    local power = 25
    local tick = 0
    local duration = 60
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        target:addStatusEffect(typeEffectOne, power, tick, duration * resist)
    end

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
