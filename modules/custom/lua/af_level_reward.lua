-----------------------------------
-- AF Reward
-----------------------------------
require('modules/module_utils')
require('scripts/globals/mobs')
require('scripts/globals/player')
require('scripts/enum/job_names')
-----------------------------------
local m = Module:new('af_level_reward')

local jobAFTable =
{

            [ 1] = -- War
            {
               [52] = { 14089},  -- 
               [54] = { 13961},  -- 
               [56] = { 12511},  -- 
               [58] = { 14214},  -- 
               [60] = { 12638},  -- 
            },
            [ 2] = -- Mnk
            {
               [52] = { 14090},  -- 
               [54] = { 13962},  -- 
               [56] = { 12512},  -- 
               [58] = { 12639},  -- 
               [60] = { 14215},  -- 
            },
            [ 3] = -- Whm
            {
               [52] = { 14091},  -- 
               [54] = { 13855},  -- 
               [56] = { 14216},  -- 
               [58] = { 12640},  -- 
               [60] = { 13963},  -- 
            },
            [ 4] = -- Blm
            {
               [52] = { 14092},  -- 
               [54] = { 13964},  -- 
               [56] = { 14217},  -- 
               [58] = { 12641},  -- 
               [60] = { 13856},  -- 
            },
            [ 5] = -- Rdm
            {
               [52] = { 14093},  -- 
               [54] = { 13965},  -- 
               [56] = { 14218},  -- 
               [58] = { 12642},  -- 
               [60] = { 12513},  -- 
            },
            [ 6] = -- Thf
            {
               [52] = { 13966},  -- 
               [54] = { 12514},  -- 
               [56] = { 14219},  -- 
               [58] = { 12643},  -- 
               [60] = { 14094},  -- 
            },
            [ 7] = -- Pld
            {
               [52] = { 14095},  -- 
               [54] = { 13967},  -- 
               [56] = { 12515},  -- 
               [58] = { 14220},  -- 
               [60] = { 12644},  -- 
            },
            [ 8] = -- Drk
            {
               [52] = { 14096},  -- 
               [54] = { 13968},  -- 
               [56] = { 14221},  -- 
               [58] = { 12645},  -- 
               [60] = { 12516},  -- 
            },
            [ 9] = -- Bst
            {
               [52] = { 14097},  -- 
               [54] = { 13969},  -- 
               [56] = { 12517},  -- 
               [58] = { 12646},  -- 
               [60] = { 14222},  -- 
            },
            [10] = -- Brd
            {
               [52] = { 14098},  -- 
               [54] = { 13857},  -- 
               [56] = { 14223},  -- 
               [58] = { 12647},  -- 
               [60] = { 13970},  -- 
            },
            [11] = -- Rng
            {
               [52] = { 13971},  -- 
               [54] = { 12518},  -- 
               [56] = { 14224},  -- 
               [58] = { 12648},  -- 
               [60] = { 14099},  -- 
            },
            [12] = -- Sam
            {
               [52] = { 14100},  -- 
               [54] = { 14225},  -- 
               [56] = { 13972},  -- 
               [58] = { 13781},  -- 
               [60] = { 13868},  -- 
            },
            [13] = -- Nin
            {
               [52] = { 14226},  -- 
               [54] = { 14101},  -- 
               [56] = { 13869},  -- 
               [58] = { 13782},  -- 
               [60] = { 13973},  -- 
            },
            [14] = -- Drg
            {
               [52] = { 14227},  -- 
               [54] = { 14102},  -- 
               [56] = { 13974},  -- 
               [58] = { 12649},  -- 
               [60] = { 12519},  -- 
            },
            [15] = -- Smn
            {
               [52] = { 14228},  -- 
               [54] = { 13975},  -- 
               [56] = { 14103},  -- 
               [58] = { 12650},  -- 
               [60] = { 12520},  -- 
            },
            [16] = -- Blu
            {
               [52] = { 15684},  -- 
               [54] = { 15600},  -- 
               [56] = { 14928},  -- 
               [58] = { 14521},  -- 
               [60] = { 15265},  -- 
            },
            [17] = -- Cor
            {
               [52] = { 15601},  -- 
               [54] = { 14929},  -- 
               [56] = { 15685},  -- 
               [58] = { 14522},  -- 
               [60] = { 15266},  -- 
            },
            [18] = -- Pup
            {
               [52] = { 15602},  -- 
               [54] = { 15686},  -- 
               [56] = { 14930},  -- 
               [58] = { 14523},  -- 
               [60] = { 15267},  -- 
            },
            [19] = -- Dnc
            {
               [52] = { 15002},  -- 15003
               [54] = { 16138},  -- 16139
               [56] = { 15746},  -- 15747
               [58] = { 15659},  -- 15660
               [60] = { 14578},  -- 14579
            },
            [20] = -- Sch
            {
               [52] = { 15004},  -- 
               [54] = { 15748},  -- 
               [56] = { 16311},  -- 
               [58] = { 14580},  -- 
               [60] = { 16140},  -- 
            },
            [21] = -- Geo
            {
               [52] = { 16143},  --
               [54] = { 14583},  --
               [56] = { 15007},  --
               [58] = { 16314},  --
               [60] = { 15751},  --
            },
            [22] = -- Run
            {
               [52] = { 16143},  --
               [54] = { 14583},  --
               [56] = { 15007},  --
               [58] = { 16314},  --
               [60] = { 15751},  --
            },
}

