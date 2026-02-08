-----------------------------------
-- Partsplox Storage NPC
-----------------------------------
require('modules/module_utils')
require('scripts/globals/npc_util')
-----------------------------------
local m = Module:new('Partsplox')

local itemsPerPage = 3

-- Define categories and items
local categories = {
    {
        name = "VNM Parts",
        items = {
            { name = "Suit of Hahava's Mail", id = xi.item.SUIT_OF_HAHAVAS_MAIL },
            { name = "Voidwrought Plate", id = xi.item.VOIDWROUGHT_PLATE },
            { name = "Celaeno's Cloth", id = xi.item.CELAENOS_CLOTH },
            { name = "Pil's Tuille", id = xi.item.PILS_TUILLE },
            { name = "Akvan's Pennon", id = xi.item.AKVANS_PENNON },
            { name = "Kaggen's Cuticle", id = xi.item.KAGGENS_CUTICLE },
        }
    },
    {
        name = "Aby NM Parts",
        items = {
            { name = "Glavoid Shell", id = xi.item.GLAVOID_SHELL },
            { name = "Two-leaf Chloris Bud", id = xi.item.TWO_LEAF_CHLORIS_BUD },
            { name = "Chukwa's Egg", id = xi.item.CHUKWAS_EGG },
            { name = "Manananggal's Necklet", id = xi.item.MANANANGGALS_NECKLET },
            { name = "Cuelebre's Horn", id = xi.item.CUELEBRES_HORN },
            { name = "Mictlantecuhtli's Habit", id = xi.item.MICTLANTECUHTLIS_HABIT },
            { name = "Helm of Briareus", id = xi.item.HELM_OF_BRIAREUS },
            { name = "Carabosse's Gem", id = xi.item.CARABOSSES_GEM },
            { name = "Marvin's Pelage", id = xi.item.MARVINS_PELAGE },
            { name = "Keesha Poppo's Pamama", id = xi.item.KEESHA_POPPOS_PAMAMA },
            { name = "Mikey's Silver Nugget", id = xi.item.MIKEYS_SILVER_NUGGET },
            { name = "Vial of Fistule Discharge", id = xi.item.VIAL_OF_FISTULE_DISCHARGE },
            { name = "Kukulkan's Fang", id = xi.item.KUKULKANS_FANG },
            { name = "Bakka's Wing", id = xi.item.BAKKAS_WING },
            { name = "Balaur Skull", id = xi.item.BALAUR_SKULL },
            { name = "Lieje Lantern", id = xi.item.LIEJE_LANTERN },
            { name = "Itzpapalotl's Scale", id = xi.item.ITZPAPALOTLS_SCALE },
            { name = "Ulhuadshi's Fang", id = xi.item.ULHUADSHIS_FANG },
            { name = "Sobek's Skin", id = xi.item.SOBEKS_SKIN },
            { name = "Cirein-croin's Lantern", id = xi.item.CIREIN_CROINS_LANTERN },
            { name = "Bukhis's Wing", id = xi.item.BUKHISS_WING },
            { name = "Sedna's Tusk", id = xi.item.SEDNAS_TUSK },
            { name = "Orthrus's Claw", id = xi.item.ORTHRUSS_CLAW },
            { name = "Dragua's Scale", id = xi.item.DRAGUAS_SCALE },
            { name = "Apademak's Horn", id = xi.item.APADEMAKS_HORN },
            { name = "Isgebind's Heart", id = xi.item.ISGEBINDS_HEART },
            { name = "Alfard's Fang", id = xi.item.ALFARDS_FANG },
            { name = "Azdaja's Horn", id = xi.item.AZDAJAS_HORN },
            { name = "Iron Plate", id = xi.item.IRON_PLATE },
            { name = "Colorless Soul", id = xi.item.COLORLESS_SOUL },
        }
    },
    {
        name = "UNM Parts",
        items = {
            { name = "Chunk of Harold Hugemaw's Red Ore", id = xi.item.CHUNK_OF_HAROLD_HUGEMAWS_RED_ORE },
            { name = "Bounding Belinda's Hide", id = xi.item.BOUNDING_BELINDAS_HIDE },
            { name = "Prickly Pitriv's Thread", id = xi.item.PRICKLY_PITRIVS_THREAD },
            { name = "Ironhorn Baldurno's Horn", id = xi.item.IRONHORN_BALDURNOS_HORN },
            { name = "Strand of Sleepy Mabel's Fur", id = xi.item.STRAND_OF_SLEEPY_MABELS_FUR },
            { name = "Imperator's Wing", id = xi.item.IMPERATORS_WING },
            { name = "Serpopard Ninlil's Bone", id = xi.item.SERPOPARD_NINLILS_BONE },
            { name = "Abyssdiver's Feather", id = xi.item.ABYSSDIVERS_FEATHER },
            { name = "Intuila's Hide", id = xi.item.INTUILAS_HIDE },
            { name = "Emperor Arthro's Shell", id = xi.item.EMPEROR_ARTHROS_SHELL },
            { name = "Orcfeltrap's Leaf", id = xi.item.ORCFELTRAPS_LEAF },
            { name = "Vial of Lumber Jill's Spittle", id = xi.item.VIAL_OF_LUMBER_JILLS_SPITTLE },
            { name = "Joyous's Moss", id = xi.item.JOYOUSS_MOSS },
            { name = "Strix's Tailfeather", id = xi.item.STRIXS_TAILFEATHER },
            { name = "Warblade Beak's Hide", id = xi.item.WARBLADE_BEAKS_HIDE },
            { name = "Arke's Wing", id = xi.item.ARKES_WING },
            { name = "Largantua's Shard", id = xi.item.LARGANTUAS_SHARD },
            { name = "Vial of Beist's Blood", id = xi.item.VIAL_OF_BEISTS_BLOOD },
            { name = "Jester Malatrix's Shard", id = xi.item.JESTER_MALATRIXS_SHARD },
            { name = "Cactrot Veloz's Needle", id = xi.item.CACTROT_VELOZS_NEEDLE },
            { name = "Woodland Mender's Log", id = xi.item.WOODLAND_MENDERS_LOG },
            { name = "Sybaritic Samantha's Vine", id = xi.item.SYBARITIC_SAMANTHAS_VINE },
            { name = "Handful of Heiligtum's Moss", id = xi.item.HANDFUL_OF_HEILIGTUMS_MOSS },
            { name = "Douma Weapon's Shard", id = xi.item.DOUMA_WEAPONS_SHARD },
            { name = "King Uropygid's Needle", id = xi.item.KING_UROPYGIDS_NEEDLE },
            { name = "Vedrfolnir's Wing", id = xi.item.VEDRFOLNIRS_WING },
            { name = "Tiyanak's Fang", id = xi.item.TIYANAKS_FANG },
            { name = "Immanibugard's Hide", id = xi.item.IMMANIBUGARDS_HIDE },
            { name = "Muut's Vestment", id = xi.item.MUUTS_VESTMENT },
            { name = "Clawberry's Coat", id = xi.item.CLAWBERRYS_COAT },
            { name = "Tuft of Camahueto's Fur", id = xi.item.TUFT_OF_CAMAHUETOS_FUR },
            { name = "Voso's Hide", id = xi.item.VOSOS_HIDE },
            { name = "Mephitas's Claw", id = xi.item.MEPHITASS_CLAW },
            { name = "Coca's Wing", id = xi.item.COCAS_WING },
            { name = "Ayapec's Shell", id = xi.item.AYAPECS_SHELL },
            { name = "Chunk of Specter's Ore", id = xi.item.CHUNK_OF_SPECTERS_ORE },
            { name = "Azrael's Eye", id = xi.item.AZRAELS_EYE },
            { name = "Stick of Ethereal Incense", id = xi.item.STICK_OF_ETHEREAL_INCENSE },
            { name = "Jar of Garbage Gel's Mucus", id = xi.item.JAR_OF_GARBAGE_GELS_MUCUS },
            { name = "Vial of Bakunawa's Ink", id = xi.item.VIAL_OF_BAKUNAWAS_INK },
            { name = "Vermillion Fishfly's Wing", id = xi.item.VERMILLION_FISHFLYS_WING },
            { name = "Pinch of Volatile Cluster's Ash", id = xi.item.PINCH_OF_VOLATILE_CLUSTERS_ASH },
            { name = "Mhuufya's Beak", id = xi.item.MHUUFYAS_BEAK },
            { name = "Pinch of Grand Grenade's Ash", id = xi.item.PINCH_OF_GRAND_GRENADES_ASH },
            { name = "Vidmapire's Claw", id = xi.item.VIDMAPRIES_CLAW },
            { name = "Centurio Armor", id = xi.item.CENTURIO_ARMOR },
            { name = "Hidhaegg's Scale", id = xi.item.HIDHAEGGS_SCALE },
            { name = "Tolba's Shell", id = xi.item.TOLBAS_SHELL },
            { name = "Sovereign Behemoth's Hide", id = xi.item.SOVEREIGN_BEHEMOTHS_HIDE },
            { name = "Vial of the Tumult Curator's Blood", id = xi.item.VIAL_OF_THE_TUMULT_CURATORS_BLOOD },
            { name = "Thu'ban's Scale", id = xi.item.THUBANS_SCALE },
            { name = "Sarama's Hide", id = xi.item.SARAMAS_HIDE },
            { name = "Shedu's Mane", id = xi.item.SHEDUS_MANE },
            { name = "Glazemane's Fang", id = xi.item.GLAZEMANES_FANG },
            { name = "Carousing Celine's Vine", id = xi.item.CAROUSING_CELINES_VINE },
            { name = "Wyvernhunter Bambrox's Shawl", id = xi.item.WYVERNHUNTER_BAMBROXS_SHAWL },
        }
    },
    {
        name = "Empyrean Upgrade Materials",
        groups = {
            { name = "Ravager's Seal", items = {
                { name = "Head", id = xi.item.RAVAGERS_SEAL_HEAD },
                { name = "Body", id = xi.item.RAVAGERS_SEAL_BODY },
                { name = "Hands", id = xi.item.RAVAGERS_SEAL_HANDS },
                { name = "Legs", id = xi.item.RAVAGERS_SEAL_LEGS },
                { name = "Feet", id = xi.item.RAVAGERS_SEAL_FEET },
            }},
            { name = "Tantra Seal", items = {
                { name = "Head", id = xi.item.TANTRA_SEAL_HEAD },
                { name = "Body", id = xi.item.TANTRA_SEAL_BODY },
                { name = "Hands", id = xi.item.TANTRA_SEAL_HANDS },
                { name = "Legs", id = xi.item.TANTRA_SEAL_LEGS },
                { name = "Feet", id = xi.item.TANTRA_SEAL_FEET },
            }},
            { name = "Orison Seal", items = {
                { name = "Head", id = xi.item.ORISON_SEAL_HEAD },
                { name = "Body", id = xi.item.ORISON_SEAL_BODY },
                { name = "Hands", id = xi.item.ORISON_SEAL_HANDS },
                { name = "Legs", id = xi.item.ORISON_SEAL_LEGS },
                { name = "Feet", id = xi.item.ORISON_SEAL_FEET },
            }},
            { name = "Goetia Seal", items = {
                { name = "Head", id = xi.item.GOETIA_SEAL_HEAD },
                { name = "Body", id = xi.item.GOETIA_SEAL_BODY },
                { name = "Hands", id = xi.item.GOETIA_SEAL_HANDS },
                { name = "Legs", id = xi.item.GOETIA_SEAL_LEGS },
                { name = "Feet", id = xi.item.GOETIA_SEAL_FEET },
            }},
            { name = "Estoqueur's Seal", items = {
                { name = "Head", id = xi.item.ESTOQUEURS_SEAL_HEAD },
                { name = "Body", id = xi.item.ESTOQUEURS_SEAL_BODY },
                { name = "Hands", id = xi.item.ESTOQUEURS_SEAL_HANDS },
                { name = "Legs", id = xi.item.ESTOQUEURS_SEAL_LEGS },
                { name = "Feet", id = xi.item.ESTOQUEURS_SEAL_FEET },
            }},
            { name = "Raider's Seal", items = {
                { name = "Head", id = xi.item.RAIDERS_SEAL_HEAD },
                { name = "Body", id = xi.item.RAIDERS_SEAL_BODY },
                { name = "Hands", id = xi.item.RAIDERS_SEAL_HANDS },
                { name = "Legs", id = xi.item.RAIDERS_SEAL_LEGS },
                { name = "Feet", id = xi.item.RAIDERS_SEAL_FEET },
            }},
            { name = "Creed Seal", items = {
                { name = "Head", id = xi.item.CREED_SEAL_HEAD },
                { name = "Body", id = xi.item.CREED_SEAL_BODY },
                { name = "Hands", id = xi.item.CREED_SEAL_HANDS },
                { name = "Legs", id = xi.item.CREED_SEAL_LEGS },
                { name = "Feet", id = xi.item.CREED_SEAL_FEET },
            }},
            { name = "Bale Seal", items = {
                { name = "Head", id = xi.item.BALE_SEAL_HEAD },
                { name = "Body", id = xi.item.BALE_SEAL_BODY },
                { name = "Hands", id = xi.item.BALE_SEAL_HANDS },
                { name = "Legs", id = xi.item.BALE_SEAL_LEGS },
                { name = "Feet", id = xi.item.BALE_SEAL_FEET },
            }},
            { name = "Ferine Seal", items = {
                { name = "Head", id = xi.item.FERINE_SEAL_HEAD },
                { name = "Body", id = xi.item.FERINE_SEAL_BODY },
                { name = "Hands", id = xi.item.FERINE_SEAL_HANDS },
                { name = "Legs", id = xi.item.FERINE_SEAL_LEGS },
                { name = "Feet", id = xi.item.FERINE_SEAL_FEET },
            }},
            { name = "Aoidos' Seal", items = {
                { name = "Head", id = xi.item.AOIDOS_SEAL_HEAD },
                { name = "Body", id = xi.item.AOIDOS_SEAL_BODY },
                { name = "Hands", id = xi.item.AOIDOS_SEAL_HANDS },
                { name = "Legs", id = xi.item.AOIDOS_SEAL_LEGS },
                { name = "Feet", id = xi.item.AOIDOS_SEAL_FEET },
            }},
            { name = "Sylvan Seal", items = {
                { name = "Head", id = xi.item.SYLVAN_SEAL_HEAD },
                { name = "Body", id = xi.item.SYLVAN_SEAL_BODY },
                { name = "Hands", id = xi.item.SYLVAN_SEAL_HANDS },
                { name = "Legs", id = xi.item.SYLVAN_SEAL_LEGS },
                { name = "Feet", id = xi.item.SYLVAN_SEAL_FEET },
            }},
            { name = "Unkai Seal", items = {
                { name = "Head", id = xi.item.UNKAI_SEAL_HEAD },
                { name = "Body", id = xi.item.UNKAI_SEAL_BODY },
                { name = "Hands", id = xi.item.UNKAI_SEAL_HANDS },
                { name = "Legs", id = xi.item.UNKAI_SEAL_LEGS },
                { name = "Feet", id = xi.item.UNKAI_SEAL_FEET },
            }},
            { name = "Iga Seal", items = {
                { name = "Head", id = xi.item.IGA_SEAL_HEAD },
                { name = "Body", id = xi.item.IGA_SEAL_BODY },
                { name = "Hands", id = xi.item.IGA_SEAL_HANDS },
                { name = "Legs", id = xi.item.IGA_SEAL_LEGS },
                { name = "Feet", id = xi.item.IGA_SEAL_FEET },
            }},
            { name = "Lancer's Seal", items = {
                { name = "Head", id = xi.item.LANCERS_SEAL_HEAD },
                { name = "Body", id = xi.item.LANCERS_SEAL_BODY },
                { name = "Hands", id = xi.item.LANCERS_SEAL_HANDS },
                { name = "Legs", id = xi.item.LANCERS_SEAL_LEGS },
                { name = "Feet", id = xi.item.LANCERS_SEAL_FEET },
            }},
            { name = "Caller's Seal", items = {
                { name = "Head", id = xi.item.CALLERS_SEAL_HEAD },
                { name = "Body", id = xi.item.CALLERS_SEAL_BODY },
                { name = "Hands", id = xi.item.CALLERS_SEAL_HANDS },
                { name = "Legs", id = xi.item.CALLERS_SEAL_LEGS },
                { name = "Feet", id = xi.item.CALLERS_SEAL_FEET },
            }},
            { name = "Mavi Seal", items = {
                { name = "Head", id = xi.item.MAVI_SEAL_HEAD },
                { name = "Body", id = xi.item.MAVI_SEAL_BODY },
                { name = "Hands", id = xi.item.MAVI_SEAL_HANDS },
                { name = "Legs", id = xi.item.MAVI_SEAL_LEGS },
                { name = "Feet", id = xi.item.MAVI_SEAL_FEET },
            }},
            { name = "Navarch's Seal", items = {
                { name = "Head", id = xi.item.NAVARCHS_SEAL_HEAD },
                { name = "Body", id = xi.item.NAVARCHS_SEAL_BODY },
                { name = "Hands", id = xi.item.NAVARCHS_SEAL_HANDS },
                { name = "Legs", id = xi.item.NAVARCHS_SEAL_LEGS },
                { name = "Feet", id = xi.item.NAVARCHS_SEAL_FEET },
            }},
            { name = "Cirque Seal", items = {
                { name = "Head", id = xi.item.CIRQUE_SEAL_HEAD },
                { name = "Body", id = xi.item.CIRQUE_SEAL_BODY },
                { name = "Hands", id = xi.item.CIRQUE_SEAL_HANDS },
                { name = "Legs", id = xi.item.CIRQUE_SEAL_LEGS },
                { name = "Feet", id = xi.item.CIRQUE_SEAL_FEET },
            }},
            { name = "Charis Seal", items = {
                { name = "Head", id = xi.item.CHARIS_SEAL_HEAD },
                { name = "Body", id = xi.item.CHARIS_SEAL_BODY },
                { name = "Hands", id = xi.item.CHARIS_SEAL_HANDS },
                { name = "Legs", id = xi.item.CHARIS_SEAL_LEGS },
                { name = "Feet", id = xi.item.CHARIS_SEAL_FEET },
            }},
            { name = "Savant's Seal", items = {
                { name = "Head", id = xi.item.SAVANTS_SEAL_HEAD },
                { name = "Body", id = xi.item.SAVANTS_SEAL_BODY },
                { name = "Hands", id = xi.item.SAVANTS_SEAL_HANDS },
                { name = "Legs", id = xi.item.SAVANTS_SEAL_LEGS },
                { name = "Feet", id = xi.item.SAVANTS_SEAL_FEET },
            }},
        }
    },
    {
        name = "Aby Currency",
        groups = {
            { name = "Vision", items = {
                { name = "Stone", id = xi.item.STONE_OF_VISION },
                { name = "Coin", id = xi.item.COIN_OF_VISION },
                { name = "Jewel", id = xi.item.JEWEL_OF_VISION },
                { name = "Card", id = xi.item.CARD_OF_VISION },
            }},
            { name = "Ardor", items = {
                { name = "Stone", id = xi.item.STONE_OF_ARDOR },
                { name = "Coin", id = xi.item.COIN_OF_ARDOR },
                { name = "Jewel", id = xi.item.JEWEL_OF_ARDOR },
                { name = "Card", id = xi.item.CARD_OF_ARDOR },
            }},
            { name = "Wieldance", items = {
                { name = "Stone", id = xi.item.STONE_OF_WIELDANCE },
                { name = "Coin", id = xi.item.COIN_OF_WIELDANCE },
                { name = "Jewel", id = xi.item.JEWEL_OF_WIELDANCE },
                { name = "Card", id = xi.item.CARD_OF_WIELDANCE },
            }},
            { name = "Balance", items = {
                { name = "Stone", id = xi.item.STONE_OF_BALANCE },
                { name = "Coin", id = xi.item.COIN_OF_BALANCE },
                { name = "Jewel", id = xi.item.JEWEL_OF_BALANCE },
                { name = "Card", id = xi.item.CARD_OF_BALANCE },
            }},
            { name = "Voyage", items = {
                { name = "Stone", id = xi.item.STONE_OF_VOYAGE },
                { name = "Coin", id = xi.item.COIN_OF_VOYAGE },
                { name = "Jewel", id = xi.item.JEWEL_OF_VOYAGE },
                { name = "Card", id = xi.item.CARD_OF_VOYAGE },
            }},
        }
    }
}

