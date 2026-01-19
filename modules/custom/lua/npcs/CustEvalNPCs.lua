-- Required modules for functionality.
require("modules/module_utils")
require("scripts/globals/npc_util")

-- Use PB_DemotionFlag to know if players need to lose medals
-- =============================================================================
-- SERVER VARIABLES
-- [CampaignBattleHandler]BattleID  : Tracks the current global battle ID.
-- CampaignResources                : Tracks global campaign resources.
-- CampaignSupplies                 : Tracks global campaign supplies.
--
-- CHARACTER VARIABLES
-- PB_DemotionFlag                  : Flag (1) if player is pending demotion due to inactivity.
-- PB_LastEvalBattleID              : The Battle ID when the player was last evaluated/paid.
-- PB_LastBattleID                  : The Battle ID of the last battle the player participated in.
-- PB_TotalLifetimeScore            : The player's total accumulated campaign score.
-- CampaignMSG                      : Setting (0=ON, 1=OFF) for campaign announcements.
-- =============================================================================

-- Global declarations for menu pages
local menu = {} -- Main Menu Title structure

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

-- =============================================================================
-- INACTIVITY AND DEMOTION CONFIGURATION
-- =============================================================================
local INACTIVITY_GRACE_PERIOD_BATTLES = 28 -- Approx. 2 IRL days (14 battles/day * 2)

local DEMOTION_FLAG_VAR = 'PB_DemotionFlag' -- CharVar to prevent multiple demotions. (1 = Demoted)

-- NEW: Cost in gil per missed battle for a player to reactivate their service record and avoid demotion.
local REACTIVATION_COST_PER_BATTLE = 50000

-- Server variable for the global battle ID
local LAST_EVAL_BATTLE_ID_VAR = 'PB_LastEvalBattleID' -- CharVar to store the battle ID at time of evaluation.
local PLAYER_LAST_BATTLE_ID_VAR = 'PB_LastBattleID' -- CharVar used by CampaignBattleHandler for inactivity checks.
-- =============================================================================

-- Resource Caps
local MAX_CAMPAIGN_RESOURCES = 1000
local MAX_CAMPAIGN_SUPPLIES = 1000

-- The campaign medal Key Item IDs and their required lifetime scores, indexed by rank (1 to 20).
local CAMPAIGN_RANKS = {
    [1] =  {     ki_id = xi.ki.BRONZE_RIBBON_OF_SERVICE,   threshold = 1000 },   -- ~5 battles from start
    [2] =  {     ki_id = xi.ki.BRONZE_STAR,                threshold = 2000 },   -- ~5 battles from rank 1
    [3] =  {     ki_id = xi.ki.COPPER_EMBLEM_OF_SERVICE,   threshold = 3200 },   -- ~6 battles from rank 2
    [4] =  {     ki_id = xi.ki.BRASS_WINGS_OF_SERVICE,     threshold = 4600 },   -- ~7 battles from rank 3
    [5] =  {     ki_id = xi.ki.STARLIGHT_MEDAL,            threshold = 6200 },   -- ~8 battles from rank 4
    [6] =  {     ki_id = xi.ki.BRASS_RIBBON_OF_SERVICE,    threshold = 8000 },   -- ~9 battles from rank 5
    [7] =  {     ki_id = xi.ki.STERLING_STAR,              threshold = 10000 },  -- ~10 battles from rank 6
    [8] =  {     ki_id = xi.ki.IRON_EMBLEM_OF_SERVICE,     threshold = 12200 },  -- ~11 battles from rank 7
    [9] =  {     ki_id = xi.ki.MYTHRIL_WINGS_OF_SERVICE,   threshold = 14600 },  -- ~12 battles from rank 8
    [10] = {     ki_id = xi.ki.MOONLIGHT_MEDAL,             threshold = 17200 },  -- ~13 battles from rank 9
    [11] = {     ki_id = xi.ki.ALLIED_RIBBON_OF_BRAVERY,    threshold = 20000, inactivity_penalty_percent = 0.0018 }, -- ~8 Days to demote
    [12] = {     ki_id = xi.ki.MYTHRIL_STAR,                threshold = 23000, inactivity_penalty_percent = 0.0020 },
    [13] = {     ki_id = xi.ki.STEELKNIGHT_EMBLEM,           threshold = 26200, inactivity_penalty_percent = 0.0022 },
    [14] = {     ki_id = xi.ki.WINGS_OF_INTEGRITY,          threshold = 29600, inactivity_penalty_percent = 0.0024 },
    [15] = {     ki_id = xi.ki.DAWNLIGHT_MEDAL,             threshold = 33200, inactivity_penalty_percent = 0.0026 },
    [16] = {     ki_id = xi.ki.ALLIED_RIBBON_OF_GLORY,      threshold = 37000, inactivity_penalty_percent = 0.0028 },
    [17] = {     ki_id = xi.ki.GOLDEN_STAR,                 threshold = 41000, inactivity_penalty_percent = 0.0030 },
    [18] = {     ki_id = xi.ki.HOLYKNIGHT_EMBLEM,          threshold = 45000, inactivity_penalty_percent = 0.0032 },    
    [19] = {     ki_id = xi.ki.WINGS_OF_HONOR,              threshold = 49000, inactivity_penalty_percent = 0.0034 },
    [20] = {     ki_id = xi.ki.MEDAL_OF_ALTANA,             threshold = 53000, inactivity_penalty_percent = 0.0036 }, -- ~5 Days to demote
}

