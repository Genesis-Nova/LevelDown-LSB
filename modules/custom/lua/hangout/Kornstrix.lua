-------------------------------
require("modules/module_utils")
-------------------------------
local m = Module:new("Kornstrix")


m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize',function(zone)
    super(zone)

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end

local function createKornMainMenu(player, page)
    local mainMenu     = { 'Daily Tally Points','[1000 Points] Materials', '[1500 Points] Job Cards', '[1500 Points] Job Shards'}
                         --  Job Cards    Head Shards  Torso Shards  Hand Shards   Leg Shards    Feet Shards   Mats          Mats
    local itemIds      = {{ 9281, 9302}, {9544, 9565}, {9588, 9609}, {9632, 9653}, {9676, 9697}, {9720, 9741}, {9002, 9009}, {9061, 9064}}
    local linesPerPage = 4
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainMenu)
    local options = {}
    for i = startIndex, endIndex do
        local menu = mainMenu[i]
        table.insert(options, {
            string.format('%s', menu),
            function(player)
               local dailyTallyPoints = player:getCurrency('daily_tally')
                  for items = 1, #itemIds do
                      if string.find(menu, 'Cards') then
                            if dailyTallyPoints >= 1500 then
                                npcUtil.giveItem(player,{{math.random(itemIds[1][1],itemIds[1][2]), 1}})
                                player:delCurrency('daily_tally', 1500)
                                return
                            else
                                player:printToPlayer('You do not have enough points item to proceed with this exchange.', 0, 'Kornstrix')
                                return
                            end
                      elseif string.find(menu, 'Shards') then
                            local shard = math.random(2,5)
                            if dailyTallyPoints >= 1500 then
                                npcUtil.giveItem(player,{{math.random(itemIds[shard][1],itemIds[shard][2]), 1}})
                                player:delCurrency('daily_tally', 1500)
                                return
                            else
                                player:printToPlayer('You do not have enough points item to proceed with this exchange.', 0, 'Kornstrix')
                                return
                            end
                      elseif string.find(menu, 'Materials') then
                            local mats       = math.random(7,8)
                            local randomItem = math.random(itemIds[mats][1],itemIds[mats][2])
                            if dailyTallyPoints >= 1000 then
                                if randomItem == 9008 then -- Befouled Water
                                   npcUtil.giveItem(player,{{8739, 1}})    -- wryn blood
                                   return
                                else
                                   npcUtil.giveItem(player,{{randomItem, 1}})
                                   player:delCurrency('daily_tally', 1000)
                                   return
                                end
                            else
                                player:printToPlayer('You do not have enough points item to proceed with this exchange.', 0, 'Kornstrix')
                                return
                            end
                      elseif string.find(menu, 'Tally') then
                                player:printToPlayer(string.format('Your Current Daily Tally Points are [%s]', dailyTallyPoints),  xi.msg.channel.SYSTEM_3)
                                return
                      end
                  end
            end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createKornMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createKornMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Daily Tally Points Exchange',
        options = options
    })

end

    local Kornstrix = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Kornstrix',
        look = '0x0000550000000000000000000000000000000000',
        x = 317.0516,
        y = -3.1104,
        z = -550.1868,
        rotation = 19,
        widescan = 1,

        onTrade = function(player, npc, trade)

        end,

      onTrigger = function(player,npc)
            local dailyTallyPoints = player:getCurrency('daily_tally')
            player:printToPlayer('Kornstrix will give you what you need!',0,'Kornstrix')
            createKornMainMenu(player, page)
            delaySendMenu(player)
      end,
    })
   utils.unused(Kornstrix)
end)

return m