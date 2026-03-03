-----------------------------------
-- Coinstrix - Dynamis Bucks Bank
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts.enum.item")

local m = Module:new("coinstrix")

local ITEM_TUKUKU_WHITESHELL        = xi.item.TUKUKU_WHITESHELL
local ITEM_LUNGO_NANGO_JADESHELL    = xi.item.LUNGO_NANGO_JADESHELL
local ITEM_RIMILALA_STRIPESHELL     = xi.item.RIMILALA_STRIPESHELL
local ITEM_ORDELLE_BRONZEPIECE      = xi.item.ORDELLE_BRONZEPIECE
local ITEM_MONTIONT_SILVERPIECE     = xi.item.MONTIONT_SILVERPIECE
local ITEM_RANPERRE_GOLDPIECE       = xi.item.RANPERRE_GOLDPIECE
local ITEM_ONE_BYNE_BILL            = xi.item.ONE_BYNE_BILL
local ITEM_HUNDRED_BYNE_BILL        = xi.item.ONE_HUNDRED_BYNE_BILL
local ITEM_TEN_THOUSAND_BYNE_BILL   = xi.item.TEN_THOUSAND_BYNE_BILL

local allowedIds = {
    ITEM_TUKUKU_WHITESHELL,
    ITEM_LUNGO_NANGO_JADESHELL,
    ITEM_RIMILALA_STRIPESHELL,
    ITEM_ORDELLE_BRONZEPIECE,
    ITEM_MONTIONT_SILVERPIECE,
    ITEM_RANPERRE_GOLDPIECE,
    ITEM_ONE_BYNE_BILL,
    ITEM_HUNDRED_BYNE_BILL,
    ITEM_TEN_THOUSAND_BYNE_BILL,
}

local LEGACY_VARS = {
    whiteshell   = "Whiteshell",
    jadeshell    = "Jadeshell",
    stripeshell  = "Stripeshell",
    bronzepiece  = "Bronzepiece",
    silverpiece  = "Silverpiece",
    goldpiece    = "Goldpiece",
    byne         = "Byne",
    hundredbyne  = "HundredByne",
    tenkbyne     = "TenkByne",
}

local VAR_DYNAMIS_BUCKS   = "dynamisBucks"
local VAR_DYNAMIS_CONVERT = "dynamisConvert"
local MAX_DYNAMIS_BUCKS   = 65535

local function delaySendMenu(player, makeMenu)
    player:timer(50, function(p)
        p:customMenu(makeMenu())
    end)
end

local function tradeHasAnyItem(trade)
    for slot = 0, 8 do
        local id = trade:getItemId(slot)
        if id ~= 0 and id ~= 65535 then
            return true
        end
    end
    return false
end

local function tradeHasOnlyAllowedItems(trade)
    for slot = 0, 8 do
        local id = trade:getItemId(slot)
        if id ~= 0 and id ~= 65535 then
            local ok = false
            for _, allowed in ipairs(allowedIds) do
                if id == allowed then
                    ok = true
                    break
                end
            end
            if not ok then
                return false
            end
        end
    end
    return true
end

local function isValidCurrency(id)
    for _, allowed in ipairs(allowedIds) do
        if id == allowed then
            return true
        end
    end
    return false
end

local function currencyValue(id)
    if id == ITEM_TUKUKU_WHITESHELL
        or id == ITEM_ORDELLE_BRONZEPIECE
        or id == ITEM_ONE_BYNE_BILL then
        return 1
    elseif id == ITEM_LUNGO_NANGO_JADESHELL
        or id == ITEM_MONTIONT_SILVERPIECE
        or id == ITEM_HUNDRED_BYNE_BILL then
        return 100
    elseif id == ITEM_RIMILALA_STRIPESHELL
        or id == ITEM_RANPERRE_GOLDPIECE
        or id == ITEM_TEN_THOUSAND_BYNE_BILL then
        return 10000
    end
    return 0
end

