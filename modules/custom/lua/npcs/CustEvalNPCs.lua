-- Required modules for functionality.
require("modules/module_utils")
require("scripts/globals/npc_util")

-- Global declarations for menu pages (Used by both Campaign NPCs and the Time Portal)
local menu = {} -- Main Menu Title structure for paginated transfers

-- CONFIGURATION TOGGLES
local DEBUG_MODE = false -- Re-enabling debug to track transaction steps

---@type Module
local m = Module:new('CustEvalNPCs') -- Renamed the module here

-- Ensure m has a logDebug method for safe printing
if not m.logDebug then
    m.logDebug = function(_, format, ...) -- '_' consumes the 'self' argument
        if DEBUG_MODE then 
            -- Reverting print statement structure to match the user's previous logs
            print(string.format("[DEBUG] [CustEvalNPCs] " .. format, ...)) 
        end
    end
end

-- The campaign medal Key Item IDs and their required lifetime scores, indexed by rank (1 to 20).
local CAMPAIGN_RANKS = {
    [1] = { ki_id = xi.ki.BRONZE_RIBBON_OF_SERVICE, threshold = 1000 },
    [2] = { ki_id = xi.ki.BRONZE_STAR, threshold = 2000 },
    [3] = { ki_id = xi.ki.COPPER_EMBLEM_OF_SERVICE, threshold = 3000 },
    [4] = { ki_id = xi.ki.BRASS_WINGS_OF_SERVICE, threshold = 4000 },
    [5] = { ki_id = xi.ki.STARLIGHT_MEDAL, threshold = 5000 },
    [6] = { ki_id = xi.ki.BRASS_RIBBON_OF_SERVICE, threshold = 6000 },
    [7] = { ki_id = xi.ki.STERLING_STAR, threshold = 7000 },
    [8] = { ki_id = xi.ki.IRON_EMBLEM_OF_SERVICE, threshold = 8000 },
    [9] = { ki_id = xi.ki.MYTHRIL_WINGS_OF_SERVICE, threshold = 9000 },
    [10] = { ki_id = xi.ki.MOONLIGHT_MEDAL, threshold = 10000 },
    [11] = { ki_id = xi.ki.ALLIED_RIBBON_OF_BRAVERY, threshold = 11000 },
    [12] = { ki_id = xi.ki.MYTHRIL_STAR, threshold = 12000 },
    [13] = { ki_id = xi.ki.HOLYKNIGHT_EMBLEM, threshold = 13000 },
    [14] = { ki_id = xi.ki.WINGS_OF_INTEGRITY, threshold = 14000 },
    [15] = { ki_id = xi.ki.DAWNLIGHT_MEDAL, threshold = 15000 },
    [16] = { ki_id = xi.ki.ALLIED_RIBBON_OF_GLORY, threshold = 16000 },
    [17] = { ki_id = xi.ki.GOLDEN_STAR, threshold = 17000 },
    [18] = { ki_id = xi.ki.STEELKNIGHT_EMBLEM, threshold = 18000 },
    [19] = { ki_id = xi.ki.WINGS_OF_HONOR, threshold = 19000 },
    [20] = { ki_id = xi.ki.MEDAL_OF_ALTANA, threshold = 20000 },
}

-- New table for reward items. Structure: { name, item_id, cost_in_allied_notes }
local CAMPAIGN_REWARDS = {
    {"Shikkoku Head", 12126, 900000},
    {"Shikkoku Togi", 12162, 900000},
    {"Shikkoku Kote", 12198, 900000},
    {"Shikkoku Legs", 12234, 900000},
    {"Shikkoku Feet", 12270, 900000},
}
local ITEMS_PER_PAGE = 4
-- FIX: Changing the internal key to all lowercase based on user confirmation that '!delcurrency allied_notes' works.
local CURRENCY_NAME = "allied_notes" 
local TEXT_CURRENCY_NAME = "Allied Notes" -- This remains mixed case for display only.

