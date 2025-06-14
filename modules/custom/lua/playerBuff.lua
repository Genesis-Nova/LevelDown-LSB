-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------

local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end

ensureTable(("xi.zones.effects.buff")

local m = Module:new("playerBuff")

local function checkParagon(player)
    local power        = 50
    local regainPower  = 25
    local refreshPower = 10
    local regenPower   = 10
    local expPower     = 500

    local jobNameByNum = {}
        for k, v in pairs(xi.job) do
            jobNameByNum[v] = k
        end

   if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 10 then
       power        = 35
       regainPower  = 25
       refreshPower = 10
       regenPower   = 10
       expPower     = 350
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 20 then
       power        = 25
       regainPower  = 15
       refreshPower = 7
       regenPower   = 7
       expPower     = 250
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 30 then
       power        = 15
       regainPower  = 7
       refreshPower = 3
       regenPower   = 3
       expPower     = 100
   end

   return power, regainPower, refreshPower, regenPower, expPower
end

local buffs =
    {
        { xi.mod.REFRESH, refreshPower },
        { xi.mod.REGEN, regenPower },
        { xi.mod.REGAIN, regainPower },
        { xi.mod.RACC, power },
        { xi.mod.RACC, power },
        { xi.mod.RATT, power },
        { xi.mod.ACC, power },
        { xi.mod.ATT, power },
        { xi.mod.MATT, power },
        { xi.mod.MACC, power },
        { xi.mod.RDEF, power },
        { xi.mod.DEF, power },
        { xi.mod.MDEF, power },
    }

local buffOn = function(player)
    player:setCharVar('Buff', 1)
    checkParagon(player)

    if player:hasStatusEffect(xi.effect.DEDICATION) then
        return
    else
        player:addStatusEffect(xi.effect.DEDICATION, expPower, 3, 0, 0, 30000) -- max 30000 or server crash
    end

    for _, mod in pairs(buffs) do
        player:addMod(mod[1], mod[2])
    end
end

local buffOff = function(player)
    player:setCharVar('Buff', 0)
    checkParagon(player)
    -- Remove bonus effects..
    player:delStatusEffect(xi.effect.DEDICATION)

    for _, mod in pairs(buffs) do
        player:delMod(mod[1], mod[2])
    end
end

m:addOverride('xi.zones.effects.buff.onEffectGain', function(target, effect)
    local state = player:getCharVar('Buff')

    local jobNameByNum = {}
        for k, v in pairs(xi.job) do
            jobNameByNum[v] = k
        end

    if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) > 30 then
        player:printToPlayer('You cannot use the option while under the Paragon Challenge Tier 4 and 5.')
        return
    end

    if player:hasStatusEffect(xi.effect.BATTLEFIELD) then
        player:printToPlayer('You cannot use or have !buff in battlefields.')
        return
    end

    if player:getMainLvl() == 99 then
        player:printToPlayer('Buff cannot be used at level 99.')
        return
    end

    if state == 0 and -- add dedication and buffs for below 99
        player:getMainLvl() <= 98 then
            buffOn(player)
            player:printToPlayer('Buff enabled.')
    end

end)

m:addOverride('xi.zones.effects.buff.onEffectTick', function(target, effect)

end)

m:addOverride('xi.zones.effects.buff.onEffectLose', function(target, effect)


    if state == 1 then -- remove buff from below 99
        buffOff(player)
        player:printToPlayer('Buff disabled.')
    end
end)


return m