-- Flatten list for storage scanning
local allItems = {}
local isInitialized = false

local function initializeData()
    if isInitialized then return end
    for _, cat in ipairs(categories) do
        if cat.items then
            for _, item in ipairs(cat.items) do
                if item.id then
                    item.var = "Partsplox_" .. item.id
                    table.insert(allItems, item)
                end
            end
        elseif cat.groups then
            for _, group in ipairs(cat.groups) do
                for _, item in ipairs(group.items) do
                    if item.id then
                        item.var = "Partsplox_" .. item.id
                        table.insert(allItems, item)
                    end
                end
            end
        end
    end
    isInitialized = true
end

local function delaySendMenu(player, menuToSend)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menuToSend)
    end)
end

local function storeItems(player, trade)
    local storedSomething = false

    for _, item in ipairs(allItems) do
        local count = trade:getItemQty(item.id)
        if count > 0 then
            local currentBalance = player:getCharVar(item.var)
            player:setCharVar(item.var, currentBalance + count)
            storedSomething = true
            player:printToPlayer(string.format('Stored %d %s. New balance: %d.', count, item.name, currentBalance + count), 0, 'Partsplox')
        end
    end

    if storedSomething then
        player:tradeComplete()
    else
        player:printToPlayer('No valid items found in the trade.', 0, 'Partsplox')
    end
