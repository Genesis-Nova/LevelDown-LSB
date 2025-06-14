-----------------------------------
-- xi.effect.BATTLEFIELD
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if target:getPet() then
        target:getPet():addStatusEffect(effect)
    end

    if target:getObjType() == xi.objType.PC then
        target:clearTrusts()
    end
    ---------- leveldown custom change for buff
local buffOff = function(target)
    target:setCharVar('Buff', 0)
    target:setCharVar('BuffLvl', 0)
    target:setCharVar('BuffJob', 0)
    -- Remove bonus effects..
    target:delStatusEffect(xi.effect.REGAIN)
    target:delStatusEffect(xi.effect.DEDICATION)
    target:delStatusEffect(xi.effect.REFRESH)
    target:delStatusEffect(xi.effect.REGEN)
    -- Remove bonus mods..
    target:delMod(xi.mod.ATT, 50)
    target:delMod(xi.mod.RACC, 50)
    target:delMod(xi.mod.RATT, 50)
    target:delMod(xi.mod.ACC, 50)
    target:delMod(xi.mod.MATT, 50)
    target:delMod(xi.mod.MACC, 50)
    target:delMod(xi.mod.RDEF, 50)
    target:delMod(xi.mod.DEF, 50)
    target:delMod(xi.mod.MDEF, 50)
end
local buffOffCap = function(player)
    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    player:delStatusEffect(xi.effect.COMMITMENT)
end
                            if target:getMainLvl() ~= 99 and
                               target:getCharVar('Buff') == 1 then
                               buffOff(target)
                               target:printToPlayer('Buff disabled.')
                               target:printToPlayer('You cannot use or have !buff in battlefields.')
                            elseif target:getMainLvl() == 99 and
                                   target:getCharVar('Buff') == 2 then
                                   buffOffCap(target)
                                   target:printToPlayer('Buff disabled.')
                                   target:printToPlayer('You cannot use or have !buff in battlefields.')
                            end



end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet then
        pet:delStatusEffect(xi.effect.BATTLEFIELD)
        pet:leaveBattlefield(1)
    end

    target:setLocalVar('[battlefield]area', 0)
end

return effectObject
