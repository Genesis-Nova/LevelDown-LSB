-- Required modules for functionality.
require("modules/module_utils")
require("scripts/globals/npc_util")

-- Global declarations for menu pages (Used by both Campaign NPCs and the Time Portal)
local menu = {} -- Main Menu Title structure for paginated transfers

-- CONFIGURATION TOGGLES
local DEBUG_MODE = false -- Re-enabling debug to track transaction steps

-- TIDE SCORE CONFIGURATION
local TIDE_SCORE_CONFIG = {
    NEUTRAL_SCORE = 50,
    -- Discount settings (when score > NEUTRAL_SCORE)
    DISCOUNT_PER_POINT = 0.5, -- 0.5% discount per point above neutral
    MAX_DISCOUNT_PERCENT = 25, -- Maximum possible discount percentage
    -- Surcharge settings (when score < NEUTRAL_SCORE)
    SURCHARGE_PER_POINT = 1, -- 1% surcharge per point below neutral
    MAX_SURCHARGE_PERCENT = 25, -- Maximum possible surcharge percentage
}

--Prices

local lockstyle_price = 15000 -- Ebon, Furia, Etc Armor - 10 battles each
local special_price = 50000 -- Select Log In Campaign Items -- 33 battles each
local abymoney_price = 2000 -- Coins, Stones, etc -- 1.5 battles each
local abyseals_price = 1000 -- Aby Seals - 1 battle
local abyingr_price = 4500 -- Job Ingredients - 3 battles
local avatar_ring_nq_price = 100000
local avatar_ring_hq_price = 300000


---@type Module
local m = Module:new('CustCampaignShop') -- Updated Module Name

-- Ensure m has a logDebug method for safe printing
if not m.logDebug then
    m.logDebug = function(_, format, ...) -- '_' consumes the 'self' argument
        if DEBUG_MODE then 
            -- Updated debug prefix to reflect the new module name
            print(string.format("[DEBUG] [CustCampaignShop] " .. format, ...)) 
        end
    end
end

