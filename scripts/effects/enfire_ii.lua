-----------------------------------
-- xi.effect.ENFIRE_II
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local basePower = effect:getPower()

    -- Triple En-spell damage if Composure is active and self-cast
    if target:hasStatusEffect(xi.effect.COMPOSURE) then
        basePower = basePower * 4.5
    end

    target:addMod(xi.mod.ENSPELL, xi.element.FIRE + 8) -- Tier IIs use higher IDs
    target:addMod(xi.mod.ENSPELL_DMG, basePower)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
end

return effectObject
