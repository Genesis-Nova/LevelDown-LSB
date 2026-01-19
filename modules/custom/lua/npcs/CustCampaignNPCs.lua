--------------------------------------------------------------------------------
-- file: CustCampaignNPCs.lua
-- desc: A module for handling campaign events, including granting the Allied Tags
--       status effect and providing access to a paginated Campaign Teleport menu
--       via all designated Campaign NPCs.
--------------------------------------------------------------------------------

-- ==============================================================================
-- DEBUG TOGGLE
-- Set to 'true' to enable detailed server console logging for all NPC interactions.
-- Set to 'false' to disable all server-side debug messages.
-- ==============================================================================
local DEBUG_MODE = false

-- Helper function to print only when DEBUG_MODE is true
local function DebugPrint(message)
    if DEBUG_MODE then
        print(string.format("[CampaignBattle DEBUG] %s", message))
    end
end
-- ==============================================================================

-- Required modules for functionality.
require("modules/module_utils")
require("scripts/globals/npc_util")
--require("scripts/globals/utils") -- For VanadielHour() and other utility functions. Depreciated file (Nov 2025)

---@type Module
local m = Module:new('CustCampaignNPCs')

-- Global menu table for delayed sending
local menu = {}

-- The number of teleport locations to show per menu page.
local TELEPORTS_PER_PAGE = 2

-- The number of shop items to show per menu page.
local ITEMS_PER_PAGE = 3

-- Centralized table for all campaign teleport locations.
local WarpLocations = {
    { name = 'West Sarutabaruta [S]',    zone = xi.zone.WEST_SARUTABARUTA_S,    x = -19.5262, y = -13.0901, z = 307.3373, rot = 252, zoneid = 95 },
    { name = 'East Ronfaure [S]',        zone = xi.zone.EAST_RONFAURE_S,        x = 320.8822, y = -30,      z = -120.46,  rot = 157, zoneid = 81 },
    { name = 'North Gustaberg [S]',      zone = xi.zone.NORTH_GUSTABERG_S,      x = -543.2109,y = 41.9802,  z = 65.2432,  rot = 129, zoneid = 88 },
    { name = 'Fort Karugo-Narugo [S]',   zone = xi.zone.FORT_KARUGO_NARUGO_S,   x = -97.4075, y = -79.0452, z = 0.9719,   rot = 127, zoneid = 96 },
    { name = 'Jugner Forest [S]',        zone = xi.zone.JUGNER_FOREST_S,        x = 73.2172,  y = 0.2277,   z = -5.8201,  rot = 88,  zoneid = 82 },
    { name = 'Grauberg [S]',             zone = xi.zone.GRAUBERG_S,             x = 302.18,   y = -48.9102, z = 100.70,   rot = 0,   zoneid = 89 },
    { name = 'Meriphataud Mountains [S]',zone = xi.zone.MERIPHATAUD_MOUNTAINS_S,x = -307.4041,y = 18.0515,  z = 429.0015, rot = 253, zoneid = 97 },
    { name = 'Pashhow Marshlands [S]',   zone = xi.zone.PASHHOW_MARSHLANDS_S,   x = 498.6725, y = 25.00,    z = 647.8894, rot = 93,  zoneid = 90 },
    { name = 'Vunkerl Inlet [S]',        zone = xi.zone.VUNKERL_INLET_S,        x = -185.1144,y = -39.6465, z = -279.82,  rot = 125, zoneid = 83 },
    { name = 'Sauromugue Champaign [S]', zone = xi.zone.SAUROMUGUE_CHAMPAIGN_S, x = -31.3777, y = 25.2828,  z = 219.4237, rot = 127, zoneid = 98 },
    { name = 'Rolanberry Fields [S]',    zone = xi.zone.ROLANBERRY_FIELDS_S,    x = 233.8327, y = 8.1201,   z = 219.2024, rot = 254, zoneid = 91 },
    { name = 'Batallia Downs [S]',       zone = xi.zone.BATALLIA_DOWNS_S,       x = 225.2325, y = 8.6223,   z = 49.7229,  rot = 72,  zoneid = 84 },
    { name = 'Beaucedine Glacier [S]',   zone = xi.zone.BEAUCEDINE_GLACIER_S,   x = 71.5509,  y = -59.9720, z = -47.6743, rot = 3,   zoneid = 136 },
    { name = 'Xarcabard [S]',            zone = xi.zone.XARCABARD_S,            x = 206.0252, y = -23.6727, z = -205.8567,rot = 168, zoneid = 137 },
}