-- Table for reward items. Structure: 
-- Standard Item: { "Piece Name", item_id, cost_in_allied_notes } (Length 3)
-- Currency Item: { "Display Name", "currency_key", Currency_Amount, cost_in_allied_notes } (Length 4)
local CAMPAIGN_REWARDS = {
    ["Special"] = { -- TIER 1 REWARDS (Score 18-20 access)
        ["Unity Accolades"] = {
            -- Display, Currency Key, Amount, Cost (Length 4)
            {"100k Accolades", "unity_accolades", 100000, 30000}, -- 20 battles
            {"250k Accolades", "unity_accolades", 250000, 60000}, -- 40 battles
            {"500k Accolades", "unity_accolades", 500000, 100000}, -- 60 battles
        },
        ["Login Campaign Items"] = { -- NEW: Contains standard items (Length 3)
            -- Display, Item ID (placeholder), Cost
            {"Monberaux Cipher", xi.item.CIPHER_OF_MONBERAUXS_ALTER_EGO, special_price}, 
            {"Ullegore Cipher", xi.item.CIPHER_OF_ULLEGORES_ALTER_EGO, special_price},
            {"Wht Rarab Cap +1", xi.item.WHITE_RARAB_CAP_P1, special_price},
            {"Chaac Belt", xi.item.CHAAC_BELT, special_price}, -- added to ENUM
            {"Fotia Gorget", xi.item.FOTIA_GORGET, special_price},
            {"Fotia Belt", xi.item.FOTIA_BELT, special_price},
            {"Gorney Ring", xi.item.GORNEY_RING, special_price},
        },
    },
    ["Mega Boss Rewards"] = {
        ["Avatar Rings"] = {
            {"Garuda Ring",       xi.item.GARUDA_RING,       avatar_ring_nq_price},
            {"Garuda Ring +1",    xi.item.GARUDA_RING_P1,    avatar_ring_hq_price},
            {"Ifrit Ring",        xi.item.IFRIT_RING,        avatar_ring_nq_price},
            {"Ifrit Ring +1",     xi.item.IFRIT_RING_P1,     avatar_ring_hq_price},
            {"Leviathan Ring",    xi.item.LEVIATHAN_RING,    avatar_ring_nq_price},
            {"Leviathan Ring +1", xi.item.LEVIATHAN_RING_P1, avatar_ring_hq_price},
            {"Ramuh Ring",        xi.item.RAMUH_RING,        avatar_ring_nq_price},
            {"Ramuh Ring +1",     xi.item.RAMUH_RING_P1,     avatar_ring_hq_price},
            {"Shiva Ring",        xi.item.SHIVA_RING,        avatar_ring_nq_price},
            {"Shiva Ring +1",     xi.item.SHIVA_RING_P1,     avatar_ring_hq_price},
            {"Titan Ring",        xi.item.TITAN_RING,        avatar_ring_nq_price},
            {"Titan Ring +1",     xi.item.TITAN_RING_P1,     avatar_ring_hq_price},
            {"Carbuncle Ring",    xi.item.CARBUNCLE_RING,    avatar_ring_nq_price},
            {"Carbuncle Ring +1", xi.item.CARBUNCLE_RING_P1, avatar_ring_hq_price},
            {"Fenrir Ring",       xi.item.FENRIR_RING,       avatar_ring_nq_price},
            {"Fenrir Ring +1",    xi.item.FENRIR_RING_P1,    avatar_ring_hq_price},
        },
        ["Empy +1 Mats"] = {
            {"Defiant Sweat", xi.item.VIAL_OF_DEFIANT_SWEAT, 0},
            {"Dark Matter", xi.item.CHUNK_OF_DARK_MATTER, 0},
            {"Macuil Horn", xi.item.MACUIL_HORN, 0},
            {"Tartarian Chain", xi.item.TARTARIAN_CHAIN, 0},
            {"Plovid Effluvium", xi.item.VIAL_OF_PLOVID_EFFLUVIUM, 0},
        },
        ["WoE +1"] = {
            {"Thrift Gloves +1", xi.item.THRIFT_GLOVES_P1, 0},
            {"Belisama's Rope +1", xi.item.BELISAMAS_ROPE_P1, 0},
            {"Ardor Pendant +1", xi.item.ARDOR_PENDANT_P1, 0},
            {"Karagoz Mantle +1", xi.item.KARAGOZ_MANTLE_P1, 0},
            {"Sasuke Tekko +1", xi.item.SASUKE_TEKKO_P1, 0},
            {"Austerity Belt +1", xi.item.AUSTERITY_BELT_P1, 0},
            {"Felicitas Cape +1", xi.item.FELICITAS_CAPE_P1, 0},
            {"Eidolon Pendant +1", xi.item.EIDOLON_PENDANT_P1, 0},
            {"Acerbic Sash +1", xi.item.ACERBIC_SASH_P1, 0},
            {"Aceso's Choker +1", xi.item.ACESOS_CHOKER_P1, 0},
            {"Fugacity Beret +1", xi.item.FUGACITY_BERET_P1, 0},
            {"Rager Ledelsens +1", xi.item.RAGER_LEDELSENS_P1, 0},
            {"Pixie Hairpin +1", xi.item.PIXIE_HAIRPIN_P1, 0},
            {"Vates Cape +1", xi.item.VATES_CAPE_P1, 0},
            {"Sveltesse Gouriz +1", xi.item.SVELTESSE_GOURIZ_P1, 0},
            {"Wukong's Hakama +1", xi.item.WUKONGS_HAKAMA_P1, 0},
            {"Adapa's Slacks +1", xi.item.ADAPAS_SLACKS_P1, 0},
            {"Aenotherus Mantle +1", xi.item.AENOTHERUS_MANTLE_P1, 0},
            {"Forban Cape +1", xi.item.FORBAN_CAPE_P1, 0},
            {"Seraph Mittens +1", xi.item.SERAPH_MITTENS_P1, 0},
            {"Slither Gloves +1", xi.item.SLITHER_GLOVES_P1, 0},
            {"Accord Hat +1", xi.item.ACCORD_HAT_P1, 0},
            {"Fugacity Mantle +1", xi.item.FUGACITY_MANTLE_P1, 0},
            {"Katipo Charm +1", xi.item.KATIPO_CHARM_P1, 0},
            {"Shifting Necklace +1", xi.item.SHIFTING_NECKLACE_P1, 0},
            {"Quartz Tathlum +1", xi.item.QUARTZ_TATHLUM_P1, 0},
            {"Conduit Shoes +1", xi.item.CONDUIT_SHOES_P1, 0},
            {"Leisure Musk +1", xi.item.LEISURE_MUSK_P1, 0},
            {"Medb's Gauntlets +1", xi.item.MEDBS_GAUNTLETS_P1, 0},
            {"Vellaunus' Mantle +1", xi.item.VELLAUNUS_MANTLE_P1, 0},
            {"Lacono Necklace +1", xi.item.LACONO_NECKLACE_P1, 0},
            {"Esper Stone +1", xi.item.ESPER_STONE_P1, 0},
            {"Gigantes Boots +1", xi.item.GIGANTES_BOOTS_P1, 0},
            {"Ombre Tathlum +1", xi.item.OMBRE_TATHLUM_P1, 0},
            {"Moondoe Mantle +1", xi.item.MOONDOE_MANTLE_P1, 0},
            {"Dualism Collar +1", xi.item.DUALISM_COLLAR_P1, 0},
            {"Mirador Trousers +1", xi.item.MIRADOR_TROUSERS_P1, 0},
            {"Oretania's Cape +1", xi.item.ORETANIAS_CAPE_P1, 0},
            {"Waylayer's Scarf +1", xi.item.WAYLAYERS_SCARF_P1, 0},
            {"Coatl Gorget +1", xi.item.COATL_GORGET_P1, 0},
            {"Chersos Helm +1", xi.item.CHERSOS_HELM_P1, 0},
            {"Meanagh Cape +1", xi.item.MEANAGH_CAPE_P1, 0},
            {"Enchntr. Earring +1", xi.item.ENCHNTR_EARRING_P1, 0},
            {"Alruna's Gloves +1", xi.item.ALRUNAS_GLOVES_P1, 0},
            {"Chiner's Belt +1", xi.item.CHINERS_BELT_P1, 0},
            {"Flume Belt +1", xi.item.FLUME_BELT_P1, 0},
            {"Moros Crossbow +1", xi.item.MOROS_CROSSBOW_P1, 0},
            {"Saevus Pendant +1", xi.item.SAEVUS_PENDANT_P1, 0},
            {"Theia's Hairpin +1", xi.item.THEIAS_HAIRPIN_P1, 0},
            {"Weathering Shield +1", xi.item.VISHAP_GREAVES, 0},
            {"Prosilio Belt +1", xi.item.PROSILIO_BELT_P1, 0},
            {"Tempered Cape +1", xi.item.TEMPERED_CAPE_P1, 0},
            {"Arvina Ringlet +1", xi.item.GAVIALIS_HELM, 0},
            {"Windbuffet Belt +1", xi.item.WINDBUFFET_BELT_P1, 0},
            {"Thuellaic Ecu +1", xi.item.CONVOKERS_PIGACHES, 0},
            {"Scopuli Nails +1", xi.item.SCOPULI_NAILS_P1, 0},
            {"Hasty Pinion +1", xi.item.HASTY_PINION_P1, 0},
            {"Dilettante's Grip +1", xi.item.DILETTANTES_GRIP_P1, 0},
            {"Smilodon Mask +1", xi.item.SMILODON_MASK_P1, 0},
            {"Gallian Helm +1", xi.item.GALLIAN_HELM_P1, 0},
            {"Hidalgo Slops +1", xi.item.HIDALGO_SLOPS_P1, 0},
            {"Lunette Ring +1", xi.item.HEARTSEEKER_EARRING, 0},
            {"Engulfer Cape +1", xi.item.ENGULFER_CAPE_P1, 0},
            {"Nefarious Collar +1", xi.item.NEFARIOUS_COLLAR_P1, 0},
            {"Elder's Grip +1", xi.item.ELDERS_GRIP_P1, 0},
            {"Nomkahpa Mittens +1", xi.item.NOMKAHPA_MITTENS_P1, 0},
        },
    },
    ["Lockstyle"] = { -- CORE REWARDS (Score 5-20 access with price modifiers)
["Ebon"] = { -- Black Armor
            -- HEAD
            {"Ebon Armet", xi.item.EBON_ARMET, lockstyle_price},
            {"Ebon Beret", xi.item.EBON_BERET, lockstyle_price},
            {"Ebon Caubeen", xi.item.EBON_CAUBEEN, lockstyle_price},
            {"Ebon Hat", xi.item.EBON_HAT, lockstyle_price},
            {"Ebon Mask", xi.item.EBON_MASK, lockstyle_price},
            {"Ebon Tam", xi.item.EBON_TAM, lockstyle_price},
            {"Ebon Visor", xi.item.EBON_VISOR, lockstyle_price},
            -- BODY
            {"Ebon Bliaut", xi.item.EBON_BLIAUT, lockstyle_price},
            {"Ebon Breastplate", xi.item.EBON_BREASTPLATE, lockstyle_price},
            {"Ebon Coat", xi.item.EBON_COAT, lockstyle_price},
            {"Ebon Frock", xi.item.EBON_FROCK, lockstyle_price},
            {"Ebon Harness", xi.item.EBON_HARNESS, lockstyle_price},
            {"Ebon Jerkin", xi.item.EBON_JERKIN, lockstyle_price},
            {"Ebon Talar", xi.item.EBON_TALAR, lockstyle_price},
            -- HANDS
            {"Ebon Bracers", xi.item.EBON_BRACERS, lockstyle_price},
            {"Ebon Cuffs", xi.item.EBON_CUFFS, lockstyle_price},
            {"Ebon Gages", xi.item.EBON_GAGES, lockstyle_price},
            {"Ebon Gants", xi.item.EBON_GANTS, lockstyle_price},
            {"Ebon Gauntlets", xi.item.EBON_GAUNTLETS, lockstyle_price},
            {"Ebon Gloves", xi.item.EBON_GLOVES, lockstyle_price},
            {"Ebon Mitts", xi.item.EBON_MITTS, lockstyle_price},
            -- LEGS
            {"Ebon Braccae", xi.item.EBON_BRACCAE, lockstyle_price},
            {"Ebon Brais", xi.item.EBON_BRAIS, lockstyle_price},
            {"Ebon Hose", xi.item.EBON_HOSE, lockstyle_price},
            {"Ebon Pants", xi.item.EBON_PANTS, lockstyle_price},
            {"Ebon Slacks", xi.item.EBON_SLACKS, lockstyle_price},
            {"Ebon Slops", xi.item.EBON_SLOPS, lockstyle_price},
            {"Ebon Spats", xi.item.EBON_SPATS, lockstyle_price},
            -- FEET
            {"Ebon Boots", xi.item.EBON_BOOTS, lockstyle_price},
            {"Ebon Brogues", xi.item.EBON_BROGUES, lockstyle_price},
            {"Ebon Clogs", xi.item.EBON_CLOGS, lockstyle_price},
            {"Ebon Galoshes", xi.item.EBON_GALOSHES, lockstyle_price},
            {"Ebon Leggings", xi.item.EBON_LEGGINGS, lockstyle_price},
            {"Ebon Sabots", xi.item.EBON_SABOTS, lockstyle_price},
            {"Ebon Socks", xi.item.EBON_SOCKS, lockstyle_price},
        },

        ["Ebur"] = { -- White Armor
            -- HEAD
            {"Ebur Armet", xi.item.EBUR_ARMET, lockstyle_price},
            {"Ebur Beret", xi.item.EBUR_BERET, lockstyle_price},
            {"Ebur Caubeen", xi.item.EBUR_CAUBEEN, lockstyle_price},
            {"Ebur Hat", xi.item.EBUR_HAT, lockstyle_price},
            {"Ebur Mask", xi.item.EBUR_MASK, lockstyle_price},
            {"Ebur Tam", xi.item.EBUR_TAM, lockstyle_price},
            {"Ebur Visor", xi.item.EBUR_VISOR, lockstyle_price},
            -- BODY
            {"Ebur Bliaut", xi.item.EBUR_BLIAUT, lockstyle_price},
            {"Ebur Breastplate", xi.item.EBUR_BREASTPLATE, lockstyle_price},
            {"Ebur Coat", xi.item.EBUR_COAT, lockstyle_price},
            {"Ebur Frock", xi.item.EBUR_FROCK, lockstyle_price},
            {"Ebur Harness", xi.item.EBUR_HARNESS, lockstyle_price},
            {"Ebur Jerkin", xi.item.EBUR_JERKIN, lockstyle_price},
            {"Ebur Talar", xi.item.EBUR_TALAR, lockstyle_price},
            -- HANDS
            {"Ebur Bracers", xi.item.EBUR_BRACERS, lockstyle_price},
            {"Ebur Cuffs", xi.item.EBUR_CUFFS, lockstyle_price},
            {"Ebur Gages", xi.item.EBUR_GAGES, lockstyle_price},
            {"Ebur Gants", xi.item.EBUR_GANTS, lockstyle_price},
            {"Ebur Gauntlets", xi.item.EBUR_GAUNTLETS, lockstyle_price},
            {"Ebur Gloves", xi.item.EBUR_GLOVES, lockstyle_price},
            {"Ebur Mitts", xi.item.EBUR_MITTS, lockstyle_price},
            -- LEGS
            {"Ebur Braccae", xi.item.EBUR_BRACCAE, lockstyle_price},
            {"Ebur Brais", xi.item.EBUR_BRAIS, lockstyle_price},
            {"Ebur Hose", xi.item.EBUR_HOSE, lockstyle_price},
            {"Ebur Pants", xi.item.EBUR_PANTS, lockstyle_price},
            {"Ebur Slacks", xi.item.EBUR_SLACKS, lockstyle_price},
            {"Ebur Slops", xi.item.EBUR_SLOPS, lockstyle_price},
            {"Ebur Spats", xi.item.EBUR_SPATS, lockstyle_price},
            -- FEET
            {"Ebur Boots", xi.item.EBUR_BOOTS, lockstyle_price},
            {"Ebur Brogues", xi.item.EBUR_BROGUES, lockstyle_price},
            {"Ebur Clogs", xi.item.EBUR_CLOGS, lockstyle_price},
            {"Ebur Galoshes", xi.item.EBUR_GALOSHES, lockstyle_price},
            {"Ebur Leggings", xi.item.EBUR_LEGGINGS, lockstyle_price},
            {"Ebur Sabots", xi.item.EBUR_SABOTS, lockstyle_price},
            {"Ebur Socks", xi.item.EBUR_SOCKS, lockstyle_price},
        },

        ["Furia"] = { -- Red Armor
            -- HEAD
            {"Furia Armet", xi.item.FURIA_ARMET, lockstyle_price},
            {"Furia Beret", xi.item.FURIA_BERET, lockstyle_price},
            {"Furia Caubeen", xi.item.FURIA_CAUBEEN, lockstyle_price},
            {"Furia Hat", xi.item.FURIA_HAT, lockstyle_price},
            {"Furia Mask", xi.item.FURIA_MASK, lockstyle_price},
            {"Furia Tam", xi.item.FURIA_TAM, lockstyle_price},
            {"Furia Visor", xi.item.FURIA_VISOR, lockstyle_price},
            -- BODY
            {"Furia Bliaut", xi.item.FURIA_BLIAUT, lockstyle_price},
            {"Furia Breastplate", xi.item.FURIA_BREASTPLATE, lockstyle_price},
            {"Furia Coat", xi.item.FURIA_COAT, lockstyle_price},
            {"Furia Frock", xi.item.FURIA_FROCK, lockstyle_price},
            {"Furia Harness", xi.item.FURIA_HARNESS, lockstyle_price},
            {"Furia Jerkin", xi.item.FURIA_JERKIN, lockstyle_price},
            {"Furia Talar", xi.item.FURIA_TALAR, lockstyle_price},
            -- HANDS
            {"Furia Bracers", xi.item.FURIA_BRACERS, lockstyle_price},
            {"Furia Cuffs", xi.item.FURIA_CUFFS, lockstyle_price},
            {"Furia Gages", xi.item.FURIA_GAGES, lockstyle_price},
            {"Furia Gants", xi.item.FURIA_GANTS, lockstyle_price},
            {"Furia Gauntlets", xi.item.FURIA_GAUNTLETS, lockstyle_price},
            {"Furia Gloves", xi.item.FURIA_GLOVES, lockstyle_price},
            {"Furia Mitts", xi.item.FURIA_MITTS, lockstyle_price},
            -- LEGS
            {"Furia Braccae", xi.item.FURIA_BRACCAE, lockstyle_price},
            {"Furia Brais", xi.item.FURIA_BRAIS, lockstyle_price},
            {"Furia Hose", xi.item.FURIA_HOSE, lockstyle_price},
            {"Furia Pants", xi.item.FURIA_PANTS, lockstyle_price},
            {"Furia Slacks", xi.item.FURIA_SLACKS, lockstyle_price},
            {"Furia Slops", xi.item.FURIA_SLOPS, lockstyle_price},
            {"Furia Spats", xi.item.FURIA_SPATS, lockstyle_price},
            -- FEET
            {"Furia Boots", xi.item.FURIA_BOOTS, lockstyle_price},
            {"Furia Brogues", xi.item.FURIA_BROGUES, lockstyle_price},
            {"Furia Clogs", xi.item.FURIA_CLOGS, lockstyle_price},
            {"Furia Galoshes", xi.item.FURIA_GALOSHES, lockstyle_price},
            {"Furia Leggings", xi.item.FURIA_LEGGINGS, lockstyle_price},
            {"Furia Sabots", xi.item.FURIA_SABOTS, lockstyle_price},
            {"Furia Socks", xi.item.FURIA_SOCKS, lockstyle_price},
        },

        ["Shikkoku"] = { -- Black Samurai Gear
            {"Shikkoku Hatsuburi", xi.item.SHIKKOKU_HATSUBURI, lockstyle_price},
            {"Shikkoku Togi", xi.item.SHIKKOKU_TOGI, lockstyle_price},
            {"Shikkoku Kote", xi.item.SHIKKOKU_KOTE, lockstyle_price},
            {"Shikkoku Haidate", xi.item.SHIKKOKU_HAIDATE, lockstyle_price},
            {"Shikkoku Sune-Ate", xi.item.SHIKKOKU_SUNE_ATE, lockstyle_price},
        },

        ["Shinku"] = { -- Red Samurai Gear
            {"Shinku Hatsuburi", xi.item.SHINKU_HATSUBURI, lockstyle_price},
            {"Shinku Togi", xi.item.SHINKU_TOGI, lockstyle_price},
            {"Shinku Kote", xi.item.SHINKU_KOTE, lockstyle_price},
            {"Shinku Haidate", xi.item.SHINKU_HAIDATE, lockstyle_price},
            {"Shinku Sune-Ate", xi.item.SHINKU_SUNE_ATE, lockstyle_price},
        },

        ["Ginhaku"] = { -- White Samurai Gear
            {"Ginhaku Hatsuburi", xi.item.GINHAKU_HATSUBURI, lockstyle_price},
            {"Ginhaku Togi", xi.item.GINHAKU_TOGI, lockstyle_price},
            {"Ginhaku Kote", xi.item.GINHAKU_KOTE, lockstyle_price},
            {"Ginhaku Haidate", xi.item.GINHAKU_HAIDATE, lockstyle_price},
            {"Ginhaku Sune-Ate", xi.item.GINHAKU_SUNE_ATE, lockstyle_price},
        },

        ["Cuauhtli"] = { -- DRK/DRG Exclusive
            {"Cuauhtli Headpiece", xi.item.CUAUHTLI_HEADPIECE, lockstyle_price},
            {"Cuauhtli Harness", xi.item.CUAUHTLI_HARNESS, lockstyle_price},
        },

        ["Ocelomeh"] = { -- RNG/COR Exclusive
            {"Ocelomeh Headpiece", xi.item.OCELOMEH_HEADPIECE, lockstyle_price},
            {"Ocelomeh Harness", xi.item.OCELOMEH_HARNESS, lockstyle_price},
        },

        ["Mekira"] = { -- NIN Exclusive
            {"Mekira Toshugai", xi.item.MEKIRA_TOSHUGAI, lockstyle_price},
            {"Mekira Oto", xi.item.MEKIRA_OTO, lockstyle_price},
        },
    },
    ["Aby. Currency"] = { -- CORE REWARDS (Score 5-20 access with price modifiers)
        ["Ardor"] = { -- Second-level set name
            -- Display, Item ID, Cost
            {"Stone", xi.item.STONE_OF_ARDOR, abymoney_price},
            {"Coin", xi.item.COIN_OF_ARDOR, abymoney_price},
            {"Jewel", xi.item.JEWEL_OF_ARDOR, abymoney_price},
            {"Card", xi.item.CARD_OF_ARDOR, abymoney_price},
        },
        ["Balance"] = {
            {"Stone", xi.item.STONE_OF_BALANCE, abymoney_price},
            {"Coin", xi.item.COIN_OF_BALANCE, abymoney_price},
            {"Jewel", xi.item.JEWEL_OF_BALANCE, abymoney_price},
            {"Card", xi.item.CARD_OF_BALANCE, abymoney_price},
        },
        ["Vision"] = {
            {"Stone", xi.item.STONE_OF_VISION, abymoney_price},
            {"Coin", xi.item.COIN_OF_VISION, abymoney_price},
            {"Jewel", xi.item.JEWEL_OF_VISION, abymoney_price},
            {"Card", xi.item.CARD_OF_VISION, abymoney_price},
        },
        ["Voyage"] = {
            {"Stone", xi.item.STONE_OF_VOYAGE, abymoney_price},
            {"Coin", xi.item.COIN_OF_VOYAGE, abymoney_price},
            {"Jewel", xi.item.JEWEL_OF_VOYAGE, abymoney_price},
            {"Card", xi.item.CARD_OF_VOYAGE, abymoney_price},
        },
        ["Wieldance"] = {
            {"Stone", xi.item.STONE_OF_WIELDANCE, abymoney_price},
            {"Coin", xi.item.COIN_OF_WIELDANCE, abymoney_price},
            {"Jewel", xi.item.JEWEL_OF_WIELDANCE, abymoney_price},
            {"Card", xi.item.CARD_OF_WIELDANCE, abymoney_price},
        },
    },
    ["Aby. Seals"] = { -- CORE REWARDS (Score 5-20 access with price modifiers)
        ["Ravager's Seal"] = { -- Second-level set name
            -- Display, Item ID, Cost
            {"Head", xi.item.RAVAGERS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.RAVAGERS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.RAVAGERS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.RAVAGERS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.RAVAGERS_SEAL_FEET, abyseals_price},
        },
        ["Tantra Seal"] = {
            {"Head", xi.item.TANTRA_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.TANTRA_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.TANTRA_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.TANTRA_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.TANTRA_SEAL_FEET, abyseals_price},
        },
        ["Orison Seal"] = {
            {"Head", xi.item.ORISON_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.ORISON_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.ORISON_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.ORISON_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.ORISON_SEAL_FEET, abyseals_price},
        },
        ["Goetia Seal"] = {
            {"Head", xi.item.GOETIA_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.GOETIA_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.GOETIA_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.GOETIA_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.GOETIA_SEAL_FEET, abyseals_price},
        },
        ["Estoqueur's Seal"] = {
            {"Head", xi.item.ESTOQUEURS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.ESTOQUEURS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.ESTOQUEURS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.ESTOQUEURS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.ESTOQUEURS_SEAL_FEET, abyseals_price},
        },
        ["Raider's Seal"] = {
            {"Head", xi.item.RAIDERS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.RAIDERS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.RAIDERS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.RAIDERS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.RAIDERS_SEAL_FEET, abyseals_price},
        },
        ["Creed Seal"] = {
            {"Head", xi.item.CREED_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.CREED_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.CREED_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.CREED_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.CREED_SEAL_FEET, abyseals_price},
        },
        ["Bale Seal"] = {
            {"Head", xi.item.BALE_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.BALE_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.BALE_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.BALE_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.BALE_SEAL_FEET, abyseals_price},
        },
        ["Ferine Seal"] = {
            {"Head", xi.item.FERINE_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.FERINE_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.FERINE_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.FERINE_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.FERINE_SEAL_FEET, abyseals_price},
        },
        ["Aoidos' Seal"] = {
            {"Head", xi.item.AOIDOS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.AOIDOS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.AOIDOS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.AOIDOS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.AOIDOS_SEAL_FEET, abyseals_price},
        },
        ["Sylvan Seal"] = {
            {"Head", xi.item.SYLVAN_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.SYLVAN_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.SYLVAN_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.SYLVAN_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.SYLVAN_SEAL_FEET, abyseals_price},
        },
        ["Unkai Seal"] = {
            {"Head", xi.item.UNKAI_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.UNKAI_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.UNKAI_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.UNKAI_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.UNKAI_SEAL_FEET, abyseals_price},
        },
        ["Iga Seal"] = {
            {"Head", xi.item.IGA_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.IGA_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.IGA_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.IGA_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.IGA_SEAL_FEET, abyseals_price},
        },
        ["Lancer's Seal"] = {
            {"Head", xi.item.LANCERS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.LANCERS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.LANCERS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.LANCERS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.LANCERS_SEAL_FEET, abyseals_price},
        },
        ["Caller's Seal"] = {
            {"Head", xi.item.CALLERS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.CALLERS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.CALLERS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.CALLERS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.CALLERS_SEAL_FEET, abyseals_price},
        },
        ["Mavi Seal"] = {
            {"Head", xi.item.MAVI_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.MAVI_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.MAVI_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.MAVI_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.MAVI_SEAL_FEET, abyseals_price},
        },
        ["Navarch's Seal"] = {
            {"Head", xi.item.NAVARCHS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.NAVARCHS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.NAVARCHS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.NAVARCHS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.NAVARCHS_SEAL_FEET, abyseals_price},
        },
        ["Cirque Seal"] = {
            {"Head", xi.item.CIRQUE_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.CIRQUE_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.CIRQUE_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.CIRQUE_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.CIRQUE_SEAL_FEET, abyseals_price},
        },
        ["Charis Seal"] = {
            {"Head", xi.item.CHARIS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.CHARIS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.CHARIS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.CHARIS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.CHARIS_SEAL_FEET, abyseals_price},
        },
        ["Savant's Seal"] = {
            {"Head", xi.item.SAVANTS_SEAL_HEAD, abyseals_price},
            {"Body", xi.item.SAVANTS_SEAL_BODY, abyseals_price},
            {"Hands", xi.item.SAVANTS_SEAL_HANDS, abyseals_price},
            {"Legs", xi.item.SAVANTS_SEAL_LEGS, abyseals_price},
            {"Feet", xi.item.SAVANTS_SEAL_FEET, abyseals_price},
        },
    },
    ["Job Ingr."] = { -- CORE REWARDS (Score 5-20 access with price modifiers)
        ["Page 1"] = { -- Second-level set name
            -- Display, Item ID, Cost
            {"Helm of Briareus", xi.item.HELM_OF_BRIAREUS, abyingr_price},
            {"Itzpapalotl's Scale", xi.item.ITZPAPALOTLS_SCALE, abyingr_price},
            {"Orthrus's Claw", xi.item.ORTHRUSS_CLAW, abyingr_price},
        },
        ["Page 2"] = {
            {"Glavoid Shell", xi.item.GLAVOID_SHELL, abyingr_price},
            {"Cirein-croin's Lantern", xi.item.CIREIN_CROINS_LANTERN, abyingr_price},
            {"Alfard's Fang", xi.item.ALFARDS_FANG, abyingr_price},
        },
        ["Page 3"] = {
            {"Kukulkan's Fang", xi.item.KUKULKANS_FANG, abyingr_price},
            {"Carabosse's Gem", xi.item.CARABOSSES_GEM, abyingr_price},
            {"Dragua's Scale", xi.item.DRAGUAS_SCALE, abyingr_price},
        },
        ["Page 4"] = {
            {"Ulhuadshi's Fang", xi.item.ULHUADSHIS_FANG, abyingr_price},
            {"Apademak's Horn", xi.item.APADEMAKS_HORN, abyingr_price},
            {"Bukhis's Wing", xi.item.BUKHISS_WING, abyingr_price},
        },
        ["Page 5"] = {
            {"Azdaja's Horn", xi.item.AZDAJAS_HORN, abyingr_price},
            {"Isgebind's Heart", xi.item.ISGEBINDS_HEART, abyingr_price},
            {"Sobek's Skin", xi.item.SOBEKS_SKIN, abyingr_price},
        },
        ["Page 6"] = {
            {"Two-leaf Chloris Bud", xi.item.TWO_LEAF_CHLORIS_BUD, abyingr_price},
            {"Sedna's Tusk", xi.item.SEDNAS_TUSK, abyingr_price},
        },
    },
}

