-- Required modules for functionality.
require("modules/module_utils")
require("scripts/globals/npc_util")

-- CONFIGURATION TOGGLES
local DEBUG_MODE = false -- Set to false to disable debug printing

-- =============================================================================
-- DONATION CAPS
-- =============================================================================
local MAX_CAMPAIGN_RESOURCES = 1000
local MAX_CAMPAIGN_SUPPLIES = 1000
local MAX_CAMPAIGN_RECON = 1000
local MAX_CAMPAIGN_FORTIFICATIONS = 1000

-- =============================================================================
-- SUPPLY TRADE-IN CONFIGURATION
-- =============================================================================
local SUPPLY_TRADE_IN_ITEMS = {
    -- Item Enum Name                      = points to add to CampaignSupplies
    [xi.item.MAPLE_STRONGBOX]        = 50,
    [xi.item.MAGNOLIA_STRONGBOX]     = 50,
    [xi.item.BEECH_STRONGBOX]        = 50,
    [xi.item.EVERGREEN_STRONGBOX]    = 50,
    [xi.item.HOLLY_STRONGBOX]        = 50,
    [xi.item.OAK_STRONGBOX]          = 50,
    [xi.item.ELM_STRONGBOX]          = 50,
    [xi.item.WILLOW_STRONGBOX]       = 50,
    [xi.item.BRONZE_LETTERBOX]       = 50,
    [xi.item.BRASS_LETTERBOX]        = 50,
    [xi.item.SHAKUDO_LETTERBOX]      = 50,
    [xi.item.PAKTONG_LETTERBOX]      = 50,
    [xi.item.PIG_IRON_LETTERBOX]     = 50,
    [xi.item.IRON_LETTERBOX]         = 50,
    [xi.item.CAST_IRON_LETTERBOX]    = 50,
    [xi.item.WROUGHT_IRON_LETTERBOX] = 50,
    [xi.item.BAMBOO_GRASS_BASKET]    = 50,
    [xi.item.BAMBOO_MEDICINE_BASKET] = 50,
    [xi.item.BAMBOO_BUGCAGE]         = 50,
    [xi.item.BAMBOO_FLOWER_BASKET]   = 50,
    [xi.item.BAMBOO_BIRDCAGE]        = 50,
    [xi.item.BAMBOO_CHARCOAL_BASKET] = 50,
    [xi.item.BAMBOO_TEA_BASKET]      = 50,
    [xi.item.BAMBOO_SNAKECAGE]       = 50,
}

-- =============================================================================
-- EQUIPMENT TRADE-IN CONFIGURATION (RESOURCES)
-- =============================================================================
local EQUIPMENT_TRADE_VALUES = {
    ILVL_119 = 50,
    ILVL_100 = 30,
    LVL_99   = 20,
    LVL_75   = 3,
    LVL_51   = 2,
    LVL_1    = 1,
}

-- =============================================================================
-- DONATION VALUES
-- =============================================================================

local DONATION_VALUES = {
    RESOURCES = {
        GIL = {
            { amount = 1000000,   points = 10,   label = "1M Gil" },
            { amount = 10000000,  points = 50,  label = "10M Gil" },
            { amount = 50000000,  points = 250,  label = "50M Gil" },
            { amount = 100000000, points = 500, label = "100M Gil" },
        },
        RANK_POINTS = {
            { amount = 100,   points = 5,   label = "100 Points" },
            { amount = 1000,  points = 50,  label = "1k Points" },
            { amount = 10000, points = 500, label = "10k Points" },
        },
        ALLIED_NOTES = {
            { amount = 1000,  points = 10,   label = "1k Notes" },
            { amount = 20000, points = 100,  label = "20k Notes" },
            { amount = 50000, points = 250, label = "50k Notes" },
        },
    },
    SUPPLIES = {
        GIL = {
            { amount = 1000000,   points = 10,   label = "1M Gil" },
            { amount = 10000000,  points = 50,  label = "10M Gil" },
            { amount = 50000000,  points = 250,  label = "50M Gil" },
            { amount = 100000000, points = 500, label = "100M Gil" },
        },
        RANK_POINTS = {
            { amount = 100,   points = 5,   label = "100 Points" },
            { amount = 1000,  points = 50,  label = "1k Points" },
            { amount = 10000, points = 500, label = "10k Points" },
        },
        ALLIED_NOTES = {
            { amount = 1000,  points = 10,   label = "1k Notes" },
            { amount = 20000, points = 100,  label = "20k Notes" },
            { amount = 50000, points = 250, label = "50k Notes" },
        },
    }
}

-- =============================================================================
-- CAMPAIGN RANKS
-- =============================================================================
local CAMPAIGN_RANKS = {
    [1] =  { ki_id = xi.ki.BRONZE_RIBBON_OF_SERVICE,   threshold = 1000 },
    [2] =  { ki_id = xi.ki.BRONZE_STAR,                threshold = 2000 },
    [3] =  { ki_id = xi.ki.COPPER_EMBLEM_OF_SERVICE,   threshold = 3200 },
    [4] =  { ki_id = xi.ki.BRASS_WINGS_OF_SERVICE,     threshold = 4600 },
    [5] =  { ki_id = xi.ki.STARLIGHT_MEDAL,            threshold = 6200 },
    [6] =  { ki_id = xi.ki.BRASS_RIBBON_OF_SERVICE,    threshold = 8000 },
    [7] =  { ki_id = xi.ki.STERLING_STAR,              threshold = 10000 },
    [8] =  { ki_id = xi.ki.IRON_EMBLEM_OF_SERVICE,     threshold = 12200 },
    [9] =  { ki_id = xi.ki.MYTHRIL_WINGS_OF_SERVICE,   threshold = 14600 },
    [10] = { ki_id = xi.ki.MOONLIGHT_MEDAL,            threshold = 17200 },
    [11] = { ki_id = xi.ki.ALLIED_RIBBON_OF_BRAVERY,   threshold = 20000 },
    [12] = { ki_id = xi.ki.MYTHRIL_STAR,               threshold = 23000 },
    [13] = { ki_id = xi.ki.STEELKNIGHT_EMBLEM,         threshold = 26200 },
    [14] = { ki_id = xi.ki.WINGS_OF_INTEGRITY,         threshold = 29600 },
    [15] = { ki_id = xi.ki.DAWNLIGHT_MEDAL,            threshold = 33200 },
    [16] = { ki_id = xi.ki.ALLIED_RIBBON_OF_GLORY,     threshold = 37000 },
    [17] = { ki_id = xi.ki.GOLDEN_STAR,                threshold = 41000 },
    [18] = { ki_id = xi.ki.HOLYKNIGHT_EMBLEM,          threshold = 45000 },
    [19] = { ki_id = xi.ki.WINGS_OF_HONOR,             threshold = 49000 },
    [20] = { ki_id = xi.ki.MEDAL_OF_ALTANA,            threshold = 53000 },
}

