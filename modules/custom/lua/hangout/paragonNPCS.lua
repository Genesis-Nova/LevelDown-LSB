-----------------------------------
require("modules/module_utils")
require('scripts/globals/paragon')
-----------------------------------
local m = Module:new("paragonNPCS")

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)
-- Forward declarations (required)
local menu   = {}
local page1  = {}
local page2  = {}
local page3  = {}
local page4  = {}
local page5  = {}
local page6  = {}
local page7  = {}
local page8  = {}
local page9  = {}
local page10 = {}

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end
    local function addRemoveParagon(player)
        if player:hasStatusEffect(xi.effect.PARAGON) then
           player:delStatusEffect(xi.effect.PARAGON)
        else
           player:addStatusEffectEx(xi.effect.PARAGON, xi.effect.PARAGON, 10, 3, 0)
        end
    end
menu =
{
    title = 'What will you do?',
    options = {},
}
page1 =
{
    {
        'Take on the Challenge',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            local currentQuest = 0
        for i = 1, 22 do
            if playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[i]) > 0 then
               playerArg:setLocalVar('[ParagonQuest]PreStarted',1 + i)
               currentQuest = i
            end
        end
           if playerArg:getLocalVar('[ParagonQuest]PreStarted') > 0 then
              playerArg:printToPlayer('It looks like you already have an active challenge.', 0, 'Paragon Emissar')
              playerArg:printToPlayer('Please complete that challenge or abandon it before starting anew.', 0, 'Paragon Emissar')
              playerArg:printToPlayer(string.format('You are currently participating in a challenge on %s!',jobNameByNum[currentQuest]), 0, 'Paragon Emissar')
           else               
                menu.options = page2
                delaySendMenu(playerArg)
           end
        end,
    },
    {
        'Nevermind!',
        function(player)
        end
    },
}
page2 =
{
    {
        'Yes',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            local paragonTierQuest = 0
            if playerArg:getCharVar('[ParagonModTier1]'..jobNameByNum[playerArg:getMainJob()]) == 0 then
               paragonTierQuest = 10
            elseif playerArg:getCharVar('[ParagonModTier1]'..jobNameByNum[playerArg:getMainJob()]) > 0 and
                   playerArg:getCharVar('[ParagonModTier2]'..jobNameByNum[playerArg:getMainJob()]) == 0 then
               paragonTierQuest = 20
            elseif playerArg:getCharVar('[ParagonModTier2]'..jobNameByNum[playerArg:getMainJob()]) > 0 and
                   playerArg:getCharVar('[ParagonModTier3]'..jobNameByNum[playerArg:getMainJob()]) == 0 then
               paragonTierQuest = 30
            elseif playerArg:getCharVar('[ParagonModTier3]'..jobNameByNum[playerArg:getMainJob()]) > 0 and
                   playerArg:getCharVar('[ParagonModTier4]'..jobNameByNum[playerArg:getMainJob()]) == 0 then
               paragonTierQuest = 40
            elseif playerArg:getCharVar('[ParagonModTier4]'..jobNameByNum[playerArg:getMainJob()]) > 0 and
                   playerArg:getCharVar('[ParagonModTier5]'..jobNameByNum[playerArg:getMainJob()]) == 0 then
               paragonTierQuest = 50
            end
            playerArg:printToPlayer(string.format('%s! Your level has been reset to 1.',playerArg:getName()),  xi.msg.channel.SYSTEM_3)
            playerArg:injectActionPacket(playerArg:getID(), 4, 509, 0, 0, 185, 10, 1)
            playerArg:setLevel(1)
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], paragonTierQuest)
            local buffOff = function(playerArg)
                    playerArg:setCharVar('Buff', 0)
                    playerArg:setCharVar('BuffLvl', 0)
                    playerArg:setCharVar('BuffJob', 0)
                            local power        = 50
                            local regainPower  = 25
                            local refreshPower = 10
                            local regenPower   = 10
                            local jobNameByNum = {}
                                for k, v in pairs(xi.job) do
                                    jobNameByNum[v] = k
                                end
   if playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 10 then
      power        = 35
      regainPower  = 25
      refreshPower = 10
      regenPower   = 10
   elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 20 then
      power        = 25
      regainPower  = 15
      refreshPower = 7
      regenPower   = 7
   elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 30 then
      power        = 15
      regainPower  = 7
      refreshPower = 3
      regenPower   = 3
   end

    playerArg:setCharVar('Buff', 0)
    playerArg:setCharVar('BuffLvl', 0)
    playerArg:setCharVar('BuffJob', 0)
    -- Remove bonus effects..
    playerArg:delStatusEffect(xi.effect.REGAIN)
    playerArg:delStatusEffect(xi.effect.DEDICATION)
    playerArg:delStatusEffect(xi.effect.REFRESH)
    playerArg:delStatusEffect(xi.effect.REGEN)
    -- Remove bonus mods..
    playerArg:delMod(xi.mod.ATT, power)
    playerArg:delMod(xi.mod.RACC, power)
    playerArg:delMod(xi.mod.RATT, power)
    playerArg:delMod(xi.mod.ACC, power)
    playerArg:delMod(xi.mod.MATT, power)
    playerArg:delMod(xi.mod.MACC, power)
    playerArg:delMod(xi.mod.RDEF, power)
    playerArg:delMod(xi.mod.DEF, power)
    playerArg:delMod(xi.mod.MDEF, power)
