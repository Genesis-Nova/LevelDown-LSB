-------------------------------
require("modules/module_utils")
-------------------------------
local m = Module:new("coinstrix")


m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize',function(zone)
    super(zone)

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end

    local function itemStorage(player, npc, trade)
      local valueTable = {}
         local valueVar = {'Whiteshell', 'Jadeshell', 'Stripeshell', 'Bronzepiece', 'Silverpiece', 'Goldpiece', 'Byne', 'HundredByne', 'TenkByne'}
         for i = 1, 9 do
               local itemID     = 1448 + i
               local charVar    = valueVar[i]
               table.insert(valueTable, {itemID, charVar})
               --print(itemID,charVar)
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
               --[[ if itemTraded[1] ~= tableValue[1] then
                   player:printToPlayer('You are trying to trade unauthorized items.', 0, 'Coinstrix')
                   return
                else ]]if itemTraded[1] == tableValue[1] then
                       -- print(itemTraded[2], tableValue[2])
                       player:setCharVar(tableValue[2], player:getCharVar(tableValue[2]) + itemTraded[2])
                       player:tradeComplete()
                end
            end
        end
      player:printToPlayer('Your Current balance of stored Dynamis Currency is:',  xi.msg.channel.SYSTEM_3)
      player:printToPlayer(string.format('[%s] Tukuku Whiteshell [%s] Lungo-nango Jadeshell [%s] Rimilala Stripeshell', player:getCharVar(valueVar[1]), player:getCharVar(valueVar[2]), player:getCharVar(valueVar[3])),  xi.msg.channel.SYSTEM_3)
      player:printToPlayer(string.format('[%s] Ordelle Bronzepiece [%s] Montiont Silverpiece [%s] Ranperre Goldpiece', player:getCharVar(valueVar[4]), player:getCharVar(valueVar[5]), player:getCharVar(valueVar[6])),  xi.msg.channel.SYSTEM_3)
      player:printToPlayer(string.format('[%s] One Byne Bill [%s] One Hundred Byne Bill [%s] Ten Thousand Byne Bill', player:getCharVar(valueVar[7]), player:getCharVar(valueVar[8]), player:getCharVar(valueVar[9])),  xi.msg.channel.SYSTEM_3)
    end

local function withdrawMainMenu(player, page, trade)
    local withdrawMenu     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Rimilala Stripeshell','Stripeshell', 1451}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'Montiont Silverpiece','Silverpiece', 1453}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'One Byne Bill','Byne', 1455}, {'One Hundred Byne Bill','HundredByne', 1456}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #withdrawMenu)
    local options = {}
    for i = startIndex, endIndex, 1 do
        local withdraw = withdrawMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', withdraw, player:getCharVar(withdrawMenu[i][2])),
            function(player)
                local gilAmount = player:getLocalVar('GilTraded')
              if player:getCharVar(withdrawMenu[i][2]) < gilAmount then
                    player:printToPlayer('You do not have enough of this item to withdraw based on the gil traded.', 0, 'Coinstrix')
              else
                if player:getFreeSlotsCount() < math.ceil(gilAmount / 99) then
                    player:printToPlayer('You cannot withdraw that amount. Please check your inventory and try again.', 0, 'Coinstrix')
                    return
                else
                        player:setCharVar(withdrawMenu[i][2], player:getCharVar(withdrawMenu[i][2]) - gilAmount)
                        npcUtil.giveItem(player,{{withdrawMenu[i][3], gilAmount}})
                        player:tradeComplete()
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