-- =============================================================================
-- RECON MISSION LOCATIONS
-- =============================================================================
local RECON_LOCATIONS = {
    --La Vaule
    { zoneId = 92, name = "Aveline",  look = '01000c0196103920963096409650006000700000', zoneName = "La Vaule [S]", pos = { 256.1647, 2.6942, -174.3707 }, rot = 46, reward = 20, notes = 80 },
    { zoneId = 92, name = "Bertrand", look = '01000c0196103920963096409650006000700000', zoneName = "La Vaule [S]", pos = { 101.7232, -2.4736, -96.3922 }, rot = 78, reward = 25, notes = 80 },
    { zoneId = 92, name = "Colette",  look = '01000c0196103920963096409650006000700000', zoneName = "La Vaule [S]", pos = { -98.7257, 3.7327, -144.7324 }, rot = 199, reward = 40, notes = 100 },
    { zoneId = 92, name = "Denis",    look = '01000c0196103920963096409650006000700000', zoneName = "La Vaule [S]", pos = { -61.5794, 3.2538, -51.5759 }, rot = 155, reward = 35, notes = 80 },
    --Beadeaux
    { zoneId = 85, name = "Etienne",  look = '01000c0196103920963096409650006000700000', zoneName = "Beadeaux [S]", pos = { 138.8037, -2.2154, 19.6391 }, rot = 7, reward = 50, notes = 120 },
    { zoneId = 85, name = "Fleur",    look = '01000c0196103920963096409650006000700000', zoneName = "Beadeaux [S]", pos = { 18.4295, -3.00, -155.0379 }, rot = 202, reward = 45, notes = 100 },
    { zoneId = 85, name = "Gaspard",  look = '01000c0196103920963096409650006000700000', zoneName = "Beadeaux [S]", pos = { -247.1832, -3.00, 55.9553 }, rot = 94, reward = 40, notes = 100 },
    { zoneId = 85, name = "Heloise",  look = '01000c0196103920963096409650006000700000', zoneName = "Beadeaux [S]", pos = { 0.9018, 24.1006, 59.7404 }, rot = 125, reward = 20, notes = 80 },
    --Castle Oztroja
    { zoneId = 99, name = "Antoine",  look = '01000c0196103920963096409650006000700000', zoneName = "Castle Oztroja [S]", pos = { -146.4849, -16.000, -0.2947 }, rot = 194, reward = 40, notes = 80 },
    { zoneId = 99, name = "Bernard",  look = '01000c0196103920963096409650006000700000', zoneName = "Castle Oztroja [S]", pos = { -263.4688, -19.2500, -53.9769 }, rot = 214, reward = 45, notes = 100 },
    { zoneId = 99, name = "Francois", look = '01000c0196103920963096409650006000700000', zoneName = "Castle Oztroja [S]", pos = { -104.3663, -72.3119, -25.7009 }, rot = 0, reward = 60, notes = 140 },
    { zoneId = 99, name = "Guillaume",look = '01000c0196103920963096409650006000700000', zoneName = "Castle Oztroja [S]", pos = { 62.8411, 1.2500, -206.0421 }, rot = 182, reward = 40, notes = 80 },
    --Castle Zvahl Baileys [S]
    { zoneId = 138, name = "Marcel",   look = '01000c0196103920963096409650006000700000', zoneName = "Castle Zvahl Baileys [S]", pos = { 59.8679, -20.1109, 29.7301 }, rot = 245, reward = 25, notes = 80 },
    { zoneId = 138, name = "Raoul",    look = '01000c0196103920963096409650006000700000', zoneName = "Castle Zvahl Baileys [S]", pos = { -139.9419, -38.000, 17.6490 }, rot = 252, reward = 35, notes = 80 },
    { zoneId = 138, name = "Thierry",  look = '01000c0196103920963096409650006000700000', zoneName = "Castle Zvahl Baileys [S]", pos = { -126.9394, -8.0471, -87.9503 }, rot = 255, reward = 50, notes = 100 },
    { zoneId = 138, name = "Olivier",  look = '01000c0196103920963096409650006000700000', zoneName = "Castle Zvahl Baileys [S]", pos = { -48.9322, 18.7635, 31.1596 }, rot = 86, reward = 75, notes = 120 },
}

-- Key Item for the mission
local RECON_MISSION_KI = xi.ki.CAMPAIGN_SUPPLIES -- Using this as requested.

-- Helper to get the zone name from its ID
function getZoneNameById(zoneId)
    for _, loc in ipairs(RECON_LOCATIONS) do
        if loc.zoneId == zoneId then return loc.zoneName end
    end
    return "an unknown zone"
end



---@type Module
local m = Module:new('CustStatusNPC')