-- Setting ITEMS_PER_PAGE to 3 for both Level 3 (Items) and Level 2 (Sets) pagination.
local ITEMS_PER_PAGE = 3 
local CURRENCY_NAME = "allied_notes" 
local TEXT_CURRENCY_NAME = "AN" -- This remains mixed case for display only.

-- Localized Player-Facing Text.
local MESSAGES = {
    greeting = "Welcome! I am the Campaign Spoils shop!",
    
    -- Main Menu
    menuTitle = "What would you like to do?",
    menuOptionRedeem = "Redeem Allied Notes",
    menuOptionNo = "No, thank you.",
    
    -- Rewards Messages
    rewardsTitle = "Category (%d %s)", -- UPDATED: Removed score from title format
    noFunds = "You need %d %s to purchase the %s, but you only possess %d.",
    inventoryFull = "Make room before attempting to purchase %s. Your %s were not deducted.",
    -- UPDATED: Removed placeholder for item name (%s) to make output generic
    purchaseSuccess = "Here you go! You exchanged %d %s for the reward.", 
    alreadyHaveItem = "You already possess that item.",
    notEnoughKills = "You do not have enough commander kills for this. You need %d, but you only have %d.",
    notEligibleKills = "You must have at least 15 Stronghold Commander kills to purchase this item.",
    navNext = "Next",
    navPrev = "Prev",
    navBack = "Back",
    
    -- New Score Messages
    scoreTooLow = "Your current Campaign Tide Score (%d) is too low (requires 5) to redeem any rewards at this time.",
    scoreRefusal = "The tides have changed and I have no rewards to give", -- New refusal message
    discountText = "(-%d%% Discount)",
    surchargeText = "(+%d%% Surcharge)",
}