-- Table of temporary items available for purchase during campaign battles.
local CampaignTempItems = {
    { name = "Body Boost",        cost = 30, id = xi.item.BOTTLE_OF_BODY_BOOST },
    { name = "Mana Boost",        cost = 30, id = xi.item.BOTTLE_OF_MANA_BOOST },
    { name = "Barbarian's Drink", cost = 30, id = xi.item.BOTTLE_OF_BARBARIANS_DRINK },
    { name = "Oracle's Drink",    cost = 30, id = xi.item.BOTTLE_OF_ORACLES_DRINK },
    { name = "Spy's Drink",       cost = 30, id = xi.item.BOTTLE_OF_SPYS_DRINK },
    { name = "Fighter's Drink",   cost = 30, id = xi.item.BOTTLE_OF_FIGHTERS_DRINK },
    { name = "Assassin's Drink",  cost = 30, id = xi.item.BOTTLE_OF_ASSASSINS_DRINK },
    { name = "Sprinter's Drink",  cost = 30, id = xi.item.BOTTLE_OF_SPRINTERS_DRINK },
    { name = "Gnostic's Drink",   cost = 30, id = xi.item.BOTTLE_OF_GNOSTICS_DRINK },
    { name = "Shepherd's Drink",  cost = 30, id = xi.item.BOTTLE_OF_SHEPHERDS_DRINK },
    { name = "Soldier's Drink",   cost = 45, id = xi.item.BOTTLE_OF_SOLDIERS_DRINK },
    { name = "Monarch's Drink",   cost = 45, id = xi.item.BOTTLE_OF_MONARCHS_DRINK },
    { name = "Champion's Drink",  cost = 45, id = xi.item.BOTTLE_OF_CHAMPIONS_DRINK },
    { name = "Fanatic's Drink",   cost = 60, id = xi.item.BOTTLE_OF_FANATICS_DRINK },
    { name = "Cleric's Drink",    cost = 60, id = xi.item.BOTTLE_OF_CLERICS_DRINK },
    { name = "Fool's Drink",      cost = 60, id = xi.item.BOTTLE_OF_FOOLS_DRINK },
    { name = "Vicar's Drink",     cost = 60, id = xi.item.BOTTLE_OF_VICARS_DRINK },
}

-- The status effect ID for Allied Tags.
local ALLIED_TAGS_EFFECT_ID = xi.effect.ALLIED_TAGS

-- The server variable that tracks the current battle state (0=Inactive, 1=Prep, 2=Active)
local BATTLE_STATE_VAR = '[CampaignBattleHandler]BattleState'

-- The duration of the Allied Tags status effect in seconds.
local EFFECT_DURATION_SECONDS = 180 -- 3 minutes

