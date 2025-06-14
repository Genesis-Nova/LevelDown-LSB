-------------------------------
require("modules/module_utils")
-------------------------------
local m = Module:new("Dynastrix")


m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize',function(zone)
    super(zone)

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end
         local valueVar =
                {
                {'Ancient Beastcoin',    1875},
                {'Ecarlate Cloth',       1930},
                {'Argyro Rivet',         1931},
                {'Utopian Gold Thread',  1932},
                {'Ancient Brass',        1933},
                {'Benedict Silk',        1934},
                {'Benedict Yarn',        1935},
                {'Diabolic Silk',        1936},
                {'Diabolic Yarn',        1937},
                {'Ruby Silk Thread',     1938},
                {'Cardinal Cloth',       1939},
                {'Supple Skin',          1940},
                {'Light Filament',       1941},
                {'Snowy Cermet',         1942},
                {'White Rivet',          1943},
                {'Dark Orichalcum',      1944},
                {'Black Rivet',          1945},
                {'Smalt Leather',        1946},
                {'Fetid Lanolin',        1947},
                {'Coiled Yarn',          1948},
                {'Brown Doeskin',        1949},
                {'Chameleon Yarn',       1950},
                {'Charcoal Cotton',      1951},
                {'Scarlet Odoshi',       1952},
                {'Kurogane',             1953},
                {'Plaited Cord',         1954},
                {'Ebony Lacquer',        1955},
                {'Cobalt Mythril Sheet', 1956},
                {'Blue Rivet',           1957},
                {'Glittering Yarn',      1958},
                {'Astral Leather',       1959},
                {'Luminian Thread',      2656},
                {'Flameshun Cloth',      2657},
                {'Silkworm Thread',      2658},
                {'Canvas Toile',         2659},
                {'Pantin Wire',          2660},
                {'Corduroy Cloth',       2661},
                {'Filet Lace',           2714},
                {'Gold Stud',            2715},
                {'Brilliantine',         2716},
                {'Electrum Stud',        2717},
                }
local function currentBalance(player, npc)
        player:printToPlayer('Your Current balance of stored Limbus Currency is:',  xi.msg.channel.SYSTEM_3)
                if player:getCurrency('ancient_beastcoin') > 0 then
                   player:printToPlayer(string.format('[Ancient Beastcoin] %s', player:getCurrency('ancient_beastcoin')),  xi.msg.channel.SYSTEM_3)
                end
            for every, charVar in pairs(valueVar) do
                if player:getCharVar(charVar[1]) > 0 then
                   player:printToPlayer(string.format('[%s] %s',charVar[1],  player:getCharVar(charVar[1])),  xi.msg.channel.SYSTEM_3)
                end
            end
end
local function storeLimbusItems(player, npc, trade)
      local valueTable = {}
         for i = 1, 41 do
               local itemID     = valueVar[i][2]
               local charVar    = valueVar[i][1]
               table.insert(valueTable, {itemID, charVar})
            --   print(itemID,charVar)
         end
      local tradedItems = {}
        for slotId = 0, 8 do
            local item = trade:getItem(slotId)
            if item then
               local itemId = item:getID()
               local quantity = trade:getSlotQty(slotId)
               table.insert(tradedItems, {itemId, quantity})
               --print(itemId,quantity)
            end
        end
        for _, itemTraded in pairs(tradedItems) do
            for _, tableValue in pairs(valueTable) do
                if itemTraded[1] == tableValue[1] then
                       -- print(itemTraded[2], tableValue[2])
                       player:setCharVar(tableValue[2], player:getCharVar(tableValue[2]) + itemTraded[2])
                       player:tradeComplete()
                end
            end
        end
        if player:getCharVar('Ancient Beastcoin') > 0 then
           player:addCurrency('ancient_beastcoin', player:getCharVar('Ancient Beastcoin'))
           player:setCharVar('Ancient Beastcoin', 0)
        end
        player:printToPlayer('Your Current balance of stored Limbus Currency is:',  xi.msg.channel.SYSTEM_3)
                if player:getCurrency('ancient_beastcoin') > 0 then
                   player:printToPlayer(string.format('[Ancient Beastcoin] %s', player:getCurrency('ancient_beastcoin')),  xi.msg.channel.SYSTEM_3)
                end    
            for every, charVar in pairs(valueVar) do
                if player:getCharVar(charVar[1]) > 0 then
                   player:printToPlayer(string.format('[%s] %s',charVar[1],  player:getCharVar(charVar[1])),  xi.msg.channel.SYSTEM_3)
                end
            end