--- Helper function to retrieve the current Campaign Tide Score.
---@param player Player
function getCampaignTideScore(player)
    -- This assumes your custom server variable is stored under 'CampaignTideScore'.
    -- If your server uses a different method to store/retrieve this value, update this function.
    -- NOTE: Switched to global GetServerVariable based on environment requirements.
    local score = GetServerVariable('CampaignTideScore') or 50 -- Default to 50 if variable not set
    return tonumber(score) or 50
end

--- Calculates the modified cost based on CampaignTideScore.
--- Returns { cost, modifierText, modifier }
---@param player Player
---@param baseCost number
function getModifiedCost(player, baseCost)
    local score = getCampaignTideScore(player)
    local modifier = 0 -- Percentage modifier (e.g., -0.10 for 10% discount, 0.05 for 5% surcharge)
    local modifierText = ""

    -- Discount Tier: Score > NEUTRAL_SCORE.
    if score > TIDE_SCORE_CONFIG.NEUTRAL_SCORE then
        local discountPercent = (score - TIDE_SCORE_CONFIG.NEUTRAL_SCORE) * TIDE_SCORE_CONFIG.DISCOUNT_PER_POINT
        discountPercent = math.min(discountPercent, TIDE_SCORE_CONFIG.MAX_DISCOUNT_PERCENT) -- Cap discount
        modifier = -discountPercent / 100
        modifierText = string.format(MESSAGES.discountText, discountPercent)
    -- Surcharge Tier: Score < NEUTRAL_SCORE.
    elseif score < TIDE_SCORE_CONFIG.NEUTRAL_SCORE then
        local surchargePercent = (TIDE_SCORE_CONFIG.NEUTRAL_SCORE - score) * TIDE_SCORE_CONFIG.SURCHARGE_PER_POINT
        surchargePercent = math.min(surchargePercent, TIDE_SCORE_CONFIG.MAX_SURCHARGE_PERCENT) -- Cap surcharge
        modifier = surchargePercent / 100
        modifierText = string.format(MESSAGES.surchargeText, surchargePercent)
    -- Neutral Tier: Score is exactly NEUTRAL_SCORE.
    else
        modifierText = "" -- No modifier text for neutral
    end

    local finalCost = math.floor(baseCost * (1 + modifier))
    return finalCost, modifierText, modifier