-- The table containing the NPCs that will give Allied Tags.
local npcOverrides = {
    { zone = 'West_Sarutabaruta_[S]',       name = 'Mhik_Liusihlo_MC',   npcID = 17167171, nation = 'Windurst' },
    { zone = 'East_Ronfaure_[S]',          name = 'Arlayse_RK',         npcID = 17109768, nation = 'San d\'Oria' },
    { zone = 'North_Gustaberg_[S]',         name = 'Jagged_Onyx_LC',     npcID = 17138460, nation = 'Bastok' },
    { zone = 'Grauberg_[S]',                name = 'Polished_Fang_LC',   npcID = 17142502, nation = 'Bastok' },
    { zone = 'Fort_Karugo-Narugo_[S]',      name = 'Lamurara_CC',        npcID = 17171055, nation = 'Windurst' },
    { zone = 'Jugner_Forest_[S]',          name = 'Roiloux_RK',         npcID = 17113889, nation = 'San d\'Oria' },
    { zone = 'Meriphataud_Mountains_[S]',   name = 'Dhen_Kwherri_MC',    npcID = 17175302, nation = 'Windurst' },
    { zone = 'Pashhow_Marshlands_[S]',      name = 'Barnett_CA',         npcID = 17146567, nation = 'Allied' },
    { zone = 'Vunkerl_Inlet_[S]',          name = 'Toulsard_RK',        npcID = 17117942, nation = 'San d\'Oria' },
    { zone = 'Sauromugue_Champaign_[S]',    name = 'Hdya_Mhirako_MC',    npcID = 17179315, nation = 'Windurst' },
    { zone = 'Batallia_Downs_[S]',          name = 'Myllue_RK',          npcID = 17122100, nation = 'San d\'Oria' },
    { zone = 'Rolanberry_Fields_[S]',       name = 'Wayward_Echo_LC',    npcID = 17150719, nation = 'Bastok' },
    { zone = 'Beaucedine_Glacier_[S]',      name = 'Disserond_RK',       npcID = 17334969, nation = 'San d\'Oria' },
    { zone = 'Xarcabard_[S]',               name = 'Sleiney_CA',         npcID = 17339018, nation = 'Allied' },
}

-- Localized Player-Facing Text.
local MESSAGES = {
    -- Text templates for each nation's greeting.
    greetings = {
        ['San d\'Oria'] = "Greetings. I am %s of the San d'Orian Provincial Knights.",
        ['Bastok'] = "Greetings. I am %s of the Bastokan Legion.",
        ['Windurst'] = "Greetings. I am %s of the Federation of Windurst.",
        ['Allied'] = "Greetings. I am %s of the Allied Forces.",
    },
    receivedTags = "You are now participating in the Allied Campaign.",
    noChangeOfMind = "Understood. Come back if you change your mind.",
    alreadyHaveTags = "(Allied Tags Active)", -- Non-functional text for the menu option
    tpMenuTitle = 'Where are you going?',
    mainMenuTitle = 'What can I do for you?',
    -- NEW: Message if the current zone does not match the active battle zone
    menuOptionTeleport = "Teleportation",
    menuOptionBuffs = "Receive Battle Buffs",
    menuOptionItems = "Purchase Battle Supplies",
    menuOptionExit = "No, thank you.",
    -- Battle Portal Messages
    noActiveBattlePortal = "No Teleport Available - No Active Battle",
    battlePortalCoordError = "[ERROR] - To Teleport Coords Found",
    insufficientSupplies = "Our battle supplies have been exhausted. We cannot provide any more items at this time.",
    noOngoingBattle = "There is no battle taking place here at the moment.",
    insufficientResources = "Our resources have dwindled. We cannot provide battle buffs until they have been restocked.",
    -- NEW: Navigation options for dynamic teleport menu
    itemShopTitle = "Battle Supplies",
    insufficientNotes = "You do not have enough Allied Notes for that.",
    purchaseComplete = "Thank you for your purchase.",
    itemShopExit = "Exit",
    navNext = "Next",
    navPrev = "Prev",
    navNowhere = "No where!",
}

-- A global function for delayed menu sending, which uses the global 'menu' table.
local function delaySendMenu(player)
    DebugPrint("Delaying menu send by 50ms.")
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