-- Ensure m has a logDebug method for safe printing
if not m.logDebug then
    m.logDebug = function(_, format, ...) -- '_' consumes the 'self' argument
        if DEBUG_MODE then 
            -- Updated debug prefix to reflect the new module name
            print(string.format("[DEBUG] [CustStatusNPC] " .. format, ...)) 
        end
    end
end

-- Localized Player-Facing Text.
local MESSAGES = {
    greeting = "Welcome! I am the Campaign Status Officer. How may I assist you?",
    mainMenuTitle = "Campaign Status",
    exit = "Very well.",
    statusNotAvailable = "TBA",
    donationThankYou = "Thank you for your generous contribution to the war effort!",
    donationNotEnoughGil = "You do not have enough gil for that donation.", 
    donationPoolFull = "The coffers are overflowing! We cannot accept any more donations at this time. Thank you!",
    donationNotEnoughRank = "Your service record does not have enough points for that donation.",
    rankPointsDonated = "You have contributed points from your service record. Thank you!",
    donationRankDown = "You cannot donate points that would cause you to lose your current rank.",
    donationNotEnoughNotes = "You do not have enough Allied Notes for that donation.",
    back = "Back",    
    reconMissionStart = "Take these supplies to our agents in the enemy strongholds.",
    reconMissionInProgress = "You are already on a recon mission. Please complete it before accepting a new one.",
    reconTurnInSuccess = "Excellent work, soldier. You have been awarded %d Recon points and %d Allied Notes!",
    reconTurnInNoKi = "Don't blow my cover when you don't have supplies!",
    reconTurnInWrongNpc = "You've found one of our agents, but this isn't the one you were assigned to meet. Check your orders.",
    reconAbandonPrompt = "You already have a mission. Give up?",
    reconAbandonYes = "Yes, abandon mission.",
    reconAbandonConfirm = "You have abandoned your current mission.",
    tradeSuccess = "Thank you for these supplies. They will be put to good use!",
    tradeNotAccepted = "I have no use for this item.",
}

--- Helper function to retrieve the current Campaign Tide Score.
---@param player Player
function getCampaignTideScore(player)
    -- Default to 50 if the variable is not set or invalid
    local score = GetServerVariable('CampaignTideScore') or 50
    return tonumber(score) or 50 -- Ensure it's a number
end

--- Helper function to retrieve the current Campaign Resources.
---@return number
function getCampaignResources()
    local resources = GetServerVariable('CampaignResources') or 0
    return tonumber(resources) or 0
end

--- Helper function to retrieve the current Campaign Supplies.
---@return number
function getCampaignSupplies()
    local supplies = GetServerVariable('CampaignSupplies') or 0
    return tonumber(supplies) or 0
end

--- Helper function to retrieve the current Campaign Fortifications.
---@return number
function getCampaignFortifications()
    local fortifications = GetServerVariable('CampaignFortifications') or 0
    return tonumber(fortifications) or 0
end

--- Helper function to retrieve the current Campaign Recon points.
---@return number
function getCampaignRecon()
    local recon = GetServerVariable('CampaignRecon') or 0
    return tonumber(recon) or 0
end

--- Generates a star rating string based on the Campaign Tide Score.
---@param player Player
---@return string
function getTideStatusStars(player)
    local score = getCampaignTideScore(player)
    local blackStar = '\129\154' -- Filled Star
    local whiteStar = '\129\153' -- Empty Star
    local numBlackStars = 0

    if score >= 50 then
        -- Score 50-100: Each 10 points above 49.99... adds a star
        numBlackStars = math.floor(score / 10) - 4
    else
        -- Score < 50: 0 black stars
        numBlackStars = 0
    end

    -- Ensure stars are within the 0-5 range
    numBlackStars = math.max(0, math.min(5, numBlackStars))
    local numWhiteStars = 5 - numBlackStars

    return string.rep(blackStar, numBlackStars) .. string.rep(whiteStar, numWhiteStars)
end

--- Generates a star rating string based on the Campaign Resources.
---@return string
function getResourceStatusStars()
    local resources = getCampaignResources()
    local blackStar = '\129\154' -- Filled Star
    local whiteStar = '\129\153' -- Empty Star

    -- Each 20% of the max value is one star.
    local pointsPerStar = MAX_CAMPAIGN_RESOURCES / 5
    local numBlackStars = math.floor(resources / pointsPerStar)

    -- Ensure stars are within the 0-5 range
    numBlackStars = math.max(0, math.min(5, numBlackStars))
    local numWhiteStars = 5 - numBlackStars

    return string.rep(blackStar, numBlackStars) .. string.rep(whiteStar, numWhiteStars)
end

--- Generates a star rating string based on the Campaign Supplies.
---@return string
function getSupplyStatusStars()
    local supplies = getCampaignSupplies()
    local blackStar = '\129\154' -- Filled Star
    local whiteStar = '\129\153' -- Empty Star

    -- Each 20% of the max value is one star.
    local pointsPerStar = MAX_CAMPAIGN_SUPPLIES / 5
    local numBlackStars = math.floor(supplies / pointsPerStar)

    -- Ensure stars are within the 0-5 range
    numBlackStars = math.max(0, math.min(5, numBlackStars))
    local numWhiteStars = 5 - numBlackStars

    return string.rep(blackStar, numBlackStars) .. string.rep(whiteStar, numWhiteStars)
end

--- Generates a star rating string based on the Campaign Fortifications.
---@return string
function getFortificationStatusStars()
    local fortifications = getCampaignFortifications()
    local blackStar = '\129\154' -- Filled Star
    local whiteStar = '\129\153' -- Empty Star

    -- Each 20% of the max value is one star.
    local pointsPerStar = MAX_CAMPAIGN_FORTIFICATIONS / 5
    local numBlackStars = math.floor(fortifications / pointsPerStar)

    -- Ensure stars are within the 0-5 range
    numBlackStars = math.max(0, math.min(5, numBlackStars))
    local numWhiteStars = 5 - numBlackStars

    return string.rep(blackStar, numBlackStars) .. string.rep(whiteStar, numWhiteStars)
