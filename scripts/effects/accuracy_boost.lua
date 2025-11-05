-----------------------------------
-- xi.effect.ACCURACY_BOOST
--
-- getPower     = ACC
-- getSubPower  = RACC
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
	local skill = effect:getPower()
    local acc = math.floor(skill)
    local racc = math.floor(skill)
  

    target:addMod(xi.mod.ACC, acc)
    target:addMod(xi.mod.RACC, racc)
   -- target:addMod(xi.mod.ACC, effect:getPower())
   -- if effect:getSubPower() > 0 then
   --     target:addMod(xi.mod.RACC, effect:getSubPower())
   -- end
end

effectObject.onEffectTick = function(target, effect)
    -- the effect loses accuracy of 1 every 3 ticks depending on the source of the acc boost
   -- local boostACCEffectSize = effect:getPower()
   -- if boostACCEffectSize > 0 then
   --     effect:setPower(boostACCEffectSize - 1)
    --    target:delMod(xi.mod.ACC, 1)
    --end
end

effectObject.onEffectLose = function(target, effect)
	local skill = effect:getPower()
    local acc = math.floor(skill)
    local racc = math.floor(skill)
  

    target:delMod(xi.mod.ACC, acc)
    target:delMod(xi.mod.RACC, racc)
   -- local boostACCEffectSize = effect:getPower()
   -- if boostACCEffectSize > 0 then
   --     target:delMod(xi.mod.ACC, effect:getPower())
   -- end

   -- if effect:getSubPower() > 0 then
   --     target:delMod(xi.mod.RACC, effect:getSubPower())
  --  end
end

return effectObject