end

local function retrieveItemWithGil(player, trade, selectedItem)
    local gilAmount = trade:getGil()
    local totalItemsToWithdraw = math.min(gilAmount, 99) -- 1 gil = 1 item fee

    local quantity = player:getCharVar(selectedItem.var)
    if quantity > 0 and totalItemsToWithdraw > 0 then
        local itemsToWithdraw = math.min(totalItemsToWithdraw, quantity)
        if player:getFreeSlotsCount() < math.ceil(itemsToWithdraw / 99) then -- Assuming stack size 99 for simplicity, or 12
            player:printToPlayer('You cannot withdraw that amount. Please check your inventory and try again.', 0, 'Partsplox')
            return
        end

        player:addItem(selectedItem.id, itemsToWithdraw)
        player:setCharVar(selectedItem.var, quantity - itemsToWithdraw)
        player:printToPlayer(string.format('You have withdrawn %d %s.', itemsToWithdraw, selectedItem.name), 0, 'Partsplox')
        player:printToPlayer(string.format('Your remaining %s balance is %d.', selectedItem.name, player:getCharVar(selectedItem.var)), 0, 'Partsplox')
        player:tradeComplete()
    else
        player:printToPlayer('You cannot withdraw that amount. Please check your balance and try again.', 0, 'Partsplox')
    end
