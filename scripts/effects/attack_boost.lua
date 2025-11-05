-----------------------------------
-- xi.effect.ATTACK_BOOST
--
-- getPower()       = ATTP
-- getSubPower()    = RATTP
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
	local skill = effect:getPower()
    local attp = math.floor(skill * 0.1)
    local rattp = math.floor(skill * 0.1)
  

    target:addMod(xi.mod.ATTP, attp)
    target:addMod(xi.mod.RATTP, rattp)
    --if effect:getPower() > 100 then --normalize values(?)
    --    effect:setPower(50)
   -- end
--target:addMod(xi.mod.ATTP, effect:getPower())

   -- if effect:getSubPower() > 100 then --normalize values(?)
   --     effect:setSubPower(50)
   -- end

   
  --  if effect:getSubPower() > 0 then
 --   target:addMod(xi.mod.RATT, effect:getSubPower())
  --  end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
	local skill = effect:getPower()
    local attp = math.floor(skill * 0.1)
    local rattp = math.floor(skill * 0.1)
  

    target:delMod(xi.mod.ATTP, attp)
    target:delMod(xi.mod.RATTP, rattp)

   -- target:delMod(xi.mod.ATTP, effect:getPower())
    --if effect:getSubPower() > 0 then
    --    target:delMod(xi.mod.RATTP, effect:getSubPower())
   -- end
end

return effectObject