--- Displays a menu for purchasing temporary campaign items.
---@param player Player The player object.
---@param npc Npc The NPC object.
---@param page number The page number to display.
local function showItemShopMenu(player, npc, page)
    --- Handles the actual item purchase transaction and returns a status.
    ---@param player Player
    ---@param item table The item data from CampaignTempItems.
    ---@return string "success" or "nofunds"
    local function processItemPurchase(player, item)        
        -- Check for available campaign supplies before checking player currency.
        local campaignSupplies = tonumber(GetServerVariable("CampaignSupplies")) or 0
        if campaignSupplies <= 0 then
            DebugPrint("FAIL: Supply check. CampaignSupplies is 0 or less.")
            return "nosupplies" -- New return status for depleted supplies
        end

        local currentNotes = player:getCurrency('allied_notes')

        if currentNotes < item.cost then
            DebugPrint(string.format("FAIL: Currency check for %s. Needed %d, has %d.", item.name, item.cost, currentNotes))
            return "nofunds"
        end

        -- All checks passed, execute the transaction
        SetServerVariable("CampaignSupplies", campaignSupplies - 10) -- Decrement supplies
        player:delCurrency('allied_notes', item.cost)
        player:addTempItem(item.id, 1)

        DebugPrint(string.format("SUCCESS: Player %s purchased %s for %d notes.", player:getName(), item.name, item.cost))
        return "success"
    end

    --- Processes the result of an item purchase attempt and shows the correct message/menu.
    ---@param player Player
    ---@param npc NPC
    ---@param result string The result from processItemPurchase ("success" or "nofunds").
    ---@param page number The current page of the shop menu to return to.
    local function handleItemPurchaseResult(player, npc, result, page)
        if result == "success" then
            player:printToPlayer(MESSAGES.purchaseComplete, 0, npc:getPacketName())
        elseif result == "nofunds" then
            player:printToPlayer(MESSAGES.insufficientNotes, 0, npc:getPacketName())
        elseif result == "nosupplies" then
            player:printToPlayer(MESSAGES.insufficientSupplies, 0, npc:getPacketName())
        end

        -- Always refresh the menu after displaying the result message.
        player:timer(50, function(p_timed)
            showItemShopMenu(p_timed, npc, page)
        end)
    end

    -- NEW: Filter items to show only those the player does not already have.
    local availableItems = {}
    for _, item in ipairs(CampaignTempItems) do
        if not player:hasItem(item.id) then
            table.insert(availableItems, item)
        end
    end

    local alliedNotes = player:getCurrency('allied_notes')
    local totalItems = #availableItems
    local totalPages = math.ceil(totalItems / ITEMS_PER_PAGE)
    local currentPage = math.max(1, math.min(page, totalPages))

    local startIndex = (currentPage - 1) * ITEMS_PER_PAGE + 1
    local endIndex = math.min(currentPage * ITEMS_PER_PAGE, totalItems)

    local itemMenu = {
        title = string.format("%s (Page %d/%d) (Notes: %d)", MESSAGES.itemShopTitle, currentPage, totalPages, alliedNotes),
        options = {}
    }

    -- Add items to the menu
    for i = startIndex, endIndex do
        local item = availableItems[i]
        local optionText = string.format("%s (%d)", item.name, item.cost)
        table.insert(itemMenu.options, {
            optionText,
            function(p) handleItemPurchaseResult(p, npc, processItemPurchase(p, item), currentPage) end
        })
    end

    -- Add navigation options
    if currentPage > 1 then
        table.insert(itemMenu.options, {
            MESSAGES.navPrev,
            function(playerArg)
                DebugPrint("Player chose 'Previous' in item shop.")
                showItemShopMenu(playerArg, npc, currentPage - 1)
            end
        })
    end

    if currentPage < totalPages then
        table.insert(itemMenu.options, {
            MESSAGES.navNext,
            function(playerArg)
                DebugPrint("Player chose 'Next' in item shop.")
                showItemShopMenu(playerArg, npc, currentPage + 1)
            end
        })
    end

    -- Add an exit option
    table.insert(itemMenu.options, {
        MESSAGES.itemShopExit,
        function(playerArg)
            DebugPrint("Player exited item shop. Re-triggering NPC for main menu.")
            -- Re-trigger the NPC to show the main menu again
            npc:onTrigger(playerArg, npc)
        end
    })

    player:timer(50, function(p)
        p:customMenu(itemMenu)
    end)
end

-- This function dynamically creates the required nested tables.
local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G

    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end