end
local function withdrawMainMenu(player, page, trade)
local withdrawMenu = {}
    if player:getCurrency('ancient_beastcoin') > 0 then
       player:setCharVar('Ancient Beastcoin',player:getCurrency('ancient_beastcoin'))
    end
           for tableValue = 1, #valueVar do
             if player:getCharVar(valueVar[tableValue][1]) > 0 then
                table.insert(withdrawMenu, {valueVar[tableValue][1], valueVar[tableValue][2]})
             end
           end
    local linesPerPage = 4
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #withdrawMenu)
    local options = {}
    for i = startIndex, endIndex, 1 do
        local withdraw = withdrawMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', withdraw, player:getCharVar(withdrawMenu[i][1])),
            function(player)
             local gilAmount = player:getLocalVar('GilTraded')
                if withdraw == 'Ancient Beastcoin' and gilAmount > player:getCurrency('ancient_beastcoin') then
                   player:printToPlayer('You do not have enough of this item to withdraw based on the gil traded.', 0, 'Dynastrix')
                elseif player:getFreeSlotsCount() < math.ceil(gilAmount / 99) then
                        player:printToPlayer('You cannot withdraw that amount. Please check your inventory and try again.', 0, 'Dynastrix')
                elseif withdraw == 'Ancient Beastcoin' and gilAmount < player:getCurrency('ancient_beastcoin') then
                            npcUtil.giveItem(player,{{1875, gilAmount}})
                            player:setCharVar('Ancient Beastcoin', 0)
                else
                  if player:getCharVar(withdrawMenu[i][1]) < gilAmount then
                        player:printToPlayer('You do not have enough of this item to withdraw based on the gil traded.', 0, 'Dynastrix')
                  else
                    if player:getFreeSlotsCount() < math.ceil(gilAmount / 12) then
                        player:printToPlayer('You cannot withdraw that amount. Please check your inventory and try again.', 0, 'Dynastrix')
                        return
                    else
                            player:setCharVar(withdrawMenu[i][1], player:getCharVar(withdrawMenu[i][1]) - gilAmount)
                            npcUtil.giveItem(player,{{withdrawMenu[i][2], gilAmount}})
                            player:tradeComplete()
                    end
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
                withdrawMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #withdrawMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                withdrawMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'What would you like to withdraw!',
        options = options
    })
end

local function abcExchange(player, page)
    local abcExchangeMenu     = {}
               for tableValue = 2, #valueVar do
                table.insert(abcExchangeMenu, {valueVar[tableValue][1], valueVar[tableValue][2]})
               end
    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #abcExchangeMenu)
    local options = {}
    for i = startIndex, endIndex do
        local abcExchange = abcExchangeMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', abcExchange, player:getCharVar(abcExchange)),
            function(player)
                if player:getCurrency('ancient_beastcoin') >= 10 then
                        player:setCharVar(abcExchange, player:getCharVar(abcExchange) + 1)
                        player:delCurrency('ancient_beastcoin', 10)
                        player:printToPlayer(string.format('You have completed exchanging 10 ABCs for 1 %s.',abcExchange), 0, 'Dynastrix')
                        return
                else
                   player:printToPlayer('You do not have enough of currency to complete this exchange.', 0, 'Dynastrix')
                end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                abcExchange(player, page - 1)
            end
        })
    end
    if endIndex < #abcExchangeMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                abcExchange(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'ABC Exchange (10/1)',
        options = options
    })
end

local function limbusQuantityMenu(player, page)
    local limbusQtyMenu     = {1, 2, 4, 10, 15 ,25}
    local limbusQtyExchangeMenu = {}
           for tableValue = 1, #valueVar do
                table.insert(limbusQtyExchangeMenu, {valueVar[tableValue][1], valueVar[tableValue][2]})
           end
    local linesPerPage = 6
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #limbusQtyMenu)
    local options = {}
    for i = startIndex, endIndex do
        local limbusQty = limbusQtyMenu[i]
        table.insert(options, {
            string.format('%s', limbusQty),
            function(player)
             local limbusCurrency = 0
             local limbusitems    = 0
             local limbusName     = 0 
                if limbusCurrency == 0 then
                  for i = 1, #limbusQtyExchangeMenu do
                    if player:getLocalVar(limbusQtyExchangeMenu[i][1]) == 1 then
                       limbusCurrency = limbusQtyExchangeMenu[i][1]
                       limbusName     = limbusQtyExchangeMenu[i][1]
                    end
                  end
                end
                if limbusitems == 0 then
                  for i = 1, #limbusQtyExchangeMenu do
                    if player:getLocalVar(limbusQtyExchangeMenu[i][1]) == 2 then
                       limbusitems    = limbusQtyExchangeMenu[i][1]
                    end
                  end
                end
            if limbusQty == 1 then
                if player:getCharVar(limbusitems) >= 1 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) +1 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) -1 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            elseif limbusQty == 2 then
                if player:getCharVar(limbusitems) >= 2 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) + 2 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) - 2 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            elseif limbusQty == 4 then
                if player:getCharVar(limbusitems) >= 4 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) + 4 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) - 4 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            elseif limbusQty == 10 then
                if player:getCharVar(limbusitems) >= 10 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) + 10 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) - 10 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            elseif limbusQty == 15 then
                if player:getCharVar(limbusitems) >= 15 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) + 15 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) - 15 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            elseif limbusQty == 25 then
                if player:getCharVar(limbusitems) >= 25 then
                   player:setCharVar(limbusCurrency, player:getCharVar(limbusCurrency) + 25 ) -- add currency
                   player:setCharVar(limbusitems, player:getCharVar(limbusitems) - 25 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',limbusName), 0, 'Dynastrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Dynastrix')
                end
            end
        end
        })
    end

    delaySendMenu(player, {
        title = 'How many to Exchange!',
        options = options
    })