-- Localized Player-Facing Text.
local MESSAGES = {
    greeting = "Welcome! I am the Campaign Service Judge. I am here to review your service record for the Allied War Council.",
    
    -- Main Menu
    menuTitle = "Do you require an evaluation?",
    menuOptionEvaluate = "Yes, please evaluate my service record.",
    menuOptionRedeem = "Redeem Allied Notes",
    menuOptionAnnouncements = "Campaign Message Settings", -- NEW
    menuOptionNo = "No, thank you.",
    noChangeOfMind = "Understood. Come back when you are ready for a review.", -- Kept but no longer used in the 'No' option.
    
    -- Evaluation Messages
    rankUpA = "%s! Your recent performance has been evaluated and the Allied War Council has deemed you worthy of a new medal!",
    rankUpC = "%s, for exemplary service, I present you with a new medal! You need %d more points to achieve the next medal.",
    noRankUp = "While the Allied War Council was pleased with your work, we determined that it did not warrant a new medal.",
    noRankUpPoints = "Your service record is satisfactory. You need %d more points to achieve the next medal rank.",
    maxRankAchieved = "Your service record is exemplary! You have achieved the highest rank possible for the Allied Forces.",

    -- Rewards Messages
    rewardsTitle = "Redeem your %s! (%d)",
    noFunds = "You need %d %s to purchase the %s, but you only possess %d.",
    inventoryFull = "Your inventory is full. Make room before attempting to purchase %s. Your %s were not deducted.",
    purchaseSuccess = "Thank you for your service! You have exchanged %d %s for the %s.",
    navNext = "Next",
    navPrev = "Previous",
    navBack = "Back",

    -- Announcements Messages (NEW)
    announcementsTitle = "Do you want the messages?",
    announceOff = "Campaign messages are now OFF",
    announceOn = "Campaign messages are now ON",
}

-- A global function for delayed menu sending.
local function delaySendMenu(player)
    player:timer(50, function(playerArg)
        -- NOTE: Using a generic 'menu' table for a clean one-page prompt.
        playerArg:customMenu(menu) 
    end)
end

--- Retrieves the name of a Key Item using its ID.
local function getMedalName(itemId)
    local name = nil
    
    local success, result = pcall(function()
        if _G.res and _G.res.items and _G.res.items.get then
            local item = _G.res.items.get(itemId)
            return item and item.name
        end
        return nil
    end)

    if success and result then
        name = result
    end
    
    if name then
        return name
    else
        m:logDebug("WARNING: Failed to retrieve Key Item name for ID %d. Using fallback.", itemId)
        return "New Medal (ID: " .. tostring(itemId) .. ")"
    end
end