end

local createCategoryMenu -- Forward declaration
local createGroupMenu -- Forward declaration
local createItemMenu -- Forward declaration

createItemMenu = function(player, categoryIndex, groupIndex, page, trade)
    page = page or 1
    local category = categories[categoryIndex]
    local sourceItems
    local title
    
    if groupIndex then
        sourceItems = category.groups[groupIndex].items
        title = category.groups[groupIndex].name
    else
        sourceItems = category.items
        title = category.name
    end

    local items = {}
    for _, item in ipairs(sourceItems) do
        table.insert(items, item)
    end

    table.sort(items, function(a, b)
        local balA = a.var and player:getCharVar(a.var) or 0
        local balB = b.var and player:getCharVar(b.var) or 0
        if balA == balB then return a.name < b.name end
        return balA > balB
    end)

    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, #items)
    local options = {}

    for i = startIndex, endIndex do
        local item = items[i]
        local balance = 0
        if item.var then
            balance = player:getCharVar(item.var)
        end
        local text = string.format('%s (%d)', item.name, balance)
        if not item.var then
            text = string.format('%s (Unavailable)', item.name)
        end
        table.insert(options, {
            text,
            function(playerArg)
                if not item.var then
                    playerArg:printToPlayer("This item is unavailable.", 0, 'Partsplox')
                    return
                end
                if trade then
                    retrieveItemWithGil(playerArg, trade, item)
                end
            end
        })
    end

    if page > 1 then
        table.insert(options, { 'Prev', function(p) createItemMenu(p, categoryIndex, groupIndex, page - 1, trade) end })
    end
    if endIndex < #items then
        table.insert(options, { 'Next', function(p) createItemMenu(p, categoryIndex, groupIndex, page + 1, trade) end })
    end
    
    table.insert(options, { 'Back', function(p) 
        if groupIndex then
            createGroupMenu(p, categoryIndex, 1, trade)
        else
            createCategoryMenu(p, trade) 
        end
    end })

    delaySendMenu(player, { title = title, options = options })