local function upgradeToThoMainMenu(player, page)
    local upgradeToThoMenu     = {{'Rimilala Stripeshell','Stripeshell', 1451}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local originalCurrency     = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Montiont Silverpiece','Silverpiece', 1453},{'One Hundred Byne Bill','HundredByne', 1456}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 2) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #upgradeToThoMenu)
    local options = {}
    for i = startIndex, endIndex do
        local upgradeToTho = upgradeToThoMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', upgradeToTho, player:getCharVar(upgradeToThoMenu[i][2])),
            function(player)
             local upgradeCurrency = 0
                if upgradeCurrency == 0 then
                  for i = 1, #originalCurrency do
                    if player:getLocalVar(originalCurrency[i][2]) > 0 then
                       upgradeCurrency = originalCurrency[i][2]
                    end
                  end
                end
                if string.find(upgradeToTho, 'Stripeshell') then
                   player:setCharVar('Stripeshell', player:getCharVar('Stripeshell') +1)
                   player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                   player:printToPlayer('You have succesfully upgraded your currency to a Rimilala Stripeshell.', 0, 'Coinstrix')
                elseif string.find(upgradeToTho, 'Goldpiece') then
                    player:setCharVar('Goldpiece', player:getCharVar('Goldpiece') +1)
                    player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                    player:printToPlayer('You have succesfully upgraded your currency to a Ranperre Goldpiece.', 0, 'Coinstrix')
                elseif string.find(upgradeToTho, 'Thousand') then
                    player:setCharVar('TenkByne', player:getCharVar('TenkByne') +1)
                    player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                    player:printToPlayer('You have succesfully upgraded your currency to a Ten Thousand Byne Bill.', 0, 'Coinstrix')                       
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'Upgrade To?',
        options = options
    })
end

local function upgradeToHunMainMenu(player, page)
    local upgradeToHunMenu     = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Montiont Silverpiece','Silverpiece', 1453},{'One Hundred Byne Bill','HundredByne', 1456}} 
    local originalCurrency     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'One Byne Bill','Byne', 1455}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #upgradeToHunMenu)
    local options = {}
    for i = startIndex, endIndex do
        local upgradeToHun = upgradeToHunMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', upgradeToHun, player:getCharVar(upgradeToHunMenu[i][2])),
            function(player)
             local upgradeCurrency = 0
                if upgradeCurrency == 0 then
                  for i = 1, #originalCurrency do
                    if player:getLocalVar(originalCurrency[i][2]) > 0 then
                       upgradeCurrency = originalCurrency[i][2]
                    end
                  end
                end
                if string.find(upgradeToHun, 'Jadeshell') then
                   player:setCharVar('Jadeshell', player:getCharVar('Jadeshell') +1)
                   player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                   player:printToPlayer('You have succesfully upgraded your currency to a Lungo-nango Jadeshell.', 0, 'Coinstrix')
                elseif string.find(upgradeToHun, 'Silverpiece') then
                    player:setCharVar('Silverpiece', player:getCharVar('Silverpiece') +1)
                    player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                    player:printToPlayer('You have succesfully upgraded your currency to a Montiont Silverpiece.', 0, 'Coinstrix')
                elseif string.find(upgradeToHun, 'Hundred') then
                    player:setCharVar('HundredByne', player:getCharVar('HundredByne') +1)
                    player:setCharVar(upgradeCurrency, player:getCharVar(upgradeCurrency) - 100)
                    player:printToPlayer('You have succesfully upgraded your currency to a One Hundred Byne Bill.', 0, 'Coinstrix')                       
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'Upgrade To?!',
        options = options
    })
end

local function upgradeMainMenu(player, page)
    local upgradeMenu     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'Montiont Silverpiece','Silverpiece', 1453}, {'One Byne Bill','Byne', 1455}, {'One Hundred Byne Bill','HundredByne', 1456}} 
    local linesPerPage = 4
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #upgradeMenu)
    local options = {}
    for i = startIndex, endIndex do
        local upgrade = upgradeMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', upgrade, player:getCharVar(upgradeMenu[i][2])),
            function(player)
                if string.find(upgrade, 'Whiteshell') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToHunMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(upgrade, 'Jadeshell') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToThoMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(upgrade, 'Bronzepiece') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToHunMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(upgrade, 'Silverpiece') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToThoMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(upgrade, 'One Byne Bill') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToHunMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(upgrade, 'Hundred') then
                   if player:getCharVar(upgradeMenu[i][2]) >= 100 then
                      player:setLocalVar(upgradeMenu[i][2], 100)
                      upgradeToThoMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
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
                upgradeMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #upgradeMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                upgradeMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Upgrade?',
        options = options
    })
