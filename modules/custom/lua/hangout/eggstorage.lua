-----------------------------------
-- Moogle
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('eggstorage')

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)
local eggs = {}
for i = 0, 25 do
    local eggName = string.char(65 + i)  -- 65 is ASCII for 'A'
    local eggId = 1488 + i
    table.insert(eggs, { name = eggName .. ' Egg', id = eggId, var = eggName .. 'Egg' })
end

local eggsPerPage = 5

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end

local function storeEggs(player, trade)
    local storedSomething = false

    for _, egg in ipairs(eggs) do
        local count = trade:getItemQty(egg.id)
        if count > 0 then
            local currentBalance = player:getCharVar(egg.var)
            player:setCharVar(egg.var, currentBalance + count)
            storedSomething = true
            player:printToPlayer(string.format('Stored %d %s. New balance: %d.', count, egg.name, currentBalance + count), 0, 'Egg NPC')
        end
    end

    if storedSomething then
        player:tradeComplete()
    else
        player:printToPlayer('No valid eggs found in the trade.', 0, 'Egg NPC')
    end
end

local function retrieveEggsWithGil(player, trade, selectedEgg)
    local gilAmount = trade:getGil()
    local totalEggsToWithdraw = math.min(gilAmount, 99) -- Assume 1 gil = 1 egg for simplicity

    local quantity = player:getCharVar(selectedEgg.var)
    if quantity > 0 and totalEggsToWithdraw > 0 then
        local eggsToWithdraw = math.min(totalEggsToWithdraw, quantity)
        if player:getFreeSlotsCount() < math.ceil(eggsToWithdraw / 12) then
            player:printToPlayer('You cannot withdraw that amount. Please check your inventory and try again.', 0, 'Egg NPC')
            return
        end

        player:addItem(selectedEgg.id, eggsToWithdraw)
        player:setCharVar(selectedEgg.var, quantity - eggsToWithdraw)
        player:printToPlayer(string.format('You have withdrawn %d %s.', eggsToWithdraw, selectedEgg.name), 0, 'Egg NPC')
        player:printToPlayer(string.format('Your remaining %s balance is %d.', selectedEgg.name, player:getCharVar(selectedEgg.var)), 0, 'Egg NPC')
        player:tradeComplete()
    else
        player:printToPlayer('You cannot withdraw that amount. Please check your balance and try again.', 0, 'Egg NPC')
    end
end
local function createMainMenu(player, page)
    page = page or 1
    local startIndex = (page - 1) * eggsPerPage + 1
    local endIndex = math.min(startIndex + eggsPerPage - 1, #eggs)
    local options = {}

    for i = startIndex, endIndex do
        local egg = eggs[i]
        local balance = player:getCharVar(egg.var)
        table.insert(options, {
            string.format('%s (You have: %d)', egg.name, balance),
            function(player)
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
    if endIndex < #eggs then
        table.insert(options, {
            'Next Page',
            function(player)
                createMainMenu(player, page + 1)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Egg Storage',
        options = options
    })
end

local function createTradeMenu(player, page, trade)
    page = page or 1
    local startIndex = (page - 1) * eggsPerPage + 1
    local endIndex = math.min(startIndex + eggsPerPage - 1, #eggs)
    local options = {}

    for i = startIndex, endIndex do
        local egg = eggs[i]
        local balance = player:getCharVar(egg.var)
        table.insert(options, {
            string.format('%s (You have: %d)', egg.name, balance),
            function(player)
                player:setLocalVar('SelectedEgg', egg.id)
                local selectedEggId = player:getLocalVar('SelectedEgg')
                local selectedEgg = nil
                for _, egg in ipairs(eggs) do
                    if egg.id == selectedEggId then
                        selectedEgg = egg
                        break
                    end
                end
                retrieveEggsWithGil(player, trade, selectedEgg)
                end
        })
    end

    -- Pagination options
    if page > 1 then
        table.insert(options, {
            'Previous Page',
            function(player)
                createTradeMenu(player, page - 1, trade)
            end
        })
    end
    if endIndex < #eggs then
        table.insert(options, {
            'Next Page',
            function(player)
                createTradeMenu(player, page + 1,trade)
            end
        })
    end

    delaySendMenu(player, {
        title = 'Egg Storage',
        options = options
    })
end
    local eggmoogle = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Egg Moogle',
        look = 82,
        x         = 344.8534,
        y         = -3.9588,
        z         = -543.7756,
        rotation = 60,
        widescan = 1,
        onTrade = function(player, npc, trade)
            if npcUtil.tradeHas(trade, xi.item.GIL) then
            createTradeMenu(player, page, trade)
            else
                storeEggs(player, trade)
            end
        end,
        onTrigger = function(player, npc)
            createMainMenu(player)
            player:printToPlayer('Review your current Egg Balance, To withdraw your eggs, trade me gil in the amount of eggs you want to withdraw. Or trade me the Eggs you want stored.', 0, 'Egg NPC')
        end,
    })
    utils.unused(eggmoogle)
end)

return m