-- Removed CAMPAIGN_REWARDS and associated currency configuration

-- Localized Player-Facing Text.
local MESSAGES = {
    greeting = "Welcome! I am the Campaign Service Judge. I am here to review your service record for the Allied War Council.",
    
    -- Main Menu
    menuTitle = "Do you require an evaluation?",
    menuOptionEvaluate = "Yes, please evaluate my service record.",
    -- Removed menuOptionRedeem
    menuOptionAnnouncements = "Campaign Message Settings", 
    menuOptionNo = "No, thank you.",
    noChangeOfMind = "Understood. Come back when you are ready for a review.", 
    
    -- Evaluation Messages
    rankUpA = "%s! Your recent performance has been evaluated and the Allied War Council has deemed you worthy of a new medal!",
    rankUpC = "%s, for exemplary service, I present you with a new medal! You need %d more points to achieve the next medal.",
    noRankUp = "While the Allied War Council was pleased with your work, we determined that it did not warrant a new medal.",
    noRankUpPoints = "Your service record is satisfactory. You need %d more points to achieve the next medal rank.",
    maxRankAchieved = "Your service record is exemplary! You have achieved the highest rank possible for the Allied Forces.",
    
    -- Demotion Messages
    demotionWarning = "However, your recent period of inactivity has been noted. A penalty has been applied to your service record.",
    demotionMessage = "Due to this penalty, your rank has been adjusted. The Allied Council has recalled your %s.",

    -- NEW: Reactivation Messages
    reactivationPrompt = " %d battles missed. Donate %d gil?",
    reactivationSuccess = "Your contribution has been noted, and your service record is now up to date. Thank you, soldier.",
    reactivationNoFunds = "You do not have sufficient gil for this contribution.",
    reactivationUpToDate = "Your service record is already up to date. No contribution is necessary.",

    -- Removed Rewards Messages
    
    -- Announcements Messages
    announcementsTitle = "Do you want the messages?",
    announceOff = "Campaign messages are now OFF",
    announceOn = "Campaign messages are now ON",
    navBack = "Back",
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
    local name = GetKeyItemName(itemId)

    if name then
        return name
    else
        m:logDebug("WARNING: Failed to retrieve Key Item name for ID %d. Using fallback.", itemId)
        return "New Medal (ID: " .. tostring(itemId) .. ")"
    end
end

--- Gets the player's highest campaign rank based on the KIs they possess.
---@param player Player The player to check.
---@return number The player's rank (1-20), or 0 if they have no rank.
local function getPlayerCampaignRank(player)
    -- Iterate backwards from the highest rank to find the first medal they have.
    for i = #CAMPAIGN_RANKS, 1, -1 do
        local rankData = CAMPAIGN_RANKS[i]
        if player:hasKeyItem(rankData.ki_id) then
            return i -- Return the rank number
        end
    end
    return 0 -- No rank found
end

--- Checks if a player's score has dropped below a medal threshold and removes the KI.
---@param player Player The player to check.
---@param currentScore number The player's new, potentially penalized score.
---@return number|nil The ID of the key item that was removed, or nil if no demotion.
local function checkForDemotion(player, currentScore)
    local demotedMedalId = nil
    -- Iterate backwards from the highest rank to find the first medal they have but no longer qualify for.
    for i = #CAMPAIGN_RANKS, 1, -1 do
        local rankData = CAMPAIGN_RANKS[i]
        local medalId = rankData.ki_id
        local requiredScore = rankData.threshold

        if player:hasKeyItem(medalId) then
            if currentScore < requiredScore then
                -- They have this medal but their score is now too low.
                player:delKeyItem(medalId)
                demotedMedalId = medalId
                m:logDebug("Demotion: Score %d is less than threshold %d for KI %d. Removing KI.", currentScore, requiredScore, medalId)
                return demotedMedalId -- Return immediately after the first (highest) demotion
            else
                -- They have this medal and still qualify, so they can't be demoted further down.
                break
            end
        end
    end
    return nil
end

local giveCampaignMedals -- Forward declaration

---
--- Handles the player's request to reactivate their service record by paying a fee.
---@param player CPlayer
---@param npc CNpc
local function handleReactivation(player, npc)
    local npcName = npc:getPacketName()
    local playerLastBattleID = player:getCharVar(LAST_EVAL_BATTLE_ID_VAR) or 0
    local currentBattleID = GetServerVariable('[CampaignBattleHandler]BattleID') or 0

    local missedBattles = currentBattleID - playerLastBattleID
 
    if missedBattles <= 0 then
        -- Safety Check: If player is flagged but up to date (e.g. re-flagged due to desync), clear flag.
        if player:getCharVar(DEMOTION_FLAG_VAR) == 1 then
            player:setCharVar(DEMOTION_FLAG_VAR, 0)
            player:setCharVar(PLAYER_LAST_BATTLE_ID_VAR, currentBattleID) -- Sync battle tracker
            m:logDebug("Player %s was flagged but up to date. Cleared flag and synced PB_LastBattleID.", player:getName())
        end
        player:printToPlayer(MESSAGES.reactivationUpToDate, 0, npcName)
        giveCampaignMedals(player, npc)
        return
    end

    local totalCost = missedBattles * REACTIVATION_COST_PER_BATTLE

    -- Create a confirmation menu
    local confirmMenu = {
        title = string.format(MESSAGES.reactivationPrompt, missedBattles, totalCost),
        options = {
            { "Yes, contribute.", function(p)
                if p:getGil() < totalCost then
                    p:printToPlayer(MESSAGES.reactivationNoFunds, 0, npcName)
                    return
                end

                -- 1. Deduct Gil
                p:delGil(totalCost)

                -- 2. Update player's battle ID and clear demotion flag
                p:setCharVar(LAST_EVAL_BATTLE_ID_VAR, currentBattleID)
                p:setCharVar(PLAYER_LAST_BATTLE_ID_VAR, currentBattleID) -- Sync battle tracker to prevent immediate re-flagging
                p:setCharVar(DEMOTION_FLAG_VAR, 0)
                m:logDebug("Player %s reactivated. Set %s and %s to %d and cleared demotion flag.", p:getName(), LAST_EVAL_BATTLE_ID_VAR, PLAYER_LAST_BATTLE_ID_VAR, currentBattleID)

                -- 3. Calculate and distribute donations
                local resourceDonation, supplyDonation
                if totalCost < 1000000 then
                    resourceDonation = 1
                    supplyDonation = 1
                else
                    local donationAmount = math.floor(totalCost / 2)
                    resourceDonation = donationAmount
                    supplyDonation = donationAmount
                end

                -- 4. Update server variables
                local currentResources = tonumber(GetServerVariable("CampaignResources")) or 0
                local currentSupplies = tonumber(GetServerVariable("CampaignSupplies")) or 0

                local newResources = math.min(MAX_CAMPAIGN_RESOURCES, currentResources + resourceDonation)
                local newSupplies = math.min(MAX_CAMPAIGN_SUPPLIES, currentSupplies + supplyDonation)

                SetServerVariable("CampaignResources", newResources)
                SetServerVariable("CampaignSupplies", newSupplies)

                m:logDebug("Distributed %d to Resources and %d to Supplies.", resourceDonation, supplyDonation)

                p:printToPlayer(MESSAGES.reactivationSuccess, 0, npcName)
                giveCampaignMedals(p, npc)
            end },
            { "No, decline.", function(p)
                -- Do nothing, just close the menu.
            end }
        }
    }

    -- Show the confirmation menu
    player:timer(50, function(p)
        p:customMenu(confirmMenu)
    end)
end

--- Handles the logic for checking the player's lifetime score and granting medals.
---@param player Player
---@param npc NPC
giveCampaignMedals = function(player, npc)
    local playerName = player:getName()
    local npcName = npc:getPacketName()
    
    local currentScore = player:getCharVar('PB_TotalLifetimeScore') or 0
    local originalScore = currentScore -- Keep a copy for logging
    local medalsAwarded = 0
    local highestNewMedalId = nil
    local nextMedalThreshold = 0

    m:logDebug("--- Campaign Medal Evaluation for %s START ---", playerName)
    m:logDebug("Original PB_TotalLifetimeScore: %d", currentScore)

    -- Store the current battle ID at the time of evaluation
    local currentBattleID = GetServerVariable('[CampaignBattleHandler]BattleID') or 0
    player:setCharVar(LAST_EVAL_BATTLE_ID_VAR, currentBattleID)
    m:logDebug("Stored current Battle ID %d in %s.", currentBattleID, LAST_EVAL_BATTLE_ID_VAR)

    -- === DEMOTION CHECK ===
    local demotionFlag = player:getCharVar(DEMOTION_FLAG_VAR) or 0

    if demotionFlag == 1 then
        m:logDebug("Demotion flag is set for %s. Checking for medal removal.", playerName)
        -- Check for demotion (KI removal)
        local demotedMedalId = checkForDemotion(player, currentScore)
        if demotedMedalId then
            local demotedMedalName = getMedalName(demotedMedalId)
            m:logDebug("Player demoted. Lost KI %d (%s).", demotedMedalId, demotedMedalName)
            player:timer(1500, function(p)
                p:printToPlayer(string.format(MESSAGES.demotionMessage, demotedMedalName), 0, npcName)
            end)
            -- The demotion flag will be cleared if the player ranks up later in this function.
            -- If they don't rank up, the flag remains, preventing them from gaining points
            -- until they are no longer flagged for demotion.
        end
    end

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
            -- Player ranked up, so clear the demotion flag
            player:setCharVar(DEMOTION_FLAG_VAR, 0)
            m:logDebug("Player ranked up. Clearing %s.", DEMOTION_FLAG_VAR)
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
            m:logDebug("No rank up. Original Score: %d. Current Score: %d. Points needed for next threshold (%d): %d", originalScore, currentScore, nextThreshold, pointsNeeded)
            
            player:printToPlayer(MESSAGES.noRankUp, 0, npcName)
            
            player:timer(100, function(playerArg)
                playerArg:printToPlayer(string.format(MESSAGES.noRankUpPoints, pointsNeeded), 0, npcName)
            end)
        end
    end
end

-- Removed showRewardsMenu function
-- Removed handleRewardPurchase function

--- Handles the menu for setting Campaign Message preferences.
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
            menu.options = {} -- Start with an empty table
 
            -- Check if player is flagged for demotion and add the reactivation option if so.
            local demotionFlag = player:getCharVar(DEMOTION_FLAG_VAR) or 0
            if demotionFlag == 1 then
                table.insert(menu.options, {
                    "Reactivate my service record.",
                    function(playerArg)
                        m:logDebug("%s selected: Reactivate service record.", playerArg:getName())
                        handleReactivation(playerArg, npc)
                    end
                })
            end
 
            -- Add the standard menu options
            table.insert(menu.options, {
                MESSAGES.menuOptionEvaluate,
                function(playerArg)
                    m:logDebug("%s selected: Evaluate service record.", playerArg:getName())
                    giveCampaignMedals(playerArg, npc)
                end
            })
            table.insert(menu.options, {
                MESSAGES.menuOptionAnnouncements,
                function(playerArg)
                    m:logDebug("%s selected: Campaign Message Settings.", playerArg:getName())
                    handleAnnouncementsMenu(playerArg, npc)
                end
            })
            table.insert(menu.options, {
                MESSAGES.menuOptionNo,
                function(playerArg)
                    m:logDebug("%s selected: Exit menu.", playerArg:getName())
                end
            })
            
            delaySendMenu(player)
            
            return true -- Handled the trigger
        end,
    })

end)



return m