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

-- Global declarations for menu pages (Used by both Campaign NPCs and the Time Portal)
local menu = {} -- Main Menu Title structure for paginated transfers
local TPlocationsPage1 = {}
local TPlocationsPage2 = {}
local TPlocationsPage3 = {}
local TPlocationsPage4 = {}
local TPlocationsPage5 = {}
local TPlocationsPage6 = {}

-- The status effect ID for Allied Tags.
local ALLIED_TAGS_EFFECT_ID = xi.effect.ALLIED_TAGS

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
    noOngoingBattle = "I can't do that, there is not an ongoing battle in this zone.",
}

-- A global function for delayed menu sending, which uses the global 'menu' table.
local function delaySendMenu(player)
    DebugPrint("Delaying menu send by 50ms.")
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

-- Teleport Locations Page 1 (Snipped for brevity - logic unchanged)
TPlocationsPage1 =
{
    {
        'No where!',
        function(playerArg)
            DebugPrint("Player chose 'No where!' (Page 1).")
        end,
    },
    {
        'West Sarutabaruta [S]',
        function(playerArg)
            DebugPrint("Warping player to West Sarutabaruta [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-19.5262, -13.0901, 307.3373, 252, xi.zone.WEST_SARUTABARUTA_S)
            end)
        end,
    },
    {
        'East Ronfaure [S]',
        function(playerArg)
            DebugPrint("Warping player to East Ronfaure [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(320.8822, -30, -120.46, 157, xi.zone.EAST_RONFAURE_S)
            end)
        end,
    },
    {
        'North Gustaberg [S]',
        function(playerArg)
            DebugPrint("Warping player to North Gustaberg [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-543.2109, 41.9802, 65.2432, 129, xi.zone.NORTH_GUSTABERG_S)
            end)
        end,
    },
    {
        'Fort Karugo-Narugo [S]',
        function(playerArg)
            DebugPrint("Warping player to Fort Karugo-Narugo [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-97.4075, -79.0452, 0.9719, 127, xi.zone.FORT_KARUGO_NARUGO_S)
            end)
        end,
    },
    {
        'Next',
        function(playerArg)
            DebugPrint("Player chose 'Next' (Page 1 to 2).")
            menu.options = TPlocationsPage2
            delaySendMenu(playerArg)
        end,
    },
}

-- Teleport Locations Page 2
TPlocationsPage2 =
{
    {
        'No where!',
        function(playerArg)
            DebugPrint("Player chose 'No where!' (Page 2).")
        end,
    },
    {
        'Jugner Forest [S]',
        function(playerArg)
            DebugPrint("Warping player to Jugner Forest [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(73.2172, 0.2277, -5.8201, 88, xi.zone.JUGNER_FOREST_S)
            end)
        end,
    },
    {
        'Grauberg [S]',
        function(playerArg)
            DebugPrint("Warping player to Grauberg [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(302.18,-48.9102, 100.70, 0, xi.zone.GRAUBERG_S)
            end)
        end,
    },
    {
        'Meriphataud Mountains [S]',
        function(playerArg)
            DebugPrint("Warping player to Meriphataud Mountains [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-307.4041, 18.0515, 429.0015, 253, xi.zone.MERIPHATAUD_MOUNTAINS_S)
            end)
        end,
    },
    {
        'Previous',
        function(playerArg)
            DebugPrint("Player chose 'Previous' (Page 2 to 1).")
            menu.options = TPlocationsPage1
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next',
        function(playerArg)
            DebugPrint("Player chose 'Next' (Page 2 to 3).")
            menu.options = TPlocationsPage3
            delaySendMenu(playerArg)
        end,
    },

}

TPlocationsPage3 =
{
    {
        'No where!',
        function(playerArg)
            DebugPrint("Player chose 'No where!' (Page 2).")
        end,
    },
    {
        'Pashhow Marshlands [S]',
        function(playerArg)
            DebugPrint("Warping player to Pashhow Marshlands [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(498.6725, 25.00, 647.8894, 93, xi.zone.PASHHOW_MARSHLANDS_S)
            end)
        end,
    },
    {
        'Vunkerl Inlet [S]',
        function(playerArg)
            DebugPrint("Warping player to Vunkerl Inlet [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-185.1144, -39.6465, -279.82, 125, xi.zone.VUNKERL_INLET_S)
            end)
        end,
    },
    {
        'Previous',
        function(playerArg)
            DebugPrint("Player chose 'Previous' (Page 2 to 1).")
            menu.options = TPlocationsPage2
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next',
        function(playerArg)
            DebugPrint("Player chose 'Next' (Page 2 to 3).")
            menu.options = TPlocationsPage4
            delaySendMenu(playerArg)
        end,
    },

}