end

local function downgradeToSinMainMenu(player, page)
    local downgradeToSinMenu     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'One Byne Bill','Byne', 1455}}
    local originalCurrency       = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Montiont Silverpiece','Silverpiece', 1453},{'One Hundred Byne Bill','HundredByne', 1456}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #downgradeToSinMenu)
    local options = {}
    for i = startIndex, endIndex do
        local downgradeToSin = downgradeToSinMenu[i][1]
        --local balance = player:getCharVar(egg.var)
        table.insert(options, {
            string.format('%s [%s]', downgradeToSin, player:getCharVar(downgradeToSinMenu[i][2])),
            function(player)
             local downgradeCurrency = 0
                if downgradeCurrency == 0 then
                  for i = 1, #originalCurrency do
                    if player:getLocalVar(originalCurrency[i][2]) > 0 then
                       downgradeCurrency = originalCurrency[i][2]
                    end
                  end
                end
                if string.find(downgradeToSin, 'Whiteshell') then
                   player:setCharVar('Whiteshell', player:getCharVar('Whiteshell') +100)
                   player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                   player:printToPlayer('You have succesfully downgraded your currency to 100 Tukuku Whiteshells.', 0, 'Coinstrix')
                elseif string.find(downgradeToSin, 'Bronzepiece') then
                    player:setCharVar('Bronzepiece', player:getCharVar('Bronzepiece') +100)
                    player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                    player:printToPlayer('You have succesfully downgraded your currency to 100 Ordelle Bronzepieces.', 0, 'Coinstrix')
                elseif string.find(downgradeToSin, 'Byne') then
                    player:setCharVar('Byne', player:getCharVar('Byne') +100)
                    player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                    player:printToPlayer('You have succesfully downgraded your currency to 100 One Byne Bills.', 0, 'Coinstrix')                       
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'Downgrade To?',
        options = options
    })

end

local function downgradeToHunMainMenu(player, page)
    local downgradeToHunMenu     = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Montiont Silverpiece','Silverpiece', 1453}, {'One Hundred Byne Bill','HundredByne', 1456}}
    local originalCurrency       = {{'Rimilala Stripeshell','Stripeshell', 1451}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 2) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #downgradeToHunMenu)
    local options = {}
    for i = startIndex, endIndex do
        local downgradeToHun = downgradeToHunMenu[i][1]
        --local balance = player:getCharVar(egg.var)
        table.insert(options, {
            string.format('%s [%s]', downgradeToHun, player:getCharVar(downgradeToHunMenu[i][2])),
            function(player)
             local downgradeCurrency = 0
                if downgradeCurrency == 0 then
                  for i = 1, #originalCurrency do
                    if player:getLocalVar(originalCurrency[i][2]) > 0 then
                       downgradeCurrency = originalCurrency[i][2]
                    end
                  end
                end
                if string.find(downgradeToHun, 'Jadeshell') then
                   player:setCharVar('Jadeshell', player:getCharVar('Jadeshell') +100)
                   player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                   player:printToPlayer('You have succesfully downgraded your currency to 100 Lungo-nango Jadeshells.', 0, 'Coinstrix')
                elseif string.find(downgradeToHun, 'Silverpiece') then
                    player:setCharVar('Silverpiece', player:getCharVar('Silverpiece') +100)
                    player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                    player:printToPlayer('You have succesfully downgraded your currency to 100 Montiont Silverpieces.', 0, 'Coinstrix')
                elseif string.find(downgradeToHun, 'Byne') then
                    player:setCharVar('HundredByne', player:getCharVar('HundredByne') +100)
                    player:setCharVar(downgradeCurrency, player:getCharVar(downgradeCurrency) - 1)
                    player:printToPlayer('You have succesfully downgraded your currency to 100 One Hundred Byne Bills.', 0, 'Coinstrix')                       
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'Downgrade To?',
        options = options
    })