end

local function limbusExchangeMain(player, page)
local limbusExchangeMainMenu = {}
           for tableValue = 2, #valueVar do
                table.insert(limbusExchangeMainMenu, {valueVar[tableValue][1], valueVar[tableValue][2]})
           end
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #limbusExchangeMainMenu)
    local options = {}
    for i = startIndex, endIndex do
        local limbusExchangeMM = limbusExchangeMainMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', limbusExchangeMM, player:getCharVar(limbusExchangeMainMenu[i][1])),
            function(player)
             local exchangeCurrency = 0
                if exchangeCurrency == 0 then
                  for i = 1, #limbusExchangeMainMenu do
                    if player:getLocalVar(tostring(limbusExchangeMainMenu[i][1])) > 0 then
                       exchangeCurrency = player:getLocalVar(tostring(limbusExchangeMainMenu[i][1]))
                    end
                  end
                end
                if string.find(limbusExchangeMM, limbusExchangeMM) then
                      player:setLocalVar(limbusExchangeMM,1)
                      limbusQuantityMenu(player)
                                  delaySendMenu(player)
                end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                limbusExchangeMain(player, page - 1)
            end
        })
    end
    if endIndex < #limbusExchangeMainMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                limbusExchangeMain(player, page + 1)
            end
        })
    end
    delaySendMenu(player, {
        title = 'Exchange for?!',
        options = options
    })

end

local function limbusExchange(player, page)
local limbusExchangeMenu = {}

           for tableValue = 2, #valueVar do
             if player:getCharVar(valueVar[tableValue][1]) > 0 then
                table.insert(limbusExchangeMenu, {valueVar[tableValue][1], valueVar[tableValue][2]})
             end
           end
    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #limbusExchangeMenu)
    local options = {}
    for i = startIndex, endIndex do
        local limbusItemExchangeMenu = limbusExchangeMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', limbusItemExchangeMenu, player:getCharVar(limbusExchangeMenu[i][1])),
            function(player)
                player:setLocalVar(limbusItemExchangeMenu, 2)
                limbusExchangeMain(player, page)
                return
            end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                limbusExchange(player, page - 1)
            end
        })
    end
    if endIndex < #limbusExchangeMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                limbusExchange(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Limbus Item Exchange',
        options = options
    })
end

local function createMainMenu(player, page)
    local mainMenu     = {'Nothing for now!', 'Current Balance', 'Exchange Items', 'ABC Exchange'} 

    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainMenu)
    local options = {}
    for i = startIndex, endIndex do
        local menu = mainMenu[i]
        table.insert(options, {
            string.format('%s', menu),
            function(player)
            if menu == 'Current Balance' then -- 
               currentBalance(player, npc)
            elseif menu == 'Exchange Items' then -- 
                   limbusExchange(player, page)
            elseif menu == 'ABC Exchange' then -- 
                   abcExchange(player, page)
            end
        end
        })
    end
    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #mainMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                createMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Limbus Options',
        options = options
    })

end


    local Dynastrix = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Dynastrix',
        look = '0x0000550000000000000000000000000000000000',
        x = 317.5777,
        y = -3.2466,
        z = -552.9113,
        rotation = 227,
        widescan = 1,

        onTrade = function(player, npc, trade)
        local amount = trade:getGil()
            player:resetLocalVars()
            player:setCharVar('Ancient Beastcoin', 0)
                if npcUtil.tradeHasExactly(trade, {{xi.item.GIL,amount }}) then
                    player:setLocalVar('GilTraded',trade:getGil())
                    withdrawMainMenu(player, page, trade) -- completed
                else
                    storeLimbusItems(player, npc, trade) -- completed
                end 
            delaySendMenu(player)
        end,

      onTrigger = function(player,npc)
            player:resetLocalVars()
            player:setCharVar('Ancient Beastcoin', 0)
          createMainMenu(player, page) -- completed
      end,
    })
   utils.unused(Dynastrix)
end)

return m