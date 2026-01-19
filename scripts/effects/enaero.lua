-----------------------------------
-- xi.effect.ENAERO
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
	local jpValue   = target:getJobPointLevel(xi.jp.COMPOSURE_EFFECT)
	local basePower = effect:getPower() + jpValue

    -- Triple En-spell damage if Composure is active and self-cast
    if target:hasStatusEffect(xi.effect.COMPOSURE) then
        basePower = basePower * 4
    end
	
    target:addMod(xi.mod.ENSPELL, xi.element.WIND)
    target:addMod(xi.mod.ENSPELL_DMG, basePower)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
end

return effectObject