end

--- Generates a star rating string based on the Campaign Recon points.
---@return string
function getReconStatusStars()
    local recon = getCampaignRecon()
    local blackStar = '\129\154' -- Filled Star
    local whiteStar = '\129\153' -- Empty Star

    -- Each 20% of the max value is one star.
    local pointsPerStar = MAX_CAMPAIGN_RECON / 5
    local numBlackStars = math.floor(recon / pointsPerStar)

    -- Ensure stars are within the 0-5 range
    numBlackStars = math.max(0, math.min(5, numBlackStars))
    local numWhiteStars = 5 - numBlackStars

    return string.rep(blackStar, numBlackStars) .. string.rep(whiteStar, numWhiteStars)
end

--- Sets a character variable flag when a player makes a successful donation.
--- @param player Player The player who donated.
--- @param category string "Resources" or "Supplies".
local function setDonationFlag(player, category)
    if category == "Resources" then
        player:setCharVar('SHB_DonatedResources', 1)
    elseif category == "Supplies" then
        player:setCharVar('SHB_DonatedSupplies', 1)
    end
end

--- Shows the main menu with all status categories.
---@param player Player
---@param npc NPC
function showMainMenu(player, npc)
    m:logDebug("Showing main menu for %s.", player:getName())
    local mainMenu = {}
    mainMenu.title = MESSAGES.mainMenuTitle
    mainMenu.options = {
        { "Tide", function(p) 
            p:timer(50, function(p_timed) showTideStatus(p_timed, npc) end) 
        end },
        { "Fortifications", function(p) 
            p:timer(50, function(p_timed) showFortificationStatus(p_timed, npc) end) 
        end },
        { "Reconnaissance", function(p) 
            p:timer(50, function(p_timed) showReconMenu(p_timed, npc) end) 
        end },
        { "Resources", function(p) 
            p:timer(50, function(p_timed) showResourceStatus(p_timed, npc) end) 
        end },
        { "Supplies", function(p) 
            p:timer(50, function(p_timed) showSupplyStatus(p_timed, npc) end) 
        end },
    }
    player:customMenu(mainMenu)
end

--- Shows the detailed status for the Campaign Tide.
---@param player Player
---@param npc NPC
function showTideStatus(player, npc)
    m:logDebug("Showing Tide Status for %s.", player:getName())
    local tideScore = getCampaignTideScore(player)
    local starRating = getTideStatusStars(player)
    local tideMenu = {}
    tideMenu.title = "Tide Status"
    tideMenu.options = {
        { string.format("Current Score: %d", tideScore), function(p) end },
        { string.format("Rating: %s", starRating), function(p) end },
        { MESSAGES.back, function(p) 
            p:timer(50, function(p_timed) showMainMenu(p_timed, npc) end) 
        end }
    }
    player:customMenu(tideMenu)
end

--- Shows a placeholder menu for unimplemented status categories.
---@param player Player
---@param npc NPC
---@param categoryName string
function showPlaceholderStatus(player, npc, categoryName, parentMenuFn)
    m:logDebug("Showing placeholder status for '%s' for player %s.", categoryName, player:getName())
    parentMenuFn = parentMenuFn or showMainMenu
    local placeholderMenu = {}
    placeholderMenu.title = categoryName .. " Status"
    placeholderMenu.options = {
        { MESSAGES.statusNotAvailable, function(p) end },
        { MESSAGES.back, function(p)
            p:timer(50, function(p_timed) parentMenuFn(p_timed, npc) end)
        end }
    }
    player:customMenu(placeholderMenu)
end

--- Shows the detailed status for Campaign Fortifications.
---@param player Player
---@param npc NPC
function showFortificationStatus(player, npc)
    m:logDebug("Showing Fortification Status menu for %s.", player:getName())
    local currentFortifications = getCampaignFortifications()
    local fortificationStars = getFortificationStatusStars()
    local fortificationMenu = {}
    fortificationMenu.title = "Fortification Status"
    fortificationMenu.options = {
        { string.format("Current Integrity: %d", currentFortifications), function(p) end },
        { string.format("Rating: %s", fortificationStars), function(p) end },
        { MESSAGES.back, function(p)
            p:timer(50, function(p_timed) showMainMenu(p_timed, npc) end)
        end }
    }
    player:customMenu(fortificationMenu)
end

--- Shows the Reconnaissance menu.
---@param player Player
---@param npc NPC
function showReconMenu(player, npc)
    m:logDebug("Showing Reconnaissance menu for %s.", player:getName())
    local currentRecon = getCampaignRecon()
    local reconStars = getReconStatusStars()
    local reconMenu = {}
    reconMenu.title = "Reconnaissance Status"
    reconMenu.options = {
        { string.format("Current Intel: %d", currentRecon), function(p) end },
        { string.format("Rating: %s", reconStars), function(p) end },
        { "Missions", function(p)
            p:timer(50, function(p_timed) startReconMission(p_timed, npc) end)
        end },
        { MESSAGES.back, function(p)
            p:timer(50, function(p_timed) showMainMenu(p_timed, npc) end)
        end }
    }
    player:customMenu(reconMenu)
end

