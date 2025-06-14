-----------------------------------
-- Spell: Mortal Ray
-- Inflicts Doom upon an enemy.
-- Spell cost: 267 MP
-- Monster Type: Demons
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: STR+2, MND+2
-- Level: 91
-- Casting Time: 8 seconds
-- Recast Time: 150 seconds
-- Combos: Dual Wield
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.DRAGON
    params.effect = xi.effect.DOOM
    local power = 10
    local tick = 3
    local duration = 188 
    local resistThreshold = 0.0
    local isGaze = true
    local isConal = false

    if target:isNM() then
        skill:setMsg(xi.msg.basic.SKILL_MISS)
    else
        return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
    end
end

return spellObject