end

local buffOffCap = function(playerArg)
    playerArg:setCharVar('Buff', 0)
    playerArg:setCharVar('BuffLvl', 0)
    playerArg:setCharVar('BuffJob', 0)
    playerArg:delStatusEffect(xi.effect.COMMITMENT)
end
                      if playerArg:getCharVar('BuffLvl') < playerArg:getMainLvl() and
                         playerArg:getCharVar('Buff') == 1 then
                         playerArg:setCharVar('BuffLvl', playerArg:getMainLvl())
                      end
                      if playerArg:getCharVar('BuffLvl') == 99 and
                         playerArg:getCharVar('Buff') == 1 then
                                playerArg:printToplayerArg('Buff disabled.')
                                buffOff(playerArg)
                      end
                      if playerArg:getCharVar('BuffJob') ~= playerArg:getMainJob() and
                         playerArg:getCharVar('Buff') == 1 then
                                playerArg:printToplayerArg('Buff disabled.')
                                buffOff(playerArg)
                      end
                      if playerArg:getCharVar('BuffJob') ~= playerArg:getMainJob() and
                         playerArg:getCharVar('Buff') == 2 then
                                playerArg:printToplayerArg('Buff disabled.')
                                buffOffCap(playerArg)
                      end


         end,
    },
    {
        'No',
        function(playerArg)
           menu.options = page1
           delaySendMenu(playerArg)
        end,
    },
}
page3 =
{
    {
        'Nevermind!',
        function(player)
        end
    },
    {
        'STR +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..18))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'DEX +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..19))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'VIT +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..20))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'AGI +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..21))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'INT +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..22))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'MND +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..23))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'Next Page.',
        function(playerArg)
           menu.options = page4
           delaySendMenu(playerArg)
        end,
    },

}
page4 =
{
    {
        'Previous Page.',
        function(playerArg)
           menu.options = page3
           delaySendMenu(playerArg)
        end,
    },
    {
        'CHR +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..24))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'ATT +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..33))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'RATT +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..34))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'ACC +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..35))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'RACC +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..36))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'MATT +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..38))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
    {
        'MACC +5',
        function(playerArg)
        local jobNameByNum = {}
          for k, v in pairs(xi.job) do
              jobNameByNum[v] = k
          end
        playerArg:setCharVar('[ParagonChoice]', tonumber(playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()])..40))
                           menu.options = page6
                           delaySendMenu(playerArg)
        end,
    },
}