--- Handles the logic for checking the player's lifetime score and granting medals.
---@param player Player
---@param npc NPC
local function giveCampaignMedals(player, npc)
    local playerName = player:getName()
    local npcName = npc:getPacketName()
    
    local currentScore = player:getCharVar('PB_TotalLifetimeScore') or 0
    local medalsAwarded = 0
    local highestNewMedalId = nil
    local nextMedalThreshold = 0

    m:logDebug("--- Campaign Medal Evaluation for %s START ---", playerName)
    m:logDebug("Current PB_TotalLifetimeScore: %d", currentScore)

    -- Loop through the campaign ranks
    for rank, rankData in ipairs(CAMPAIGN_RANKS) do
        local requiredScore = rankData.threshold
        local medalId = rankData.ki_id
        local ki_is_valid = type(medalId) == 'number'
        local has_ki = ki_is_valid and player:hasKeyItem(medalId)

        if currentScore >= requiredScore and ki_is_valid and not has_ki then
            m:logDebug("Awarding Medal: %d (Rank %d). Score %d >= Threshold %d.", medalId, rank, currentScore, requiredScore)
            npcUtil.giveKeyItem(player, medalId)
            
            medalsAwarded = medalsAwarded + 1
            highestNewMedalId = medalId
        elseif currentScore < requiredScore then
            nextMedalThreshold = requiredScore 
            m:logDebug("Stopping search at Rank %d. Next medal threshold is %d.", rank, nextMedalThreshold)
            break 
        end
    end
    
    m:logDebug("--- Evaluation Complete. Total medals awarded: %d ---", medalsAwarded)

    -- Provide final feedback
    if medalsAwarded > 0 then
        local medalName = getMedalName(highestNewMedalId)
        
        local nextRankIsLast = nextMedalThreshold == 0 and highestNewMedalId ~= nil and highestNewMedalId == CAMPAIGN_RANKS[#CAMPAIGN_RANKS].ki_id
        local scoreToNextMedal = nextRankIsLast and 0 or (nextMedalThreshold > 0 and (nextMedalThreshold - currentScore) or 0)

        player:printToPlayer(string.format(MESSAGES.rankUpA, playerName), 0, npcName)
        
        player:timer(100, function(playerArg)
            local message_text
            if nextRankIsLast then
                message_text = MESSAGES.maxRankAchieved
            else
                message_text = string.format(MESSAGES.rankUpC, playerName, scoreToNextMedal)
            end

            playerArg:printToPlayer(message_text, 0, npcName)
        end)
    else
        -- NO RANK UP DIALOG
        local nextThreshold = 0
        for rank, rankData in ipairs(CAMPAIGN_RANKS) do
            if not player:hasKeyItem(rankData.ki_id) then
                nextThreshold = rankData.threshold
                break
            end
        end

        if nextThreshold == 0 then
            m:logDebug("Player already has max rank key item.")
            player:printToPlayer(MESSAGES.maxRankAchieved, 0, npcName)
        else
            local pointsNeeded = nextThreshold - currentScore
            m:logDebug("No rank up. Points needed for next threshold (%d): %d", nextThreshold, pointsNeeded)
            
            player:printToPlayer(MESSAGES.noRankUp, 0, npcName)
            
            player:timer(100, function(playerArg)
                playerArg:printToPlayer(string.format(MESSAGES.noRankUpPoints, pointsNeeded), 0, npcName)
            end)
        end
    end
end

--- Displays the paginated rewards menu.
--- NOTE: Made global to ensure visibility within delayed callbacks.
---@param player Player
---@param npc NPC
---@param page number The page number to display (1-indexed).
function showRewardsMenu(player, npc, page)
    m:logDebug("%s: Opening rewards menu (Page %d requested).", player:getName(), page)
    
    local totalItems = #CAMPAIGN_REWARDS
    local totalPages = math.ceil(totalItems / ITEMS_PER_PAGE)
    local currentPage = math.max(1, math.min(page, totalPages)) -- Clamp page number
    
    -- Calculate start and end indices for the current page
    local startIndex = ((currentPage - 1) * ITEMS_PER_PAGE) + 1
    local endIndex = math.min(currentPage * ITEMS_PER_PAGE, totalItems)

    -- Use getCurrency which is confirmed to work for reading the balance
    local currentNotes = player:getCurrency(CURRENCY_NAME) or 0
    
    m:logDebug("Total Items: %d, Total Pages: %d. Showing items %d through %d on page %d. Player balance: %d.", totalItems, totalPages, startIndex, endIndex, currentPage, currentNotes)
    
    -- Construct the menu title with current balance
    local rewardsMenu = {}
    rewardsMenu.title = string.format(MESSAGES.rewardsTitle, TEXT_CURRENCY_NAME, currentNotes)
    rewardsMenu.options = {}

    -- 1. Add reward options for the current page (4 items max)
    for i = startIndex, endIndex do
        local itemData = CAMPAIGN_REWARDS[i]
        local name, id, cost = itemData[1], itemData[2], itemData[3]
        
        -- Format the menu option as: [Item Name] (Cost pts)
        local optionText = string.format("%s (%d)", name, cost)
        
        table.insert(rewardsMenu.options, {
            optionText,
            function(playerArg)
                m:logDebug("%s selected item: %s (Cost: %d). Opening confirmation menu.", playerArg:getName(), name, cost)
                -- Confirmation prompt before purchase
                local confirmMenu = {}
                confirmMenu.title = ("Are you sure?")
                confirmMenu.options = {
                    { "Yes, Buy It!", function(p) handleRewardPurchase(p, npc, id, cost, name, currentPage) end },
                    { "No, Go Back.", function(p) 
                        -- FIX: Use a timer when opening a new menu from a menu callback
                        p:timer(50, function(p)
                            showRewardsMenu(p, npc, currentPage) 
                        end)
                    end },
                }
                -- FIX: Use a timer when opening a new menu from a menu callback
                playerArg:timer(50, function(p)
                    p:customMenu(confirmMenu)
                end)
            end
        })
    end

    -- 2. Add navigation options
    
    -- Previous Page
    if currentPage > 1 then
        m:logDebug("Adding 'Previous' navigation.")
        table.insert(rewardsMenu.options, {
            MESSAGES.navPrev,
            function(playerArg)
                m:logDebug("%s selected 'Previous'. Moving to page %d.", playerArg:getName(), currentPage - 1)
                -- FIX: Use a timer when opening a new menu from a menu callback (pagination)
                playerArg:timer(50, function(p)
                    showRewardsMenu(p, npc, currentPage - 1)
                end)
            end
        })
    end
    
    -- Next Page
    if currentPage < totalPages then
        m:logDebug("Adding 'Next' navigation.")
        table.insert(rewardsMenu.options, {
            MESSAGES.navNext,
            function(playerArg)
                m:logDebug("%s selected 'Next'. Moving to page %d.", playerArg:getName(), currentPage + 1)
                -- FIX: Use a timer when opening a new menu from a menu callback (pagination)
                playerArg:timer(50, function(p)
                    showRewardsMenu(p, npc, currentPage + 1)
                end)
            end
        })
    end
    
    -- Back to Main Menu (Always last option)
    table.insert(rewardsMenu.options, {
        MESSAGES.navBack,
        function(playerArg)
            m:logDebug("%s selected 'Back'. Returning to main menu.", playerArg:getName())
            -- FIX: Send the main menu directly to avoid the CAIActionQueue crash from onTrigger inside a timer.
            playerArg:timer(50, function(p)
                -- Print greeting again for context, then display the main menu (which was populated in onTrigger)
                p:printToPlayer(MESSAGES.greeting, 0, npc:getPacketName())
                p:customMenu(menu)
            end)
        end
    })

    player:customMenu(rewardsMenu)
end

--- Handles the transaction logic for purchasing a reward item.
--- NOTE: Made global to ensure visibility within delayed callbacks.
---@param player Player
---@param npc NPC
---@param itemID number
---@param cost number
---@param itemName string
---@param page number The page to return to after purchase attempt.
function handleRewardPurchase(player, npc, itemID, cost, itemName, page)
    -- Use getCurrency for custom currency
    local currentNotes = player:getCurrency(CURRENCY_NAME) or 0

    m:logDebug("%s: Starting purchase attempt for %s (ID:%d). Cost: %d %s. Current notes: %d", player:getName(), itemName, itemID, cost, TEXT_CURRENCY_NAME, currentNotes)

    -- 1. Check Currency
    if currentNotes < cost then
        m:logDebug("FAIL: Currency check. Needed %d, has %d. Aborting purchase.", cost, currentNotes)
        player:printToPlayer(string.format(MESSAGES.noFunds, cost, TEXT_CURRENCY_NAME, itemName, currentNotes), 0, npc:getPacketName())
        -- Return to the rewards menu after a short delay
        player:timer(1500, function(playerArg)
            playerArg:timer(50, function(p)
                showRewardsMenu(p, npc, page)
            end)
        end)
        return
    end
    m:logDebug("PASS: Currency check successful.")

    -- 2. Check Inventory Space (assuming a count of 1 for the item)
    if player:getFreeSlotsCount() < 1 then
        m:logDebug("FAIL: Inventory full (%d free slots). Aborting purchase.", player:getFreeSlotsCount())
        player:printToPlayer(string.format(MESSAGES.inventoryFull, itemName, TEXT_CURRENCY_NAME), 0, npc:getPacketName())
        player:timer(1500, function(playerArg)
            playerArg:timer(50, function(p)
                showRewardsMenu(p, npc, page)
            end)
        end)
        return
    end
    m:logDebug("PASS: Inventory space available.")


    -- 3. Execute Transaction
    
    -- FIX: Reverting to delCurrency, as the GM command proved it is the correct function 
    -- when the currency key is the correct case (all lowercase).
    player:delCurrency(CURRENCY_NAME, cost)

    -- Give the item
    npcUtil.giveItem(player, {{itemID, 1}}, { msg = false }) -- msg = false to handle our own success message

    local newNotes = player:getCurrency(CURRENCY_NAME) or 0 -- Get the new balance after the successful deduction

    m:logDebug("Transaction SUCCESS. %d %s deducted. New balance: %d. Item %s (ID:%d) given.", cost, CURRENCY_NAME, newNotes, itemName, itemID)

    -- Success message
    player:printToPlayer(string.format(MESSAGES.purchaseSuccess, cost, TEXT_CURRENCY_NAME, itemName), 0, npc:getPacketName())

    -- We intentionally stop interaction here to ensure the item and notes are processed correctly.
end

--- Handles the menu for setting Campaign Message preferences. (NEW)
---@param player Player
---@param npc NPC
local function handleAnnouncementsMenu(player, npc)
    local npcName = npc:getPacketName()
    -- CampaignMSG: 0 = ON (default), 1 = OFF
    local currentSetting = player:getCharVar('CampaignMSG') or 0 
    local currentStateText = (currentSetting == 1) and "OFF" or "ON"

    m:logDebug("%s: Opening Announcements menu. Current setting: %s (var: %d)", player:getName(), currentStateText, currentSetting)
    
    local confirmMenu = {}
    
    -- The prompt asks if they want to turn OFF messages
    confirmMenu.title = MESSAGES.announcementsTitle .. " (Set to: " .. currentStateText .. ")"
    confirmMenu.options = {
        -- YES - Turn OFF (Set CampaignMSG to 1)
        { 
            "Turn Messages OFF", 
            function(p) 
                p:setCharVar('CampaignMSG', 1)
                m:logDebug("%s set CampaignMSG to 1 (OFF).", p:getName())
                p:printToPlayer(MESSAGES.announceOff, 0, npcName)
                -- Return to main menu after a short delay
                p:timer(1500, function(playerArg) 
                    delaySendMenu(playerArg) 
                end)
            end 
        },
        -- NO - Keep ON (Set CampaignMSG to 0)
        { 
            "Turn Messages ON", 
            function(p) 
                p:setCharVar('CampaignMSG', 0)
                m:logDebug("%s set CampaignMSG to 0 (ON).", p:getName())
                p:printToPlayer(MESSAGES.announceOn, 0, npcName)
                -- Return to main menu after a short delay
                p:timer(1500, function(playerArg) 
                    delaySendMenu(playerArg) 
                end)
            end 
        },
        -- Back to main menu
        {
            MESSAGES.navBack,
            function(playerArg)
                m:logDebug("%s selected 'Back' from Announcements.", playerArg:getName())
                -- Print greeting again for context, then display the main menu
                playerArg:timer(50, function(p)
                    p:printToPlayer(MESSAGES.greeting, 0, npcName)
                    p:customMenu(menu)
                end)
            end
        }
    }

    -- FIX: Use a timer when opening a new menu from a menu callback
    player:timer(50, function(p)
        p:customMenu(confirmMenu)
    end)
end

--- Overrides the Mog Garden initialization to insert the Campaign Judge NPC.
m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    local ok, err = pcall(function()
        super(zone)
    end)
    if not ok then
        print('ERROR: super(zone) failed in Mog Garden: ' .. tostring(err))
    end
    
    -- Define and insert the Campaign Judge NPC.
    local campevalnpc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Campaign Judge',
        look = '01000c0196103920963096409650006000700000', 
        x = 384.4120,
        y = -0.2665,
        z = -577.0699,
        rotation = 57, 
        widescan = 1,
        
        -- Custom onTrigger logic for the Campaign Judge
        onTrigger = function(player, npc)
            local npcName = npc:getPacketName()
            m:logDebug("NPC Triggered by %s. Displaying main menu.", player:getName())

            -- Print the general greeting.
            player:printToPlayer(MESSAGES.greeting, 0, npcName)

            -- Define the core menu options here.
            menu.title = MESSAGES.menuTitle
            menu.options = {
                {
                    MESSAGES.menuOptionEvaluate,
                    function(playerArg)
                        m:logDebug("%s selected: Evaluate service record.", playerArg:getName())
                        -- If 'Evaluate', proceed to evaluation logic
                        giveCampaignMedals(playerArg, npc)
                    end
                },
                -- REWARDS OPTION
                {
                    MESSAGES.menuOptionRedeem,
                    function(playerArg)
                        m:logDebug("%s selected: Redeem Allied Notes. Moving to rewards page 1.", playerArg:getName())
                        -- If 'Redeem', go to the first page of the rewards menu
                        -- FIX: Use a timer when opening a new menu from a menu callback
                        playerArg:timer(50, function(p)
                            showRewardsMenu(p, npc, 1)
                        end)
                    end
                },
                -- NEW ANNOUNCEMENTS OPTION
                {
                    MESSAGES.menuOptionAnnouncements,
                    function(playerArg)
                        m:logDebug("%s selected: Campaign Message Settings.", playerArg:getName())
                        handleAnnouncementsMenu(playerArg, npc)
                    end
                },
                {
                    MESSAGES.menuOptionNo,
                    function(playerArg)
                        m:logDebug("%s selected: Exit menu.", playerArg:getName())
                        -- If 'No', simply close the menu without a message.
                        -- Original: playerArg:printToPlayer(MESSAGES.noChangeOfMind, 0, npcName)
                    end
                }
            }
            
            delaySendMenu(player)
            
            return true -- Handled the trigger
        end,
    })

end)



return m
