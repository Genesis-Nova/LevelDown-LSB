-----------------------------------
-- xi.effect.ENDARK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue   = target:getJobPointLevel(xi.jp.ENDARK_EFFECT)
    local basePower = effect:getPower() + jpValue

    -- Triple En-spell damage if Composure is active and self-cast
    if target:hasStatusEffect(xi.effect.COMPOSURE) then
        basePower = basePower * 1.5
    end

    target:addMod(xi.mod.ENSPELL, xi.element.DARK)
    target:addMod(xi.mod.ENSPELL_DMG, basePower)
    target:addMod(xi.mod.ATT, jpValue)
    target:addMod(xi.mod.ACC, jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.ENDARK_EFFECT)

    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
    target:delMod(xi.mod.ATT, jpValue)
    target:delMod(xi.mod.ACC, jpValue)
end

return effectObject