end

local function downgradeMainMenu(player, page)
    local downgradeMenu     = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Rimilala Stripeshell','Stripeshell', 1451}, {'Montiont Silverpiece','Silverpiece', 1453}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'One Hundred Byne Bill','HundredByne', 1456}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #downgradeMenu)
    local options = {}
    for i = startIndex, endIndex do
        local downgrade = downgradeMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', downgrade, player:getCharVar(downgradeMenu[i][2])),
            function(player)
                if string.find(downgrade, 'Jadeshell') then
                   if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToSinMainMenu(player, page)
                   else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                   end
                elseif string.find(downgrade, 'Stripeshell') then
                    if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToHunMainMenu(player, page)
                    else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                    end
                elseif string.find(downgrade, 'Silverpiece') then
                    if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToSinMainMenu(player, page)
                    else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                    end
                elseif string.find(downgrade, 'Goldpiece') then
                    if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToHunMainMenu(player, page)
                    else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                    end
                elseif string.find(downgrade, 'Hundred') then
                    if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToSinMainMenu(player, page)
                    else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
                    end
                elseif string.find(downgrade, 'Thousand') then
                    if player:getCharVar(downgradeMenu[i][2]) >= 1 then
                      player:setLocalVar(downgradeMenu[i][2], 1)
                      downgradeToHunMainMenu(player, page)
                    else
                      player:printToPlayer('You do not have enough of this item to upgrade to.', 0, 'Coinstrix')
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
                downgradeMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #downgradeMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                downgradeMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Downgrade?',
        options = options
    })

end

local function convertQuantityMenu(player, page)
    local convertQtyMenu     = {1, 5, 10, 25, 50 ,75}
    local convertitem        = {{'Tukuku Whiteshell','Whiteshell', '1449'}, {'Lungo Jadeshell','Jadeshell', '1450'}, {'Rimilala Stripeshell','Stripeshell', '1451'}, {'Ordelle Bronzepiece','Bronzepiece', '1452'}, {'Montiont Silverpiece','Silverpiece', '1453'}, {'Ranperre Goldpiece','Goldpiece', '1454'}, {'One Byne Bill','Byne', '1455'}, {'One Hundred Byne','HundredByne', '1456'}, {'Ten Thousand Byne Bill','TenkByne', '1457'}} 
    local linesPerPage = 6
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #convertQtyMenu)
    local options = {}
    for i = startIndex, endIndex do
        local convertQty = convertQtyMenu[i]
        table.insert(options, {
            string.format('%s', convertQty),
            function(player)
             local convertCurrency = 0
             local convertitems    = 0
             local convertName     = 0 
                if convertCurrency == 0 then
                  for i = 1, #convertitem do
                    if player:getLocalVar(convertitem[i][2]) > 0 then
                       convertCurrency = convertitem[i][2]
                       convertName     = convertitem[i][1]
                    end
                  end
                end
                if convertitems == 0 then
                  for i = 1, #convertitem do
                    if player:getLocalVar(convertitem[i][3]) > 0 then
                       convertitems    = convertitem[i][2]
                    end
                  end
                end
            if convertQty == 1 then
                if player:getCharVar(convertitems) >= 1 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) +1 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) -1 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            elseif convertQty == 5 then
                if player:getCharVar(convertitems) >= 5 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) + 5 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) - 5 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            elseif convertQty == 10 then
                if player:getCharVar(convertitems) >= 10 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) + 10 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) - 10 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            elseif convertQty == 25 then
                if player:getCharVar(convertitems) >= 25 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) + 25 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) - 25 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            elseif convertQty == 50 then
                if player:getCharVar(convertitems) >= 50 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) + 50 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) - 50 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            elseif convertQty == 75 then
                if player:getCharVar(convertitems) >= 75 then
                   player:setCharVar(convertCurrency, player:getCharVar(convertCurrency) + 75 ) -- add currency
                   player:setCharVar(convertitems, player:getCharVar(convertitems) - 75 ) -- subtact currency
                   player:printToPlayer(string.format('You have converted you currency to %s.',convertName), 0, 'Coinstrix')
                else
                   player:printToPlayer('You do not have enough of this currency to convert.', 0, 'Coinstrix')
                end
            end
        end
        })
    end

    delaySendMenu(player, {
        title = 'How many to Convert!',
        options = options
    })