end

-- A global function for delayed menu sending.
local function delaySendMenu(player)
    player:timer(50, function(playerArg)
        -- NOTE: Using a generic 'menu' table for a clean one-page prompt.
        playerArg:customMenu(menu) 
    end)
end

--- Displays a quantity selection menu for bulk purchases.
---@param player Player
---@param npc NPC
---@param itemData table The specific reward item data
---@param baseCost number The base cost of a single item
---@param fullName string The full name of the item for logging
---@param categoryName string The category name for menu navigation
---@param setName string The set name for menu navigation
---@param page number The page number to return to
function showQuantitySelectionMenu(player, npc, itemData, baseCost, fullName, categoryName, setName, page)
    local pieceName = itemData[1]
    local quantities = {1, 10, 25}
    
    local quantityMenu = {}
    quantityMenu.title = string.format("Buy %s?", pieceName)
    quantityMenu.options = {}

    for _, quantity in ipairs(quantities) do
        -- Calculate total cost for this quantity for display
        local singleModifiedCost, _, _ = getModifiedCost(player, baseCost)
        local totalModifiedCost = singleModifiedCost * quantity

        local optionText = string.format("x%d (%d %s)", quantity, totalModifiedCost, TEXT_CURRENCY_NAME)
        
        table.insert(quantityMenu.options, {
            optionText,
            function(p)
                -- Call handleRewardPurchase with the selected quantity
                handleRewardPurchase(p, npc, itemData, baseCost, fullName, categoryName, setName, page, quantity)
            end
        })
    end

    -- Add a back button
    table.insert(quantityMenu.options, {
        MESSAGES.navBack,
        function(playerArg)
            playerArg:timer(50, function(p)
                showItemSelectionMenu(p, npc, categoryName, setName, page)
            end)
        end
    })

    -- Use a timer to prevent menu conflicts
    player:timer(50, function(p)
        p:customMenu(quantityMenu)
    end)
