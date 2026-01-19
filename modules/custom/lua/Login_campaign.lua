-------------------------------------------
-- Login Campaign
-------------------------------------------
require("modules/module_utils")
require("scripts/utils/utils")
require("scripts/events/login_campaign")
-------------------------------------------
local m = Module:new("system_login_campaign")

-- Configuration: Set to true to cycle items monthly, false to keep static
local CYCLE_SETTINGS = {
    [1]  = true, -- 10 Points
    [5]  = true, -- 100 Points
    [9]  = true, -- 100 Points (Page 2)
    [13] = true, -- 300 Points
    [17] = true, -- 500 Points
    [21] = true, -- 750 Points
    [25] = true, -- 1000 Points
    [29] = true, -- 1500 Points
}

-- ONLY 19 ITEMS PER PRICE BRACKET POSSIBLE!! (20 will overwrite the ingame back button.)
local loginCampaignData =
{
    -- STATIC, DOESNT ROTATE
    [1] =
    {
        ["price"] = 10,
        ["static_items"] =
        {
            xi.item.BEASTMENS_SEAL, -- beastmens_seal
            xi.item.KINDREDS_SEAL, -- kindreds_seal
            xi.item.KINDREDS_CREST, -- kindreds_crest
            xi.item.HIGH_KINDREDS_CREST, -- h._kindred_crest
            xi.item.SACRED_KINDREDS_CREST, -- s._kindred_crest
            xi.item.ONE_BYNE_BILL, -- one byne bill
            xi.item.ORDELLE_BRONZEPIECE, -- ordelle bronzepiece
            xi.item.TUKUKU_WHITESHELL, -- tukuku whiteshell
            xi.item.ANCIENT_BEASTCOIN, -- ancient beastcoin
        },
        ["rotating_items"] =
        {
            -- Cycle #1 January/May/September
            {
                xi.item.IMPERIAL_CHAIR_SET,
                xi.item.DECORATIVE_CHAIR_SET,
                xi.item.ORNATE_STOOL_SET,
            },
            -- Cycle #2 February/June/October
            {
                xi.item.REFINED_CHAIR_SET,
                xi.item.PORTABLE_CONTAINER,
                xi.item.EPHRAMADIAN_THRONE,
            },
            -- Cycle #3 March/July/November
            {
                xi.item.SHADOW_THRONE,
                xi.item.CHOCOBO_CHAIR, -- Chocobo Chair
                xi.item.LEAF_BENCH, -- Leaf Bench
                xi.item.ASTRAL_CUBE,
            },
        },
    },

    [5] =
    {
        ["price"] = 100,
        ["static_items"] =
        {
            xi.item.COPPER_AMAN_VOUCHER, -- copper aman voucher
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.CIPHER_OF_LUZAFS_ALTER_EGO,
                xi.item.CIPHER_OF_NAJELITHS_ALTER_EGO,
                xi.item.CIPHER_OF_ZEIDS_ALTER_EGO,
                xi.item.CIPHER_OF_LIONS_ALTER_EGO,
                xi.item.MOUNT_SPECTRAL_CHAIR, -- ♪spectral chair
                xi.item.MOUNT_SPHEROID, -- ♪spheroid
                xi.item.MOUNT_OMEGA,
                xi.item.MOUNT_COEURL, -- ♪coeurl
                xi.item.MOUNT_GOOBBUE,
                xi.item.MOUNT_RAAZ, -- ♪raaz
                xi.item.CIPHER_OF_D_SHANTOTTOS_ALTER_EGO,
            },
            -- Cycle #2
            {
                xi.item.CIPHER_OF_STAR_SIBYLS_ALTER_EGO,
                xi.item.CIPHER_OF_KARAHAS_ALTER_EGO,
                xi.item.CIPHER_OF_AREUHATS_ALTER_EGO,
                xi.item.MOUNT_LEVITUS, -- ♪levitus
                xi.item.MOUNT_ADAMANTOISE, -- ♪adamantoise
                xi.item.MOUNT_DHALMEL,
                xi.item.MOUNT_DOLL, -- ♪doll
                xi.item.RED_RAPTOR_NOTEBOOK,
                xi.item.GOLDEN_BOMB_NOTEBOOK,
            },
            -- Cycle #3
            {
                xi.item.CIPHER_OF_TEODORS_ALTER_EGO,
                xi.item.CIPHER_OF_DARRCUILNS_ALTER_EGO,
                xi.item.BUFFALO_NOTEBOOK,
                xi.item.WIVRE_NOTEBOOK,
                xi.item.IRON_GIANT_NOTEBOOK,
                xi.item.BYAKKO_NOTEBOOK,
                xi.item.IXION_NOTEBOOK,
            },
        },
    },

    [9] = -- 100 Points (Page 2)
    {
        ["price"] = 100,
        ["static_items"] =
        {
            -- No static items for this tier
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.CIPHER_OF_UKAS_ALTER_EGO,
                xi.item.CIPHER_OF_KUYINS_ALTER_EGO,
                xi.item.CIPHER_OF_ABENZIOS_ALTER_EGO,
                xi.item.CIPHER_OF_RUGHADJEENS_ALTER_EGO,
                xi.item.MOUNT_RAPTOR, -- ♪raptor
                xi.item.MOUNT_TIGER,
                xi.item.MOUNT_CRAB,
                xi.item.MOUNT_RED_CRAB,
                xi.item.MOUNT_BOMB,
                xi.item.MOUNT_SHEEP, -- ♪ram
                xi.item.CIPHER_OF_LHES_ALTER_EGO,
            },
            -- Cycle #2
            {
                xi.item.CIPHER_OF_MAYAKOVS_ALTER_EGO,
                xi.item.CIPHER_OF_BRYGIDS_ALTER_EGO,
                xi.item.CIPHER_OF_MILDAURIONS_ALTER_EGO,
                xi.item.MOUNT_MORBOL, -- ♪morbol
                xi.item.MOUNT_CRAWLER,
                xi.item.MOUNT_FENRIR,
                xi.item.MOUNT_BEETLE,
                xi.item.MOUNT_MOOGLE, -- ♪moogle
                xi.item.MOUNT_MAGIC_POT, -- ♪magic pot
            },
            -- Cycle #3
            {
                xi.item.CIPHER_OF_RONGELOUTSS_ALTER_EGO,
                xi.item.CIPHER_OF_ROBEL_AKBELS_ALTER_EGO,
                xi.item.CIPHER_OF_SHANTOTTOS_ALTER_EGO_II,
                xi.item.MOUNT_TULFAIRE, -- ♪tulfaire
                xi.item.MOUNT_WARMACHINE, -- ♪warmachine
                xi.item.MOUNT_XZOMIT, -- ♪xzomit
                xi.item.MOUNT_HIPPOGRYPH, -- ♪hippogryph
                xi.item.MOUNT_PHUABO, -- ♪phuabo
            },
        },
    },

    [13] =
    {
        ["price"] = 300,
        ["static_items"] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_1,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_2,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_3,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_4,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_5,
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.CHOCOBO_MASQUE_P1, -- chocobo masque +1
                xi.item.CHOCOBO_SUIT_P1, -- chocobo suit +1
                xi.item.STARLET_FLOWER, -- Starlet Flower
                xi.item.STARLET_JABOT, -- Starlet Jabot
                xi.item.STARLET_GLOVES, -- Starlet Gloves
                xi.item.STARLET_SKIRT, -- Starlet Skirt
                xi.item.STARLET_BOOTS, -- Starlet Boots
                xi.item.KORRIGAN_SUIT, -- Korrigan Suite
                xi.item.KORRIGAN_MASQUE, -- Korrigan Masque
            },
            -- Cycle #2
            {
                xi.item.WYRMKING_MASQUE_P1, -- Wyrm. Masque +1
                xi.item.WYRMKING_SUIT_P1, -- Wyrmking Suit +1
                xi.item.AGENT_HOOD, -- Agent Hood
                xi.item.AGENT_COAT, -- Agent Coat
                xi.item.AGENT_CUFFS, -- Agent Cuffs
                xi.item.AGENT_PANTS, -- Agent Pants
                xi.item.AGENT_BOOTS, -- Agent Boots
            },
            -- Cycle #3
            {
                xi.item.DEED_OF_MODERATION, -- deed of moderation
                xi.item.DEED_OF_PLACIDITY, -- deed of placidity
                xi.item.DEED_OF_SENSIBILITY, -- deed of sensibility
                xi.item.BEHEMOTH_MASQUE_P1, -- behemoth masque +1
                xi.item.BEHEMOTH_SUIT_P1, -- behemoth suit +1
                xi.item.MOOGLE_SUIT, -- moogle suit
                xi.item.MOOGLE_MASQUE, -- moogle masque
            },
        },
    },

    [17] =
    {
        ["price"] = 500,
        ["static_items"] =
        {
            xi.item.PEACOCK_AMULET, -- Peacock Amulet
            xi.item.BOUNDING_BOOTS,
            xi.item.OCHIMUSHA_KOTE,
            xi.item.SONIC_BELT_P1, -- Sonic Belt +1
            xi.item.SARUTOBI_KYAHAN,
            xi.item.CELESTIAL_GLOBE,
            xi.item.MEGALIXIR,
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.EXCALIPOOR, -- Excalipoor
                xi.item.BLIZZARD_BRAND, -- Blizzard Brand
                xi.item.NOVENNIAL_THIGH_BOOTS, -- novennial thigh boots
                xi.item.NOVENNIAL_DRESS, -- Novennial Dress
                xi.item.DECENNIAL_TIARA, -- decennial tiara
                xi.item.DECENNIAL_DRESS, -- decennial dress
            },
            -- Cycle #2
            {
                xi.item.FIRETONGUE, -- Fire Tongue
                xi.item.ZANMATO, -- Zanmato
                xi.item.DECENNIAL_HOSE, -- decennial hose
                xi.item.DECENNIAL_CROWN, -- Decennial Crown
                xi.item.DECENNIAL_COAT, -- Decennial Coat
                xi.item.NOVENNIAL_COAT, -- Novennial Coat
                xi.item.NEMUS_SALVARS_P1, -- Novennial Hose
                xi.item.DECENNIAL_TIGHTS, -- Decennial tights
            },
            -- Cycle #3
            {
                xi.item.FIRST_VIRTUE, -- first virtue
                xi.item.SECOND_VIRTUE, -- second virtue
                xi.item.THIRD_VIRTUE, -- third virtue
                xi.item.SHA_WUJINGS_LANCE, -- Sha Wujing Lance
                xi.item.KAMLANAUTS_SWORD, -- kamlanauts sword
                xi.item.DINNER_JACKET, -- Dinner Jacket
                xi.item.DINNER_HOSE, -- Dinner Hose
            },
        },
    },

    [21] =
    {
        ["price"] = 750,
        ["static_items"] =
        {
            xi.item.COPY_OF_REMS_TALE_CHAPTER_6,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_7,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_8,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_9,
            xi.item.COPY_OF_REMS_TALE_CHAPTER_10,
            xi.item.DIVINE_BIJOU, -- Divine Bijou
            xi.item.BARBARIC_BIJOU, -- Barbaric Bijou
            xi.item.STEELWALL_BIJOU, -- Steelwall Bijou
            xi.item.ROVING_BIJOU, -- Roving Bijou
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.JUG_OF_HONEY_WINE,
                xi.item.BEASTLY_SHANK,
                xi.item.CLUMP_OF_BLUE_PONDWEED,
            },
            -- Cycle #2
            {
                xi.item.SPRINGSTONE,
                xi.item.SUMMERSTONE,
                xi.item.AUTUMNSTONE,
                xi.item.WINTERSTONE,
                xi.item.GEM_OF_THE_EAST,
                xi.item.GEM_OF_THE_WEST,
                xi.item.GEM_OF_THE_NORTH,
                xi.item.GEM_OF_THE_SOUTH,
            },
            -- Cycle #3
            {
                xi.item.FOURTH_VIRTUE,
                xi.item.FIFTH_VIRTUE,
                xi.item.SIXTH_VIRTUE,
            },
        },
    },

    [25] =
    {
        ["price"] = 1000,
        ["static_items"] =
        {
            xi.item.SUPPANOMIMI, -- Suppanomimi
            xi.item.ABYSSAL_EARRING, -- Abyssal Earring
            xi.item.BEASTLY_EARRING, -- Beastly Earring
            xi.item.BUSHINOMIMI, -- Bushinomimi Earring
            xi.item.KNIGHTS_EARRING, -- Knights Earring
            xi.item.LUNGO_NANGO_JADESHELL, -- lungo-nango jadeshell
            xi.item.MONTIONT_SILVERPIECE, -- montiont silverpiece
            xi.item.ONE_HUNDRED_BYNE_BILL, -- one hundred byne bill
            xi.item.LEERING_BIJOU, -- leering bijou
            xi.item.CREEPERS_JUJU, -- creepers juju
            xi.item.REVELATORY_JUJU, -- revelatory juju
            xi.item.UNDYING_JUJU, -- undying juju
            xi.item.HERALDS_JUJU, -- heralds juju
            xi.item.SHROUDED_BIJOU, -- Shrouded Bijou
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.RAJAS_RING,
                xi.item.SATTVA_RING,
                xi.item.TAMAS_RING,
            },
            -- Cycle #2
            {
                xi.item.BALRAHNS_RING,
                xi.item.ULTHALAMS_RING,
                xi.item.JALZAHNS_RING,
            },
            -- Cycle #3
            {
                xi.item.STATIC_EARRING,
                xi.item.MAGNETIC_EARRING,
                xi.item.HOLLOW_EARRING,
                xi.item.ETHEREAL_EARRING,
            },
        },
    },

    [29] =
    {
        ["price"] = 1500,
        ["static_items"] =
        {
            xi.item.CUP_OF_SWEET_TEA, -- Sweet Tea
            xi.item.SAVORY_SHANK, -- Savory Shank
            xi.item.CLUMP_OF_RED_PONDWEED, -- Red Pondweed
            xi.item.MALIYAKALEYA_ORB, -- Maliya. Coral Orb
            xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, -- cipher of ullegores alter ego
        },
        ["rotating_items"] =
        {
            -- Cycle #1
            {
                xi.item.CIPHER_OF_MONBERAUXS_ALTER_EGO,
                xi.item.HACHIRIN_NO_OBI, -- Hachirin-no-Obi
                xi.item.OCTAVE_CLUB,
                xi.item.WHITE_RARAB_CAP_P1,
            },
            -- Cycle #2
            {
                xi.item.HEPATIZON_INGOT,
                xi.item.BERYLLIUM_INGOT,
                xi.item.CIPHER_OF_LEHKOS_ALTER_EGO,
                xi.item.NIGHTFALL,
                xi.item.CHAAC_BELT,
            },
            -- Cycle #3
            {
                xi.item.PIECE_OF_EXALTED_LUMBER,
                xi.item.SPOOL_OF_SIFS_MACRAME,
                xi.item.FOTIA_GORGET,
                xi.item.FOTIA_BELT,
                xi.item.GORNEY_RING,
            },
        },
    },
}