end

local function convertThoMainMenu(player, page)
    local convertThoMenu     = {{'Rimilala Stripeshell','Stripeshell', 1451}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #convertThoMenu)
    local options = {}
    for i = startIndex, endIndex do
        local convertTho = convertThoMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', convertTho, player:getCharVar(convertThoMenu[i][2])),
            function(player)
             local exchangeCurrency = 0
                if exchangeCurrency == 0 then
                  for i = 1, #convertThoMenu do
                    if player:getLocalVar(tostring(convertThoMenu[i][3])) > 0 then
                       exchangeCurrency = player:getLocalVar(tostring(convertThoMenu[i][3]))
                    end
                  end
                end
                if string.find(convertTho, 'Rimilala Stripeshell') then
                      player:setLocalVar('Stripeshell',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertTho, 'Ranperre Goldpiece') then
                      player:setLocalVar('Goldpiece',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertTho, 'Ten Thousand Byne Bill') then
                      player:setLocalVar('TenkByne',exchangeCurrency)
                      convertQuantityMenu(player, page)
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'What would you like to do!',
        options = options
    })

end

local function convertHunMainMenu(player, page)
    local convertHunMenu     = {{'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Montiont Silverpiece','Silverpiece', 1453}, {'One Hundred Byne Bill','HundredByne', 1456}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #convertHunMenu)
    local options = {}
    for i = startIndex, endIndex do
        local convertHun = convertHunMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', convertHun, player:getCharVar(convertHunMenu[i][2])),
            function(player)
             local exchangeCurrency = 0
                if exchangeCurrency == 0 then
                  for i = 1, #convertHunMenu do
                    if player:getLocalVar(tostring(convertHunMenu[i][3])) > 0 then
                       exchangeCurrency = player:getLocalVar(tostring(convertHunMenu[i][3]))
                    end
                  end
                end
                if string.find(convertHun, 'Jadeshell') then
                      player:setLocalVar('Jadeshell',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertHun, 'Montiont Silverpiece') then
                      player:setLocalVar('Silverpiece',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertHun, 'One Hundred Byne Bill') then
                      player:setLocalVar('HundredByne',exchangeCurrency)
                      convertQuantityMenu(player, page)
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'What would you like to do!',
        options = options
    })

end

local function convertSinMainMenu(player, page)
    local convertSinMenu     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'One Byne Bill','Byne', 1455}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #convertSinMenu)
    local options = {}
    for i = startIndex, endIndex do
        local convertSin = convertSinMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', convertSin, player:getCharVar(convertSinMenu[i][2])),
            function(player)
             local exchangeCurrency = 0
                if exchangeCurrency == 0 then
                  for i = 1, #convertSinMenu do
                    if player:getLocalVar(tostring(convertSinMenu[i][3])) > 0 then
                       exchangeCurrency = player:getLocalVar(tostring(convertSinMenu[i][3]))
                    end
                  end
                end
                if string.find(convertSin, 'Tukuku Whiteshell') then
                      player:setLocalVar('Whiteshell',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertSin, 'Ordelle Bronzepiece') then
                      player:setLocalVar('Bronzepiece',exchangeCurrency)
                      convertQuantityMenu(player, page)
                elseif string.find(convertSin, 'One Byne Bill') then
                      player:setLocalVar('Byne',exchangeCurrency)
                      convertQuantityMenu(player, page)
                end
        end
        })
    end

    delaySendMenu(player, {
        title = 'What would you like to do!',
        options = options
    })