-- Ensure the tables for each NPC entry exist before the script attempts to
-- add the override function to them.
for _, entry in ipairs(npcOverrides) do
    ensureTable(string.format("xi.zones.%s.npcs.%s", entry.zone, entry.name))
end

--- Dynamically generates and displays a paginated teleport menu.
---@param player Player The player object.
---@param page number The page number to display.
local function showTeleportMenu(player, page)
    local totalLocations = #WarpLocations
    local totalPages = math.ceil(totalLocations / TELEPORTS_PER_PAGE)
    local currentPage = math.max(1, math.min(page, totalPages))

    local startIndex = (currentPage - 1) * TELEPORTS_PER_PAGE + 1
    local endIndex = math.min(currentPage * TELEPORTS_PER_PAGE, totalLocations)

    local tpMenu = {
        title = string.format("%s (Page %d/%d)", MESSAGES.tpMenuTitle, currentPage, totalPages),
        options = {}
    }

    -- Add "No where!" option to every page
    table.insert(tpMenu.options, {
        MESSAGES.navNowhere,
        function(playerArg) DebugPrint("Player chose 'No where!'.") end
    })

    -- Add teleport locations for the current page
    for i = startIndex, endIndex do
        local loc = WarpLocations[i]
        table.insert(tpMenu.options, {
            loc.name,
            function(playerArg)
                DebugPrint(string.format("Warping player to %s.", loc.name))
                playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
                playerArg:timer(1000, function()
                    playerArg:setPos(loc.x, loc.y, loc.z, loc.rot, loc.zone)
                end)
            end
        })
    end

    -- Add navigation options
    if currentPage > 1 then
        table.insert(tpMenu.options, {
            MESSAGES.navPrev,
            function(playerArg)
                DebugPrint("Player chose 'Previous'.")
                showTeleportMenu(playerArg, currentPage - 1)
            end
        })
    end

    if currentPage < totalPages then
        table.insert(tpMenu.options, {
            MESSAGES.navNext,
            function(playerArg)
                DebugPrint("Player chose 'Next'.")
                showTeleportMenu(playerArg, currentPage + 1)
            end
        })
    end

    player:timer(50, function(p)
        p:customMenu(tpMenu)
    end)
end