end

--- Displays the paginated items within a selected set (Level 3).
---@param player Player
---@param npc NPC
---@param categoryName string The top-level category name (e.g., "Lockstyle Gear")
---@param setName string The name of the set being viewed (e.g., "Shikkoku Set")
---@param page number The page number to display (1-indexed).
function showItemSelectionMenu(player, npc, categoryName, setName, page)
    local rewardsList = CAMPAIGN_REWARDS[categoryName] and CAMPAIGN_REWARDS[categoryName][setName]
    if not rewardsList then
        m:logDebug("Error: Set name '%s' not found in category '%s'.", setName, categoryName)
        return
    end

    m:logDebug("%s: Opening item rewards menu for %s/%s (Page %d requested).", player:getName(), categoryName, setName, page)
    
    local totalItems = #rewardsList
    local totalPages = math.ceil(totalItems / ITEMS_PER_PAGE)
    local currentPage = math.max(1, math.min(page, totalPages))
    
    local startIndex = ((currentPage - 1) * ITEMS_PER_PAGE) + 1
    local endIndex = math.min(currentPage * ITEMS_PER_PAGE, totalItems)

    local currentNotes = player:getCurrency(CURRENCY_NAME) or 0
    
    local rewardsMenu = {}
    -- Level 3 Title: Simplified to "Redeem Items"
    rewardsMenu.title = "Redeem Items"
    rewardsMenu.options = {}

    -- 1. Add reward options for the current page
    for i = startIndex, endIndex do
        local itemData = rewardsList[i]
        
        local pieceName, baseCost
        
        -- Determine the base cost based on the structure length (3 for item, 4 for currency)
        if categoryName == "Special" and #itemData == 4 then
            pieceName = itemData[1]
            baseCost = itemData[4] -- Cost is the 4th element for currency rewards
        else
            pieceName = itemData[1]
            baseCost = itemData[3] -- Cost is the 3rd element for standard items
        end
        
        -- Calculate dynamic cost
        local modifiedCost, _, _ = getModifiedCost(player, baseCost)

        -- The full name used for logging and success message (kept for logging)
        local fullName = categoryName .. " " .. setName .. " " .. pieceName 
        
        -- Display only the piece name and the final cost
        local optionText
        if setName == "Empy +1 Mats" or setName == "WoE +1" or setName == "Avatar Rings" then
            optionText = pieceName
        else
            optionText = string.format("%s (%d %s)", pieceName, modifiedCost, TEXT_CURRENCY_NAME)
        end

        table.insert(rewardsMenu.options, {
            optionText,
            function(playerArg)
                -- If the category is one of the bulk-buy types, show the quantity menu.
                if categoryName == "Aby. Currency" or categoryName == "Aby. Seals" or categoryName == "Job Ingr." then
                    m:logDebug("%s selected bulk-buy item: %s. Opening quantity menu.", playerArg:getName(), fullName)
                    showQuantitySelectionMenu(playerArg, npc, itemData, baseCost, fullName, categoryName, setName, currentPage)
                else
                    -- Otherwise, show the standard confirmation menu for a single item.
                    m:logDebug("%s selected item: %s (Cost: %d). Opening confirmation menu.", playerArg:getName(), fullName, modifiedCost)
                    
                    local confirmMenu = {}
                    confirmMenu.title = "Are you sure?"
                    confirmMenu.options = {
                        { "Yes, Buy It!", function(p) 
                            -- For single purchases, quantity is always 1.
                            handleRewardPurchase(p, npc, itemData, baseCost, fullName, categoryName, setName, currentPage, 1) 
                        end },
                        { "No, Go Back.", function(p) 
                            p:timer(50, function(p_inner) showItemSelectionMenu(p_inner, npc, categoryName, setName, currentPage) end)
                        end },
                    }
                    playerArg:timer(50, function(p)
                        p:customMenu(confirmMenu)
                    end)
                end
            end
        })
    end

    -- 2. Add navigation options
    
    -- Previous Page
    if currentPage > 1 then
        table.insert(rewardsMenu.options, {
            MESSAGES.navPrev,
            function(playerArg)
                playerArg:timer(50, function(p)
                    showItemSelectionMenu(p, npc, categoryName, setName, currentPage - 1)
                end)
            end
        })
    end
    
    -- Next Page
    if currentPage < totalPages then
        table.insert(rewardsMenu.options, {
            MESSAGES.navNext,
            function(playerArg)
                playerArg:timer(50, function(p)
                    showItemSelectionMenu(p, npc, categoryName, setName, currentPage + 1)
                end)
            end
        })
    end

    -- Back to Set Selection Menu (Always last option)
    table.insert(rewardsMenu.options, {
        MESSAGES.navBack,
        function(playerArg)
            m:logDebug("%s selected 'Back'. Returning to set selection menu for category %s.", playerArg:getName(), categoryName)
            playerArg:timer(50, function(p)
                showSetSelectionMenu(p, npc, categoryName, 1) -- Back to first page of sets
            end)
        end
    })

    player:customMenu(rewardsMenu)