--- Starts a new recon mission for the player.
---@param player Player
---@param npc NPC
function startReconMission(player, npc)
    m:logDebug("startReconMission called for %s.", player:getName())
    m:logDebug("Checking for KI %d. Player has KI: %s", RECON_MISSION_KI, tostring(player:hasKeyItem(RECON_MISSION_KI)))
    if player:hasKeyItem(RECON_MISSION_KI) then
        m:logDebug("Player %s already has a recon mission. Showing abandon menu.", player:getName())
        local abandonMenu = {
            title = MESSAGES.reconAbandonPrompt,
            options = {
                { MESSAGES.reconAbandonYes, function(p)
                    m:logDebug("--- ABANDON MISSION: Function started. ---")
                    local success, err = pcall(function(player_inner, npc_param)
                        m:logDebug("Attempting to abandon mission for %s.", player_inner:getName())                        
                        player_inner:delKeyItem(RECON_MISSION_KI, true) -- Suppress system message
                        player_inner:setCharVar("ActiveReconMission", 0) -- Clear the mission
                        player_inner:printToPlayer(MESSAGES.reconAbandonConfirm, 0, npc_param:getPacketName())
                        
                        m:logDebug("Player %s successfully abandoned their recon mission.", player_inner:getName())
                        player_inner:timer(50, function(p_timed) showReconMenu(p_timed, npc_param) end)
                    end, p, npc)

                    if not success then
                        print(string.format("!!! LUA ERROR in abandon mission: %s", tostring(err)))
                    end
                end},
                { MESSAGES.back, function(p)
                    m:logDebug("Player selected 'Back' from abandon menu.")
                    -- Just go back to the recon menu.
                    p:timer(50, function(p_timed) showReconMenu(p_timed, npc) end)
                end }
            }
        }
        player:customMenu(abandonMenu)
        return -- Stop execution here to show the abandon menu.
    end

    m:logDebug("Assigning new recon mission to %s.", player:getName())
    npcUtil.giveKeyItem(player, RECON_MISSION_KI)

    player:printToPlayer(MESSAGES.reconMissionStart, 0, npc:getPacketName())
    -- We do NOT show the recon menu again here, as the player just received a mission and doesn't need to see the menu immediately.
end

--- Shows the detailed status for Campaign Resources and donation options.
---@param player Player
---@param npc NPC
function showResourceStatus(player, npc)
    m:logDebug("Showing Resource Status menu for %s.", player:getName())
    local currentResources = getCampaignResources()
    local resourceStars = getResourceStatusStars()
    local resourceMenu = {}
    resourceMenu.title = "Resource Status"
    resourceMenu.options = {
        { string.format("Current Stockpile: %d", currentResources), function(p) end },
        { string.format("Rating: %s", resourceStars), function(p) end },
        { "Donate", function(p)
            p:timer(50, function(p_timed) showDonationTypeMenu(p_timed, npc, "Resources") end)
        end },
        { MESSAGES.back, function(p)
            p:timer(50, function(p_timed) showMainMenu(p_timed, npc) end)
        end }
    }
    player:customMenu(resourceMenu)
end

--- Shows the detailed status for Campaign Supplies and donation options.
---@param player Player
---@param npc NPC
function showSupplyStatus(player, npc)
    m:logDebug("Showing Supply Status menu for %s.", player:getName())
    local currentSupplies = getCampaignSupplies()
    local supplyStars = getSupplyStatusStars()
    local supplyMenu = {}
    supplyMenu.title = "Supply Status"
    supplyMenu.options = {
        { string.format("Current Stockpile: %d", currentSupplies), function(p) end },
        { string.format("Rating: %s", supplyStars), function(p) end },
        { "Donate", function(p)
            p:timer(50, function(p_timed) showDonationTypeMenu(p_timed, npc, "Supplies") end)
        end },
        { MESSAGES.back, function(p)
            p:timer(50, function(p_timed) showMainMenu(p_timed, npc) end)
        end }
    }
    player:customMenu(supplyMenu)
end

--- Handles a player's gil donation for a specific category.
---@param player Player
---@param gilAmount number
---@param points number
---@param category string "Resources" or "Supplies"
function handleGilDonation(player, gilAmount, points, category)
    category = category or "Resources"
    local currentPool, maxPool, serverVar
    if category == "Resources" then
        currentPool, maxPool, serverVar = getCampaignResources(), MAX_CAMPAIGN_RESOURCES, 'CampaignResources'
    else -- Supplies
        currentPool, maxPool, serverVar = getCampaignSupplies(), MAX_CAMPAIGN_SUPPLIES, 'CampaignSupplies'
    end

    if currentPool >= maxPool then
        return "full"
    end

    if player:getGil() < gilAmount then
        return "nogil"
    end
    player:delGil(gilAmount)
    local newPoolValue = math.min(maxPool, currentPool + points)
    SetServerVariable(serverVar, newPoolValue)
    m:logDebug("Player %s donated %d gil for %d %s. New %s: %d", player:getName(), gilAmount, points, category, serverVar, newPoolValue)
    setDonationFlag(player, category)
    return "success"
end

--- Gets the threshold score for the player's current highest rank.
---@param player Player
---@return number
local function getPlayerRankThreshold(player)
    for i = #CAMPAIGN_RANKS, 1, -1 do
        local rankData = CAMPAIGN_RANKS[i]
        if player:hasKeyItem(rankData.ki_id) then
            return rankData.threshold
        end
    end
    return 0
end