-- Teleport Locations Page 3
TPlocationsPage4 =
{
    {
        'No where!',
        function(playerArg)
            DebugPrint("Player chose 'No where!' (Page 3).")
        end,
    },
    {
        'Sauromugue Champaign [S]',
        function(playerArg)
            DebugPrint("Warping player to Sauromugue Champaign [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(-31.3777, 25.2828, 219.4237, 127, xi.zone.SAUROMUGUE_CHAMPAIGN_S)
            end)
        end,
    },
    {
        'Rolanberry Fields [S]',
        function(playerArg)
            DebugPrint("Warping player to Rolanberry Fields [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(233.8327, 8.1201, 219.2024, 254, xi.zone.ROLANBERRY_FIELDS_S)
            end)
        end,
    },
    {
        'Batallia Downs [S]',
        function(playerArg)
            DebugPrint("Warping player to Batallia Downs [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(225.2325, 8.6223, 49.7229, 72, xi.zone.BATALLIA_DOWNS_S)
            end)
        end,
    },
    {
        'Previous',
        function(playerArg)
            DebugPrint("Player chose 'Previous' (Page 3 to 2).")
            menu.options = TPlocationsPage3
            delaySendMenu(playerArg)
        end,
    },
    {
        'Next',
        function(playerArg)
            DebugPrint("Player chose 'Next' (Page 3 to 4).")
            menu.options = TPlocationsPage5
            delaySendMenu(playerArg)
        end,
    },

}

-- Teleport Locations Page 4
TPlocationsPage5 =
{
    {
        'No where!',
        function(playerArg)
            DebugPrint("Player chose 'No where!' (Page 4).")
        end,
    },
    {
        'Beaucedine Glacier [S]',
        function(playerArg)
            DebugPrint("Warping player to Beaucedine Glacier [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(71.5509, -59.9720, -47.6743, 3, xi.zone.BEAUCEDINE_GLACIER_S)
            end)
        end,
    },
    {
        'Xarcabard [S]',
        function(playerArg)
            DebugPrint("Warping player to Xarcabard [S].")
            -- Inject action packet for animation (replace animation ID as needed)
            playerArg:injectActionPacket(playerArg:getID(), 6, 643, 0, 0, 0, 10, 1)
            -- Delay warp using a timer
            playerArg:timer(1000, function()
                playerArg:setPos(138.7753, -21.0384, -118.4290, 131, xi.zone.XARCABARD_S)
            end)
        end,
    },
    {
        'Previous',
        function(playerArg)
            DebugPrint("Player chose 'Previous' (Page 4 to 3).")
            menu.options = TPlocationsPage4
            delaySendMenu(playerArg)
        end,
    },
}


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
                'Teleportation',
                function(playerArg)
                    DebugPrint("Player selected 'Teleportation'.")
                    -- Start the TP sequence by setting the global menu context
                    menu.title = MESSAGES.tpMenuTitle
                    menu.options = TPlocationsPage1
                    delaySendMenu(playerArg)
                end
            })

            -- 3. Add Allied Tags Option (Different display based on status)
            if not player:hasStatusEffect(ALLIED_TAGS_EFFECT_ID) then
                DebugPrint("Player does NOT have Allied Tags. Offering buffs.")
                -- Player does NOT have the tags, offer to give them.
                table.insert(campaignMenu.options, {
                    'Receive Battle Buffs',
                    function(playerArg)
                        -- Get the server variable and convert it to a number for comparison
                        local ongoingBattleZoneId = tonumber(GetServerVariable("CampaignBattleZone"))
                        -- Get the current zone ID the player is in
                        local currentZoneId = playerArg:getZone():getID()

                        DebugPrint(string.format("Buff Check: ServerVariable (CampaignBattleZone) is %s. Current Zone ID is %d.",
                            tostring(ongoingBattleZoneId), currentZoneId))

                        -- Check if the server variable is set and if it matches the current zone ID
                        if ongoingBattleZoneId == nil or ongoingBattleZoneId ~= currentZoneId then
                            DebugPrint("Buff Check FAILED: Zone IDs do not match or Server Variable is not set.")
                            playerArg:printToPlayer(MESSAGES.noOngoingBattle, 0, npc:getPacketName())
                            return -- Stop execution if no battle is ongoing in this zone
                        end

                        DebugPrint("Buff Check PASSED. Applying battle buffs.")
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
                'No, thank you.',
                function(playerArg)
                    DebugPrint("Player selected 'No, thank you.'")
                    playerArg:printToPlayer(MESSAGES.noChangeOfMind, 0, npc:getPacketName())
                end
            })

            -- Send the dynamically built campaign menu
            player:customMenu(campaignMenu)

            -- We return true to indicate the trigger has been handled.
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
        x         = 386.6025,
        y         = -0.2607,
        z         = -578.0363,
        rotation = 125,
        widescan = 1,
        onTrigger = function(player, npc)
            DebugPrint(string.format("Time Portal Triggered by Player: %s (ID: %d). Starting TP menu.",
                player:getName(), player:getID()))
            -- Ensure the title is correct before sending the paginated menu
            menu.title = MESSAGES.tpMenuTitle
            menu.options = TPlocationsPage1
            delaySendMenu(player)
        end,
    })
    DebugPrint("Time Portal dynamic entity inserted into Mog Garden.")
end)

return m