local prizes = {}

for month = 1, 12 do
    prizes[month] = {}

    for categoryID, categoryInfo in pairs(loginCampaignData) do
        local items = {}

        -- Add static items first
        if categoryInfo.static_items then
            for _, item in ipairs(categoryInfo.static_items) do
                table.insert(items, item)
            end
        end

        -- Add rotating items if cycling is enabled
        if CYCLE_SETTINGS[categoryID] == true and categoryInfo.rotating_items then
            local cycleIndex = (month - 1) % 3 + 1 -- jan(1) => 1, feb(2) => 2, mar(3) => 3, apr(4) => 1
            local rotatingSet = categoryInfo.rotating_items[cycleIndex]
            if rotatingSet then
                for _, item in ipairs(rotatingSet) do
                    table.insert(items, item)
                end
            end
        end

        prizes[month][categoryID] =
        {
            price = categoryInfo.price,
            items = items,
        }
    end
end

m:addOverride("xi.events.loginCampaign.isCampaignActive", function()
    if xi.settings.main.ENABLE_LOGIN_CAMPAIGN == 1 then
        return true
    end

    return false
end)

local function getMonth()
    return tonumber(os.date("%m", os.time()))
end

local function getYear()
    return tonumber(os.date("%Y", os.time()))
end

m:addOverride("xi.events.loginCampaign.onGameIn", function(player)

    if not xi.events.loginCampaign.isCampaignActive()  then
        return
    end

    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local loginPoints = player:getCurrency('login_points')

    local playercMonth = player:getCharVar('LoginCampaignMonth')
    local playercYear  = player:getCharVar('LoginCampaignYear')
    local nextMidnight = player:getCharVar('LoginCampaignNextMidnight')
    local loginCount   = player:getCharVar('LoginCampaignLoginNumber')

    local loginCampaignMonth = getMonth()
    local loginCampaignYear  = getYear()

    -- Carry last months points if there's any
    if playercMonth ~= loginCampaignMonth or playercYear ~= loginCampaignYear then
        if loginPoints > 1500 then
            player:setCurrency('login_points', 1500)
            player:messageSpecial(ID.text.CARRIED_OVER_POINTS, 0, 1500)
        elseif loginPoints ~= 0 then
            player:messageSpecial(ID.text.CARRIED_OVER_POINTS, 0, loginPoints)
        end

        player:setCharVar('LoginCampaignMonth', loginCampaignMonth)
        player:setCharVar('LoginCampaignYear', loginCampaignYear)
        loginCount = 1  -- Reset to 1 for the first login of the new month/year

        -- Show info about new campaign month/year
        player:messageSpecial(ID.text.LOGIN_CAMPAIGN_UNDERWAY, loginCampaignYear, loginCampaignMonth)
    elseif nextMidnight ~= JstMidnight() then
        loginCount = loginCount + 1  -- Increment for daily logins within the same month/year
    else
        return -- If it's not a new day or month, do nothing
    end

    player:setCharVar('LoginCampaignNextMidnight', JstMidnight())

    -- Award login points based on the login count
    if loginCount == 1 then
        player:addCurrency('login_points', 500)
        player:messageSpecial(ID.text.LOGIN_NUMBER, 0, loginCount, 500, player:getCurrency('login_points'))
    else
        player:addCurrency('login_points', 200)
        player:messageSpecial(ID.text.LOGIN_NUMBER, 0, loginCount, 200, player:getCurrency('login_points'))
    end

    player:setCharVar('LoginCampaignLoginNumber', loginCount)
end)

