-----------------------------------
-- Spell: Warm-Up
-- Enhances accuracy and evasion
-- Spell cost: 59 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 4
-- Stat Bonus: VIT+1
-- Level: 68
-- Casting Time: 7 seconds
-- Recast Time: 120 seconds
-- Duration: 180 seconds
-----------------------------------
-- Combos: Clear Mind
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 180
    local returnEffect = xi.effect.ACCURACY_BOOST
	
	if caster:hasStatusEffect(xi.effect.DIFFUSION) then
        local diffMerit = caster:getMerit(xi.merit.DIFFUSION)

        if diffMerit > 0 then
            duration = duration + (duration / 100) * diffMerit
        end

        caster:delStatusEffect(xi.effect.DIFFUSION)
    end

    local actionOne = target:addStatusEffect(xi.effect.ACCURACY_BOOST, { power = 100, duration = duration, origin = caster })
    local actionTwo = target:addStatusEffect(xi.effect.EVASION_BOOST, { power = 100, duration = duration, origin = caster })

    if not actionOne and not actionTwo then -- both statuses fail to apply
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    elseif not actionOne and actionTwo then -- the first status fails to apply
        returnEffect = xi.effect.EVASION_BOOST
    elseif actionOne and not actionTwo then -- the second status fails to apply
        returnEffect = xi.effect.ACCURACY_BOOST
    end

    return returnEffect
end

return spellObject
