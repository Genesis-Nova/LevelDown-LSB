-----------------------------------
-- Spell: Dream Flower
-- Deals Puts all enemies within range to sleep
-- Spell cost: 68 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: HP+5, MP+5, CHR+2
-- Level: 87
-- Casting Time: 2.5 seconds
-- Recast Time: 45 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.PLANTOID
    params.effect = xi.effect.SLEEP_II
    local power = 2
    local tick = 0
    local duration = 90
    local resistThreshold = 0.50
    local isGaze = false
    local isConal = false

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