m:addOverride("xi.events.loginCampaign.onTrigger", function(player, csid)

    if not xi.events.loginCampaign.isCampaignActive() then
        -- TODO: What do the moogles do when the campaign isn't active?
        return
    end

    local loginPoints = player:getCurrency('login_points')
    local cDate = bit.bor(getYear(), bit.lshift(getMonth(), 28))
    local currentLoginCampaign = prizes[getMonth()]
    local price = {}
    local priceShift = {}
    local hideOptions = 0

    -- Makes a table of prices
    for k, v in pairs(currentLoginCampaign) do
        price[k] = currentLoginCampaign[k]['price']
    end

    -- Bit shifts values of prices (Defaults to 0 if price not in table)
    priceShift[1] = price[1] or 0
    priceShift[2] = bit.lshift(price[5] or 0, 16)
    priceShift[3] = price[9] or 0
    priceShift[4] = bit.lshift(price[13] or 0, 16)
    priceShift[5] = price[17] or 0
    priceShift[6] = bit.lshift(price[21] or 0, 16)
    priceShift[7] = price[25] or 0
    priceShift[8] = bit.lshift(price[29] or 0, 16)

    -- Combines two 16bit values to a single 32bit that will be passed as a CS param
    local priceBit1 = bit.bor(priceShift[1], priceShift[2])
    local priceBit2 = bit.bor(priceShift[3], priceShift[4])
    local priceBit3 = bit.bor(priceShift[5], priceShift[6])
    local priceBit4 = bit.bor(priceShift[7], priceShift[8])

    -- Turning on bits in hideOptions will make choices disappear
    for i = 1, #priceShift do
        if priceShift[i] == 0 then
            hideOptions = bit.bor(hideOptions, bit.lshift(1, i - 1))
        end
    end

    -- Eight param is not used/unknown
    player:startEvent(csid, cDate, loginPoints, priceBit1, priceBit2, priceBit3, priceBit4, hideOptions)
end)