end

local function convertMainMenu(player, page)
    local convertMenu     = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Lungo-nango Jadeshell','Jadeshell', 1450}, {'Rimilala Stripeshell','Stripeshell', 1451}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'Montiont Silverpiece','Silverpiece', 1453}, {'Ranperre Goldpiece','Goldpiece', 1454}, {'One Byne Bill','Byne', 1455}, {'One Hundred Byne Bill','HundredByne', 1456}, {'Ten Thousand Byne Bill','TenkByne', 1457}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #convertMenu)
    local options = {}
    for i = startIndex, endIndex do
        local convert = convertMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', convert, player:getCharVar(convertMenu[i][2])),
            function(player)
                if string.find(convert, 'Tukuku Whiteshell') then
                   if player:getCharVar('Whiteshell') >= 1 then
                      player:setLocalVar('1449', player:getCharVar('Whiteshell'))
                      convertSinMainMenu(player, page)
                   else
                           player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                   end
                elseif string.find(convert, 'Jadeshell') then
                       if player:getCharVar('Jadeshell') >= 1 then
                          player:setLocalVar('1450', player:getCharVar('Jadeshell'))
                          convertHunMainMenu(player, page)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Stripeshell') then
                       if player:getCharVar('Stripeshell') >= 1 then
                          player:setLocalVar('1451', player:getCharVar('Stripeshell'))
                          convertThoMainMenu(player, page)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Bronzepiece') then
                       if player:getCharVar('Bronzepiece') >= 1 then
                          player:setLocalVar('1452', player:getCharVar('Bronzepiece'))
                          convertSinMainMenu(player, page - 1)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Silverpiece') then
                       if player:getCharVar('Silverpiece') >= 1 then
                          player:setLocalVar('1453', player:getCharVar('Silverpiece'))
                          convertHunMainMenu(player, page - 1)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Goldpiece') then
                       if player:getCharVar('Goldpiece') >= 1 then
                          player:setLocalVar('1454', player:getCharVar('Goldpiece'))
                          convertThoMainMenu(player, page - 1)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'One Byne Bill') then
                       if player:getCharVar('Byne') >= 1 then
                          player:setLocalVar('1455', player:getCharVar('Byne'))
                          convertSinMainMenu(player, page - 2)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Hundred') then
                       if player:getCharVar('HundredByne') >= 1 then
                          player:setLocalVar('1456', player:getCharVar('HundredByne'))
                          convertHunMainMenu(player, page - 2)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
                       end
                elseif string.find(convert, 'Thousand') then
                       if player:getCharVar('TenkByne') >= 1 then
                          player:setLocalVar('1457', player:getCharVar('TenkByne'))
                          convertThoMainMenu(player, page - 2)
                       else
                          player:printToPlayer('You do not have enough of this item to convert.', 0, 'Coinstrix')
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
                convertMainMenu(player, page - 1)
            end
        })
    end
    if endIndex < #convertMenu then
        table.insert(options, {
            'Next Page',
            function(player)
                convertMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'What would you like to do!',
        options = options
    })

end