local function runMigration(player)
    local whiteshell   = player:getCharVar(LEGACY_VARS.whiteshell)
    local jadeshell    = player:getCharVar(LEGACY_VARS.jadeshell)
    local stripeshell  = player:getCharVar(LEGACY_VARS.stripeshell)
    local bronzepiece  = player:getCharVar(LEGACY_VARS.bronzepiece)
    local silverpiece  = player:getCharVar(LEGACY_VARS.silverpiece)
    local goldpiece    = player:getCharVar(LEGACY_VARS.goldpiece)
    local byne         = player:getCharVar(LEGACY_VARS.byne)
    local hundredbyne  = player:getCharVar(LEGACY_VARS.hundredbyne)
    local tenkbyne     = player:getCharVar(LEGACY_VARS.tenkbyne)
    local currentBucks = player:getCharVar(VAR_DYNAMIS_BUCKS)

    local total =
          whiteshell + (jadeshell * 100) + (stripeshell * 10000)
        + bronzepiece + (silverpiece * 100) + (goldpiece * 10000)
        + byne + (hundredbyne * 100) + (tenkbyne * 10000)
        + currentBucks

    if total > MAX_DYNAMIS_BUCKS then
		total = MAX_DYNAMIS_BUCKS
	end

	player:setCharVar(VAR_DYNAMIS_BUCKS, total)

    player:setCharVar(LEGACY_VARS.whiteshell,   0)
    player:setCharVar(LEGACY_VARS.jadeshell,    0)
    player:setCharVar(LEGACY_VARS.stripeshell,  0)
    player:setCharVar(LEGACY_VARS.bronzepiece,  0)
    player:setCharVar(LEGACY_VARS.silverpiece,  0)
    player:setCharVar(LEGACY_VARS.goldpiece,    0)
    player:setCharVar(LEGACY_VARS.byne,         0)
    player:setCharVar(LEGACY_VARS.hundredbyne,  0)
    player:setCharVar(LEGACY_VARS.tenkbyne,     0)

    player:setCharVar(VAR_DYNAMIS_CONVERT, 1)
    player:printToPlayer("Pleasure doin' business with ya.", 0, "Coinstrix")
end

local function showMainMenu(player)
    local bucks = player:getCharVar(VAR_DYNAMIS_BUCKS) or 0
    delaySendMenu(player, function()
        return {
            title = "Coinstrix Services",
            options = {
                { string.format("Dynamis Bucks: %u", bucks), function(p) end },
                { "Deposit", function(p)
                    p:printToPlayer("To deposit, trade me any accepted Dynamis currency.", 0, "Coinstrix")
                end },
                { "Withdraw", function(p)
                    p:printToPlayer("To withdraw, trade me gil equal to the amount you want back.", 0, "Coinstrix")
                end },
                { "Convert", function(p)
                    p:printToPlayer("All conversions now happen automatically when you withdraw.", 0, "Coinstrix")
                end },
                { "Exit", function(p) end },
            },
        }
    end)
end

local function giveWithdraw(player, fam, amount)
    local item10k
    local item100
    local item1

    if fam == "bastok" then
        item10k = ITEM_TEN_THOUSAND_BYNE_BILL
        item100 = ITEM_HUNDRED_BYNE_BILL
        item1   = ITEM_ONE_BYNE_BILL
    elseif fam == "sandy" then
        item10k = ITEM_RANPERRE_GOLDPIECE
        item100 = ITEM_MONTIONT_SILVERPIECE
        item1   = ITEM_ORDELLE_BRONZEPIECE
    else
        item10k = ITEM_RIMILALA_STRIPESHELL
        item100 = ITEM_LUNGO_NANGO_JADESHELL
        item1   = ITEM_TUKUKU_WHITESHELL
    end

    local left   = amount
    local num10k = math.floor(left / 10000); left = left - num10k * 10000
    local num100 = math.floor(left / 100);   left = left - num100 * 100
    local num1   = left

    local items = {}
    if num10k > 0 then table.insert(items, { item10k, num10k }) end
    if num100 > 0 then table.insert(items, { item100, num100 }) end
    if num1   > 0 then table.insert(items, { item1,   num1   }) end

    if #items == 0 then
        return false
    end

    local stackSize   = 99
    local neededSlots = 0

    if num10k > 0 then
        neededSlots = neededSlots + math.ceil(num10k / stackSize)
    end
    if num100 > 0 then
        neededSlots = neededSlots + math.ceil(num100 / stackSize)
    end
    if num1 > 0 then
        neededSlots = neededSlots + math.ceil(num1 / stackSize)
    end

    if player:getFreeSlotsCount() < neededSlots then
        return false
    end

    if not npcUtil.giveItem(player, items) then
        return false
    end

    return true
end