-- Loop through each entry and apply the onTrigger override (Campaign Tags/TP Giver).
for _, entry in ipairs(npcOverrides) do
    local triggerPath = string.format('xi.zones.%s.npcs.%s.onTrigger', entry.zone, entry.name)

    m:addOverride(triggerPath, function(player, npc, fallbackFn)
        DebugPrint(string.format("NPC Triggered: %s in Zone: %s by Player: %s (ID: %d)",
            npc:getPacketName(), player:getZone():getName(), player:getName(), player:getID()))

        -- Check if the player is in the correct zone.
        if player:getZone():getName() == entry.zone then

            DebugPrint("Player is in the expected NPC zone. Proceeding with menu.")

            -- Print the nation-specific greeting.
            local greetingText = MESSAGES.greetings[entry.nation]
            if greetingText then
                player:printToPlayer(string.format(greetingText, npc:getPacketName()), 0, npc:getPacketName())
            end

            -- 1. Initialize the Campaign NPC's main menu structure (local to avoid global conflict)
            local campaignMenu = {
                title = MESSAGES.mainMenuTitle,
                options = {}
            }

            -- 2. Add the Teleportation Option (Always available)
            table.insert(campaignMenu.options, {
                MESSAGES.menuOptionTeleport,
                function(playerArg)
                    DebugPrint("Player selected 'Teleportation'.")
                    -- Show the first page of the dynamic teleport menu.
                    showTeleportMenu(playerArg, 1)
                end
            })

            -- 4. Add Battle Supplies Option (Only during active battle)
            local battleState = tonumber(GetServerVariable(BATTLE_STATE_VAR)) or 0
            local ongoingBattleZoneId = tonumber(GetServerVariable("CampaignBattleZone"))
            local currentZoneId = player:getZone():getID()

            if battleState == 2 and ongoingBattleZoneId == currentZoneId then
                DebugPrint("Active battle in this zone. Adding 'Purchase Battle Supplies' option.")
                table.insert(campaignMenu.options, {
                    MESSAGES.menuOptionItems,
                    function(playerArg)
                        DebugPrint("Player selected 'Purchase Battle Supplies'.")
                        showItemShopMenu(playerArg, npc, 1) -- Pass player, npc, and start on page 1
                    end
                })
            else
                DebugPrint(string.format("No active battle in this zone (State: %d, Zone: %s). Item shop option hidden.",
                    battleState, tostring(ongoingBattleZoneId)))
            end

            -- 3. Add Allied Tags Option (Different display based on status)
            if not player:hasStatusEffect(ALLIED_TAGS_EFFECT_ID) then
                DebugPrint("Player does NOT have Allied Tags. Offering buffs.")
                -- Player does NOT have the tags, offer to give them.
                table.insert(campaignMenu.options, {
                    MESSAGES.menuOptionBuffs,
                    function(playerArg)
                        -- NEW: Check for sufficient campaign resources before proceeding.
                        local campaignResources = tonumber(GetServerVariable("CampaignResources")) or 0
                        DebugPrint(string.format("Resource Check: ServerVariable (CampaignResources) is %d.", campaignResources))
                        if campaignResources < 10 then
                            DebugPrint("Resource Check FAILED: Resources are below 10.")
                            playerArg:printToPlayer(MESSAGES.insufficientResources, 0, npc:getPacketName())
                            return -- Stop execution if resources are insufficient
                        end

                        -- Get the server variable and convert it to a number for comparison
                        local ongoingBattleZoneId = tonumber(GetServerVariable("CampaignBattleZone"))
                        -- Get the current zone ID the player is in
                        local currentZoneId = playerArg:getZone():getID()

                        DebugPrint(string.format("Buff Check: ServerVariable (CampaignBattleZone) is %s. Current Zone ID is %d.",
                            tostring(ongoingBattleZoneId), currentZoneId) .. string.format(" Battle State is %d.", battleState))

                        -- Check if the server variable is set and if it matches the current zone ID
                        if battleState ~= 2 or ongoingBattleZoneId == nil or ongoingBattleZoneId ~= currentZoneId then
                            DebugPrint("Buff Check FAILED: Zone IDs do not match or Server Variable is not set.")
                            playerArg:printToPlayer(MESSAGES.noOngoingBattle, 0, npc:getPacketName())
                            return -- Stop execution if no battle is ongoing in this zone
                        end

                        DebugPrint("Buff Check PASSED. Applying battle buffs.")

                        -- Deduct resources for the buffs
                        SetServerVariable("CampaignResources", campaignResources - 10)
                        DebugPrint(string.format("Deducted 10 resources for buffs. New total: %d", campaignResources - 10))

                        -- If the check passes, apply the buffs
                        --playerArg:addStatusEffect(ALLIED_TAGS_EFFECT_ID, 1, 3, EFFECT_DURATION_SECONDS) --makes it so you can't attack the mobs
                        playerArg:addStatusEffect(432, 1, 3, EFFECT_DURATION_SECONDS) -- Multistrikes
                        playerArg:addStatusEffect(170, 25, 3, EFFECT_DURATION_SECONDS) -- Regain
                        playerArg:addStatusEffect(42, 10, 3, EFFECT_DURATION_SECONDS) -- Regen
                        playerArg:addStatusEffect(43, 10, 3, EFFECT_DURATION_SECONDS) -- Refresh
                        DebugPrint(string.format("Applied buffs (432, 170, 42, 43) for %d seconds.", EFFECT_DURATION_SECONDS))
                        playerArg:printToPlayer(MESSAGES.receivedTags, 0, npc:getPacketName())
                    end
                })
            else
                DebugPrint("Player ALREADY has Allied Tags. Skipping buff offer.")
                -- Player HAS the tags, show an unclickable label.
                table.insert(campaignMenu.options, {
                    MESSAGES.alreadyHaveTags,
                    function(playerArg)
                        -- Do nothing, just close the menu.
                    end
                })
            end

            -- 4. Add the Exit Option
            table.insert(campaignMenu.options, {
                MESSAGES.menuOptionExit,
                function(playerArg)
                    DebugPrint("Player selected 'No, thank you.'")
                    playerArg:printToPlayer(MESSAGES.noChangeOfMind, 0, npc:getPacketName())
                end
            })

            -- Assign the dynamically built menu to the global 'menu' table
            menu = campaignMenu

            -- Use the delayed function to send the menu
            delaySendMenu(player)
            return true
        end

        -- If the zone doesn't match, we fall back to the default behavior.
        DebugPrint("Player is NOT in the expected NPC zone. Falling back to default trigger.")
        if fallbackFn then
            fallbackFn(player, npc)
        end
    end)