--- Handles a player's rank point donation.
---@param player Player
---@param rankPoints number
---@param resourcePoints number
---@param category string "Resources" or "Supplies"
function handleRankPointDonation(player, rankPoints, resourcePoints, category)
    category = category or "Resources"
    local currentPool, maxPool, serverVar
    if category == "Resources" then
        currentPool, maxPool, serverVar = getCampaignResources(), MAX_CAMPAIGN_RESOURCES, 'CampaignResources'
    else -- Supplies
        currentPool, maxPool, serverVar = getCampaignSupplies(), MAX_CAMPAIGN_SUPPLIES, 'CampaignSupplies'
    end

    if currentPool >= maxPool then
        return "full"
    end

    local currentRankPoints = player:getCharVar('PB_TotalLifetimeScore') or 0
    if currentRankPoints < rankPoints then
        return "norank"
    end

    -- Check if donation would cause rank down
    local rankThreshold = getPlayerRankThreshold(player)
    if (currentRankPoints - rankPoints) < rankThreshold then
        return "rankdown"
    end

    player:setCharVar('PB_TotalLifetimeScore', currentRankPoints - rankPoints)
    local newPoolValue = math.min(maxPool, currentPool + resourcePoints)
    SetServerVariable(serverVar, newPoolValue)
    m:logDebug("Player %s donated %d rank points for %d %s. New %s: %d", player:getName(), rankPoints, resourcePoints, category, serverVar, newPoolValue)
    setDonationFlag(player, category)
    return "success"
end

--- Handles a player's Allied Notes donation.
---@param player Player
---@param notesAmount number
---@param points number
---@param category string "Resources" or "Supplies"
function handleAlliedNotesDonation(player, notesAmount, points, category)
    category = category or "Resources"
    local currentPool, maxPool, serverVar
    if category == "Resources" then
        currentPool, maxPool, serverVar = getCampaignResources(), MAX_CAMPAIGN_RESOURCES, 'CampaignResources'
    else -- Supplies
        currentPool, maxPool, serverVar = getCampaignSupplies(), MAX_CAMPAIGN_SUPPLIES, 'CampaignSupplies'
    end

    if currentPool >= maxPool then
        return "full"
    end

    if player:getCurrency('allied_notes') < notesAmount then
        return "nonotes"
    end

    player:delCurrency('allied_notes', notesAmount)
    local newPoolValue = math.min(maxPool, currentPool + points)
    SetServerVariable(serverVar, newPoolValue)
    m:logDebug("Player %s donated %d Allied Notes for %d %s. New %s: %d", player:getName(), notesAmount, points, category, serverVar, newPoolValue)
    setDonationFlag(player, category)
    return "success"
end

--- Shows the donation menu for a specific currency type and category.
---@param player Player
---@param npc NPC
---@param currencyType string "GIL", "RANK_POINTS", or "ALLIED_NOTES"
---@param category string "Resources" or "Supplies"
function showDonationAmountMenu(player, npc, currencyType, category)
    m:logDebug("Showing donation amount menu for %s (Currency: %s, Category: %s).", player:getName(), currencyType, category)
    local menu = {}
    local tempName = string.lower(currencyType:gsub("_", " "))
    local currencyName = string.upper(string.sub(tempName, 1, 1)) .. string.sub(tempName, 2)

    menu.title = "Donate " .. currencyName
    if category == "Supplies" then
        menu.title = menu.title .. " for Supplies"
    end
    menu.options = {}

    local donationValues = DONATION_VALUES[string.upper(category)][currencyType]
    local handlerFunction
    if currencyType == "GIL" then
        handlerFunction = handleGilDonation
    elseif currencyType == "RANK_POINTS" then
        handlerFunction = handleRankPointDonation
    elseif currencyType == "ALLIED_NOTES" then
        handlerFunction = handleAlliedNotesDonation
    end

    for _, donation in ipairs(donationValues) do
        table.insert(menu.options, { donation.label, function(p)
            local result = handlerFunction(p, donation.amount, donation.points, category)
            processDonationResult(p, npc, result, category)
        end })
    end

    table.insert(menu.options, { MESSAGES.back, function(p)
        p:timer(50, function(p_timed) showDonationTypeMenu(p_timed, npc, category) end)
    end })

    player:customMenu(menu)
end

--- Shows the menu to select donation type (Gil or Rank Points).
---@param player Player
---@param npc NPC
---@param category string "Resources" or "Supplies"
function showDonationTypeMenu(player, npc, category)
    m:logDebug("Showing donation type menu for %s (Category: %s).", player:getName(), category)
    local typeMenu = {}
    typeMenu.title = "Select Donation Type"
    typeMenu.options = {}

    local returnMenuFn
    if category == "Resources" then
        returnMenuFn = showResourceStatus
    elseif category == "Supplies" then
        returnMenuFn = showSupplyStatus
    end

    table.insert(typeMenu.options, { "Gil", function(p) p:timer(50, function(p_timed) showDonationAmountMenu(p_timed, npc, "GIL", category) end) end })
    table.insert(typeMenu.options, { "Rank Points", function(p) p:timer(50, function(p_timed) showDonationAmountMenu(p_timed, npc, "RANK_POINTS", category) end) end })
    table.insert(typeMenu.options, { "Allied Notes", function(p) p:timer(50, function(p_timed) showDonationAmountMenu(p_timed, npc, "ALLIED_NOTES", category) end) end })
    table.insert(typeMenu.options, { MESSAGES.back, function(p) p:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end) end })

    player:customMenu(typeMenu)
end

--- Processes the result of a donation attempt and shows the correct message/menu.
---@param player Player
---@param npc NPC
---@param result string
---@param category string "Resources" or "Supplies"
function processDonationResult(player, npc, result, category)
    m:logDebug("Processing donation result for %s. Result: '%s', Category: '%s'.", player:getName(), result, category)
    category = category or "Resources" -- Default to resources for old calls
    local returnMenuFn
    if category == "Resources" then
        returnMenuFn = showResourceStatus
    else -- Supplies
        returnMenuFn = showSupplyStatus
    end

    if result == "success" then
        player:printToPlayer(MESSAGES.donationThankYou)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    elseif result == "full" then
        player:printToPlayer(MESSAGES.donationPoolFull)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    elseif result == "nogil" then
        player:printToPlayer(MESSAGES.donationNotEnoughGil)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    elseif result == "norank" then
        player:printToPlayer(MESSAGES.donationNotEnoughRank)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    elseif result == "rankdown" then
        player:printToPlayer(MESSAGES.donationRankDown)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    elseif result == "nonotes" then
        player:printToPlayer(MESSAGES.donationNotEnoughNotes)
        player:timer(50, function(p_timed) returnMenuFn(p_timed, npc) end)
    end