local function forgottenMenu(player, page)
    local forgottenMenu     = {{'Forgotten Thought', 3493}, {'Forgotten Hope', 3494}, {'Forgotten Touch', 3495}, {'Forgotten Journey', 3496}, {'Forgotten Step', 3497}}
    local exchangeVar       = {'Whiteshell', 'Bronzepiece', 'Byne'}
    local linesPerPage = 7
    page = page or 1
    local startIndex = (page - 2) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #forgottenMenu)
    local options = {}
    for i = startIndex, endIndex do
        local forgotten = forgottenMenu[i][1]
        table.insert(options, {
            string.format('%s', forgotten),
            function(player)
             local exchangeCurrency = 0
                if exchangeCurrency == 0 then
                  for i = 1, #exchangeVar do
                    if player:getLocalVar(exchangeVar[i]) > 0 then
                       exchangeCurrency = exchangeVar[i]
                    end
                  end
                end
                -- need to remove variable on exit out without choosing
               if options[1] then
                    if player:getLocalVar(exchangeCurrency) > 0 then
                        player:setCharVar(exchangeCurrency, player:getCharVar(exchangeCurrency) - 10)
                        npcUtil.giveItem(player,{{forgottenMenu[i][2], 1}})
                        player:setLocalVar(exchangeCurrency, 0)
                    end
               elseif options[2] then
                    if player:getLocalVar(exchangeCurrency) > 0 then
                        player:setCharVar(exchangeCurrency, player:getCharVar(exchangeCurrency) - 10)
                        npcUtil.giveItem(player,{{forgottenMenu[i][2], 1}})
                        player:setLocalVar(exchangeCurrency, 0)
                    end
               elseif otpions[3] then
                    if player:getLocalVar(exchangeCurrency) > 0 then
                        player:setCharVar(exchangeCurrency, player:getCharVar(exchangeCurrency) - 10)
                        npcUtil.giveItem(player,{{forgottenMenu[i][2], 1}})
                        player:setLocalVar(exchangeCurrency, 0)
                    end
               elseif options[4] then
                    if player:getLocalVar(exchangeCurrency) > 0 then
                        player:setCharVar(exchangeCurrency, player:getCharVar(exchangeCurrency) - 10)
                        npcUtil.giveItem(player,{{forgottenMenu[i][2], 1}})
                        player:setLocalVar(exchangeCurrency, 0)
                    end
               elseif options[5] then
                    if player:getLocalVar(exchangeCurrency) > 0 then
                        player:setCharVar(exchangeCurrency, player:getCharVar(exchangeCurrency) - 10)
                        npcUtil.giveItem(player,{{forgottenMenu[i][2], 1}})
                        player:setLocalVar(exchangeCurrency, 0)
                    end
               end
        end
        })
    end
    delaySendMenu(player, {
        title = 'Pick your Forgotten Item!',
        options = options
    })
end

local function exchangeMainMenu(player, page)
    local exchangeMenu = {{'Tukuku Whiteshell','Whiteshell', 1449}, {'Ordelle Bronzepiece','Bronzepiece', 1452}, {'One Byne Bill','Byne', 1455}} 
    local linesPerPage = 3
    page = page or 1
    local startIndex = (page - 2) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #exchangeMenu)
    local options = {}
    for i = startIndex, endIndex do
        local exchange = exchangeMenu[i][1]
        table.insert(options, {
            string.format('%s [%s]', exchange, player:getCharVar(exchangeMenu[i][2])),
            function(player)

                if string.find(exchange, 'Tukuku Whiteshell') then
                   if player:getCharVar('Whiteshell') >= 10 then
                      player:setLocalVar('Whiteshell', 10)
                      player:setLocalVar('Bronzepiece',  0)
                      player:setLocalVar('Byne',  0)
                      forgottenMenu(player, page)
                   else
                           player:printToPlayer('You do not have enough of this item to exchange to forgotten items.', 0, 'Coinstrix')
                   end
                elseif string.find(exchange, 'Ordelle Bronzepiece') then
                       if player:getCharVar('Bronzepiece') >= 10 then
                          player:setLocalVar('Bronzepiece', 10)
                          player:setLocalVar('Whiteshell',  0)
                          player:setLocalVar('Byne',  0)
                          forgottenMenu(player, page)
                       else
                           player:printToPlayer('You do not have enough of this item to exchange to forgotten items.', 0, 'Coinstrix')
                       end
                elseif string.find(exchange, 'One Byne Bill') then
                       if player:getCharVar('Byne') >= 10 then
                          player:setLocalVar('Byne', 10)
                          player:setLocalVar('Whiteshell',  0)
                          player:setLocalVar('Bronzepiece',  0)
                          forgottenMenu(player, page)
                       else
                              player:printToPlayer('You do not have enough of this item to exchange to forgotten items.', 0, 'Coinstrix')
                       end
                else
                    player:printToPlayer('You do not have enough of this item to exchange to forgotten items.', 0, 'Coinstrix')
                    player:setLocalVar('Whiteshell',  0)
                    player:setLocalVar('Bronzepiece',  0)
                    player:setLocalVar('Byne',  0)
                end                
        end
        })
    end
    delaySendMenu(player, {
        title = 'Forgotten Item Exchange (Cost: 10 Currency)',
        options = options
    })