m:addOverride("xi.events.loginCampaign.onEventUpdate", function(player, csid, option)

    local showItems = bit.band(option, 31) -- first 32 bits are for showing correct item list
    local itemSelected = bit.band(bit.rshift(option, 5), 31)
    local itemQuantity = bit.band(bit.rshift(option, 11), 511)
    local currentLoginCampaign = prizes[getMonth()]
    local loginPoints = player:getCurrency('login_points')

    if
        showItems == 1 or
        showItems == 5 or
        showItems == 9 or
        showItems == 13 or
        showItems == 17 or
        showItems == 21 or
        showItems == 25 or
        showItems == 29
    then
        local items = {}
        for i = 1, 20 do
            if currentLoginCampaign[showItems]["items"][i] ~= nil then
                table.insert(items, currentLoginCampaign[showItems]["items"][i])
            else
                table.insert(items, 0)
            end
        end

        player:updateEvent(
            bit.bor(items[1], bit.lshift(items[2], 16)),
            bit.bor(items[3], bit.lshift(items[4], 16)),
            bit.bor(items[5], bit.lshift(items[6], 16)),
            bit.bor(items[7], bit.lshift(items[8], 16)),
            bit.bor(items[9], bit.lshift(items[10], 16)),
            bit.bor(items[11], bit.lshift(items[12], 16)),
            bit.bor(items[13], bit.lshift(items[14], 16)),
            bit.bor(items[15], bit.lshift(items[16], 16)))
    elseif
        showItems == 2 or
        showItems == 6 or
        showItems == 10 or
        showItems == 14 or
        showItems == 18 or
        showItems == 22 or
        showItems == 26 or
        showItems == 30
    then
        local price = currentLoginCampaign[showItems - 1]["price"]
        local totalItemsMask = (2 ^ 20 - 1) - (2 ^ #currentLoginCampaign[showItems - 1]["items"] - 1)  -- Uses 20 bits and sets to 1 for items not used.
        local items = {}

        for i = 1, 20 do
            if currentLoginCampaign[showItems - 1]["items"][i] ~= nil then
                table.insert(items, currentLoginCampaign[showItems - 1]["items"][i])
            else
                table.insert(items, 0)
            end
        end

        player:updateEvent(
            bit.bor(items[17], bit.lshift(items[18], 16)),
            bit.bor(items[19], bit.lshift(items[20], 16)),
            totalItemsMask,
            price,
            loginPoints)
    else
        if itemQuantity == 1 then
            if npcUtil.giveItem(player, { { currentLoginCampaign[showItems - 2]["items"][itemSelected + 1], itemQuantity } }) then
                player:delCurrency("login_points", currentLoginCampaign[showItems - 2]["price"] * itemQuantity)
                player:updateEvent(
                    currentLoginCampaign[showItems - 2]["items"][itemSelected + 1],
                    player:getCurrency("login_points"), -- Login Points after purchase
                    0, -- Unknown (most likely totalItemMask)
                    currentLoginCampaign[showItems - 2]["price"],
                    loginPoints) -- Login points before purchase
            end
        else
            print(string.format("%s has attempted to purchase %s of item: %s from login campaign.", player, itemQuantity, currentLoginCampaign[showItems - 2]["items"][itemSelected + 1], itemQuantity))
        end
    end
end)

return m