end

--- Displays the rewards menu showing item sets within a category (Level 2).
---@param player Player
---@param npc NPC
---@param categoryName string The top-level category name (e.g., "Lockstyle Gear")
---@param page number The page number to display (1-indexed). -- ADDED PAGE FOR PAGINATION
function showSetSelectionMenu(player, npc, categoryName, page)
    local setsList = CAMPAIGN_REWARDS[categoryName]
    if not setsList then
        m:logDebug("Error: Category name '%s' not found.", categoryName)
        return
    end

    -- 1. Get all set names and filter them
    local sortedSetNames = {}
    for setName, _ in pairs(setsList) do
        table.insert(sortedSetNames, setName)
    end
    
    -- Custom sorting logic based on category
    if categoryName == "Job Ingr." then
        -- Ensures Page 1, Page 2, etc., are in numerical order
        table.sort(sortedSetNames, function(a, b)
            -- Extract page number from string "Page X"
            local numA = tonumber(a:match("Page (%d+)")) or 0
            local numB = tonumber(b:match("Page (%d+)")) or 0
            -- Sort ascending
            return numA < numB
        end)
    elseif categoryName == "Aby. Currency" then
        -- Ensures alphabetical order for Aby. Currency (NEW REQUIREMENT)
        table.sort(sortedSetNames)
    else
        -- Alphabetical sort for all other categories to ensure consistent order
        table.sort(sortedSetNames)
    end

    -- 2. Pagination Logic (REQUEST 1 IMPLEMENTATION)
    local totalSets = #sortedSetNames
    local totalPages = math.ceil(totalSets / ITEMS_PER_PAGE)
    local currentPage = math.max(1, math.min(page, totalPages))
    
    local startIndex = ((currentPage - 1) * ITEMS_PER_PAGE) + 1
    local endIndex = math.min(currentPage * ITEMS_PER_PAGE, totalSets)
    
    -- 3. Build Menu
    local notesBalance = player:getCurrency(CURRENCY_NAME) or 0
    
    local setMenu = {}
    -- Level 2 Title: Include page information
    setMenu.title = string.format("Reward Category (Page %d/%d)", currentPage, totalPages) 
    setMenu.options = {}

    -- Loop through the sets for the current page
    for i = startIndex, endIndex do
        local setName = sortedSetNames[i]
        local displayName = setName

        if setName == "Avatar Rings" then
            displayName = setName .. " (2/5 Kills)"
        elseif setName == "Empy +1 Mats" then
            displayName = setName .. " (10 Kills)"
        elseif setName == "WoE +1" then
            displayName = setName .. " (30 Kills)"
        end
        
        table.insert(setMenu.options, {
            displayName,
            function(playerArg)
                m:logDebug("%s selected set: %s. Moving to item selection.", playerArg:getName(), setName)
                playerArg:timer(50, function(p)
                    -- Start on page 1 of the selected set's items
                    showItemSelectionMenu(p, npc, categoryName, setName, 1) 
                end)
            end
        })
    end
    
    -- 4. Add Navigation Options
    
    -- Previous Page
    if currentPage > 1 then
        table.insert(setMenu.options, {
            MESSAGES.navPrev,
            function(playerArg)
                playerArg:timer(50, function(p)
                    showSetSelectionMenu(p, npc, categoryName, currentPage - 1) -- Pass updated page
                end)
            end
        })
    end
    
    -- Next Page
    if currentPage < totalPages then
        table.insert(setMenu.options, {
            MESSAGES.navNext,
            function(playerArg)
                playerArg:timer(50, function(p)
                    showSetSelectionMenu(p, npc, categoryName, currentPage + 1) -- Pass updated page
                end)
            end
        })
    end
    
    -- Add Back to Category Menu (Always last option)
    table.insert(setMenu.options, {
        MESSAGES.navBack,
        function(playerArg)
            m:logDebug("%s selected 'Back' from Set Selection. Returning to category menu.", playerArg:getName())
            playerArg:timer(50, function(p)
                showCategorySelectionMenu(p, npc)
            end)
        end
    })

    player:customMenu(setMenu)
end

--- Displays the top-level rewards menu showing item categories (e.g., Lockstyle Gear) (Level 1).
---@param player Player
---@param npc NPC
function showCategorySelectionMenu(player, npc)
    local score = getCampaignTideScore(player)
    
    -- TIERED ACCESS CHECK: SCORE UNDER 5
    if score < 5 then
        -- Print the specific refusal message before returning to the main menu.
        player:printToPlayer(MESSAGES.scoreRefusal, 0, npc:getPacketName()) 
        -- Return to main menu. We must re-trigger the main menu logic to rebuild it correctly.
        player:timer(1500, function(p)
            -- This is a simplified version of the onTrigger logic to rebuild the main menu.
            local currentNotes = p:getCurrency(CURRENCY_NAME) or 0
            menu.title = MESSAGES.menuTitle
            menu.options[1][1] = MESSAGES.menuOptionRedeem .. string.format(" (%d %s)", currentNotes, TEXT_CURRENCY_NAME)
            -- Now show the correctly populated menu.
            p:customMenu(menu)
        end)
        return
    end

    local notesBalance = player:getCurrency(CURRENCY_NAME) or 0
    
    local categoryMenu = {}
    -- Level 1 Title: Remains detailed to show currency balance
    categoryMenu.title = string.format(MESSAGES.rewardsTitle, notesBalance, TEXT_CURRENCY_NAME)
    categoryMenu.options = {}

    -- Define the desired order of categories to ensure "Special" is first and all others are included
    local CATEGORY_ORDER = {"Special", "Mega Boss Rewards", "Lockstyle", "Aby. Currency", "Aby. Seals", "Job Ingr."} 

    -- Loop through categories in the defined order
    for _, categoryName in ipairs(CATEGORY_ORDER) do
        -- Check if the category exists in the rewards table
        local sets = CAMPAIGN_REWARDS[categoryName] 
        if sets then
            local includeCategory = true
            
            -- TIERED ACCESS CHECK: Special Rewards requires score >= 75
            if categoryName == "Special" and score < 75 then
                includeCategory = false
            end

            if includeCategory then
                table.insert(categoryMenu.options, {
                    categoryName,
                    function(playerArg)
                        m:logDebug("%s selected category: %s. Moving to set selection.", playerArg:getName(), categoryName)
                        -- Next level is set selection, STARTING AT PAGE 1
                        playerArg:timer(50, function(p)
                            showSetSelectionMenu(p, npc, categoryName, 1) 
                        end)
                    end
                })
            end
        end
    end
    
    -- Add Back to Main Menu (Always last option)
    table.insert(categoryMenu.options, {
        MESSAGES.navBack,
        function(playerArg)
            m:logDebug("%s selected 'Back' from Category Selection. Returning to main menu.", playerArg:getName())
            playerArg:timer(50, function(p)
                p:printToPlayer(MESSAGES.greeting, 0, npc:getPacketName())
                p:customMenu(menu) -- 'menu' is the main menu created in onTrigger
            end)
        end
    })

    player:customMenu(categoryMenu)