end

local function createMainMenu(player, page)
    local mainMenu     = {'Nothing for now!', 'Current Balance', 'Upgrade Currency', 'Downgrade Currency', 'Convert Currency', 'Exchange Currency'} 
    local linesPerPage = 5
    page = page or 1
    local startIndex = (page - 1) * linesPerPage + 1
    local endIndex = math.min(startIndex + linesPerPage - 1, #mainMenu)
    local options = {}

    for i = startIndex, endIndex do
        local menus = mainMenu[i]
        table.insert(options, {
            string.format('%s', menus),
            function(player)
            if menus == 'Nothing for now!' then
               return
            elseif menus == 'Current Balance' then -- completed
                   player:printToPlayer('Your Current balance of stored Dynamis Currency is:',  xi.msg.channel.SYSTEM_3)
                   player:printToPlayer(string.format('[%s] Tukuku Whiteshell [%s] Lungo-nango Jadeshell [%s] Rimilala Stripeshell', player:getCharVar('Whiteshell'), player:getCharVar('Jadeshell'), player:getCharVar('Stripeshell')),  xi.msg.channel.SYSTEM_3)
                   player:printToPlayer(string.format('[%s] Ordelle Bronzepiece [%s] Montiont Silverpiece [%s] Ranperre Goldpiece', player:getCharVar('Bronzepiece'), player:getCharVar('Silverpiece'), player:getCharVar('Goldpiece')),  xi.msg.channel.SYSTEM_3)
                   player:printToPlayer(string.format('[%s] One Byne Bill [%s] One Hundred Byne Bill [%s] Ten Thousand Byne Bill', player:getCharVar('Byne'), player:getCharVar('HundredByne'), player:getCharVar('TenkByne')),  xi.msg.channel.SYSTEM_3)
            elseif menus == 'Upgrade Currency' then -- complete
                   upgradeMainMenu(player, page)
            elseif menus == 'Downgrade Currency' then -- complete
                   downgradeMainMenu(player, page)
            elseif menus == 'Convert Currency' then -- complete
                   convertMainMenu(player, page)
            elseif menus == 'Exchange Currency' then -- completed
                   exchangeMainMenu(player, page)
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
        title = 'What would you like to do!',
        options = options
    })
end

    local coinstrix = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Coinstrix',
        look = '0x0000550000000000000000000000000000000000',
        x = 318.5695,
        y = -3.0170,
        z = -548.3183,
        rotation = 48,
        widescan = 1,

        onTrade = function(player, npc, trade)
        local amount = trade:getGil()
            player:resetLocalVars()
                if npcUtil.tradeHasExactly(trade, {{xi.item.GIL,amount }}) then
                    player:setLocalVar('GilTraded',trade:getGil())
                    withdrawMainMenu(player, page, trade) -- completed
                else
                    itemStorage(player, npc, trade) -- completed
                end
            delaySendMenu(player)
        end,

      onTrigger = function(player,npc)
            player:printToPlayer('Coinstrix gots whats ya needs!',0,'Coinstrix')
            player:resetLocalVars()
            createMainMenu(player, page) -- completed
            delaySendMenu(player)
      end,
    })
   utils.unused(coinstrix)
end)

return m