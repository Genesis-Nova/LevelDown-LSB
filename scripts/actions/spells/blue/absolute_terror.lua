-----------------------------------
-- Spell: Absolute terror
-- Freezes target in fear.
-- Spell cost: 29 MP
-- Monster Type: Dragon
-- Spell Type: Magical (Dark)
-- Stat Bonus:
-- Level: 96
-- Casting Time: .5 seconds
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
    params.ecosystem = xi.ecosystem.DRAGON
    params.attackType = xi.attackType.MAGICAL
    params.skillType = xi.skill.BLUE_MAGIC
    params.damageType = xi.damageType.DARK
    params.effect = xi.effect.TERROR
    local power = 10
    local tick = 3
    local duration = 5
    local resistThreshold = 0.5
    local resist = applyResistanceEffect(caster, target, spell, params)
    local isGaze = false
    local isConal = false

    if target:isNM() then
       if resist >= resistThreshold then
          resistThreshold = 0
       end
    end

         return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
    