local function performWithdraw(player, fam, gil)
    local bucks = player:getCharVar(VAR_DYNAMIS_BUCKS) or 0

    if bucks <= 0 then
		player:printToPlayer("What part of 'time is money' don't you understand?", 0, "Coinstrix")
        player:printToPlayer("Your Dynamis Bucks balance is 0. Deposit currency first.", 0, "Coinstrix")
        return
    end

    if gil <= 0 then
        player:printToPlayer("You must trade gil to withdraw.", 0, "Coinstrix")
        return
    end

    if gil > MAX_DYNAMIS_BUCKS then
        player:printToPlayer(string.format(
            "Yeah, very funny. You can withdraw at most %u Dynamis Bucks at a time.",
            MAX_DYNAMIS_BUCKS
        ), 0, "Coinstrix")
        return
    end

    local amountToPay = gil
    if bucks < amountToPay then
        amountToPay = bucks
    end

    if amountToPay <= 0 then
		player:printToPlayer("What part of 'time is money' don't you understand?", 0, "Coinstrix")
        player:printToPlayer("Your Dynamis Bucks balance is 0. Deposit currency first.", 0, "Coinstrix")
        return
    end

    local ok = giveWithdraw(player, fam, amountToPay)
    if not ok then
        player:printToPlayer("I got a long day, kid. Clear some inventory first.", 0, "Coinstrix")
        return
    end

    player:tradeComplete()

    if gil > amountToPay then
        npcUtil.giveItem(player, { { xi.item.GIL, gil - amountToPay } })
    end

    local newBucks = bucks - amountToPay
    if newBucks < 0 then newBucks = 0 end
    player:setCharVar(VAR_DYNAMIS_BUCKS, newBucks)

    player:printToPlayer(string.format(
        "Your balance is now %u Dynamis Bucks. Have a good one!",
        newBucks
    ), 0, "Coinstrix")
end


local function openWithdrawMenu(player, gil)
    local bucks = player:getCharVar(VAR_DYNAMIS_BUCKS) or 0
    if bucks <= 0 then
		player:printToPlayer("What part of 'time is money' don't you understand?", 0, "Coinstrix")
        player:printToPlayer("Your Dynamis Bucks balance is 0. Deposit currency first.", 0, "Coinstrix")
        return
    end

    if gil > MAX_DYNAMIS_BUCKS then
        player:printToPlayer(string.format(
            "Yeah, very funny. You can withdraw at most %u Dynamis Bucks at a time.",
            MAX_DYNAMIS_BUCKS
        ), 0, "Coinstrix")
        return
    end

    delaySendMenu(player, function()
        return {
            title = "Withdrawing?",
            options = {
                { "Bastok (Byne)",      function(p) performWithdraw(p, "bastok", gil) end },
                { "San d'Oria (Piece)", function(p) performWithdraw(p, "sandy",  gil) end },
                { "Windurst (Shell)",   function(p) performWithdraw(p, "windy",  gil) end },
                { "Exit",               function(p)
                    p:printToPlayer("I don't have time for this. Withdrawal cancelled.", 0, "Coinstrix")
                end },
            },
        }
    end)
end


local function handleDepositTrade(player, trade)
    if not tradeHasOnlyAllowedItems(trade) then
        player:printToPlayer("Dynamis currency only, Amateur.", 0, "Coinstrix")
        return
    end

    local total = 0

    for slot = 0, 8 do
        local id  = trade:getItemId(slot)
        if id ~= 0 and id ~= 65535 then
            local qty = trade:getSlotQty(slot)
            if qty > 0 and isValidCurrency(id) then
                total = total + currencyValue(id) * qty
            end
        end
    end

    if total <= 0 then
        player:printToPlayer("Nothing to deposit.", 0, "Coinstrix")
        return
    end

    if total > MAX_DYNAMIS_BUCKS then
        player:printToPlayer(string.format(
            "Yeah, very funny. You can withdraw at most %u Dynamis Bucks at a time.",
            MAX_DYNAMIS_BUCKS
        ), 0, "Coinstrix")
        return
    end

    local current = player:getCharVar(VAR_DYNAMIS_BUCKS) or 0

    if current >= MAX_DYNAMIS_BUCKS then
        player:printToPlayer(string.format(
            "Big shot, huh? You are already at the maximum of %u.",
            MAX_DYNAMIS_BUCKS
        ), 0, "Coinstrix")
        return
    end

    local newTotal = current + total
    if newTotal > MAX_DYNAMIS_BUCKS then
        player:printToPlayer(string.format(
            "That deposit would exceed the maximum of %u Dynamis Bucks. You can deposit at most %u more.",
            MAX_DYNAMIS_BUCKS,
            MAX_DYNAMIS_BUCKS - current
        ), 0, "Coinstrix")
        return
    end

    player:setCharVar(VAR_DYNAMIS_BUCKS, newTotal)
    player:tradeComplete()

    player:printToPlayer(string.format(
        "%d Dynamis Bucks added. Your balance is now %d Dynamis Bucks.",
        total, newTotal
    ), 0, "Coinstrix")
