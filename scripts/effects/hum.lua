-----------------------------------
-- xi.effect.HUM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local equipItem = target:getEquipID(xi.slot.BODY)
          effect:setIcon(xi.effect.NONE)
          target:setCharVar('[GearAura]', equipItem)
end

effectObject.onEffectTick = function(target, effect)
  local party = target:getParty()
 for _, member in ipairs(party) do
  if member:checkDistance(target) <= 10 then
     if member:getCharVar('[BodyAura]') == 0 then
        if member ~= target then
           member:addStatusEffect(xi.effect.ENSPHERE,10,3, 6000000)
        end
     end
  elseif member:checkDistance(target) > 10 and
         member:hasStatusEffect(xi.effect.ENSPHERE) then
         member:delStatusEffect(xi.effect.ENSPHERE)
         member:setCharVar('[BodyAura]', 0)
  end
 end
end

effectObject.onEffectLose = function(target, effect)
target:delStatusEffect(xi.effect.HUM)
target:setCharVar('[GearAura]', 0)
end

return effectObject