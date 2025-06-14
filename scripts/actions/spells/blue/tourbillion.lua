-----------------------------------
-- Spell: Tourbillion
-- Delivers an area attack. Additional effect duration varies with TP. Additional effect: Weakens defense.
-- Spell cost: 108 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Blunt)
-- Stat Bonus:
-- Level: 97
-- Casting Time: 1 seconds
-- Recast Time: 30 seconds
-- Skillchain Element(s): Light, Fragmentation
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    if caster:hasStatusEffect(xi.effect.UNBRIDLED_LEARNING) or
    caster:hasStatusEffect(xi.effect.UNBRIDLED_WISDOM) then
        return 0
    else
        return spell:setMsg(xi.msg.basic.STATUS_PREVENTS)
    end
   
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEAST
    params.tpmod = xi.spells.blue.tpMod.DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.scattr = xi.skillchainType.LIGHT
    params.scattr2 = xi.skillchainType.FRAGMENTATION
    params.numhits = 1
    params.multiplier = 4.0
    params.tp150 = 1.0
    params.tp300 = 2.0
    params.duppercap = 69
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
    local duration = 60
    local fTP = caster:getTP()
    local resistThreshold = 0
    if fTP >= 2000 then 
        duration = 60
    elseif fTP == 3000 then
        duration = 120
        resistThreshold = 0.5
        end
    local damage = xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
    xi.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject
    