page6 =
{
    {
        'Yes i am sure!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            local modNameByNum = {}
                for k, v in pairs(xi.mod) do
                  modNameByNum[v] = k
                end
        local number = tostring(playerArg:getCharVar('[ParagonChoice]'))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end

            local paragonTier = result[1].. result[2]
            local paragonMod = result[3].. result[4]

            local playerJob = playerArg:getMainJob() +10
            playerArg:printToPlayer(string.format('Congratulations, You have gained the Paragon Effect %s +5',modNameByNum[tonumber(paragonMod - 10)]),  xi.msg.channel.SYSTEM_3)
            playerArg:injectActionPacket(playerArg:getID(), 6, 290, 0, 0, 0, 10, 1)
            if playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 10 then
               playerArg:setCharVar('[ParagonModTier1]'..jobNameByNum[playerArg:getMainJob()], tonumber(playerJob..playerArg:getCharVar('[ParagonChoice]')))
            elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 20 then
                   playerArg:setCharVar('[ParagonModTier2]'..jobNameByNum[playerArg:getMainJob()], tonumber(playerJob..playerArg:getCharVar('[ParagonChoice]')))
            elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 30 then
                   playerArg:setCharVar('[ParagonModTier3]'..jobNameByNum[playerArg:getMainJob()], tonumber(playerJob..playerArg:getCharVar('[ParagonChoice]')))
            elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 40 then
                   playerArg:setCharVar('[ParagonModTier4]'..jobNameByNum[playerArg:getMainJob()], tonumber(playerJob..playerArg:getCharVar('[ParagonChoice]')))
            elseif playerArg:getCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()]) == 50 then
                   playerArg:setCharVar('[ParagonModTier5]'..jobNameByNum[playerArg:getMainJob()], tonumber(playerJob..playerArg:getCharVar('[ParagonChoice]')))
            end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 0)
            playerArg:setCharVar('[ParagonChoice]', 0)
            addRemoveParagon(playerArg)
            -- playerArg:timer(2000, function(playerArgX)
            -- playerArgX:setPos(playerArgX:getXPos(), playerArgX:getYPos(), playerArgX:getZPos(), playerArgX:getRotPos(), playerArgX:getZoneID())
            -- end)
        end
        end,
    },
    {
        'Let me think about it!',
        function(playerArg)
            playerArg:setCharVar('[ParagonChoice]', 0)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
}
page7 =
{
    {
        'Nevermind!',
        function(playerArg)
            playerArg:addGil(5000000)
        end,
    },
    {
        'Tier 1 Mod!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 10)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
    {
        'Tier 2 Mod!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 20)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
    {
        'Tier 3 Mod!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 30)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
    {
        'Tier 4 Mod!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 40)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
    {
        'Tier 5 Mod!',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 50)
                           menu.options = page3
                           delaySendMenu(playerArg)
        end,
    },
}
page8 =
{
    {
        'Abandon Challenge.',
        function(playerArg)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
            playerArg:injectActionPacket(playerArg:getID(), 4, 510, 0, 0, 185, 10, 1)
            playerArg:setCharVar('[ParagonQuest]'..jobNameByNum[playerArg:getMainJob()], 0)
            playerArg:setLevel(99)
        end,
    },
    {
        'Nevermind!',
        function(playerArg)
        end,
    },
}
page9 =
{
    {
        'Medadas ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26225)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        ' Gurebus ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26226)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        'Cornelias ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26227)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        'Ragelises ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26228)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        'Lehkos ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26229)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        'Fickblixs ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26230)
           menu.options = page10
            delaySendMenu(player)
         end
    },
    {
        'Ephramads ring',
         function(player)
           player:setLocalVar('[Paragon]Reward', 26231)
           menu.options = page10
            delaySendMenu(player)
         end
    },
}
page10 =
{
    {
        'Obtain Ring?.',
        function(playerArg)
         local reward = playerArg:getLocalVar('Paragon]Reward')
               if playerArg:hasItem(reward) or
               playerArg:getFreeSlotsCount() < 1 then
               playerArg:printToPlayer('Please check your inventory and try again!')
               playerArg:setLocalVar('[Paragon]Reward', 0)
               return
               else
               npcUtil.giveItem(playerArg, reward)
               playerArg:setCharVar('[ParagonReward]', 2)
               end
        end,
    },
    {
        'Nevermind!',
        function(playerArg)
                           menu.options = page9
                           delaySendMenu(playerArg)
        end,
    },
}
local function isMaster(player)
local master = false
      if player:getSpentJobPoints() == 2100 then
      master = true
      end
    return master
end

local function completedParagonChallenges(player)
        player:setLocalVar('[ParagonQuest]Completed', 0)
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
        for i = 1, 22 do
            if player:getCharVar('[ParagonModTier1]'..jobNameByNum[i]) > 0 then
               player:setLocalVar('[ParagonQuest]Completed',player:getLocalVar('[ParagonQuest]Completed') + 1)

            end
        end
        for i = 1, 22 do
            if player:getCharVar('[ParagonModTier2]'..jobNameByNum[i]) > 0 then
               player:setLocalVar('[ParagonQuest]Completed',player:getLocalVar('[ParagonQuest]Completed') + 1)

            end
        end
        for i = 1, 22 do
            if player:getCharVar('[ParagonModTier3]'..jobNameByNum[i]) > 0 then
               player:setLocalVar('[ParagonQuest]Completed',player:getLocalVar('[ParagonQuest]Completed') + 1)

            end
        end
        for i = 1, 22 do
            if player:getCharVar('[ParagonModTier4]'..jobNameByNum[i]) > 0 then
               player:setLocalVar('[ParagonQuest]Completed',player:getLocalVar('[ParagonQuest]Completed') + 1)

            end
        end
        for i = 1, 22 do
            if player:getCharVar('[ParagonModTier5]'..jobNameByNum[i]) > 0 then
               player:setLocalVar('[ParagonQuest]Completed',player:getLocalVar('[ParagonQuest]Completed') + 1)

            end
        end