end

--- Overrides the Mog Garden initialization to insert the Campaign Judge NPC.
m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    local ok, err = pcall(function()
        m:logDebug("Calling super(zone) for Mog Garden onInitialize.")
        super(zone)
    end)
    if not ok then
        print('ERROR: super(zone) failed in Mog Garden: ' .. tostring(err))
    end
    
    -- Define and insert the Campaign Spoils NPC.
    m:logDebug("Spawning Campaign Status NPC in Mog Garden.")
    local campaignStatusNpc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Status Keeper',
        look = '00002a0300000000000000000000000000000000', 
        x = 388.7673,
        y = -0.0433,
        z = -579.8759,
        rotation = 122,
        widescan = 1,

        -- Custom onTrigger logic for the Campaign Status NPC
        onTrigger = function(player, npc)
            m:logDebug("NPC triggered by %s.", player:getName())
            player:printToPlayer(MESSAGES.greeting, 0, npc:getPacketName())
            -- Use a timer to ensure the menu appears after the greeting text
            player:timer(50, function(p)
                showMainMenu(p, npc)
            end)
            return true -- Handled the trigger
        end,

        onTrade = function(player, npc, trade)
            -- Iterate through the configured supply items to find a match
            for itemId, points in pairs(SUPPLY_TRADE_IN_ITEMS) do
                if npcUtil.tradeHasExactly(trade, itemId) then
                    local currentSupplies = getCampaignSupplies()

                    if currentSupplies >= MAX_CAMPAIGN_SUPPLIES then
                        player:printToPlayer(MESSAGES.donationPoolFull, 0, npc:getPacketName())
                        return true
                    end

                    player:tradeComplete()

                    local newSupplies = math.min(MAX_CAMPAIGN_SUPPLIES, currentSupplies + points)
                    SetServerVariable('CampaignSupplies', newSupplies)

                    player:printToPlayer(MESSAGES.tradeSuccess, 0, npc:getPacketName())
                    m:logDebug("Player %s traded item ID %d for %d supply points. New total: %d", player:getName(), itemId, points, newSupplies)
                    return true
                end
            end

            -- Equipment Trade Logic for Resources
            local totalResourcePoints = 0
            local validItems = 0
            local invalidItems = 0

            for i = 0, 8 do
                local item = trade:getItem(i)
                if item and item:getID() > 0 then
                    local points = 0
                    if item:isType(xi.itemType.WEAPON) or item:isType(xi.itemType.ARMOR) then
                        local iLvl = item:getILvl()
                        local reqLvl = item:getReqLvl()

                        if iLvl >= 119 then
                            points = EQUIPMENT_TRADE_VALUES.ILVL_119
                        elseif iLvl >= 100 then
                            points = EQUIPMENT_TRADE_VALUES.ILVL_100
                        elseif reqLvl == 99 then
                            points = EQUIPMENT_TRADE_VALUES.LVL_99
                        elseif reqLvl >= 75 then
                            points = EQUIPMENT_TRADE_VALUES.LVL_75
                        elseif reqLvl >= 51 then
                            points = EQUIPMENT_TRADE_VALUES.LVL_51
                        elseif reqLvl >= 1 then
                            points = EQUIPMENT_TRADE_VALUES.LVL_1
                        end
                    end

                    if points > 0 then
                        totalResourcePoints = totalResourcePoints + points
                        validItems = validItems + 1
                    else
                        invalidItems = invalidItems + 1
                    end
                end
            end

            if validItems > 0 and invalidItems == 0 then
                local currentResources = getCampaignResources()
                if currentResources >= MAX_CAMPAIGN_RESOURCES then
                    player:printToPlayer(MESSAGES.donationPoolFull, 0, npc:getPacketName())
                    return true
                end

                player:tradeComplete()
                local newResources = math.min(MAX_CAMPAIGN_RESOURCES, currentResources + totalResourcePoints)
                SetServerVariable('CampaignResources', newResources)

                player:printToPlayer(MESSAGES.tradeSuccess, 0, npc:getPacketName())
                player:printToPlayer(string.format("You donated equipment for %d Resource points.", totalResourcePoints), 0, npc:getPacketName())
                m:logDebug("Player %s traded %d equipment items for %d resource points. New total: %d", player:getName(), validItems, totalResourcePoints, newResources)
                return true
            end

            player:printToPlayer(MESSAGES.tradeNotAccepted, 0, npc:getPacketName())
            m:logDebug("Player %s traded an unaccepted item.", player:getName())

            return true -- Handled the trade
        end,
    })

    campaignStatusNpc:setAnimation(34) -- Standing animation
end)