end

-- Mog Garden Zone Initialization (Time Portal NPC)
m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    DebugPrint("Mog Garden Zone Initialization start.")
    local ok, err = pcall(function()
        super(zone)
    end)
    if not ok then
        print('ERROR: super(zone) failed in Mog Garden: ' .. tostring(err))
    end
    local camptpnpc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Time Portal',
        look = 2421, -- 2421 for floating portal
        x         = 317.9936,
        y         = -0.8239,
        z         = -583.3723,
        rotation = 125,
        widescan = 1,
        onTrigger = function(player, npc)
            DebugPrint(string.format("Time Portal Triggered by Player: %s (ID: %d). Starting TP menu.",
                player:getName(), player:getID()))
            -- Ensure the title is correct before sending the paginated menu
            -- Show the first page of the new dynamic teleport menu.
            showTeleportMenu(player, 1)
        end,
    })
    DebugPrint("Time Portal2 dynamic entity inserted into Mog Garden.")
        local camptpnpc2 = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Battle Portal',
        look = '00003b0500000000000000000000000000000000', -- 2421 for floating portal
        x         = 386.6025,
        y         = -0.2607,
        z         = -578.0363,
        rotation = 125,
        widescan = 1,
        onTrigger = function(player, npc)
            DebugPrint(string.format("Battle Portal Triggered by Player: %s (ID: %d). Checking for active battle.",
                player:getName(), player:getID()))

            -- Get the active battle zone ID from the server variable
            local battleZoneId = tonumber(GetServerVariable("CampaignBattleZone")) or 0 -- The zone where the battle is.
            -- NEW: Get the current battle state to ensure it's actually active.
            local battleState = tonumber(GetServerVariable(BATTLE_STATE_VAR)) or 0 -- 0=Inactive, 1=Prep, 2=Active

            -- Only teleport if a battle zone is set AND the battle state is Prep or Active.
            if battleZoneId > 0 and battleState > 0 then
                DebugPrint(string.format("Active battle found in Zone ID: %d. Attempting to teleport player.", battleZoneId))
                
                -- Find the matching location in the new WarpLocations table
                local targetLocation = nil
                for _, loc in ipairs(WarpLocations) do
                    if loc.zoneid == battleZoneId then
                        targetLocation = loc
                        break
                    end
                end

                if targetLocation then
                    DebugPrint("Teleport function found. Executing warp.")
                    player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
                    player:timer(1000, function() player:setPos(targetLocation.x, targetLocation.y, targetLocation.z, targetLocation.rot, targetLocation.zone) end)
                else
                    DebugPrint("ERROR: Battle zone ID " .. battleZoneId .. " has no matching teleport configuration.")
                    player:printToPlayer(MESSAGES.battlePortalCoordError, 0, npc:getPacketName())
                end
            else
                DebugPrint(string.format("No active battle found. Zone ID: %d, Battle State: %d.", battleZoneId, battleState))
                player:printToPlayer(MESSAGES.noActiveBattlePortal, 0, npc:getPacketName())
            end
        end,
    })
    DebugPrint("Time Portal dynamic entity inserted into Mog Garden.")
end)



return m
