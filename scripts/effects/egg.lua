-----------------------------------
-- xi.effect.EGG
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)


              if target:getCharVar('NakedRun') > 0 then
                 target:setLevel(1)
                    target:timer(120, function(targetArg)
                    
                       for i = xi.slot.MAIN, xi.slot.BACK do
                           targetArg:unequipItem(i)
                           target:setMod(xi.mod.MOVE_SPEED_OVERIDE, 255)
                           target:setSpeed(255)
                       end
                    end)
              end
            target:addListener('TICK', 'NAKEDRUN_TICK', function(target)
                       for i = xi.slot.MAIN, xi.slot.BACK do
                           if target:getEquipID(i) > 1 then
                           target:unequipItem(i)
                           end
                       end
            end)
end

effectObject.onEffectTick = function(target, effect)
              
end

effectObject.onEffectLose = function(target, effect)
local ExistLvl = tonumber(target:getCharVar('NakedRun'))
                      target:setLevel(ExistLvl)
                      target:delMod(xi.mod.MOVE_SPEED_OVERIDE, 255)
                      target:setSpeed(80)
                      target:setCharVar('NakedRun', 0)
                      target:removeListener('NAKEDRUN_TICK')
end

return effectObject