m:addOverride('xi.player.onPlayerLevelUp', function(player, option, id)
    local levelMilestones = player:getJobLevel(player:getMainJob()) -- player:getMainLvl()
    local gender = player:getGender()                        -- Female: 0, Male: 1
    local job = player:getMainJob()
    local mlvl = player:getJobLevel(job)
    local sbjob = player:getSubJob()
    local slvl = player:getJobLevel(sbjob)
      --    player:capAllSkills()

            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
  if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getSubJob()]) == 0 then
    if slvl < 50 then
        if slvl < mlvl then
            if slvl >= mlvl - 5 then
               player:setsLevel(slvl + 1)
               player:printToPlayer(string.format('%s attains sublevel %s', player:getName() , slvl +1),xi.msg.channel.SYSTEM_3)
            end
        end
    end
  end

            if mlvl == 52 or mlvl == 54 or mlvl == 56 or mlvl == 58 or mlvl == 60 then
                local itemData = jobAFTable[job][mlvl]
                local itemId = itemData[1]

               if job == 19 and gender == 0 then
                          if player:getFreeSlotsCount() < 1 then
                             player:printToPlayer('Your inventory is full and the armor has been sent to your delivery box!',xi.msg.channel.SYSTEM_3)
                             SendItemToDeliveryBox(player:getName(), itemId, 1,'LevelDown')
                          else
                             player:printToPlayer(string.format('%s has obtained Artifact Armor as a reward for achieving Level %s.',player:getName(),levelMilestones),xi.msg.channel.SYSTEM_3)
                             npcUtil.giveItem(player, { { itemId +1, 1 } })
                          end
               else
                          if player:getFreeSlotsCount() < 1 then
                             player:printToPlayer('Your inventory is full and the armor has been sent to your delivery box!',xi.msg.channel.SYSTEM_3)
                             SendItemToDeliveryBox(player:getName(), itemId, 1,'LevelDown')
                          else
                             player:printToPlayer(string.format('%s has obtained Artifact Armor as a reward for achieving Level %s.',player:getName(),levelMilestones),xi.msg.channel.SYSTEM_3)
                             npcUtil.giveItem(player, { { itemId, 1 } })
                          end
               end
            end

local buffOff = function(player)
    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
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

local buffOffCap = function(player)
    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    player:delStatusEffect(xi.effect.COMMITMENT)
end
                      if player:getCharVar('BuffLvl') < player:getMainLvl() and
                         player:getCharVar('Buff') == 1 then
                         player:setCharVar('BuffLvl', player:getMainLvl())
                      end
                      if player:getCharVar('BuffLvl') == 99 and
                         player:getCharVar('Buff') == 1 then
                                player:printToPlayer('Buff disabled.')
                                buffOff(player)
                      end
                      if player:getCharVar('BuffJob') ~= player:getMainJob() and
                         player:getCharVar('Buff') == 1 then
                                player:printToPlayer('Buff disabled.')
                                buffOff(player)
                      end
                      if player:getCharVar('BuffJob') ~= player:getMainJob() and
                         player:getCharVar('Buff') == 2 then
                                player:printToPlayer('Buff disabled.')
                                buffOffCap(player)
                      end



    super(player)
end)
return m
