-----------------------------------
-- Spell: Polar Roar
-- Deals ice damage to enemies within range. Additional effect: Bind
-- Spell cost: 126 MP
-- Monster Type: Beast
-- Spell Type: Magical (Ice)
-- Stat Bonus:
-- Level: 99
-- Casting Time: 0.5 seconds
-- Recast Time: 30 seconds
-- Combos: Magic Attack Bonus
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
    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.ICE
    params.attribute = xi.mod.INT
    params.attribute = xi.mod.STR
    params.multiplier = 1.36
    params.tMultiplier = 2
    params.duppercap = 69
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = xi.effect.BIND
    local power = 5
    local tick = 0
    local duration = 10

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
    