end

--- Handles the transaction logic for purchasing a reward item.
--- NOTE: The 'cost' parameter here is the already calculated MODIFIED cost.
---@param player Player
---@param npc NPC
---@param itemData table The specific reward item data from CAMPAIGN_REWARDS
---@param cost number (MODIFIED price in Allied Notes)
---@param itemName string The full name of the item (e.g., "Special Login Points")
---@param categoryName string The name of the category (for returning to the correct menu)
---@param setName string The name of the set (for returning to the correct menu)
---@param page number The page number to return to.
function handleRewardPurchase(player, npc, itemData, baseCost, itemName, categoryName, setName, page, quantity)
    local npcName = npc:getPacketName()
    local currentNotes = player:getCurrency(CURRENCY_NAME) or 0
    local isCurrencyReward = (categoryName == "Special" and #itemData == 4)
    local killCost = 0 -- for avatar rings

    -- New requirement check for Avatar Rings
    if setName == "Avatar Rings" then
        local bossKills = player:getCharVar('StrongholdMegaBossKills') or 0
        local isHQ = string.find(itemData[1], "+1")
        killCost = isHQ and 5 or 2

        if bossKills < killCost then
            player:printToPlayer(string.format(MESSAGES.notEnoughKills, killCost, bossKills), 0, npcName)
            m:logDebug("FAIL: Player %s has %d StrongholdMegaBossKills, needs %d.", player:getName(), bossKills, killCost)
            return
        end
    elseif setName == "Empy +1 Mats" then
        local bossKills = player:getCharVar('StrongholdMegaBossKills') or 0
        killCost = 10 * quantity

        if bossKills < killCost then
            player:printToPlayer(string.format(MESSAGES.notEnoughKills, killCost, bossKills), 0, npcName)
            m:logDebug("FAIL: Player %s has %d StrongholdMegaBossKills, needs %d.", player:getName(), bossKills, killCost)
            return
        end
    elseif setName == "WoE +1" then
        local bossKills = player:getCharVar('StrongholdMegaBossKills') or 0
        killCost = 30 * quantity

        if bossKills < killCost then
            player:printToPlayer(string.format(MESSAGES.notEnoughKills, killCost, bossKills), 0, npcName)
            m:logDebug("FAIL: Player %s has %d StrongholdMegaBossKills, needs %d.", player:getName(), bossKills, killCost)
            return
        end
    end
    
	-- Calculate total cost
	local singleModifiedCost, _, _ = getModifiedCost(player, baseCost)
	local totalCost = singleModifiedCost * quantity

	m:logDebug("%s: Starting purchase for %s (x%d). Total Cost: %d. Current notes: %d.", player:getName(), itemName, quantity, totalCost, currentNotes)

	-- 1. Points Check
	if currentNotes < totalCost then
		m:logDebug("FAIL: Currency check. Needed %d, has %d.", totalCost, currentNotes)
		player:printToPlayer(string.format(MESSAGES.noFunds, totalCost, TEXT_CURRENCY_NAME, itemName, currentNotes), 0, npcName)
		return -- Exit function
	end

	-- 2. Inventory Space Check (skip for currency rewards)
	if not isCurrencyReward then
		-- Use a simple inventory check. Since we are giving one item type at a time,
		-- we only need to check for at least one free slot.
		if player:getFreeSlotsCount() < 1 then
			m:logDebug("FAIL: Inventory full.")
			player:printToPlayer(string.format(MESSAGES.inventoryFull, itemName, TEXT_CURRENCY_NAME), 0, npcName)
			return -- Exit function
		end
	end

	-- 3. All checks passed, execute the transaction
	player:delCurrency(CURRENCY_NAME, totalCost)

    if setName == "Avatar Rings" or setName == "Empy +1 Mats" or setName == "WoE +1" then
        local bossKills = player:getCharVar('StrongholdMegaBossKills') or 0
        player:setCharVar('StrongholdMegaBossKills', bossKills - killCost)
        m:logDebug("SUCCESS: Deducted %d StrongholdMegaBossKills from %s. New total: %d.", killCost, player:getName(), bossKills - killCost)
    end

	if isCurrencyReward then
		-- Currency Reward: { "Display Name", "currency_key", Currency_Amount, cost_in_allied_notes }
		local currencyKey = itemData[2]
		local currencyAmount = itemData[3] * quantity
		player:addCurrency(currencyKey, currencyAmount)

		m:logDebug("SUCCESS: %d %s deducted. %d %s added.", totalCost, CURRENCY_NAME, currencyAmount, currencyKey)
		player:printToPlayer(string.format("You have exchanged %d %s for the reward.", totalCost, TEXT_CURRENCY_NAME), 0, npcName)
	else
		-- Standard Item Reward
		local itemID = itemData[2]
		player:addItem(itemID, quantity)

		m:logDebug("SUCCESS: %d %s deducted. Item %d (x%d) given.", totalCost, CURRENCY_NAME, itemID, quantity)
		player:printToPlayer(string.format(MESSAGES.purchaseSuccess, totalCost, TEXT_CURRENCY_NAME), 0, npcName)
	end

	-- After a successful purchase, refresh the current menu for the player.
	player:timer(1500, function(playerArg)
		playerArg:timer(50, function(p)
			if quantity > 1 then
				-- If it was a bulk purchase, refresh the quantity menu
				showQuantitySelectionMenu(p, npc, itemData, baseCost, itemName, categoryName, setName, page)
			else
				-- If it was a single purchase, refresh the item list
				showItemSelectionMenu(p, npc, categoryName, setName, page)
			end
		end)
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
    
    -- Define and insert the Campaign Spoils NPC.
    local campshopnpc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Campaign Spoils',
        look = '00001b0900000000000000000000000000000000', 
        x = 382.7659,
        y = -0.3846,
        z = -577.4653,
        rotation = 13, 
        widescan = 1,
        
        -- Custom onTrigger logic for the Campaign Judge
        onTrigger = function(player, npc)
            local npcName = npc:getPacketName()
            m:logDebug("NPC Triggered by %s. Displaying main menu.", player:getName())

            -- Get current notes for display in the main menu
            local currentNotes = player:getCurrency(CURRENCY_NAME) or 0

            -- Print the general greeting.
            player:printToPlayer(MESSAGES.greeting, 0, npcName)

            -- Define the core menu options here.
            menu.title = MESSAGES.menuTitle
            menu.options = {
                -- REWARDS OPTION (Now includes current notes)
                {
                    MESSAGES.menuOptionRedeem .. string.format(" (%d %s)", currentNotes, TEXT_CURRENCY_NAME), -- UPDATED: Added notes balance
                    function(playerArg)
                        m:logDebug("%s selected: Redeem Allied Notes. Moving to category selection.", playerArg:getName())
                        -- If 'Redeem', go to the category selection menu
                        playerArg:timer(50, function(p)
                            showCategorySelectionMenu(p, npc)
                        end)
                    end
                },
                {
                    MESSAGES.menuOptionNo,
                    function(playerArg)
                        m:logDebug("%s selected: Exit menu.", playerArg:getName())
                        -- If 'No', simply close the menu without a message.
                    end
                }
            }
            
            delaySendMenu(player)
            
            return true -- Handled the trigger
        end,
    })

end)


return m