end

createGroupMenu = function(player, categoryIndex, page, trade)
    page = page or 1
    local category = categories[categoryIndex]
    local groups = category.groups
    local startIndex = (page - 1) * itemsPerPage + 1
    local endIndex = math.min(startIndex + itemsPerPage - 1, #groups)
    local options = {}

    for i = startIndex, endIndex do
        local group = groups[i]
        table.insert(options, {
            group.name,
            function(playerArg)
                createItemMenu(playerArg, categoryIndex, i, 1, trade)
            end
        })
    end

    if page > 1 then
        table.insert(options, { 'Prev', function(p) createGroupMenu(p, categoryIndex, page - 1, trade) end })
    end
    if endIndex < #groups then
        table.insert(options, { 'Next', function(p) createGroupMenu(p, categoryIndex, page + 1, trade) end })
    end
    
    table.insert(options, { 'Back', function(p) createCategoryMenu(p, trade) end })

    delaySendMenu(player, { title = category.name, options = options })
end

createCategoryMenu = function(player, trade)
    local options = {}
    for i, cat in ipairs(categories) do
        table.insert(options, {
            cat.name,
            function(playerArg)
                if cat.groups then
                    createGroupMenu(playerArg, i, 1, trade)
                else
                    createItemMenu(playerArg, i, nil, 1, trade)
                end
            end
        })
    end
    
    delaySendMenu(player, { title = 'Select Category', options = options })
end

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)

    local partsplox = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Partsplox',
        look = 85,
        x = 322.7088, y = -2.8651, z = -546.6050, 
        rotation = 60,
        widescan = 1,
        onTrade = function(player, npc, trade)
            initializeData()
            if npcUtil.tradeHas(trade, xi.item.GIL) then
                createCategoryMenu(player, trade)
            else
                storeItems(player, trade)
            end
        end,
        onTrigger = function(player, npc)
            initializeData()
            createCategoryMenu(player, nil) -- View only mode
            player:printToPlayer('Review your current Parts Balance. To withdraw, trade me gil (1 gil per item). Or trade me the Parts you want stored.', 0, 'Partsplox')
        end,
    })
    utils.unused(partsplox)
end)

return m
