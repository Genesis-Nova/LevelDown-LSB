-----------------------------------
-- Spell: Auroral Drape
-- Silences and blinds enemies within range.
-- Spell cost: 51 MP
-- Monster Type: Empty
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: INT +3 CHR +2
-- Level: 84
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Combos: Fast Cast
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem 		= xi.ecosystem.EMPTY
	params.skillType 		= xi.skill.BLUE_MAGIC
	params.effect 			= xi.effect.BLINDNESS
	params.effect			= xi.effect.SILENCE
    params.power 			= 60
    params.tick 			= 0
    params.duration 		= 60
    params.resistThreshold 	= 0.50
    params.isGaze 			= false
    params.isConal 			= false

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params)
   
end

return spellObject
