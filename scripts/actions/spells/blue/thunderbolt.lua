-----------------------------------
-- Spell: Thunderbolt
-- Deals Lightning damage to enemies within the area of effect. Additional effect: "Stun".
-- Spell cost: 138 MP
-- Monster Type: Beast
-- Spell Type: Magical (THunder)
-- Stat Bonus:
-- Level: 95
-- Casting Time: 8.5 seconds
-- Recast Time: 30 seconds
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
    params.damageType = xi.damageType.THUNDER
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.attribute = xi.mod.INT
    params.attribute = xi.mod.MND
    params.multiplier = 0.5
    params.tMultiplier = 1.0
    params.duppercap = 75
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.2
    params.chr_wsc = 0.0
    
    params.addedEffect = xi.effect.STUN
    local power = 5
    local tick = 3
    local duration = 10

    local damage = xi.spells.blue.useMagicalSpell(caster, target, spell, params)
    xi.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