--- Handles the logic for a recon NPC being triggered.
---@param player Player
---@param npc NPC
function handleReconNpcTrigger(player, npc)
    m:logDebug("Recon NPC '%s' triggered by '%s'.", npc:getName(), player:getName())

    -- Check if the player has the required key item.
    if player:hasKeyItem(RECON_MISSION_KI) then
        m:logDebug("Player %s has the recon mission KI.", player:getName())

        -- Find the mission details for the current NPC by matching its name.
        local missionDetails = nil
        for _, loc in ipairs(RECON_LOCATIONS) do
            if string.match(npc:getName(), loc.name .. "$") then
                missionDetails = loc
                break
            end
        end

        if missionDetails then
            m:logDebug("Player %s is turning in supplies to '%s'. Reward: %d.", player:getName(), npc:getName(), missionDetails.reward)
            player:delKeyItem(RECON_MISSION_KI)

            local currentRecon = getCampaignRecon()
            local newReconValue = math.min(MAX_CAMPAIGN_RECON, currentRecon + missionDetails.reward)
            SetServerVariable('CampaignRecon', newReconValue)

            -- Award Allied Notes based on the 'notes' field
            local notesReward = missionDetails.notes
            player:addCurrency("allied_notes", notesReward)

            player:printToPlayer(string.format(MESSAGES.reconTurnInSuccess, missionDetails.reward, notesReward), 0, npc:getPacketName() or npc:getName())
            m:logDebug("Player %s completed recon mission. New CampaignRecon: %d. Awarded %d Allied Notes.", player:getName(), newReconValue, notesReward)
            player:setCharVar('SHB_CompletedRecon', 1)
        else
            -- This case is for when the player has the KI but talks to a recon NPC not in the table. 
            m:logDebug("Player %s triggered a recon NPC ('%s') that is not in the RECON_LOCATIONS table.", player:getName(), npc:getName())
            player:printToPlayer(MESSAGES.reconTurnInWrongNpc, 0, npc:getPacketName() or npc:getName())
        end
    else
        -- Player does not have the key item at all
        player:printToPlayer(MESSAGES.reconTurnInNoKi, 0, npc:getPacketName() or npc:getName())
    end
    return true -- Handled
end

-- Override the onInitialize for La Vaule [S] to spawn recon NPCs.
m:addOverride('xi.zones.La_Vaule_[S].Zone.onInitialize', function(zone)
    pcall(function() super(zone) end) -- Safely call original

    m:logDebug("Spawning recon NPCs in La Vaule [S].")

    local Aveline = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Aveline", look = '01000c0196103920963096409650006000700000', x = 256.1647, y = 2.6942, z = -174.3707, rotation = 46, widescan = 1, onTrigger = handleReconNpcTrigger })


    local Bertrand = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Bertrand", look = '01000c0196103920963096409650006000700000', x = 101.7232, y = -2.4736, z = -96.3922 , rotation = 78, widescan = 1, onTrigger = handleReconNpcTrigger })


    local Colette = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Colette", look = '01000c0196103920963096409650006000700000', x = -98.7257, y = 3.7327, z = -144.7324, rotation = 199, widescan = 1, onTrigger = handleReconNpcTrigger })


    local Denis = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Denis", look = '01000c0196103920963096409650006000700000', x = -61.5794, y = 3.2538, z = -51.5759, rotation = 155, widescan = 1, onTrigger = handleReconNpcTrigger })

end)

-- Override the onInitialize for Beadeaux [S] to spawn recon NPCs.
m:addOverride('xi.zones.Beadeaux_[S].Zone.onInitialize', function(zone)
    pcall(function() super(zone) end) -- Safely call original

    m:logDebug("Spawning recon NPCs in Beadeaux [S].")

    local Etienne = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Etienne", look = '01000c0196103920963096409650006000700000', x = 138.8037, y = -2.2154, z = 19.6391, rotation = 7, widescan = 1, onTrigger = handleReconNpcTrigger })


    local Fleur = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Fleur", look = '01000c0196103920963096409650006000700000', x = 18.4295, y = -3.00, z = -155.0379, rotation = 202, widescan = 1, onTrigger = handleReconNpcTrigger })


    local Gaspard = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Gaspard", look = '01000c0196103920963096409650006000700000', x = -247.1832, y = -3.00, z = 55.9553, rotation = 94, widescan = 1, onTrigger = handleReconNpcTrigger })

    local Heloise = zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Heloise", look = '01000c0196103920963096409650006000700000', x = 0.9018, y = 24.1006, z = 59.7404, rotation = 125, widescan = 1, onTrigger = handleReconNpcTrigger })
end)

-- Override the onInitialize for Castle Oztroja [S] to spawn recon NPCs.
m:addOverride('xi.zones.Castle_Oztroja_[S].Zone.onInitialize', function(zone)
    pcall(function() super(zone) end) -- Safely call original

    m:logDebug("Spawning recon NPCs in Castle Oztroja [S].")

    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Antoine", look = '01000c0196103920963096409650006000700000', x = -146.4849, y = -16.000, z = -0.2947, rotation = 194, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Bernard", look = '01000c0196103920963096409650006000700000', x = -263.4688, y = -19.2500, z = -53.9769, rotation = 214, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Francois", look = '01000c0196103920963096409650006000700000', x = -104.3663, y = -72.3119, z = -25.7009, rotation = 0, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Guillaume", look = '01000c0196103920963096409650006000700000', x = 62.8411, y = 1.2500, z = -206.0421, rotation = 182, widescan = 1, onTrigger = handleReconNpcTrigger })
end)

-- Override the onInitialize for Castle Zvahl Baileys [S] to spawn recon NPCs.
m:addOverride('xi.zones.Castle_Zvahl_Baileys_[S].Zone.onInitialize', function(zone)
    pcall(function() super(zone) end) -- Safely call original

    m:logDebug("Spawning recon NPCs in Castle Zvahl Baileys [S].")

    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Marcel", look = '01000c0196103920963096409650006000700000', x = 59.8679, y = -20.1109, z = 29.7301, rotation = 245, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Raoul", look = '01000c0196103920963096409650006000700000', x = -139.9419, y = -38.000, z = 17.6490, rotation = 252, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Thierry", look = '01000c0196103920963096409650006000700000', x = -126.9394, y = -8.0471, z = -87.9503, rotation = 255, widescan = 1, onTrigger = handleReconNpcTrigger })
    zone:insertDynamicEntity({ objtype = xi.objType.NPC, name = "Olivier", look = '01000c0196103920963096409650006000700000', x = -48.9322, y = 18.7635, z = 31.1596, rotation = 86, widescan = 1, onTrigger = handleReconNpcTrigger })
end)

return m