end


local function showConversionPreview(player)
    local whiteshell   = player:getCharVar(LEGACY_VARS.whiteshell)
    local jadeshell    = player:getCharVar(LEGACY_VARS.jadeshell)
    local stripeshell  = player:getCharVar(LEGACY_VARS.stripeshell)
    local bronzepiece  = player:getCharVar(LEGACY_VARS.bronzepiece)
    local silverpiece  = player:getCharVar(LEGACY_VARS.silverpiece)
    local goldpiece    = player:getCharVar(LEGACY_VARS.goldpiece)
    local byne         = player:getCharVar(LEGACY_VARS.byne)
    local hundredbyne  = player:getCharVar(LEGACY_VARS.hundredbyne)
    local tenkbyne     = player:getCharVar(LEGACY_VARS.tenkbyne)
    local currentBucks = player:getCharVar(VAR_DYNAMIS_BUCKS)

    local preview =
          whiteshell + (jadeshell*100) + (stripeshell*10000)
        + bronzepiece + (silverpiece*100) + (goldpiece*10000)
        + byne + (hundredbyne*100) + (tenkbyne*10000)
        + currentBucks

    player:printToPlayer("You currently have...", 0, "Coinstrix")
    player:printToPlayer(string.format(
        "Windurst: %u Whiteshell, %u Jadeshell, %u Stripeshell",
        whiteshell, jadeshell, stripeshell
    ), 0, "Coinstrix")
    player:printToPlayer(string.format(
        "San d'Oria: %u Bronzepiece, %u Silverpiece, %u Goldpiece",
        bronzepiece, silverpiece, goldpiece
    ), 0, "Coinstrix")
    player:printToPlayer(string.format(
        "Bastok: %u One Byne, %u Hundred Byne, %u Ten Thousand Byne",
        byne, hundredbyne, tenkbyne
    ), 0, "Coinstrix")

    player:printToPlayer(string.format("After conversion you will have %u Dynamis Bucks.", preview), 0, "Coinstrix")

    delaySendMenu(player, function()
        return {
            title = "Convert now?",
            options = {
                { "Yes", function(p)
                    runMigration(p)
                end },
                { "Let me double check my statements", function(p)
                    p:printToPlayer("Keep it real!", 0, "Coinstrix")
                end },
            },
        }
    end)
end

local function introConversion(player)
    player:printToPlayer("Sup? Ever heard of Dynamis Bucks?  Exchange your ancient currencies with me and you will never have issues", 0, "Coinstrix")
    player:printToPlayer("depositing, withdrawing, or converting them ever again.  One ancient currency equals one Dynamis Buck!", 0, "Coinstrix")
	delaySendMenu(player, function()
        return {
            title = "Understand?",
            options = {
                { "Yes!", function(p)
                    showConversionPreview(p)
                end },
                { "Nope!", function(p)
                    p:printToPlayer("Let me explain that again...", 0, "Coinstrix")
                    introConversion(p)
                end },
            },
        }
    end)
end

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)

    local coinstrix = zone:insertDynamicEntity({
        objtype  = xi.objType.NPC,
        name     = 'Coinstrix',
        look     = '0x0000550000000000000000000000000000000000',
        x        = 318.5695,
        y        = -3.0170,
        z        = -548.3183,
        rotation = 48,
        widescan = 1,

        onTrade = function(player, npc, trade)
            local converted = player:getCharVar(VAR_DYNAMIS_CONVERT) or 0

            if converted == 0 then
                player:printToPlayer("We are under new management, please talk to me before you make any more deposits or withdrawals.", 0, "Coinstrix")
                return
            end

            local gil   = trade:getGil()
            local hasIt = tradeHasAnyItem(trade)

            if gil > 0 and hasIt then
                player:printToPlayer("Please deposit currency OR withdraw with gil, not both.", 0, "Coinstrix")
                return
            end

            if gil > 0 and not hasIt then
                openWithdrawMenu(player, gil)
                return
            end

            if hasIt then
                handleDepositTrade(player, trade)
                return
            end

            player:printToPlayer("Nothing to deposit.", 0, "Coinstrix")
        end,

        onTrigger = function(player, npc)
            local converted = player:getCharVar(VAR_DYNAMIS_CONVERT) or 0

            if converted == 0 then
                introConversion(player)
            else
                showMainMenu(player)
            end
        end,
    })

    utils.unused(coinstrix)
end)

return m