end

    local ParagonNPC = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Paragon Emissar',
        look = '0000860A00000000000000000000000000000000',
        x = 399.1610,
        y = -3.4000,
        z = -520.7460,
        rotation = 105,
        widescan = 1,

     onTrade = function(player, npc, trade)
            if npcUtil.tradeHas(trade, xi.item.GIL) then
               local count = trade:getItemQty(65535)
               if count ~= 5000000 then
                  return
               else
               player:tradeComplete()
               player:printToPlayer('So you wish to change your Paragon Effect? Please select which Tier you wish to change.', 0, npc:getPacketName())
               player:timer(250, function(playerArg)
                        menu.options = page7
                        delaySendMenu(playerArg)
               end)
               end
            end
     end,

  onTrigger = function(player, npc)
          local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end
        local paragonOne    = player:getCharVar('[ParagonModTier1]'..jobNameByNum[player:getMainJob()])
        local paragonTwo    = player:getCharVar('[ParagonModTier2]'..jobNameByNum[player:getMainJob()])
        local paragonThree  = player:getCharVar('[ParagonModTier3]'..jobNameByNum[player:getMainJob()])
        local paragonFour   = player:getCharVar('[ParagonModTier4]'..jobNameByNum[player:getMainJob()])
        local paragonFive   = player:getCharVar('[ParagonModTier5]'..jobNameByNum[player:getMainJob()])
        local paragonAccept = player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()])


    if player:getGMLevel() > 0 then
        if isMaster(player) == false and
               paragonAccept == 0 then
               player:printToPlayer('You are not ready to take on the Paragon Chellenges, You must be a Master in your current job.', 0, npc:getPacketName())
        elseif isMaster(player) == false and
               paragonAccept > 0 then
               player:printToPlayer(string.format('Welcome %s! It appears you are currently involved in a Paragon Challenge!', player:getName()), 0, npc:getPacketName())
                        menu.options = page8
                        delaySendMenu(player)
        elseif isMaster(player) == true and
               paragonAccept == 0 then
                      if paragonOne == 0 then
                        player:printToPlayer(string.format('Welcome %s! I see you are ready to take on the Paragon Challenges.', player:getName()), 0, npc:getPacketName())
                        menu.options = page1
                        delaySendMenu(player)
                      elseif paragonOne > 0 and
                        paragonTwo == 0 then
                        player:printToPlayer(string.format('Welcome back %s! I see you are ready to take on the second Paragon Challenge.', player:getName()), 0, npc:getPacketName())
                        menu.options = page1
                        delaySendMenu(player)
                      elseif paragonTwo > 0 and
                        paragonThree == 0 then
                        player:printToPlayer(string.format('Welcome back %s! I see you are ready to take on the third Paragon Challenge.', player:getName()), 0, npc:getPacketName())
                        menu.options = page1
                        delaySendMenu(player)
                      elseif paragonThree > 0 and
                        paragonFour == 0 then
                        player:printToPlayer(string.format('Welcome back %s! I see you are ready to take on the fourth Paragon Challenge.', player:getName()), 0, npc:getPacketName())
                        menu.options = page1
                        delaySendMenu(player)
                      elseif paragonFour > 0 and
                        paragonFive == 0 then
                        player:printToPlayer(string.format('Welcome back %s! I see you are ready to take on the fifth Paragon Challenge.', player:getName()), 0, npc:getPacketName())
                        menu.options = page1
                        delaySendMenu(player)
                      elseif paragonFive > 0 then
                        player:printToPlayer(string.format('Welcome back %s! Currently there are no more Paragon Challenges at this time for this job.', player:getName()), 0, npc:getPacketName())
                      end
        elseif isMaster(player) == true and
               paragonAccept > 0 then
               if player:getMainLvl() == 99 and
                  paragonOne == 0 then
                      player:printToPlayer(string.format('Congratulations %s! It appears you have completed the Tier 1 Paragon Challenge. Please choose your reward!', player:getName()), 0, npc:getPacketName())
                      menu.options = page3
                      delaySendMenu(player)
               elseif player:getMainLvl() == 99 and
                      paragonOne > 0 and
                      paragonTwo == 0 then
                           player:printToPlayer(string.format('Congratulations %s! It appears you have completed the Tier 2 Paragon Challenge. Please choose your reward!', player:getName()), 0, npc:getPacketName())
                           menu.options = page3
                           delaySendMenu(player)
               elseif player:getMainLvl() == 99 and
                      paragonTwo > 0 and
                      paragonThree == 0 then
                           player:printToPlayer(string.format('Congratulations %s! It appears you have completed the Tier 3 Paragon Challenge. Please choose your reward!', player:getName()), 0, npc:getPacketName())
                           menu.options = page3
                           delaySendMenu(player)
               elseif player:getMainLvl() == 99 and
                      paragonThree > 0 and
                      paragonFour == 0 then
                           player:printToPlayer(string.format('Congratulations %s! It appears you have completed the Tier 4 Paragon Challenge. Please choose your reward!', player:getName()), 0, npc:getPacketName())
                           menu.options = page3
                           delaySendMenu(player)
               elseif player:getMainLvl() == 99 and
                      paragonFour > 0 and
                      paragonFive == 0 then
                           player:printToPlayer(string.format('Congratulations %s! It appears you have completed the Tier 5 Paragon Challenge. Please choose your reward!', player:getName()), 0, npc:getPacketName())
                           menu.options = page3
                           delaySendMenu(player)
               end
        end
    else
                           player:printToPlayer(string.format('This content is under construction for testing, You are not a GM so be patient', player:getName()), 0, npc:getPacketName())
    end
    end,
    })
    utils.unused(ParagonNPC)
    local chesta = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Paragon Rewards',
        look = '0000F40500000000000000000000000000000000',
        x         = 398.2542,
        y         = -3.4000,
        z         = -519.1542,
        rotation = 91,
        widescan = 1,
        onTrade = function(player, npc, trade)
        end,
        onTrigger = function(player, npc)
        completedParagonChallenges(player)
        local completed = player:getLocalVar('[ParagonQuest]Completed')
     --   player:printToPlayer(string.format('%s', completed))

        if completed >= 10 and completed <= 24 and player:getCharVar('[ParagonReward]') == 0 then
            npcUtil.giveItem(player, 26117) -- Crepuscular earring
            player:setCharVar('[ParagonReward]', 1)
            player:printToPlayer(string.format('%s has been awarded Crepuscular Earring.',player:getName()),  xi.msg.channel.SYSTEM_3)
        elseif completed >= 25 and completed <= 49 and player:getCharVar('[ParagonReward]') == 1 then
                           menu.options = page9
                           delaySendMenu(player)
        elseif completed >= 50 and completed <= 99 and player:getCharVar('[ParagonReward]') == 2 then
            player:setCharVar('[ParagonReward]', 3)
            player:addSpell(998)
            player:printToPlayer(string.format('%s has gained the ability to call Ygnas to fight by his side.',player:getName()),  xi.msg.channel.SYSTEM_3)
        elseif completed >= 100 and completed <= 109 and player:getCharVar('[ParagonReward]') == 3 then
            player:setCharVar('[ParagonReward]', 4)
            player:addSpell(1003)
            player:printToPlayer(string.format('%s has gained the ability to call Matsui-P to fight by his side.',player:getName()),  xi.msg.channel.SYSTEM_3)
        elseif completed == 110 and player:getCharVar('[ParagonReward]') == 4 then
            player:setCharVar('[ParagonReward]', 5)
            player:addSpell(984)
            player:printToPlayer(string.format('%s has gained the ability to call August to fight by his side.',player:getName()),  xi.msg.channel.SYSTEM_3)
        end
        end,
    })
    chesta:hideName(true)
    utils.unused(chesta)
    local chestb = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Paragon Rewards',
        look = '0000F40500000000000000000000000000000000',
        x         = 400.5340,
        y         = -3.4000,
        z         = -522.4309,
        rotation = 116,
        widescan = 1,
        onTrade = function(player, npc, trade)
        end,
        onTrigger = function(player, npc)
        end,
    })
    chestb:hideName(true)
    utils.unused(chestb)
end)

return m