-----------------------------------
-- func: buff
-- desc: Toggles buff on the player, granting them several special abilities.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}


local buffOn = function(player)
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
-- player:printToPlayer(string.format('%s %s %s %s',power,regainPower,refreshPower,regenPower))

    player:setCharVar('BuffLvl', player:getMainLvl())
    player:setCharVar('BuffJob', player:getMainJob())
    player:setCharVar('Buff', 1)
    -- Add bonus effects to the player..
    player:addStatusEffect(xi.effect.REGAIN, regainPower, 0, 0)
    player:addStatusEffect(xi.effect.REFRESH, refreshPower, 0, 0)
    player:addStatusEffect(xi.effect.REGEN, regenPower, 0, 0)
        if player:hasStatusEffect(xi.effect.DEDICATION) then
           return
           else
           player:addStatusEffect(xi.effect.DEDICATION, expPower, 3, 0, 0, 30000) -- max 30000 or server crash
        end
    -- Add bonus mods to the player..
    player:addMod(xi.mod.RACC, power)
    player:addMod(xi.mod.RATT, power)
    player:addMod(xi.mod.ACC, power)
    player:addMod(xi.mod.ATT, power)
    player:addMod(xi.mod.MATT, power)
    player:addMod(xi.mod.MACC, power)
    player:addMod(xi.mod.RDEF, power)
    player:addMod(xi.mod.DEF, power)
    player:addMod(xi.mod.MDEF, power)
end

local buffOff = function(player)
local power        = 50
local regainPower  = 25
local refreshPower = 10
local regenPower   = 10
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
   if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 10 then
      power        = 35
      regainPower  = 25
      refreshPower = 10
      regenPower   = 10
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 20 then
      power        = 25
      regainPower  = 15
      refreshPower = 7
      regenPower   = 7
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 30 then
      power        = 15
      regainPower  = 7
      refreshPower = 3
      regenPower   = 3
   end

    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    -- Remove bonus effects..
    player:delStatusEffect(xi.effect.REGAIN)
    player:delStatusEffect(xi.effect.DEDICATION)
    player:delStatusEffect(xi.effect.REFRESH)
    player:delStatusEffect(xi.effect.REGEN)
    -- Remove bonus mods..
    player:delMod(xi.mod.ATT, power)
    player:delMod(xi.mod.RACC, power)
    player:delMod(xi.mod.RATT, power)
    player:delMod(xi.mod.ACC, power)
    player:delMod(xi.mod.MATT, power)
    player:delMod(xi.mod.MACC, power)
    player:delMod(xi.mod.RDEF, power)
    player:delMod(xi.mod.DEF, power)
    player:delMod(xi.mod.MDEF, power)
end


local buffOnCap = function(player)
    player:addStatusEffect(xi.effect.COMMITMENT, 40, 0, 0, 0, 30000)
    player:setCharVar('BuffLvl', player:getMainLvl())
    player:setCharVar('BuffJob', player:getMainJob())
    player:setCharVar('Buff', 2)
end

local buffOffCap = function(player)
    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    player:delStatusEffect(xi.effect.COMMITMENT)
end


commandObj.onTrigger = function(player, tier)
  local mode = utils.clamp(tier or 0, 0, 2)
  local state = player:getCharVar('Buff')
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end

   if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) > 30 then
      player:printToPlayer('You cannot use the option while under the Paragon Challenge Tier 4 and 5.')
   else
        if player:hasStatusEffect(xi.effect.BATTLEFIELD) then
           player:printToPlayer('You cannot use or have !buff in battlefields.')
           return
        else
            if state == 0 and -- add only commitment for lvl 99 
               player:getMainLvl() == 99 then
                if player:hasStatusEffect(xi.effect.COMMITMENT) then
                   return
                   else
                   buffOnCap(player)
                   player:printToPlayer('Buff enabled.')
                end
            elseif state == 0 and -- add dedication and buffs for below 99
                   player:getMainLvl() <= 98 then
                   buffOn(player)
                   player:printToPlayer('Buff enabled.')
            elseif state == 1 then -- remove buff from below 99
                   buffOff(player)
                   player:printToPlayer('Buff disabled.')
            elseif state == 2 then -- remove buff from 99
                   buffOffCap(player)
                   player:printToPlayer('Buff disabled.')
            end
        end
   end
end
return commandObj
