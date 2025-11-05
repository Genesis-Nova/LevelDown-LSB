--------------------------------------------------------------------------------

require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/utils/utils")
--------------------------------------------------------------------------------
--                              ROTATING NM HUNT                              --
--------------------------------------------------------------------------------

local m = Module:new('rotatingnmhunt')

-- Localized NPC Text Messages
local MESSAGES = {
    -- General
    NO_HUNT_CONFIGURED = "Greetings, Hunter. It seems there are no hunts configured for me. Please contact a GM!",
    NO_TASKS_TODAY = "Greetings, Hunter. I have no urgent tasks for you today. Perhaps come back tomorrow!",
    ISSUE_WITH_HUNT_DATA = "Greetings, Hunter. There was an issue with your hunt data. Please inform a GM!",
    ISSUE_PROCESSING_TRADE = "There was an issue processing your trade. Please try again or contact a GM if the problem persists.",
    INVALID_HUNT_ID_ERROR = "[DHHunt ERROR] Invalid hunt ID %d found for player %s for day %d. Resetting hunt.",
    INVALID_HUNT_ID_TRADE_ERROR = "[DHHunt ERROR] Invalid hunt ID %d found for player %s during trade. Resetting hunt.",
    DAILY_HUNT_RESET_SUCCESS = "Hello Hunter! New Day, New Hunt!",

    -- Hunt Assignment / Current Hunt Status
    HUNT_ASSIGNMENT_PART1 = "Go to %s. Defeat '%s' and bring the '%s' (%d pts).",
    HUNT_ASSIGNMENT_PART2 = "You don't have much time! The hunt expires at 24:00! Good luck!",
    ALREADY_COMPLETED_HUNT = "You already completed today's daily hunt. Your current points: %d.",
    WOULD_YOU_LIKE_TO_FETCH_SOMETHING = "Would you like to fetch something for me?",

    -- Trade Outcome Messages
    TRADE_NM_SUCCESS = "Ah, the '%s'! Excellent work, Hunter!",
    POINTS_EARNED_MESSAGE = "You earned %d hunt points!",
    NM_ALREADY_TRADED_ON_TRADE = "You have already traded the '%s' for today's hunt. I don't need anything else from you.",
    INVALID_TRADE_ITEM = "That's not what I asked for, Hunter. I need '%s'.",
    HUNT_NOT_ACTIVE_FOR_PLAYER = "I currently have no active hunt for you. Please speak to me first!",
    HUNT_EXPIRED = "Too slow! Yesterday's hunts expired. You need a new one!",
    POST_TRADE_COMPLETED = "You're done for the day. Take a break already!",

    -- Bribe Messages
    BRIBE_MENU_OPTION = "Bribe (1M): Need more work?",
    BRIBE_SUCCESS = "Alright, that's my gil now. I got something new for you to hunt.",
    BRIBE_NEW_HUNT_ASSIGNED = "New Hunt: Head to %s. Defeat '%s' and bring me the '%s' (%d pts).",
    BRIBE_INSUFFICIENT_GIL = "Come back when your pockets are heavier, I need a proper incentive: %s Gil.",
    BRIBE_HUNT_ACTIVE = "Slow down, hunter! You still have unfinished business.",
    BRIBE_GIL_DEDUCTION_FAILED = "My hand slipped... the Gil didn't quite make it. Best try again, discreetly this time.",
    BRIBE_ALREADY_DONE = "I have SOME ethics, friend. One bribe per day!",

    -- Reroll Messages (UPDATED: Added REROLL_HUNT_COMPLETED)
    REROLL_SUCCESS_FREE = "Consider that forgotten! Here's a new target. Better hurry!",
    REROLL_SUCCESS_PAID = "Gil accepted! Here's your new target. Better hurry!",
    REROLL_ALREADY_DONE = "That's your limit for the day. You only get two rerolls!",
    REROLL_INSUFFICIENT_GIL = "A reroll costs %s Gil. No mind tricks, only money.",
    REROLL_GIL_DEDUCTION_FAILED = "Payment failed. Try again.",
    REROLL_HUNT_COMPLETED = "You've already completed today's hunt, but I do take bribes.",

    -- New Hunt hunt Menu Messages
    NEW_HUNT_MENU_OPTION = "New Hunt? (One per day)",
    NEW_HUNT_ALREADY_HUNT = "Nice try! You still have an active hunt to complete!",
    NEW_HUNT_ALREADY_COMPLETED = "You've already completed today's hunt. Come back tomorrow for a new one!",
    NEW_HUNT_SUCCESS = "Alright, I've got a new hunt for you.",
    NEW_HUNT_FAIL = "I have no new hunts at this time. Check back tomorrow.",

    -- Menu Titles and Options
    DAILY_HUNT_MENU_TITLE = "Daily Hunt Options",
    SELECT_REWARD_TIER_OPTION = "Rewards",
    LEAVE_OPTION = "Leave",

    REDEEM_TIER_SELECTION_TITLE = "Rewards (Points: %d)",
    TIER1_MENU_OPTION = "Tier 1: Lustreless Items (%d)",
    TIER2_MENU_OPTION = "Tier 2: Trust Upgrades (%d)",
    TIER3_MENU_OPTION = "Tier 3: Job Shards (%d)",
    BACK_OPTION = "Back",
    NEXT_PAGE_OPTION = "Next Page",
    PREVIOUS_PAGE_OPTION = "Previous Page",

    TIER1_MENU_TITLE = "Tier 1: Lustreless Items (Cost: %d points)",
    TIER2_MAIN_MENU_TITLE = "Tier 2: Trust Upgrades (Cost: %d points)",
    TRUST_MENU_TITLE = "%s Upgrades (Cost: %d points)",
    TRUST_ITEM_PURCHASED = "[PURCHASED]",
    TRUST_ITEM_AVAILABLE = "[AVAILABLE]",

    TIER3_MENU_TITLE = "Tier 3: Job Shards (Cost: %d points)",
    JOB_SELECTION_PAGE_TITLE = "Select Job (Page %d/%d - Cost: %d points)",
    JOB_SHARD_MENU_TITLE = "%s Shards (Cost: %d points)",

    -- Redemption Status Messages
    REDEEM_TRUST_ALREADY_PURCHASED = "You have already purchased the '%s' upgrade. This is a once-per-character trade.",
    REDEEM_SUCCESS_ITEM = "You successfully redeemed %d points for a '%s'!",
    REDEEM_NOT_ENOUGH_POINTS = "You do not have enough points for that.",
    REDEEM_INVENTORY_FULL = "Your inventory is full. Please make space before redeeming.",
    REDEEM_INVALID_CHOICE = "That's not a valid redemption option.",
    REDEEM_CURRENT_POINTS_INFO = "Your current hunt points: %d.",
}

--------------------------------------------------------------------------------
-- LOCAL HELPER FUNCTIONS                                                     --
--------------------------------------------------------------------------------

-- Function to add commas to a number string
local function addCommas(n)
    local s = tostring(n)
    local left, num, right = s:match('^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end

-- Helper function for delayed menu sending.
local function delaySendMenu(player, npc, menu_options_table, title_string)
    player:timer(50, function(p)
        local menu = { options = menu_options_table }
        if title_string then
            menu.title = title_string
        else
            menu.title = MESSAGES.DAILY_HUNT_MENU_TITLE -- Default title
        end
        p:customMenu(menu)
    end)
end

-- Helper function for item redemption (UPDATED: Returns success status)
-- NOTE: This function no longer handles menu navigation. The caller must handle it.
local function redeemItem(player, npc, itemID, itemName, cost, quantity, charVarKey)
    local player_total_points = player:getCharVar("DH_TotalPoints")
    local success = false
    local already_purchased = false

    -- *** Purchase Limit Check for Trust Upgrades ***
    if charVarKey then
        local is_purchased = player:getCharVar(charVarKey) == 1
        if is_purchased then
            player:printToPlayer(string.format(MESSAGES.REDEEM_TRUST_ALREADY_PURCHASED, itemName), 0, npc:getPacketName())
            already_purchased = true
        end
    end
    -- *** END Purchase Limit Check ***

    if not already_purchased then
        if player_total_points >= cost then
            -- Inventory Check Logic: Trust items and T3 need 1 free slot (non-stackable)
            local free_slots_needed = (charVarKey or quantity == 1) and 1 or 0
            local can_redeem = true

            if quantity > 1 then -- For T1 lustreless items (stacks of 99)
                 local current_stack_size = player:getItemCount(itemID)
                 if not (current_stack_size > 0 and current_stack_size < 99) then
                     if player:getFreeSlotsCount() < 1 then
                        can_redeem = false
                     end
                 end
            else -- For non-stackable items (Trust items, T3)
                if player:getFreeSlotsCount() < 1 then
                    can_redeem = false
                end
            end

            if can_redeem then
                player:incrementCharVar("DH_TotalPoints", -cost)
                player:addItem(itemID, quantity)
                player:printToPlayer(string.format(MESSAGES.REDEEM_SUCCESS_ITEM, cost, itemName), 0, npc:getPacketName())

                -- *** Set purchased flag for Trust Upgrades ***
                if charVarKey then
                    player:setCharVar(charVarKey, 1)
                end
                -- *** END Set purchased flag ***
                success = true
            else
                player:printToPlayer(MESSAGES.REDEEM_INVENTORY_FULL, 0, npc:getPacketName())
            end
        else
            player:printToPlayer(MESSAGES.REDEEM_NOT_ENOUGH_POINTS, 0, npc:getPacketName())
        end
    end
    player:printToPlayer(string.format(MESSAGES.REDEEM_CURRENT_POINTS_INFO, player:getCharVar("DH_TotalPoints")), 0, npc:getPacketName())
    return success -- Return boolean success flag for caller to decide next menu action
end

-- Centralized function to check for a new day and reset all relevant variables.
local function checkAndResetDailyVars(player)
    local last_checked_day = player:getCharVar("DH_LastVanadielDay") or 0
    local current_day = VanadielUniqueDay()

    if current_day ~= last_checked_day then
        player:setCharVar("DH_HuntCompletedToday", 0)
        player:setCharVar("DH_LastBribeDay", -1)
        player:setCharVar("DH_RerollsToday", 0)
        player:setCharVar("DH_PlayerCurrentHuntID", 0)
        player:setCharVar("DH_LastVanadielDay", current_day)
        return true
    else
        return false
    end
end

--------------------------------------------------------------------------------
--                              CONFIGURATION                                 --
--------------------------------------------------------------------------------

-- NM Hunt Configuration (Unchanged)
local zonedrops = {
        [1] = { zonename = "Alzadaal Undersea Ruins", nmhunt = "Boompadu", nmitem = "Surge Subligar", nmitemid = 16375, points = 88 },
        [2] = { zonename = "Alzadaal Undersea Ruins", nmhunt = "Cookieduster Lipiroon", nmitem = "Lyft Crossbow", nmitemid = 19233, points = 113 },
        [3] = { zonename = "Alzadaal Undersea Ruins", nmhunt = "Vidmapire", nmitem = "Raicho", nmitemid = 20980, points = 82.45 },
        [4] = { zonename = "Alzadaal Undersea Ruins", nmhunt = "Vidmapire", nmitem = "Fi Follet Cape", nmitemid = 27609, points = 82.45 },
        [5] = { zonename = "Arrapago Reef", nmhunt = "Lamie No.8", nmitem = "Mercenary's Turban", nmitemid = 16083, points = 159 },
        [6] = { zonename = "Arrapago Reef", nmhunt = "Lamie No.7", nmitem = "Corsair's Scimitar", nmitemid = 17737, points = 159 },
        [7] = { zonename = "Arrapago Reef", nmhunt = "Euryale", nmitem = "Lyft Jambiya", nmitemid = 19125, points = 92 },
        [8] = { zonename = "Arrapago Reef", nmhunt = "Dimgruzub", nmitem = "gendewitha gages", nmitemid = 28054, points = 47.275 },
        [9] = { zonename = "Attohwa Chasm", nmhunt = "Ambusher Antlion", nmitem = "Archer's Jupon", nmitemid = 14467, points = 35 },
        [10] = { zonename = "Attohwa Chasm", nmhunt = "Xolotl", nmitem = "Bandomusha Kote", nmitemid = 14873, points = 244.5 },
        [11] = { zonename = "Attohwa Chasm", nmhunt = "Sekhmet", nmitem = "Layqa Seraweels", nmitemid = 16374, points = 82 },
        [12] = { zonename = "Attohwa Chasm", nmhunt = "Muut", nmitem = "Anathema Harpe", nmitemid = 20606, points = 82.45 },
        [13] = { zonename = "Attohwa Chasm", nmhunt = "Muut", nmitem = "Kachimusha Kote", nmitemid = 27050, points = 82.45 },
        [14] = { zonename = "Attohwa Chasm", nmhunt = "Fjalar", nmitem = "hagondes pants", nmitemid = 28196, points = 47.275 },
        [15] = { zonename = "Aydeewa Subterrane", nmhunt = "Lizardtrap", nmitem = "Fenrir's Crown", nmitemid = 11496, points = 91 },
        [16] = { zonename = "Aydeewa Subterrane", nmhunt = "Morta", nmitem = "hgafircian", nmitemid = 21294, points = 58.125 },
        [17] = { zonename = "Batallia Downs", nmhunt = "Ahtu", nmitem = "Engraved Key", nmitemid = 535, points = 35 },
        [18] = { zonename = "Batallia Downs", nmhunt = "Lumber Jill", nmitem = "Sangarius", nmitemid = 20611, points = 82.45 },
        [19] = { zonename = "Batallia Downs", nmhunt = "Lumber Jill", nmitem = "Grounded Mantle", nmitemid = 27601, points = 82.45 },
        [20] = { zonename = "Batallia Downs", nmhunt = "Cherufe", nmitem = "hagondes coat", nmitemid = 27916, points = 47.275 },
        [21] = { zonename = "Batallia Downs (S)", nmhunt = "Taweret", nmitem = "cizin greaves", nmitemid = 28332, points = 47.275 },
        [22] = { zonename = "Batallia Downs [S]", nmhunt = "Habergoass", nmitem = "Kyoshu Kyahan", nmitemid = 11405, points = 84 },
        [23] = { zonename = "Batallia Downs [S]", nmhunt = "Burlibix Brawnback", nmitem = "Sortie Ring", nmitemid = 15854, points = 87 },
        [24] = { zonename = "Batallia Downs [S]", nmhunt = "Chaneque", nmitem = "Birdbanes", nmitemid = 18767, points = 83 },
        [25] = { zonename = "Beaucedine Glacier", nmhunt = "Nue", nmitem = "Nue Fang", nmitemid = 1012, points = 76 },
        [26] = { zonename = "Beaucedine Glacier", nmhunt = "Kirata", nmitem = "Boreas Cesti", nmitemid = 18359, points = 68 },
        [27] = { zonename = "Beaucedine Glacier", nmhunt = "Largantua", nmitem = "Emet Harness", nmitemid = 26870, points = 82.45 },
        [28] = { zonename = "Beaucedine Glacier", nmhunt = "Largantua", nmitem = "Warders Charm", nmitemid = 27504, points = 82.45 },
        [29] = { zonename = "Beaucedine Glacier [S]", nmhunt = "Grand'Goule", nmitem = "Unshomaru", nmitemid = 18453, points = 88 },
        [30] = { zonename = "Beaucedine Glacier [S]", nmhunt = "Scylla", nmitem = "Papilio Kirpan", nmitemid = 19126, points = 89 },
        [31] = { zonename = "Behemoth's Dominion", nmhunt = "Pil", nmitem = "nehushtan", nmitemid = 21105, points = 58.9 },
        [32] = { zonename = "Behemoth's Dominion", nmhunt = "Sovereign Behemoth", nmitem = "Antitail", nmitemid = 22266, points = 84.15 },
        [33] = { zonename = "Behemoth's Dominion", nmhunt = "Sovereign Behemoth", nmitem = "Loricate Torque", nmitemid = 26001, points = 84.15 },
        [34] = { zonename = "Behemoth's Dominion", nmhunt = "Pil", nmitem = "Ilmr Earring", nmitemid = 26097, points = 58.9 },
        [35] = { zonename = "Behemoth's Dominion", nmhunt = "Sovereign Behemoth", nmitem = "Dominance Earring", nmitemid = 27542, points = 84.15 },
        [36] = { zonename = "Bhaflau Thickets", nmhunt = "Nis Puk", nmitem = "Tempest Belt", nmitemid = 15946, points = 87 },
        [37] = { zonename = "Bhaflau Thickets", nmhunt = "Mahishasura", nmitem = "Veuglaire", nmitemid = 19235, points = 88 },
        [38] = { zonename = "Bibiki Bay", nmhunt = "Splacknuck", nmitem = "Knack Pendant", nmitemid = 16298, points = 86 },
        [39] = { zonename = "Bibiki Bay", nmhunt = "Bismarck", nmitem = "iizamal", nmitemid = 20924, points = 58.125 },
        [40] = { zonename = "Bibiki Bay", nmhunt = "Intuila", nmitem = "Assiduity Pants", nmitemid = 28134, points = 80.75 },
        [41] = { zonename = "Bibiki Bay", nmhunt = "Intuila", nmitem = "Nourishing Earring", nmitemid = 28484, points = 80.75 },
        [42] = { zonename = "Bostaunieux Oubliette", nmhunt = "Garbage Gel", nmitem = "Gelatinous Ring", nmitemid = 10768, points = 81.6 },
        [43] = { zonename = "Bostaunieux Oubliette", nmhunt = "Bloodsucker", nmitem = "Bloodbead Ring", nmitemid = 13302, points = 82 },
        [44] = { zonename = "Bostaunieux Oubliette", nmhunt = "Sewer Syrup", nmitem = "Jelly Ring", nmitemid = 13303, points = 35 },
        [45] = { zonename = "Bostaunieux Oubliette", nmhunt = "Drexerion the Condemned", nmitem = "Shadow Mask", nmitemid = 13912, points = 157 },
        [46] = { zonename = "Bostaunieux Oubliette", nmhunt = "Phanduron the Condemned", nmitem = "Ascalon", nmitemid = 16943, points = 165 },
        [47] = { zonename = "Bostaunieux Oubliette", nmhunt = "Shii", nmitem = "Sukesada", nmitemid = 16980, points = 35 },
        [48] = { zonename = "Bostaunieux Oubliette", nmhunt = "Garbage Gel", nmitem = "Emeici", nmitemid = 20521, points = 81.6 },
        [49] = { zonename = "Buburimu Peninsula", nmhunt = "Abyssdiver", nmitem = "WingCutter", nmitemid = 21349, points = 80.75 },
        [50] = { zonename = "Buburimu Peninsula", nmhunt = "Botulus Rex", nmitem = "Telchine Cap", nmitemid = 26736, points = 49.6 },
        [51] = { zonename = "Buburimu Peninsula", nmhunt = "Botulus Rex", nmitem = "Telchine Chas.", nmitemid = 26894, points = 49.6 },
        [52] = { zonename = "Buburimu Peninsula", nmhunt = "Abyssdiver", nmitem = "Macabre Gauntlets", nmitemid = 27993, points = 80.75 },
        [53] = { zonename = "Caedarva Mire", nmhunt = "Aynu-kaysey", nmitem = "Cinquedea", nmitemid = 19123, points = 88 },
        [54] = { zonename = "Caedarva Mire", nmhunt = "Shedu", nmitem = "Flyssa", nmitemid = 20681, points = 84.15 },
        [55] = { zonename = "Caedarva Mire", nmhunt = "Shedu", nmitem = "Septoptic", nmitemid = 21075, points = 84.15 },
        [56] = { zonename = "Caedarva Mire", nmhunt = "Shedu", nmitem = "Tatenashi Gote", nmitemid = 27148, points = 84.15 },
        [57] = { zonename = "Caedarva Mire", nmhunt = "Brekekekex", nmitem = "otronif harness", nmitemid = 27913, points = 47.275 },
        [58] = { zonename = "Caedarva Mire", nmhunt = "Brekekekex", nmitem = "gendewitha galoshes", nmitemid = 28335, points = 47.275 },
        [59] = { zonename = "Cape Teriggan", nmhunt = "Killer Jonny", nmitem = "Fendoir", nmitemid = 17969, points = 89 },
        [60] = { zonename = "Cape Teriggan", nmhunt = "Kreutzet", nmitem = "Sirocco Kukri", nmitemid = 18018, points = 176.75 },
        [61] = { zonename = "Cape Teriggan", nmhunt = "Glazemane", nmitem = "Kustawi", nmitemid = 20580, points = 82.45 },
        [62] = { zonename = "Cape Teriggan", nmhunt = "Vedrfolnir", nmitem = "Jugo Kukri", nmitemid = 20608, points = 82.45 },
        [63] = { zonename = "Cape Teriggan", nmhunt = "Vedrfolnir", nmitem = "Marin Staff", nmitemid = 21159, points = 82.45 },
        [64] = { zonename = "Cape Teriggan", nmhunt = "Glazemane", nmitem = "Ushenzi", nmitemid = 21690, points = 82.45 },
        [65] = { zonename = "Carpenters Landing", nmhunt = "Mycophile", nmitem = "Mycophile Cuffs", nmitemid = 14884, points = 97.5 },
        [66] = { zonename = "Carpenters' Landing", nmhunt = "Orcfeltrap", nmitem = "Tancho", nmitemid = 20987, points = 80.75 },
        [67] = { zonename = "Carpenters' Landing", nmhunt = "Orcfeltrap", nmitem = "Shinjutsu-no-Obi", nmitemid = 28423, points = 80.75 },
        [68] = { zonename = "Castle Oztroja", nmhunt = "Mee Deggi the Punisher", nmitem = "Ochimusha Kote", nmitemid = 14986, points = 108 },
        [69] = { zonename = "Castle Oztroja", nmhunt = "Quu Domi the Gallant", nmitem = "Sarutobi Kyahan", nmitemid = 15737, points = 79 },
        [70] = { zonename = "Castle Oztroja", nmhunt = "Tzee Xicu the Manifest", nmitem = "Daylight Dagger", nmitemid = 17619, points = 161 },
        [71] = { zonename = "Castle Zvahl Baileys", nmhunt = "Marquis Sabnock", nmitem = "Astrolabe", nmitemid = 19239, points = 83 },
        [72] = { zonename = "Crawlers Nest", nmhunt = "Dynast Beetle", nmitem = "Dasra's Ring", nmitemid = 15853, points = 80 },
        [73] = { zonename = "Crawlers Nest [S]", nmhunt = "Lugh", nmitem = "Setanta's Ledelsens", nmitemid = 11410, points = 89 },
        [74] = { zonename = "Crawlers Nest [S]", nmhunt = "Morille Mortelle", nmitem = "Spurrer Beret", nmitemid = 11497, points = 109 },
        [75] = { zonename = "Crawlers' Nest", nmhunt = "Mellonia", nmitem = "iclamar", nmitemid = 20877, points = 58.125 },
        [76] = { zonename = "Crawlers' Nest (S)", nmhunt = "Nympha Eunomia", nmitem = "faizzeer", nmitemid = 20833, points = 58.125 },
        [77] = { zonename = "Dangruf Wadi", nmhunt = "Chocoboleech", nmitem = "Gassan", nmitemid = 18412, points = 45.5 },
        [78] = { zonename = "Dangruf Wadi", nmhunt = "Celaeno", nmitem = "nenekirimaru", nmitemid = 21037, points = 59.675 },
        [79] = { zonename = "Dangruf Wadi", nmhunt = "Celaeno", nmitem = "Bragi Earring", nmitemid = 26101, points = 59.675 },
        [80] = { zonename = "Den of Rancor", nmhunt = "Tonberry Tracker", nmitem = "Thiefs Kote", nmitemid = 12748, points = 90 },
        [81] = { zonename = "Den of Rancor", nmhunt = "Tawny-fingered Mugberry", nmitem = "Uggalepih Necklace", nmitemid = 13147, points = 35 },
        [82] = { zonename = "Den of Rancor", nmhunt = "Ogama", nmitem = "Amanojaku", nmitemid = 16911, points = 61.25 },
        [83] = { zonename = "Den of Rancor", nmhunt = "Celeste-eyed Tozberry", nmitem = "Kitsutsuki", nmitemid = 16912, points = 85 },
        [84] = { zonename = "Den of Rancor", nmhunt = "Carmine-tailed Janberry", nmitem = "Asklepios", nmitemid = 17454, points = 35 },
        [85] = { zonename = "Den of Rancor", nmhunt = "Bistre-hearted Malberry", nmitem = "Skirnir's Wand", nmitemid = 17455, points = 87 },
        [86] = { zonename = "Den of Rancor", nmhunt = "Azrael", nmitem = "Aizkora", nmitemid = 20851, points = 82.45 },
        [87] = { zonename = "Den of Rancor", nmhunt = "Azrael", nmitem = "Alhazen Hat", nmitemid = 26786, points = 82.45 },
        [88] = { zonename = "East Ronfaure", nmhunt = "Sarimanok", nmitem = "Cizin Helm", nmitemid = 27768, points = 47.275 },
        [89] = { zonename = "East Ronfaure", nmhunt = "Sarimanok", nmitem = "Otronif Gloves", nmitemid = 28052, points = 47.275 },
        [90] = { zonename = "East Ronfaure (S)", nmhunt = "Cottus", nmitem = "Cizin Mail", nmitemid = 27912, points = 47.275 },
        [91] = { zonename = "East Sarutabaruta", nmhunt = "Sharp-Eared Ropipi", nmitem = "Entrancing Ribbon", nmitemid = 15218, points = 35 },
        [92] = { zonename = "East Sarutabaruta", nmhunt = "RW NW Prt M Hrw", nmitem = "keraunos", nmitemid = 21169, points = 59.675 },
        [93] = { zonename = "East Sarutabaruta", nmhunt = "RW NW Prt M Hrw", nmitem = "Fulla Earring", nmitemid = 26106, points = 59.675 },
        [94] = { zonename = "Eastern Altepa Desert", nmhunt = "Centurio XII-I", nmitem = "Intruder Earring", nmitemid = 14806, points = 108 },
        [95] = { zonename = "Eastern Altepa Desert", nmhunt = "Cactrot Veloz", nmitem = "Mengado", nmitemid = 21222, points = 81.6 },
        [96] = { zonename = "Eastern Altepa Desert", nmhunt = "Cactrot Veloz", nmitem = "Arete del Luna", nmitemid = 28486, points = 81.6 },
        [97] = { zonename = "Fei'Yin", nmhunt = "Borealis Shadow", nmitem = "Fists of Fury", nmitemid = 20527, points = 82.45 },
        [98] = { zonename = "Fei'Yin", nmhunt = "Borealis Shadow", nmitem = "Beheader", nmitemid = 20853, points = 82.45 },
        [99] = { zonename = "Fei'Yin", nmhunt = "Borealis Shadow", nmitem = "Paloma Bow", nmitemid = 21219, points = 82.45 },
        [100] = { zonename = "Fei'Yin", nmhunt = "Carousing Celine", nmitem = "Gazu Bracelet", nmitemid = 27150, points = 82.45 },
        [101] = { zonename = "Fei'Yin", nmhunt = "Carousing Celine", nmitem = "Odnowa Earring", nmitemid = 27548, points = 82.45 },
        [102] = { zonename = "Fei'Yin", nmhunt = "Borealis Shadow", nmitem = "Deliverance", nmitemid = 27640, points = 82.45 },
        [103] = { zonename = "FeiYin", nmhunt = "Mind Hoarder", nmitem = "Lleu's Charm", nmitemid = 16299, points = 109 },
        [104] = { zonename = "FeiYin", nmhunt = "Eastern Shadow", nmitem = "Vali's Bow", nmitemid = 18714, points = 109 },
        [105] = { zonename = "FeiYin", nmhunt = "Western Shadow", nmitem = "Retaliators", nmitemid = 18752, points = 105 },
        [106] = { zonename = "Fort Ghelsba", nmhunt = "Kegpaunch Doshgnosh", nmitem = "Frugal Cape", nmitemid = 11529, points = 73 },
        [107] = { zonename = "Fort Ghelsba", nmhunt = "Chariotbuster Byakzak", nmitem = "Auriga Xiphos", nmitemid = 17708, points = 138.25 },
        [108] = { zonename = "Fort Karugo-Narugo (S)", nmhunt = "Kalasutrax", nmitem = "Taeon Chapeau", nmitemid = 26735, points = 49.6 },
        [109] = { zonename = "Fort Karugo-Narugo (S)", nmhunt = "Kalasutrax", nmitem = "Taeon Tabard", nmitemid = 26893, points = 49.6 },
        [110] = { zonename = "Garlaige Citadel", nmhunt = "Hazmat", nmitem = "Promptitude Solea", nmitemid = 11404, points = 79 },
        [111] = { zonename = "Garlaige Citadel", nmhunt = "Frogamander", nmitem = "Selemnus Belt", nmitemid = 15944, points = 82 },
        [112] = { zonename = "Garlaige Citadel", nmhunt = "Hovering Hotpot", nmitem = "Sleight Kukri", nmitemid = 19121, points = 84 },
        [113] = { zonename = "Garlaige Citadel", nmhunt = "Mephitas", nmitem = "Ternion Dagger", nmitemid = 20603, points = 82.45 },
        [114] = { zonename = "Garlaige Citadel", nmhunt = "Roly-Poly", nmitem = "aedold", nmitemid = 21132, points = 58.125 },
        [115] = { zonename = "Garlaige Citadel", nmhunt = "Mephitas", nmitem = "Mephitass Ring", nmitemid = 27558, points = 82.45 },
        [116] = { zonename = "Garlaige Citadel (S)", nmhunt = "Laidly Laurence", nmitem = "kannakiri", nmitemid = 21013, points = 58.125 },
        [117] = { zonename = "Garlaige Citadel [S]", nmhunt = "Buarainech", nmitem = "Shrewd Pumps", nmitemid = 11411, points = 88 },
        [118] = { zonename = "Garlaige Citadel [S]", nmhunt = "Elatha", nmitem = "Bricta's Cuffs", nmitemid = 15057, points = 88 },
        [119] = { zonename = "Giddeus", nmhunt = "Eyy Mon the Ironbreaker", nmitem = "Aspir Knife", nmitemid = 16509, points = 35 },
        [120] = { zonename = "Grauberg (S)", nmhunt = "Ocythoe", nmitem = "Helios Band", nmitemid = 26737, points = 49.6 },
        [121] = { zonename = "Grauberg (S)", nmhunt = "Ocythoe", nmitem = "Helios Jacket", nmitemid = 26895, points = 49.6 },
        [122] = { zonename = "Grauberg [S]", nmhunt = "Sarcopsylla", nmitem = "Morana's Pigaches", nmitemid = 11408, points = 90 },
        [123] = { zonename = "Grauberg [S]", nmhunt = "Kotan-kor Kamuy", nmitem = "Cradle Horn", nmitemid = 17854, points = 88 },
        [124] = { zonename = "Grauberg [S]", nmhunt = "Vasiliceratops", nmitem = "Lyft Voulge", nmitemid = 18508, points = 114 },
        [125] = { zonename = "Gusgen Mines", nmhunt = "Lorbulcrud", nmitem = "Leisilonu", nmitemid = 20641, points = 48.05 },
        [126] = { zonename = "Gusgen Mines", nmhunt = "Lorbulcrud", nmitem = "beatific shield", nmitemid = 28662, points = 48.05 },
        [127] = { zonename = "Gustav Tunnel", nmhunt = "Goblinsavior Heronox", nmitem = "Eisentaenzer", nmitemid = 16727, points = 79 },
        [128] = { zonename = "Gustav Tunnel", nmhunt = "Amikiri", nmitem = "Kamewari", nmitemid = 16968, points = 41 },
        [129] = { zonename = "Gustav Tunnel", nmhunt = "Wyvernpoacher Drachlox", nmitem = "Othinus' Bow", nmitemid = 17244, points = 120 },
        [130] = { zonename = "Gustav Tunnel", nmhunt = "Taxim", nmitem = "Cocytus Pole", nmitemid = 17564, points = 83 },
        [131] = { zonename = "Gustav Tunnel", nmhunt = "Ungur", nmitem = "Ungur Boomerang", nmitemid = 18141, points = 41 },
        [132] = { zonename = "Gustav Tunnel", nmhunt = "Wyvernhunter Bambrox", nmitem = "Pixquizpan", nmitemid = 21805, points = 82.45 },
        [133] = { zonename = "Gustav Tunnel", nmhunt = "Wyvernhunter Bambrox", nmitem = "Imati", nmitemid = 22120, points = 82.45 },
        [134] = { zonename = "Halvung", nmhunt = "Copper Borer", nmitem = "Wayang Kulit Mantle", nmitemid = 11536, points = 154 },
        [135] = { zonename = "Halvung", nmhunt = "Farlarder the Shrewd", nmitem = "Mercenary's Subligar", nmitemid = 15624, points = 84 },
        [136] = { zonename = "Halvung", nmhunt = "Gurfurlur the Menacing", nmitem = "Mercenary's Ring", nmitemid = 15792, points = 150.5 },
        [137] = { zonename = "Halvung", nmhunt = "Mythril Mouth Monamaq", nmitem = "Volunteer's Earring", nmitemid = 15984, points = 84 },
        [138] = { zonename = "Halvung", nmhunt = "Dorgerwor the Astute", nmitem = "Mercenary's Mantle", nmitemid = 16222, points = 278.25 },
        [139] = { zonename = "Ifrit's Cauldron", nmhunt = "Coca", nmitem = "Gae Derg", nmitemid = 20942, points = 82.45 },
        [140] = { zonename = "Ifrit's Cauldron", nmhunt = "Coca", nmitem = "Ajax", nmitemid = 27638, points = 82.45 },
        [141] = { zonename = "Ifrit's Cauldron", nmhunt = "Ildebrann", nmitem = "hagondes pants", nmitemid = 28196, points = 47.275 },
        [142] = { zonename = "Ifrits Cauldron", nmhunt = "Bomb Queen", nmitem = "Avengers", nmitemid = 16426, points = 154 },
        [143] = { zonename = "Ifrits Cauldron", nmhunt = "Vouivre", nmitem = "Gae Bolg", nmitemid = 16885, points = 35 },
        [144] = { zonename = "Ifrits Cauldron", nmhunt = "Foreseer Oramix", nmitem = "Power Staff", nmitemid = 17563, points = 82 },
        [145] = { zonename = "Ifrits Cauldron", nmhunt = "Tyrannic Tunnok", nmitem = "Lohar", nmitemid = 17927, points = 35 },
        [146] = { zonename = "Ifrits Cauldron", nmhunt = "Lindwurm", nmitem = "Valiant Knife", nmitemid = 17983, points = 87 },
        [147] = { zonename = "Ifrits Cauldron", nmhunt = "Tarasque", nmitem = "Ascention", nmitemid = 18042, points = 111.8 },
        [148] = { zonename = "Inner Horutoto Ruins", nmhunt = "Maltha", nmitem = "Trailer's Tunica", nmitemid = 14464, points = 64 },
        [149] = { zonename = "Jugner Forest", nmhunt = "King Arthro", nmitem = "Velocious Belt", nmitemid = 15899, points = 162 },
        [150] = { zonename = "Jugner Forest", nmhunt = "Meteormauler Zhagtegg", nmitem = "Garde Pick", nmitemid = 17947, points = 105 },
        [151] = { zonename = "Jugner Forest", nmhunt = "Belphoebe", nmitem = "macbain", nmitemid = 20759, points = 58.9 },
        [152] = { zonename = "Jugner Forest", nmhunt = "Belphoebe", nmitem = "Foresti Earring", nmitemid = 26091, points = 58.9 },
        [153] = { zonename = "Jugner Forest", nmhunt = "Emperor Arthro", nmitem = "Augury Cuisses", nmitemid = 28136, points = 81.6 },
        [154] = { zonename = "Jugner Forest", nmhunt = "Emperor Arthro", nmitem = "Sailfi Belt", nmitemid = 28427, points = 81.6 },
        [155] = { zonename = "Jugner Forest (S)", nmhunt = "Kholomodumo", nmitem = "inanna", nmitemid = 20901, points = 58.9 },
        [156] = { zonename = "Jugner Forest (S)", nmhunt = "Kholomodumo", nmitem = "inanna", nmitemid = 20901, points = 58.9 },
        [157] = { zonename = "Jugner Forest [S]", nmhunt = "Boll Weevil", nmitem = "Nasatya's Ring", nmitemid = 15852, points = 87 },
        [158] = { zonename = "Jugner Forest [S]", nmhunt = "Voirloup", nmitem = "Lyft Sainti", nmitemid = 18771, points = 89 },
        [159] = { zonename = "King Ranperre's Tomb", nmhunt = "Hahava", nmitem = "izuna", nmitemid = 20989, points = 59.675 },
        [160] = { zonename = "King Ranperre's Tomb", nmhunt = "Hahava", nmitem = "Dellingr Earring", nmitemid = 26103, points = 59.675 },
        [161] = { zonename = "King Ranperres Tomb", nmhunt = "Gwyllgi", nmitem = "Gosha Sarashi", nmitemid = 15940, points = 74 },
        [162] = { zonename = "Konschtat Highlands", nmhunt = "Haty", nmitem = "Rogetsurin", nmitemid = 18246, points = 134.75 },
        [163] = { zonename = "Konschtat Highlands", nmhunt = "Bendigeit Vran", nmitem = "Rogetsurin", nmitemid = 18246, points = 134.75 },
        [164] = { zonename = "Konschtat Highlands", nmhunt = "Sleepy Mabel", nmitem = "Damani Horn", nmitemid = 21402, points = 77.35 },
        [165] = { zonename = "Konschtat Highlands", nmhunt = "Gwynn Ap Nudd", nmitem = "Yorium Cuisses", nmitemid = 27232, points = 68.2 },
        [166] = { zonename = "Konschtat Highlands", nmhunt = "Gwynn Ap Nudd", nmitem = "Acro Breeches", nmitemid = 27233, points = 68.2 },
        [167] = { zonename = "Konschtat Highlands", nmhunt = "Gwynn Ap Nudd", nmitem = "Taeon Tights", nmitemid = 27234, points = 68.2 },
        [168] = { zonename = "Konschtat Highlands", nmhunt = "Gwynn Ap Nudd", nmitem = "Telchine Braconi", nmitemid = 27235, points = 68.2 },
        [169] = { zonename = "Konschtat Highlands", nmhunt = "Gwynn Ap Nudd", nmitem = "Helios Spats", nmitemid = 27236, points = 68.2 },
        [170] = { zonename = "Konschtat Highlands", nmhunt = "Sleepy Mabel", nmitem = "Acipayam Belt", nmitemid = 28426, points = 77.35 },
        [171] = { zonename = "Konschtat Highlands", nmhunt = "Sleepy Mabel", nmitem = "Mouflon Ring", nmitemid = 28533, points = 77.35 },
        [172] = { zonename = "Korroloka Tunnel", nmhunt = "Cargo Crab Colin", nmitem = "Nadrs", nmitemid = 17650, points = 104 },
        [173] = { zonename = "Korroloka Tunnel", nmhunt = "Falcatus Aranei", nmitem = "Webcutter", nmitemid = 18040, points = 74 },
        [174] = { zonename = "Kuftal Tunnel", nmhunt = "Pelican", nmitem = "Astral Aspis", nmitemid = 12382, points = 35 },
        [175] = { zonename = "Kuftal Tunnel", nmhunt = "Cancer", nmitem = "Arondight", nmitemid = 16945, points = 115.7 },
        [176] = { zonename = "Kuftal Tunnel", nmhunt = "Bloodthirster Madkix", nmitem = "Acha d'Armas", nmitemid = 17926, points = 107 },
        [177] = { zonename = "Kuftal Tunnel", nmhunt = "Sabotender Mariachi", nmitem = "Bano del Sol", nmitemid = 17981, points = 85 },
        [178] = { zonename = "Kuftal Tunnel", nmhunt = "Specter Worm", nmitem = "Ghastly Tathlum", nmitemid = 21343, points = 82.45 },
        [179] = { zonename = "Kuftal Tunnel", nmhunt = "Specter Worm", nmitem = "Kladenets", nmitemid = 21702, points = 82.45 },
        [180] = { zonename = "Kuftal Tunnel", nmhunt = "Tangaroa", nmitem = "hagondes cuffs", nmitemid = 28055, points = 47.275 },
        [181] = { zonename = "La Theine Plateau", nmhunt = "Nihniknoovi", nmitem = "Van Pendant", nmitemid = 15503, points = 61.25 },
        [182] = { zonename = "La Theine Plateau", nmhunt = "Stachysaurus", nmitem = "Yorium Gauntlets", nmitemid = 27045, points = 68.2 },
        [183] = { zonename = "La Theine Plateau", nmhunt = "Stachysaurus", nmitem = "Acro Gauntlets", nmitemid = 27046, points = 68.2 },
        [184] = { zonename = "La Theine Plateau", nmhunt = "Stachysaurus", nmitem = "Taeon Gloves", nmitemid = 27047, points = 68.2 },
        [185] = { zonename = "La Theine Plateau", nmhunt = "Stachysaurus", nmitem = "Telchine Gloves", nmitemid = 27048, points = 68.2 },
        [186] = { zonename = "La Theine Plateau", nmhunt = "Stachysaurus", nmitem = "Helios Gloves", nmitemid = 27049, points = 68.2 },
        [187] = { zonename = "La Theine Plateau", nmhunt = "Ironhorn Baldurno", nmitem = "Bleating Mantle", nmitemid = 27600, points = 77.35 },
        [188] = { zonename = "La Theine Plateau", nmhunt = "Ironhorn Baldurno", nmitem = "Thorfinn Shield", nmitemid = 27633, points = 77.35 },
        [189] = { zonename = "La Theine Plateau", nmhunt = "Ironhorn Baldurno", nmitem = "Grit Earring", nmitemid = 28489, points = 77.35 },
        [190] = { zonename = "Labyrinth of Onzozo", nmhunt = "Ose", nmitem = "Assault Jerkin", nmitemid = 13805, points = 120 },
        [191] = { zonename = "Labyrinth of Onzozo", nmhunt = "Mysticmaker Profblix", nmitem = "Moldavite Earring", nmitemid = 14724, points = 78 },
        [192] = { zonename = "Labyrinth of Onzozo", nmhunt = "Peg Powler", nmitem = "Schwarz Axt", nmitemid = 16728, points = 87 },
        [193] = { zonename = "Labyrinth of Onzozo", nmhunt = "Lord of Onzozo", nmitem = "Kraken Club", nmitemid = 17440, points = 94 },
        [194] = { zonename = "Labyrinth of Onzozo", nmhunt = "Soulstealer Skullnix", nmitem = "Kard", nmitemid = 17982, points = 82 },
        [195] = { zonename = "Labyrinth of Onzozo", nmhunt = "Hellion", nmitem = "A l'Outrance", nmitemid = 18041, points = 35 },
        [196] = { zonename = "Labyrinth of Onzozo", nmhunt = "Voso", nmitem = "Refined Grip", nmitemid = 21416, points = 81.6 },
        [197] = { zonename = "Labyrinth of Onzozo", nmhunt = "Voso", nmitem = "Agony Jerkin", nmitemid = 26942, points = 81.6 },
        [198] = { zonename = "Lower Delkfutt's Tower", nmhunt = "Akvan", nmitem = "Vor Earring", nmitemid = 26096, points = 58.9 },
        [199] = { zonename = "Lufaise Meadows", nmhunt = "Vermillion Fishfly", nmitem = "Cacoethic Ring", nmitemid = 10770, points = 82.45 },
        [200] = { zonename = "Lufaise Meadows", nmhunt = "Kurrea", nmitem = "Galliard Trousers", nmitemid = 15425, points = 52.5 },
        [201] = { zonename = "Lufaise Meadows", nmhunt = "Vermillion Fishfly", nmitem = "Blistering Sallet", nmitemid = 25601, points = 82.45 },
        [202] = { zonename = "Lufaise Meadows", nmhunt = "Immanibugard", nmitem = "Hippomenes Socks", nmitemid = 27409, points = 80.75 },
        [203] = { zonename = "Lufaise Meadows", nmhunt = "Immanibugard", nmitem = "Apeile Ring", nmitemid = 27560, points = 80.75 },
        [204] = { zonename = "Lufaise Meadows", nmhunt = "Abununnu", nmitem = "iuitl wristbands", nmitemid = 28053, points = 47.275 },
        [205] = { zonename = "Mamook", nmhunt = "Dragonscaled Bugaal Ja", nmitem = "Beast Bazubands", nmitemid = 14958, points = 159 },
        [206] = { zonename = "Mamook", nmhunt = "Darting Kachaal Ja", nmitem = "Volunteer's Belt", nmitemid = 15898, points = 159 },
        [207] = { zonename = "Mamook", nmhunt = "Devout Radol Ja", nmitem = "Volunteer's Khud", nmitemid = 16082, points = 159 },
        [208] = { zonename = "Mamook", nmhunt = "Hundredfaced Hapool Ja", nmitem = "Ryumon", nmitemid = 18422, points = 159 },
        [209] = { zonename = "Mamook", nmhunt = "Yalungur", nmitem = "gendewitha spats", nmitemid = 28195, points = 47.275 },
        [210] = { zonename = "Maze of Shakhrami", nmhunt = "Argus", nmitem = "Peacock Amulet", nmitemid = 15515, points = 67 },
        [211] = { zonename = "Maze of Shakhrami", nmhunt = "Ogbunabali", nmitem = "Iztaasu", nmitemid = 20742, points = 58.125 },
        [212] = { zonename = "Meriphataud Mountains", nmhunt = "Coo Keja the Unseen", nmitem = "Ajase Beads", nmitemid = 15504, points = 104 },
        [213] = { zonename = "Meriphataud Mountains", nmhunt = "Lord Asag", nmitem = "kumbhakarna", nmitemid = 20809, points = 58.9 },
        [214] = { zonename = "Meriphataud Mountains", nmhunt = "Lord Asag", nmitem = "Saxnot Earring", nmitemid = 26093, points = 58.9 },
        [215] = { zonename = "Meriphataud Mountains", nmhunt = "Warblade Beak", nmitem = "Shigure Tekko", nmitemid = 27995, points = 81.6 },
        [216] = { zonename = "Meriphataud Mountains", nmhunt = "Warblade Beak", nmitem = "Handlers Earring", nmitemid = 28490, points = 81.6 },
        [217] = { zonename = "Meriphataud Mountains (S)", nmhunt = "Akupara", nmitem = "svarga", nmitemid = 20857, points = 58.9 },
        [218] = { zonename = "Meriphataud Mountains (S)", nmhunt = "Akupara", nmitem = "Meili Earring", nmitemid = 26098, points = 58.9 },
        [219] = { zonename = "Meriphataud Mountains [S]", nmhunt = "Bloodlapper", nmitem = "Vicious Mufflers", nmitemid = 15013, points = 109.2 },
        [220] = { zonename = "Meriphataud Mountains [S]", nmhunt = "Centipedal Centruroides", nmitem = "Lyft Tabar", nmitemid = 17970, points = 88 },
        [221] = { zonename = "Meriphataud Mountains [S]", nmhunt = "Hemodrosophila", nmitem = "Atesh Pole", nmitemid = 18608, points = 89 },
        [222] = { zonename = "Misareaux Coast", nmhunt = "Goaftrap", nmitem = "Altdorf's Earring", nmitemid = 16035, points = 86 },
        [223] = { zonename = "Misareaux Coast", nmhunt = "Okyupete", nmitem = "Shepherd's Chain", nmitemid = 16297, points = 88 },
        [224] = { zonename = "Misareaux Coast", nmhunt = "Volatile Cluster", nmitem = "Norifusa", nmitemid = 21029, points = 82.45 },
        [225] = { zonename = "Misareaux Coast", nmhunt = "Tiyanak", nmitem = "Lugra Cloak", nmitemid = 26896, points = 81.6 },
        [226] = { zonename = "Misareaux Coast", nmhunt = "Volatile Cluster", nmitem = "Aurists Cape", nmitemid = 27619, points = 82.45 },
        [227] = { zonename = "Misareaux Coast", nmhunt = "Tsui-Goab", nmitem = "otronif boots", nmitemid = 28333, points = 47.275 },
        [228] = { zonename = "Misareaux Coast", nmhunt = "Tiyanak", nmitem = "Lugra Earring", nmitemid = 28481, points = 81.6 },
        [229] = { zonename = "Monastic Cavern", nmhunt = "Overlord Bakgodek", nmitem = "Nightmare Sword", nmitemid = 17649, points = 182 },
        [230] = { zonename = "Monastic Cavern", nmhunt = "Orcish Overlord", nmitem = "Nightmare Sword", nmitemid = 17649, points = 102 },
        [231] = { zonename = "Mount Zhayolm", nmhunt = "Cerberus", nmitem = "Algol", nmitemid = 18385, points = 152 },
        [232] = { zonename = "Mount Zhayolm", nmhunt = "Fahrafahr the Bloodied", nmitem = "Lyft Ferule", nmitemid = 18872, points = 154 },
        [233] = { zonename = "Mount Zhayolm", nmhunt = "Ignamoth", nmitem = "Octant", nmitemid = 19232, points = 88 },
        [234] = { zonename = "Mount Zhayolm", nmhunt = "Sarama", nmitem = "Tanmogayi", nmitemid = 20679, points = 84.15 },
        [235] = { zonename = "Mount Zhayolm", nmhunt = "Grand Grenade", nmitem = "Loxotic Mace", nmitemid = 21090, points = 82.45 },
        [236] = { zonename = "Mount Zhayolm", nmhunt = "Sarama", nmitem = "Montante", nmitemid = 21688, points = 84.15 },
        [237] = { zonename = "Mount Zhayolm", nmhunt = "Grand Grenade", nmitem = "Seething Bomblet", nmitemid = 22254, points = 82.45 },
        [238] = { zonename = "Mount Zhayolm", nmhunt = "Sarama", nmitem = "Tatenashi Haidate", nmitemid = 25855, points = 84.15 },
        [239] = { zonename = "Mount Zhayolm", nmhunt = "Vanasarvik", nmitem = "gendewitha caubeen", nmitemid = 27771, points = 47.275 },
        [240] = { zonename = "Newton Movalpolos", nmhunt = "Goblin Collector", nmitem = "Barbarian Mittens", nmitemid = 14889, points = 132 },
        [241] = { zonename = "Newton Movalpolos", nmhunt = "Bugbear Matman", nmitem = "Rutter Sabatons", nmitemid = 15349, points = 145.25 },
        [242] = { zonename = "North Gustaberg", nmhunt = "Maighdean Uaine", nmitem = "Optical Earring", nmitemid = 14803, points = 35 },
        [243] = { zonename = "North Gustaberg", nmhunt = "Sallow Seymour", nmitem = "Cizin Breeches", nmitemid = 28192, points = 47.275 },
        [244] = { zonename = "North Gustaberg (S)", nmhunt = "Ushumgal", nmitem = "Cizin Greaves", nmitemid = 28332, points = 47.275 },
        [245] = { zonename = "North Gustaberg [S]", nmhunt = "Ankabut", nmitem = "Tsugumi", nmitemid = 19277, points = 82 },
        [246] = { zonename = "Oldton Movalpolos", nmhunt = "Goblin Wolfman", nmitem = "Parade Gorget", nmitemid = 15506, points = 118.5 },
        [247] = { zonename = "Ordelle's Caves", nmhunt = "Krabimanjaro", nmitem = "ninzas", nmitemid = 20553, points = 58.125 },
        [248] = { zonename = "Ordelle's Caves", nmhunt = "Krabimanjaro", nmitem = "Lehbrailg", nmitemid = 21208, points = 58.125 },
        [249] = { zonename = "Outer Horutoto Ruins", nmhunt = "Desmodont", nmitem = "Fidelity Mantle", nmitemid = 11531, points = 73 },
        [250] = { zonename = "Outer Horutoto Ruins", nmhunt = "Voidwrought", nmitem = "Gersemi Earring", nmitemid = 26102, points = 59.675 },
        [251] = { zonename = "Outer Horutoto Ruins", nmhunt = "Voidwrought", nmitem = "svalinn", nmitemid = 27627, points = 59.675 },
        [252] = { zonename = "Pashhow Marshlands", nmhunt = "Bo'Who Warmonger", nmitem = "Tortoise Shield", nmitemid = 12374, points = 104 },
        [253] = { zonename = "Pashhow Marshlands", nmhunt = "Murk-Veined Baneberry", nmitem = "Ohrmazd", nmitemid = 20530, points = 58.9 },
        [254] = { zonename = "Pashhow Marshlands", nmhunt = "Murk-Veined Baneberry", nmitem = "Hretha Earring", nmitemid = 26092, points = 58.9 },
        [255] = { zonename = "Pashhow Marshlands", nmhunt = "Joyous Green", nmitem = "Canto Necklace", nmitemid = 28352, points = 81.6 },
        [256] = { zonename = "Pashhow Marshlands", nmhunt = "Joyous Green", nmitem = "Acuity Belt", nmitemid = 28429, points = 81.6 },
        [257] = { zonename = "Pashhow Marshlands (S)", nmhunt = "Melancholic Moira", nmitem = "Ipetam", nmitemid = 20616, points = 58.9 },
        [258] = { zonename = "Pashhow Marshlands (S)", nmhunt = "Melancholic Moira", nmitem = "Ran Earring", nmitemid = 26089, points = 58.9 },
        [259] = { zonename = "Pashhow Marshlands [S]", nmhunt = "Sugaar", nmitem = "Aoide's Pumps", nmitemid = 11409, points = 84 },
        [260] = { zonename = "Pashhow Marshlands [S]", nmhunt = "Kinepikwa", nmitem = "Taster's Cape", nmitemid = 16238, points = 113.1 },
        [261] = { zonename = "Pashhow Marshlands [S]", nmhunt = "Nommo", nmitem = "Lyft Lance", nmitemid = 19306, points = 89 },
        [262] = { zonename = "Phomiuna Aqueducts", nmhunt = "Eba", nmitem = "Fomor Tunic", nmitemid = 14466, points = 106 },
        [263] = { zonename = "Phomiuna Aqueducts", nmhunt = "Mahisha", nmitem = "Sinister Mask", nmitemid = 15219, points = 115 },
        [264] = { zonename = "Phomiuna Aqueducts", nmhunt = "Tres Duendes", nmitem = "Vampiric Claws", nmitemid = 17510, points = 144 },
        [265] = { zonename = "Phomiuna Aqueducts", nmhunt = "Tres Duendes", nmitem = "Niokiyotsuna", nmitemid = 17794, points = 144 },
        [266] = { zonename = "Phomiuna Aqueducts", nmhunt = "Tres Duendes", nmitem = "Chiroptera Dagger", nmitemid = 18007, points = 144 },
        [267] = { zonename = "Purgonorgo Island", nmhunt = "Shen", nmitem = "Reverend Mail", nmitemid = 14469, points = 164.5 },
        [268] = { zonename = "Purgonorgo Island", nmhunt = "Shankha", nmitem = "Adoubeur's Pavise", nmitemid = 16187, points = 82 },
        [269] = { zonename = "Qufim Island", nmhunt = "Jester Malatrix", nmitem = "Buramgh", nmitemid = 20806, points = 80.75 },
        [270] = { zonename = "Qufim Island", nmhunt = "Kaggen", nmitem = "Mimir Earring", nmitemid = 26095, points = 58.9 },
        [271] = { zonename = "Qufim Island", nmhunt = "Jester Malatrix", nmitem = "Evalach", nmitemid = 27636, points = 80.75 },
        [272] = { zonename = "Quicksand Caves", nmhunt = "Centurio X-I", nmitem = "Shaman's Cloak", nmitemid = 13803, points = 104 },
        [273] = { zonename = "Quicksand Caves", nmhunt = "Diamond Daig", nmitem = "Protecting Bangles", nmitemid = 14063, points = 35 },
        [274] = { zonename = "Quicksand Caves", nmhunt = "Nussknacker", nmitem = "Sand Gloves", nmitemid = 14064, points = 147 },
        [275] = { zonename = "Quicksand Caves", nmhunt = "Sabotender Bailarina", nmitem = "Dune Boots", nmitemid = 14168, points = 35 },
        [276] = { zonename = "Quicksand Caves", nmhunt = "Triarius X-XV", nmitem = "Pendragon Axe", nmitemid = 16734, points = 82 },
        [277] = { zonename = "Quicksand Caves", nmhunt = "Sagittarius X-XIII", nmitem = "Loxley Bow", nmitemid = 17199, points = 71 },
        [278] = { zonename = "Quicksand Caves", nmhunt = "Proconsul XII", nmitem = "Dainslaif", nmitemid = 17651, points = 82 },
        [279] = { zonename = "Quicksand Caves", nmhunt = "Tribunus VII-I", nmitem = "Tungi", nmitemid = 17924, points = 80 },
        [280] = { zonename = "Quicksand Caves", nmhunt = "Centurio XX-I", nmitem = "Cohort Cloak", nmitemid = 25680, points = 82.45 },
        [281] = { zonename = "Quicksand Caves", nmhunt = "Malleator Maurok", nmitem = "iuitl tights", nmitemid = 28194, points = 47.275 },
        [282] = { zonename = "Quicksand Caves", nmhunt = "Centurio XX-I", nmitem = "Kentarch Belt", nmitemid = 28412, points = 82.45 },
        [283] = { zonename = "Ranguemont Pass", nmhunt = "Taisaijin", nmitem = "Spelunker's Hat", nmitemid = 15222, points = 163 },
        [284] = { zonename = "Ranguemont Pass", nmhunt = "Gloom Eye", nmitem = "Wit Pendant", nmitemid = 16300, points = 82 },
        [285] = { zonename = "Riverne-Site A01", nmhunt = "Carmine Dobsonfly", nmitem = "Jaeger Ring", nmitemid = 14669, points = 152 },
        [286] = { zonename = "Riverne-Site A01", nmhunt = "Carmine Dobsonfly", nmitem = "Dobson Bandana", nmitemid = 15183, points = 84 },
        [287] = { zonename = "Riverne-Site A01", nmhunt = "Carmine Dobsonfly", nmitem = "Voyager Sallet", nmitemid = 15184, points = 156 },
        [288] = { zonename = "Riverne-Site B00", nmhunt = "Boroka", nmitem = "Auditory Torque", nmitemid = 13178, points = 147 },
        [289] = { zonename = "Riverne-Site B01", nmhunt = "Boroka", nmitem = "Boroka Earring", nmitemid = 14763, points = 147 },
        [290] = { zonename = "Riverne-Site B01", nmhunt = "Unstable Cluster", nmitem = "Soboro Sukehiro", nmitemid = 17813, points = 102.7 },
        [291] = { zonename = "Ro'Maeve", nmhunt = "Rogue Receptacle", nmitem = "Lyricist's Gonnelle", nmitemid = 11533, points = 110 },
        [292] = { zonename = "Ro'Maeve", nmhunt = "Shikigami Weapon", nmitem = "Yinyang Robe", nmitemid = 14468, points = 113 },
        [293] = { zonename = "Ro'Maeve", nmhunt = "Mimic King", nmitem = "qatsunoci", nmitemid = 20967, points = 58.125 },
        [294] = { zonename = "Ro'Maeve", nmhunt = "Douma Weapon", nmitem = "Rigorous Grip", nmitemid = 21418, points = 82.45 },
        [295] = { zonename = "Ro'Maeve", nmhunt = "Douma Weapon", nmitem = "Shomonjijoe", nmitemid = 26887, points = 82.45 },
        [296] = { zonename = "Rolanberry Fields", nmhunt = "Simurgh", nmitem = "Trotter Boots", nmitemid = 15736, points = 79 },
        [297] = { zonename = "Rolanberry Fields", nmhunt = "Eldritch Edge", nmitem = "Helenus's Earring", nmitemid = 16037, points = 79 },
        [298] = { zonename = "Rolanberry Fields", nmhunt = "Strix", nmitem = "Magesmasher", nmitemid = 21099, points = 82.45 },
        [299] = { zonename = "Rolanberry Fields", nmhunt = "Yatagarasu", nmitem = "iuitl vest", nmitemid = 27914, points = 47.275 },
        [300] = { zonename = "Rolanberry Fields", nmhunt = "Strix", nmitem = "Jute Boots", nmitemid = 28275, points = 82.45 },
        [301] = { zonename = "Rolanberry Fields (S)", nmhunt = "Agathos", nmitem = "gendewitha spats", nmitemid = 28195, points = 47.275 },
        [302] = { zonename = "Rolanberry Fields [S]", nmhunt = "Delicieuse Delphine", nmitem = "Stimulus Sabots", nmitemid = 11406, points = 86 },
        [303] = { zonename = "Rolanberry Fields [S]", nmhunt = "Lamina", nmitem = "Kusha's Ring", nmitemid = 15851, points = 87 },
        [304] = { zonename = "Rolanberry Fields [S]", nmhunt = "Erle", nmitem = "Courser's Pugio", nmitemid = 19122, points = 84 },
        [305] = { zonename = "Ru'Aun Gardens", nmhunt = "Aello", nmitem = "olyndicus", nmitemid = 20946, points = 58.9 },
        [306] = { zonename = "Ru'Aun Gardens", nmhunt = "Aello", nmitem = "Mani Earring", nmitemid = 26094, points = 58.9 },
        [307] = { zonename = "Sauromugue Champaign", nmhunt = "Blighting Brand", nmitem = "Cassandra's Earring", nmitemid = 16038, points = 79 },
        [308] = { zonename = "Sauromugue Champaign", nmhunt = "Roc", nmitem = "Dryad Staff", nmitemid = 18587, points = 154 },
        [309] = { zonename = "Sauromugue Champaign", nmhunt = "Arke", nmitem = "Pukulatmuj", nmitemid = 20613, points = 82.45 },
        [310] = { zonename = "Sauromugue Champaign", nmhunt = "Arke", nmitem = "Ababinili", nmitemid = 21164, points = 82.45 },
        [311] = { zonename = "Sauromugue Champaign", nmhunt = "Goji", nmitem = "Iuitl headgear", nmitemid = 27770, points = 47.275 },
        [312] = { zonename = "Sauromugue Champaign (S)", nmhunt = "Gugalanna", nmitem = "iuitl tights", nmitemid = 28194, points = 47.275 },
        [313] = { zonename = "Sauromugue Champaign [S]", nmhunt = "Hyakinthos", nmitem = "Lava's Ring", nmitemid = 15850, points = 87 },
        [314] = { zonename = "Sea Serpent Grotto", nmhunt = "Fyuu the Seabellow", nmitem = "Frog Trousers", nmitemid = 14286, points = 77 },
        [315] = { zonename = "Sea Serpent Grotto", nmhunt = "Pahh the Gullcaller", nmitem = "Calamar", nmitemid = 16882, points = 71 },
        [316] = { zonename = "Sea Serpent Grotto", nmhunt = "Zuug the Shoreleaper", nmitem = "Narval", nmitemid = 16884, points = 82 },
        [317] = { zonename = "Sea Serpent Grotto", nmhunt = "Qull the Shellbuster", nmitem = "Exocets", nmitemid = 17503, points = 78 },
        [318] = { zonename = "Sea Serpent Grotto", nmhunt = "Worr the Clawfisted", nmitem = "Pagures", nmitemid = 17504, points = 80 },
        [319] = { zonename = "Sea Serpent Grotto", nmhunt = "Charybdis", nmitem = "Joyeuse", nmitemid = 17652, points = 53 },
        [320] = { zonename = "Sea Serpent Grotto", nmhunt = "Bakunawa", nmitem = "Demersal Degen", nmitemid = 20708, points = 82.45 },
        [321] = { zonename = "Sea Serpent Grotto", nmhunt = "Bakunawa", nmitem = "Bathy Choker", nmitemid = 27517, points = 82.45 },
        [322] = { zonename = "South Gustaberg", nmhunt = "Leaping Lizzy", nmitem = "Bounding Boots", nmitemid = 15351, points = 70 },
        [323] = { zonename = "South Gustaberg", nmhunt = "Carnero", nmitem = "Katayama", nmitemid = 17811, points = 35 },
        [324] = { zonename = "South Gustaberg", nmhunt = "Bhishani", nmitem = "claidheamh soluis", nmitemid = 20718, points = 59.675 },
        [325] = { zonename = "South Gustaberg", nmhunt = "Bhishani", nmitem = "Gna Earring", nmitemid = 26105, points = 59.675 },
        [326] = { zonename = "Tahrongi Canyon", nmhunt = "Yara Ma Yha Who", nmitem = "Fasting Ring", nmitemid = 15546, points = 61.25 },
        [327] = { zonename = "Tahrongi Canyon", nmhunt = "Serpopard Ninlil", nmitem = "Narmar Boomerang", nmitemid = 21348, points = 77.35 },
        [328] = { zonename = "Tahrongi Canyon", nmhunt = "Smierc", nmitem = "Yorium Sabatons", nmitemid = 27402, points = 68.2 },
        [329] = { zonename = "Tahrongi Canyon", nmhunt = "Smierc", nmitem = "Acro Leggings", nmitemid = 27403, points = 68.2 },
        [330] = { zonename = "Tahrongi Canyon", nmhunt = "Smierc", nmitem = "Taeon Boots", nmitemid = 27404, points = 68.2 },
        [331] = { zonename = "Tahrongi Canyon", nmhunt = "Smierc", nmitem = "Telchine Pigaches", nmitemid = 27405, points = 68.2 },
        [332] = { zonename = "Tahrongi Canyon", nmhunt = "Smierc", nmitem = "Helios Boots", nmitemid = 27406, points = 68.2 },
        [333] = { zonename = "Tahrongi Canyon", nmhunt = "Serpopard Ninlil", nmitem = "Cloud Hairpin", nmitemid = 28350, points = 77.35 },
        [334] = { zonename = "Tahrongi Canyon", nmhunt = "Serpopard Ninlil", nmitem = "Nekhen Ring", nmitemid = 28534, points = 77.35 },
        [335] = { zonename = "Temple of Uggalepih", nmhunt = "Sacrificial Goblet", nmitem = "Charging Shield", nmitemid = 12381, points = 61.25 },
        [336] = { zonename = "Temple of Uggalepih", nmhunt = "Crimson-toothed Pawberry", nmitem = "Carbuncle Mitts", nmitemid = 14062, points = 61.25 },
        [337] = { zonename = "Temple of Uggalepih", nmhunt = "Beryl-footed Molberry", nmitem = "Hototogisu", nmitemid = 16899, points = 159.25 },
        [338] = { zonename = "Temple of Uggalepih", nmhunt = "Death from Above", nmitem = "Hornetneedle", nmitemid = 17980, points = 45.5 },
        [339] = { zonename = "Temple of Uggalepih", nmhunt = "Azure-toothed Clawberry", nmitem = "Asteria Mitts", nmitemid = 27106, points = 82.45 },
        [340] = { zonename = "Temple of Uggalepih", nmhunt = "Azure-toothed Clawberry", nmitem = "Lamassu Mitts", nmitemid = 27108, points = 82.45 },
        [341] = { zonename = "Temple of Uggalepih", nmhunt = "Neith", nmitem = "hagondes sabots", nmitemid = 28336, points = 47.275 },
        [342] = { zonename = "The Boyahda Tree", nmhunt = "Ellyllon", nmitem = "Mushroom Helm", nmitemid = 13913, points = 81 },
        [343] = { zonename = "The Boyahda Tree", nmhunt = "Unut", nmitem = "Luna Subligar", nmitemid = 14287, points = 86 },
        [344] = { zonename = "The Boyahda Tree", nmhunt = "Aquarius", nmitem = "Fransisca", nmitemid = 17925, points = 39 },
        [345] = { zonename = "The Boyahda Tree", nmhunt = "Hidhaegg", nmitem = "Combuster", nmitemid = 20696, points = 84.15 },
        [346] = { zonename = "The Boyahda Tree", nmhunt = "Ayapec", nmitem = "Perun", nmitemid = 20804, points = 82.45 },
        [347] = { zonename = "The Boyahda Tree", nmhunt = "Modron", nmitem = "shichishito", nmitemid = 21058, points = 58.125 },
        [348] = { zonename = "The Boyahda Tree", nmhunt = "Hidhaegg", nmitem = "Nullis", nmitemid = 21695, points = 84.15 },
        [349] = { zonename = "The Boyahda Tree", nmhunt = "Hidhaegg", nmitem = "Loess Barbuta", nmitemid = 25635, points = 84.15 },
        [350] = { zonename = "The Boyahda Tree", nmhunt = "Ayapec", nmitem = "Hike Khat", nmitemid = 26784, points = 82.45 },
        [351] = { zonename = "The Eldieme Necropolis", nmhunt = "Cwn Cyrff", nmitem = "Swan Bilbo", nmitemid = 17709, points = 98 },
        [352] = { zonename = "The Eldieme Necropolis", nmhunt = "Gasha", nmitem = "crobaci", nmitemid = 20787, points = 58.125 },
        [353] = { zonename = "The Eldieme Necropolis (S)", nmhunt = "Giltine", nmitem = "bocluamni", nmitemid = 21242, points = 58.125 },
        [354] = { zonename = "The Garden of Ru'Hmet", nmhunt = "Ix'aern (DRK)", nmitem = "Vice of Avarice", nmitemid = 1902, points = 61.25 },
        [355] = { zonename = "The Garden of Ru'Hmet", nmhunt = "Ix'aern (DRG)", nmitem = "Vice of Aspersion", nmitemid = 1903, points = 61.25 },
        [356] = { zonename = "The Sanctuary of Zi'Tah", nmhunt = "Keeper of Heiligtum", nmitem = "Kunimune", nmitemid = 21034, points = 81.6 },
        [357] = { zonename = "The Sanctuary of Zi'Tah", nmhunt = "Cath Palug", nmitem = "uffrat", nmitemid = 21209, points = 58.125 },
        [358] = { zonename = "The Sanctuary of Zi'Tah", nmhunt = "Keeper of Heiligtum", nmitem = "Zoar Subligar", nmitemid = 27230, points = 81.6 },
        [359] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Faust", nmitem = "Tonbo-Giri", nmitemid = 16838, points = 114 },
        [360] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Olla Grande", nmitem = "Skofnung", nmitemid = 16956, points = 89 },
        [361] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Mother Globe", nmitem = "Shiranui", nmitemid = 17774, points = 113 },
        [362] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Ullikummi", nmitem = "Ulfhedinn Axe", nmitemid = 18199, points = 89 },
        [363] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Qilin", nmitem = "doomsday", nmitemid = 21476, points = 58.9 },
        [364] = { zonename = "The Shrine of Ru'Avitau", nmhunt = "Qilin", nmitem = "Njordr Earring", nmitemid = 26104, points = 58.9 },
        [365] = { zonename = "Toraimarai Canal", nmhunt = "Brazen Bones", nmitem = "Laran's Pendant", nmitemid = 16303, points = 110 },
        [366] = { zonename = "Uleguerand Range", nmhunt = "Magnotaur", nmitem = "Pygme Sainti", nmitemid = 18770, points = 88 },
        [367] = { zonename = "Uleguerand Range", nmhunt = "Camahueto", nmitem = "Triska Scythe", nmitemid = 20898, points = 82.45 },
        [368] = { zonename = "Uleguerand Range", nmhunt = "Camahueto", nmitem = "Hygieia Clogs", nmitemid = 27407, points = 82.45 },
        [369] = { zonename = "Uleguerand Range", nmhunt = "Isarukitsck", nmitem = "otronif brais", nmitemid = 28193, points = 47.275 },
        [370] = { zonename = "Upper Delkfutts Tower", nmhunt = "Autarch", nmitem = "Kinship Axe", nmitemid = 18507, points = 85 },
        [371] = { zonename = "Valkurm Dunes", nmhunt = "Valkurm Emperor ", nmitem = "Empress Hairpin", nmitemid = 15224, points = 74 },
        [372] = { zonename = "Valkurm Dunes", nmhunt = "Valkurm Imperator", nmitem = "Imperial Wing Hairpin", nmitemid = 26709, points = 80.75 },
        [373] = { zonename = "Valkurm Dunes", nmhunt = "Ig-Alima", nmitem = "Yorium Barbuta", nmitemid = 26733, points = 49.6 },
        [374] = { zonename = "Valkurm Dunes", nmhunt = "Ig-Alima", nmitem = "Yorium Cuirass", nmitemid = 26891, points = 49.6 },
        [375] = { zonename = "Valkurm Dunes", nmhunt = "Valkurm Imperator", nmitem = "Regal Pumps", nmitemid = 28273, points = 80.75 },
        [376] = { zonename = "Valley of Sorrows", nmhunt = "Tolba", nmitem = "Malison", nmitemid = 21483, points = 84.15 },
        [377] = { zonename = "Valley of Sorrows", nmhunt = "Tolba", nmitem = "Obviation Cuirass", nmitemid = 25709, points = 84.15 },
        [378] = { zonename = "Valley of Sorrows", nmhunt = "Tolba", nmitem = "Forfend", nmitemid = 26401, points = 84.15 },
        [379] = { zonename = "Ve'Lugannon Palace", nmhunt = "Steam Cleaner", nmitem = "Indra Katars", nmitemid = 17511, points = 88 },
        [380] = { zonename = "Ve'Lugannon Palace", nmhunt = "Zipacna", nmitem = "Ushikirimaru", nmitemid = 17804, points = 89 },
        [381] = { zonename = "Ve'Lugannon Palace", nmhunt = "Uptala", nmitem = "Lodurr Earring", nmitemid = 26099, points = 58.9 },
        [382] = { zonename = "Vunkerl Inlet (S)", nmhunt = "Gaunab", nmitem = "Acro Helm", nmitemid = 26734, points = 49.6 },
        [383] = { zonename = "Vunkerl Inlet (S)", nmhunt = "Gaunab", nmitem = "Acro Surcoat", nmitemid = 26892, points = 49.6 },
        [384] = { zonename = "Vunkerl Inlet [S]", nmhunt = "Judgmental Julika", nmitem = "Creve-coeur", nmitemid = 19124, points = 88 },
        [385] = { zonename = "Wajaom Woodlands", nmhunt = "Gharial", nmitem = "Tartaglia", nmitemid = 17971, points = 88 },
        [386] = { zonename = "Wajaom Woodlands", nmhunt = "Kubool Ja's Mhuufya", nmitem = "Mdomo Axe", nmitemid = 20799, points = 82.45 },
        [387] = { zonename = "Wajaom Woodlands", nmhunt = "Thu'ban", nmitem = "Habilitator", nmitemid = 21748, points = 84.15 },
        [388] = { zonename = "Wajaom Woodlands", nmhunt = "Thu'ban", nmitem = "Tatenashi Sune-Ate", nmitemid = 25923, points = 84.15 },
        [389] = { zonename = "Wajaom Woodlands", nmhunt = "Thu'ban", nmitem = "Vim Torque", nmitemid = 26021, points = 84.15 },
        [390] = { zonename = "Wajaom Woodlands", nmhunt = "Kubool Ja's Mhuufya", nmitem = "Zwazo Earring", nmitemid = 27532, points = 82.45 },
        [391] = { zonename = "West Ronfaure", nmhunt = "Lancing Lamorak", nmitem = "linos", nmitemid = 21404, points = 59.675 },
        [392] = { zonename = "West Ronfaure", nmhunt = "Lancing Lamorak", nmitem = "Hnoss Earring", nmitemid = 26100, points = 59.675 },
        [393] = { zonename = "West Sarutabaruta", nmhunt = "Virvatuli", nmitem = "otronif mask", nmitemid = 27769, points = 47.275 },
        [394] = { zonename = "West Sarutabaruta", nmhunt = "Virvatuli", nmitem = "cizin mufflers", nmitemid = 28051, points = 47.275 },
        [395] = { zonename = "West Sarutabaruta (S)", nmhunt = "Ramponneau", nmitem = "Summoning Belt", nmitemid = 15942, points = 107 },
        [396] = { zonename = "West Sarutabaruta (S)", nmhunt = "Pancimanci", nmitem = "gendewitha bliaut", nmitemid = 27915, points = 47.275 },
        [397] = { zonename = "West Sarutabaruta [S]", nmhunt = "Belladonna", nmitem = "Virtuoso Belt", nmitemid = 15943, points = 82 },
        [398] = { zonename = "Western Altepa Desert", nmhunt = "Picolaton", nmitem = "Thrakon Breastplate", nmitemid = 11343, points = 80 },
        [399] = { zonename = "Western Altepa Desert", nmhunt = "King Vinegarroon", nmitem = "Ace's Helm", nmitemid = 15223, points = 213.5 },
        [400] = { zonename = "Western Altepa Desert", nmhunt = "Celphie", nmitem = "Dhalmel Whistle", nmitemid = 15505, points = 77 },
        [401] = { zonename = "Western Altepa Desert", nmhunt = "King Vinegarroon", nmitem = "Heavy Shell", nmitemid = 18255, points = 220.5 },
        [402] = { zonename = "Western Altepa Desert", nmhunt = "Calchas", nmitem = "Fuchingiri", nmitemid = 19278, points = 87 },
        [403] = { zonename = "Western Altepa Desert", nmhunt = "King Uropygid", nmitem = "Stinger Bullet", nmitemid = 21329, points = 79.05 },
        [404] = { zonename = "Western Altepa Desert", nmhunt = "King Uropygid", nmitem = "Stinger Helm", nmitemid = 26731, points = 82.45 },
        [405] = { zonename = "Western Altepa Desert", nmhunt = "Sabotender Campeador", nmitem = "iuitl gaiters", nmitemid = 28334, points = 47.275 },
        [406] = { zonename = "Xarcabard", nmhunt = "Barbaric Weapon", nmitem = "Rover's Gloves", nmitemid = 15056, points = 82 },
        [407] = { zonename = "Xarcabard", nmhunt = "Biast", nmitem = "Patroclus's Helm", nmitemid = 15221, points = 111 },
        [408] = { zonename = "Xarcabard", nmhunt = "Timeworn Warrior", nmitem = "Jasper Tathlum", nmitemid = 19238, points = 83 },
        [409] = { zonename = "Xarcabard", nmhunt = "Beist", nmitem = "Adorned Helm", nmitemid = 26714, points = 82.45 },
        [410] = { zonename = "Xarcabard", nmhunt = "Beist", nmitem = "Hime Domaru", nmitemid = 26872, points = 82.45 },
        [411] = { zonename = "Xarcabard [S]", nmhunt = "Graoully", nmitem = "Lyft Scimitar", nmitemid = 17766, points = 90 },
        [412] = { zonename = "Xarcabard [S]", nmhunt = "Tikbalang", nmitem = "Lyft Pole", nmitemid = 18609, points = 87 },
        [413] = { zonename = "Xarcabard [S]", nmhunt = "Prince Orobas", nmitem = "Lyft Claymore", nmitemid = 19161, points = 89 },
        [414] = { zonename = "Xarcabard [S]", nmhunt = "Zirnitra", nmitem = "Hightail Bullet", nmitemid = 19236, points = 85 },
        [415] = { zonename = "Yhoator Jungle", nmhunt = "Acolnahuacatl", nmitem = "Echo Cape", nmitemid = 11534, points = 89 },
        [416] = { zonename = "Yhoator Jungle", nmhunt = "Bright-handed Kunberry", nmitem = "Resentment Cape", nmitemid = 15468, points = 108 },
        [417] = { zonename = "Yhoator Jungle", nmhunt = "Woodland Mender", nmitem = "Pouwhenua", nmitemid = 21162, points = 81.6 },
        [418] = { zonename = "Yhoator Jungle", nmhunt = "Woodland Mender", nmitem = "Rosette Jaseran", nmitemid = 26868, points = 81.6 },
        [419] = { zonename = "Yuhtunga Jungle", nmhunt = "Rose Garden", nmitem = "Vilma's Ring", nmitemid = 15547, points = 107 },
        [420] = { zonename = "Yuhtunga Jungle", nmhunt = "Voluptuous Vilma", nmitem = "Vilma's Ring", nmitemid = 15547, points = 187.25 },
        [421] = { zonename = "Yuhtunga Jungle", nmhunt = "Bayawak", nmitem = "Slick Dart", nmitemid = 19237, points = 143.5 },
        [422] = { zonename = "Yuhtunga Jungle", nmhunt = "Sybaritic Samantha", nmitem = "Unmoving Collar", nmitemid = 27508, points = 80.75 },
        [423] = { zonename = "Yuhtunga Jungle", nmhunt = "Sybaritic Samantha", nmitem = "Metamorph Ring", nmitemid = 27562, points = 80.75 },
        [424] = { zonename = "Yuhtunga Jungle", nmhunt = "Holy Moly", nmitem = "hagondes hat", nmitemid = 27772, points = 47.275 },
}

local HUNT_ASSIGNMENT_CHANCE = 100
local NM_ITEM_PER_TRADE_QTY = 1

-- Tier 1 Configuration (Unchanged)
local TIER1_COST = 750
local TIER1_ITEMS = {
    { itemID = 4088, name = "Lustreless Wing x99" },
    { itemID = 4087, name = "Lustreless Hide x99" },
    { itemID = 4086, name = "Lustreless Scale x99" },
}

-- Tier 2 Configuration (Unchanged)
local TIER2_TRUST_UPGRADES = {
    COST = 1000,
    ITEM_LIMIT_PER_PAGE = 3,
    TRUSTS = {
        ["Lion II"] = {
            idPrefix = "LII", -- Used to generate unique CharVar: DH_Trust_LII_001
            items = {
                { itemID = 28450, name = "Chaac Belt" },
                { itemID = 27585, name = "Gorney Ring" },
                { itemID = 26987, name = "Plunderers Armlet +1" },
                { itemID = 14914, name = "Assassins Armlet +1" },
                { itemID = 25679, name = "White Rarab Cap +1" },
                { itemID = 16480, name = "Thiefs Knife" },
                { itemID = 20618, name = "Sandung Dagger" },
            }
        },
        ["Valaineral"] = {
            idPrefix = "V", -- Used to generate unique CharVar: DH_Trust_V_001
            items = {
                { itemID = 27611, name = "Philidor Mantle" },
                { itemID = 15965, name = "Ethereal Earring" },
                { itemID = 14915, name = "Valor Gauntlets +1" },
                { itemID = 25635, name = "Loess Barbuta (NQ)" },
                { itemID = 26989, name = "Caballarius Gauntlets +1" },
                { itemID = 20682, name = "Flyssa +1" },
            }
        },
        ["Ferreous Coffin"] = {
            idPrefix = "FC", -- Used to generate unique CharVar: DH_Trust_FC_001
            items = {
                { itemID = 28335, name = "Gendewitha Galoshes" },
                { itemID = 10791, name = "Haoma's Ring" },
                { itemID = 27554, name = "Purity Ring" },
                { itemID = 27463, name = "Vanya clogs" },
                { itemID = 26981, name = "Piety Mitts +1" },
                { itemID = 27333, name = "Piety Duckbills +1" },
                { itemID = 27407, name = "Hygieia Clogs (NQ)" },
                { itemID = 21076, name = "Septoptic +1" },
                { itemID = 21084, name = "Queller Rod" },
                { itemID = 26326, name = "Channeler's Stone" },
            }
        },
    }
}
local TIER2_COST = TIER2_TRUST_UPGRADES.COST -- Convenience variable

-- Tier 3 Configuration (Unchanged)
local TIER3_COST = 1750
local TIER3_JOB_SHARDS_BY_JOB = {
    -- ... (unchanged configuration data)
    ["WAR"] = { Head = { itemID = 9544, name = "Headshard" }, Torso = { itemID = 9588, name = "Torsoshard" }, Hand = { itemID = 9632, name = "Handshard" }, Legs = { itemID = 9676, name = "Legshard" }, Foot = { itemID = 9720, name = "Footshard" }, },
    ["MNK"] = { Head = { itemID = 9545, name = "Headshard" }, Torso = { itemID = 9589, name = "Torsoshard" }, Hand = { itemID = 9633, name = "Handshard" }, Legs = { itemID = 9677, name = "Legshard" }, Foot = { itemID = 9721, name = "Footshard" }, },
    ["WHM"] = { Head = { itemID = 9546, name = "Headshard" }, Torso = { itemID = 9590, name = "Torsoshard" }, Hand = { itemID = 9634, name = "Handshard" }, Legs = { itemID = 9678, name = "Legshard" }, Foot = { itemID = 9722, name = "Footshard" }, },
    ["BLM"] = { Head = { itemID = 9547, name = "Headshard" }, Torso = { itemID = 9591, name = "Torsoshard" }, Hand = { itemID = 9635, name = "Handshard" }, Legs = { itemID = 9679, name = "Legshard" }, Foot = { itemID = 9723, name = "Footshard" }, },
    ["RDM"] = { Head = { itemID = 9548, name = "Headshard" }, Torso = { itemID = 9592, name = "Torsoshard" }, Hand = { itemID = 9636, name = "Handshard" }, Legs = { itemID = 9680, name = "Legshard" }, Foot = { itemID = 9724, name = "Footshard" }, },
    ["THF"] = { Head = { itemID = 9549, name = "Headshard" }, Torso = { itemID = 9593, name = "Torsoshard" }, Hand = { itemID = 9637, name = "Handshard" }, Legs = { itemID = 9681, name = "Legshard" }, Foot = { itemID = 9725, name = "Footshard" }, },
    ["PLD"] = { Head = { itemID = 9550, name = "Headshard" }, Torso = { itemID = 9594, name = "Torsoshard" }, Hand = { itemID = 9638, name = "Handshard" }, Legs = { itemID = 9682, name = "Legshard" }, Foot = { itemID = 9726, name = "Footshard" }, },
    ["DRK"] = { Head = { itemID = 9551, name = "Headshard" }, Torso = { itemID = 9595, name = "Torsoshard" }, Hand = { itemID = 9639, name = "Handshard" }, Legs = { itemID = 9683, name = "Legshard" }, Foot = { itemID = 9727, name = "Footshard" }, },
    ["BST"] = { Head = { itemID = 9552, name = "Headshard" }, Torso = { itemID = 9596, name = "Torsoshard" }, Hand = { itemID = 9640, name = "Handshard" }, Legs = { itemID = 9684, name = "Legshard" }, Foot = { itemID = 9728, name = "Footshard" }, },
    ["BRD"] = { Head = { itemID = 9553, name = "Headshard" }, Torso = { itemID = 9597, name = "Torsoshard" }, Hand = { itemID = 9641, name = "Handshard" }, Legs = { itemID = 9685, name = "Legshard" }, Foot = { itemID = 9729, name = "Footshard" }, },
    ["RNG"] = { Head = { itemID = 9554, name = "Headshard" }, Torso = { itemID = 9598, name = "Torsoshard" }, Hand = { itemID = 9642, name = "Handshard" }, Legs = { itemID = 9686, name = "Legshard" }, Foot = { itemID = 9730, name = "Footshard" }, },
    ["SAM"] = { Head = { itemID = 9555, name = "Headshard" }, Torso = { itemID = 9599, name = "Torsoshard" }, Hand = { itemID = 9643, name = "Handshard" }, Legs = { itemID = 9687, name = "Legshard" }, Foot = { itemID = 9731, name = "Footshard" }, },
    ["NIN"] = { Head = { itemID = 9556, name = "Headshard" }, Torso = { itemID = 9600, name = "Torsoshard" }, Hand = { itemID = 9644, name = "Handshard" }, Legs = { itemID = 9688, name = "Legshard" }, Foot = { itemID = 9732, name = "Footshard" }, },
    ["DRG"] = { Head = { itemID = 9557, name = "Headshard" }, Torso = { itemID = 9601, name = "Torsoshard" }, Hand = { itemID = 9645, name = "Handshard" }, Legs = { itemID = 9689, name = "Legshard" }, Foot = { itemID = 9733, name = "Footshard" }, },
    ["SMN"] = { Head = { itemID = 9558, name = "Headshard" }, Torso = { itemID = 9602, name = "Torsoshard" }, Hand = { itemID = 9646, name = "Handshard" }, Legs = { itemID = 9690, name = "Legshard" }, Foot = { itemID = 9734, name = "Footshard" }, },
    ["BLU"] = { Head = { itemID = 9559, name = "Headshard" }, Torso = { itemID = 9603, name = "Torsoshard" }, Hand = { itemID = 9647, name = "Handshard" }, Legs = { itemID = 9691, name = "Legshard" }, Foot = { itemID = 9735, name = "Footshard" }, },
    ["COR"] = { Head = { itemID = 9560, name = "Headshard" }, Torso = { itemID = 9604, name = "Torsoshard" }, Hand = { itemID = 9648, name = "Handshard" }, Legs = { itemID = 9692, name = "Legshard" }, Foot = { itemID = 9736, name = "Footshard" }, },
    ["PUP"] = { Head = { itemID = 9561, name = "Headshard" }, Torso = { itemID = 9605, name = "Torsoshard" }, Hand = { itemID = 9649, name = "Handshard" }, Legs = { itemID = 9693, name = "Legshard" }, Foot = { itemID = 9737, name = "Footshard" }, },
    ["DNC"] = { Head = { itemID = 9562, name = "Headshard" }, Torso = { itemID = 9606, name = "Torsoshard" }, Hand = { itemID = 9650, name = "Handshard" }, Legs = { itemID = 9694, name = "Legshard" }, Foot = { itemID = 9738, name = "Footshard" }, },
    ["SCH"] = { Head = { itemID = 9563, name = "Headshard" }, Torso = { itemID = 9607, name = "Torsoshard" }, Hand = { itemID = 9651, name = "Handshard" }, Legs = { itemID = 9695, name = "Legshard" }, Foot = { itemID = 9739, name = "Footshard" }, },
    ["GEO"] = { Head = { itemID = 9564, name = "Headshard" }, Torso = { itemID = 9608, name = "Torsoshard" }, Hand = { itemID = 9652, name = "Handshard" }, Legs = { itemID = 9696, name = "Legshard" }, Foot = { itemID = 9740, name = "Footshard" }, },
    ["RUN"] = { Head = { itemID = 9565, name = "Headshard" }, Torso = { itemID = 9609, name = "Torsoshard" }, Hand = { itemID = 9653, name = "Handshard" }, Legs = { itemID = 9697, name = "Legshard" }, Foot = { itemID = 9741, name = "Footshard" }, },
}


local BRIBE_GIL_AMOUNT = 1000000
local REROLL_GIL_AMOUNT = 500000
local JOBS_PER_PAGE = 5 -- Job Shard Page limit

--------------------------------------------------------------------------------
--                          REWARDS MENU GENERATION                           --
--------------------------------------------------------------------------------
-- Forward Declarations
local setupTrustSelectionPage
local generateRewardsMainMenu
local generateTierSelectionMenu

-- NEW: Function to display a paginated list of Trust Upgrade items (MODIFIED FOR SORTING/DISPLAY)
local function setupTrustItemPage(player, npc, trustName, trustDetails, pageNum)
    local cost = TIER2_TRUST_UPGRADES.COST
    local items_per_page = TIER2_TRUST_UPGRADES.ITEM_LIMIT_PER_PAGE
    local all_items = trustDetails.items
    
    local categorized_items = {}
    local available_items = {}
    local purchased_items = {}

    -- 1. Categorize all items based on purchase status
    for i, item in ipairs(all_items) do
        local item_unique_id = trustDetails.idPrefix .. "_" .. string.format("%03d", i)
        local charVarKey = "DH_Trust_" .. item_unique_id
        local is_purchased = player:getCharVar(charVarKey) == 1

        local item_data = {
            item = item,
            status_tag = is_purchased and "[X]" or "", -- UPDATED TAG: [X] or empty string
            charVarKey = charVarKey,
        }

        if is_purchased then
            table.insert(purchased_items, item_data)
        else
            table.insert(available_items, item_data)
        end
    end

    -- 2. Combine and Sort: Available items first, then purchased items
    local sorted_items = {}
    for _, data in ipairs(available_items) do table.insert(sorted_items, data) end
    for _, data in ipairs(purchased_items) do table.insert(sorted_items, data) end

    -- 3. Apply Pagination to the sorted list
    local total_items = #sorted_items
    local total_pages = math.ceil(total_items / items_per_page)
    local items_menu = {}
    local startIndex = (pageNum - 1) * items_per_page
    local endIndex = math.min(startIndex + items_per_page, total_items)

    local trust_title = string.format(MESSAGES.TRUST_MENU_TITLE, trustName, cost)

    -- 4. Build the menu for the current page
    for i = startIndex + 1, endIndex do
        local item_data = sorted_items[i]
        local item = item_data.item
        local status_tag = item_data.status_tag
        local charVarKey = item_data.charVarKey

        -- Trimming logic: Only add a space if status_tag is not empty
        local item_name_display = string.format("%s%s", item.name, status_tag ~= "" and (" " .. status_tag) or "")

        table.insert(items_menu, {
            item_name_display,
            function(player)
                -- If item is marked [X], send the purchased message and refresh menu, otherwise attempt purchase
                if status_tag == "[X]" then
                     player:printToPlayer(string.format(MESSAGES.REDEEM_TRUST_ALREADY_PURCHASED, item.name), 0, npc:getPacketName())
                     -- Force a refresh in case they clicked on an already purchased item on another page
                     setupTrustItemPage(player, npc, trustName, trustDetails, pageNum)
                     return
                else
                    -- Call redeemItem, which handles the points/inventory/item adding, and prints messages
                    local purchased_successfully = redeemItem(player, npc, item.itemID, item.name, cost, 1, charVarKey)

                    -- Always re-call this function to refresh the menu, which updates the [X] status and re-sorts the list.
                    setupTrustItemPage(player, npc, trustName, trustDetails, pageNum)
                end
            end
        })
    end

    -- Navigation options (must use the current pageNum and total_pages based on the sorted list)
    if pageNum < total_pages then
        table.insert(items_menu, { MESSAGES.NEXT_PAGE_OPTION, function(player)
            setupTrustItemPage(player, npc, trustName, trustDetails, pageNum + 1)
        end })
    end
    if pageNum > 1 then
        table.insert(items_menu, { MESSAGES.PREVIOUS_PAGE_OPTION, function(player)
            setupTrustItemPage(player, npc, trustName, trustDetails, pageNum - 1)
        end })
    end

    -- Back option
    table.insert(items_menu, { MESSAGES.BACK_OPTION, function(player)
        setupTrustSelectionPage(player, npc)
    end })

    delaySendMenu(player, npc, items_menu, trust_title)
end

-- Function to display the three Trust options (Unchanged)
setupTrustSelectionPage = function(player, npc)
    local trust_menu = {}
    local trust_cost = TIER2_TRUST_UPGRADES.COST
    local trust_title = string.format(MESSAGES.TIER2_MAIN_MENU_TITLE, trust_cost)

    for trustName, trustDetails in pairs(TIER2_TRUST_UPGRADES.TRUSTS) do
        local total_items = #trustDetails.items
        -- local total_pages = math.ceil(total_items / TIER2_TRUST_UPGRADES.ITEM_LIMIT_PER_PAGE) -- Not needed here

        table.insert(trust_menu, {
            string.format("%s (%d Items)", trustName, total_items),
            function(player)
                setupTrustItemPage(player, npc, trustName, trustDetails, 1) -- Start on page 1
            end
        })
    end

    -- Back option to return to the Tier Selection Menu
    table.insert(trust_menu, { MESSAGES.BACK_OPTION, function(player)
        local fresh_tier_menu = generateTierSelectionMenu(player, npc)
        delaySendMenu(player, npc, fresh_tier_menu, string.format(MESSAGES.REDEEM_TIER_SELECTION_TITLE, player:getCharVar("DH_TotalPoints")))
    end })

    delaySendMenu(player, npc, trust_menu, trust_title)
end

-- Function to generate the Tier 1/2/3 selection page (Unchanged)
generateTierSelectionMenu = function(player, npc)
    local NMHRedeemTierSelectionPage = {}
    local tierSelectionTitle = string.format(MESSAGES.REDEEM_TIER_SELECTION_TITLE, player:getCharVar("DH_TotalPoints"))

    -- TIER 1 Setup (Lustreless)
    local NMHTier1RewardsPage = {}
    for _, item in ipairs(TIER1_ITEMS) do
        table.insert(NMHTier1RewardsPage, {
            item.name,
            function(player)
                redeemItem(player, npc, item.itemID, item.name, TIER1_COST, 99)
                delaySendMenu(player, npc, NMHTier1RewardsPage, string.format(MESSAGES.TIER1_MENU_TITLE, TIER1_COST))
            end
        })
    end
    table.insert(NMHTier1RewardsPage, { MESSAGES.BACK_OPTION, function(player)
        local fresh_tier_menu = generateTierSelectionMenu(player, npc)
        delaySendMenu(player, npc, fresh_tier_menu, tierSelectionTitle)
    end })

    -- TIER 3 Setup (Job Shards)
    local sortedJobNames = {}
    for jobName, _ in pairs(TIER3_JOB_SHARDS_BY_JOB) do table.insert(sortedJobNames, jobName) end
    table.sort(sortedJobNames)
    local totalJobs = #sortedJobNames
    local totalJobPages = math.ceil(totalJobs / JOBS_PER_PAGE)
    local NMHTier3JobSelectionPages = {}

    for pageNum = 1, totalJobPages do
        local pageMenu = {}
        local startIndex = (pageNum - 1) * JOBS_PER_PAGE + 1
        local endIndex = math.min(startIndex + JOBS_PER_PAGE - 1, totalJobs)

        for i = startIndex, endIndex do
            local jobName = sortedJobNames[i]
            table.insert(pageMenu, {
                string.format("%s Shards", jobName),
                function(player)
                    local jobShardsMenu = {}
                    local jobShards = TIER3_JOB_SHARDS_BY_JOB[jobName]
                    local shardTypes = {"Head", "Torso", "Hand", "Legs", "Foot"}
                    for _, shardType in ipairs(shardTypes) do
                        local shardDetails = jobShards[shardType]
                        if shardDetails then
                            table.insert(jobShardsMenu, {
                                shardDetails.name,
                                function(player)
                                    redeemItem(player, npc, shardDetails.itemID, shardDetails.name, TIER3_COST, 1)
                                    delaySendMenu(player, npc, jobShardsMenu, string.format(MESSAGES.JOB_SHARD_MENU_TITLE, jobName, TIER3_COST))
                                end
                            })
                        end
                    end
                    table.insert(jobShardsMenu, { MESSAGES.BACK_OPTION, function(player)
                        delaySendMenu(player, npc, NMHTier3JobSelectionPages[pageNum], string.format(MESSAGES.JOB_SELECTION_PAGE_TITLE, pageNum, totalJobPages, TIER3_COST))
                    end })
                    delaySendMenu(player, npc, jobShardsMenu, string.format(MESSAGES.JOB_SHARD_MENU_TITLE, jobName, TIER3_COST))
                end
            })
        end

        if pageNum < totalJobPages then table.insert(pageMenu, { MESSAGES.NEXT_PAGE_OPTION, function(player)
            delaySendMenu(player, npc, NMHTier3JobSelectionPages[pageNum + 1], string.format(MESSAGES.JOB_SELECTION_PAGE_TITLE, pageNum + 1, totalJobPages, TIER3_COST))
        end }) end
        if pageNum > 1 then table.insert(pageMenu, { MESSAGES.PREVIOUS_PAGE_OPTION, function(player)
            delaySendMenu(player, npc, NMHTier3JobSelectionPages[pageNum - 1], string.format(MESSAGES.JOB_SELECTION_PAGE_TITLE, pageNum - 1, totalJobPages, TIER3_COST))
        end }) end

        NMHTier3JobSelectionPages[pageNum] = pageMenu
    end

    -- Back options for T3 pages
    for pageNum = 1, totalJobPages do
        table.insert(NMHTier3JobSelectionPages[pageNum], { MESSAGES.BACK_OPTION, function(player)
            local fresh_tier_menu = generateTierSelectionMenu(player, npc)
            delaySendMenu(player, npc, fresh_tier_menu, tierSelectionTitle)
        end })
    end

    -- Build the main Tier Selection Menu (NMHRedeemTierSelectionPage)
    table.insert(NMHRedeemTierSelectionPage, { string.format(MESSAGES.TIER1_MENU_OPTION, TIER1_COST), function(player)
        delaySendMenu(player, npc, NMHTier1RewardsPage, string.format(MESSAGES.TIER1_MENU_TITLE, TIER1_COST))
    end })
    table.insert(NMHRedeemTierSelectionPage, { string.format(MESSAGES.TIER2_MENU_OPTION, TIER2_COST), function(player)
        setupTrustSelectionPage(player, npc)
    end })
    table.insert(NMHRedeemTierSelectionPage, { string.format(MESSAGES.TIER3_MENU_OPTION, TIER3_COST), function(player)
        delaySendMenu(player, npc, NMHTier3JobSelectionPages[1], string.format(MESSAGES.JOB_SELECTION_PAGE_TITLE, 1, totalJobPages, TIER3_COST))
    end })
    table.insert(NMHRedeemTierSelectionPage, { MESSAGES.LEAVE_OPTION, function(player)
        player:printToPlayer(string.format(MESSAGES.REDEEM_CURRENT_POINTS_INFO, player:getCharVar("DH_TotalPoints")), 0, npc:getPacketName())
    end })
    table.insert(NMHRedeemTierSelectionPage, { MESSAGES.BACK_OPTION, function(player)
        delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
    end })

    return NMHRedeemTierSelectionPage
end

-- Function to generate the main NPC menu
generateRewardsMainMenu = function(player, npc)
    local NMHRewardsMainPage = {}

    -- Option to get a new hunt
    table.insert(NMHRewardsMainPage, { MESSAGES.NEW_HUNT_MENU_OPTION, function(player)
        local hunt_completed_today = player:getCharVar("DH_HuntCompletedToday")
        local player_current_hunt_id_menu = player:getCharVar("DH_PlayerCurrentHuntID")
        local is_hunt_active = player_current_hunt_id_menu ~= 0 and hunt_completed_today == 0
        local is_hunt_completed = hunt_completed_today == 1

        if is_hunt_active then
            player:printToPlayer(MESSAGES.NEW_HUNT_ALREADY_HUNT, 0, npc:getPacketName())
        elseif is_hunt_completed then
            player:printToPlayer(MESSAGES.NEW_HUNT_ALREADY_COMPLETED, 0, npc:getPacketName())
        else
            local num_hunts = #zonedrops
            local random_roll = math.random(1, 100)

            if random_roll <= HUNT_ASSIGNMENT_CHANCE then
                local new_hunt_id = math.random(1, num_hunts)
                player:setCharVar("DH_PlayerCurrentHuntID", new_hunt_id)
                player:setCharVar("DH_HuntCompletedToday", 0)

                player:printToPlayer(MESSAGES.NEW_HUNT_SUCCESS, 0, npc:getPacketName())
                local new_hunt_details = zonedrops[new_hunt_id]
                if new_hunt_details then
                    -- UPDATED: Added new_hunt_details.points
                    player:printToPlayer(string.format(MESSAGES.HUNT_ASSIGNMENT_PART1, 
                        new_hunt_details.zonename, new_hunt_details.nmhunt, new_hunt_details.nmitem, new_hunt_details.points), 0, npc:getPacketName())
                    player:printToPlayer(MESSAGES.HUNT_ASSIGNMENT_PART2, 0, npc:getPacketName())
                end
            else
                player:printToPlayer(MESSAGES.NEW_HUNT_FAIL, 0, npc:getPacketName())
                player:setCharVar("DH_PlayerCurrentHuntID", 0)
            end
        end
        delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
    end })
    
    -- Dynamic Reroll Menu Text calculation
    local player_reroll_count = player:getCharVar("DH_RerollsToday") or 0
    local hunt_completed_today = player:getCharVar("DH_HuntCompletedToday") or 0 -- Get status for dynamic text
    local REROLL_COST = REROLL_GIL_AMOUNT
    local REROLL_LIMIT = 2
    local reroll_cost_text = addCommas(REROLL_COST)

    local reroll_menu_option_text = ""
    if hunt_completed_today == 1 then -- NEW CHECK
        reroll_menu_option_text = "Reroll: Unavailable"
    elseif player_reroll_count == 0 then
        reroll_menu_option_text = "Reroll: Change Current Hunt?"
    elseif player_reroll_count == 1 then
        reroll_menu_option_text = "Reroll (500k): Change Current Hunt?"
        else -- >= REROLL_LIMIT
        reroll_menu_option_text = "Reroll: Limit Reached"
    end
    -- End Dynamic Reroll Menu Text calculation

    -- Reroll Hunt Option (UPDATED to use dynamic text and block completed hunts)
    table.insert(NMHRewardsMainPage, { reroll_menu_option_text, function(player)
        local player_reroll_count_inner = player:getCharVar("DH_RerollsToday") or 0
        local hunt_completed_today_inner = player:getCharVar("DH_HuntCompletedToday") or 0
        
        -- BLOCK REROLL IF HUNT IS COMPLETED
        if hunt_completed_today_inner == 1 then
            player:printToPlayer(MESSAGES.REROLL_HUNT_COMPLETED, 0, npc:getPacketName())

        elseif player_reroll_count_inner >= REROLL_LIMIT then
            -- Limit Reached
            player:printToPlayer(MESSAGES.REROLL_ALREADY_DONE, 0, npc:getPacketName())

        elseif player_reroll_count_inner == 0 then
            -- FIRST REROLL (FREE)
            player:setCharVar("DH_HuntCompletedToday", 0)
            local num_hunts = #zonedrops
            local new_hunt_id = math.random(1, num_hunts)
            player:setCharVar("DH_PlayerCurrentHuntID", new_hunt_id)
            player:incrementCharVar("DH_RerollsToday", 1) -- Count goes to 1

            player:printToPlayer(MESSAGES.REROLL_SUCCESS_FREE, 0, npc:getPacketName())
            local new_hunt_details = zonedrops[new_hunt_id]
            if new_hunt_details then
                -- UPDATED: Added new_hunt_details.points
                player:printToPlayer(string.format(MESSAGES.BRIBE_NEW_HUNT_ASSIGNED, new_hunt_details.zonename, new_hunt_details.nmhunt, new_hunt_details.nmitem, new_hunt_details.points), 0, npc:getPacketName())
            end
        
        elseif player_reroll_count_inner == 1 then
            -- SECOND REROLL (PAID - 500k)
            if player:getGil() >= REROLL_COST then
                if not player:delGil(REROLL_COST) then
                    player:printToPlayer(MESSAGES.REROLL_GIL_DEDUCTION_FAILED, 0, npc:getPacketName())
                    delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
                    return
                end

                player:setCharVar("DH_HuntCompletedToday", 0)
                local num_hunts = #zonedrops
                local new_hunt_id = math.random(1, num_hunts)
                player:setCharVar("DH_PlayerCurrentHuntID", new_hunt_id)
                player:incrementCharVar("DH_RerollsToday", 1) -- Count goes to 2

                player:printToPlayer(MESSAGES.REROLL_SUCCESS_PAID, 0, npc:getPacketName())
                local new_hunt_details = zonedrops[new_hunt_id]
                if new_hunt_details then
                    -- UPDATED: Added new_hunt_details.points
                    player:printToPlayer(string.format(MESSAGES.BRIBE_NEW_HUNT_ASSIGNED, new_hunt_details.zonename, new_hunt_details.nmhunt, new_hunt_details.nmitem, new_hunt_details.points), 0, npc:getPacketName())
                end
            else
                player:printToPlayer(string.format(MESSAGES.REROLL_INSUFFICIENT_GIL, reroll_cost_text), 0, npc:getPacketName())
            end
        end

        delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
    end })


    -- Bribe Option (1M Gil) (Unchanged)
    table.insert(NMHRewardsMainPage, { MESSAGES.BRIBE_MENU_OPTION, function(player)
        local current_game_day_menu = VanadielUniqueDay()
        local player_current_hunt_id_menu = player:getCharVar("DH_PlayerCurrentHuntID")
        local hunt_completed_today = player:getCharVar("DH_HuntCompletedToday")
        local player_last_bribe_day = player:getCharVar("DH_LastBribeDay") or -1
        local player_total_gil = player:getGil()

        local can_bribe = (player_current_hunt_id_menu == 0 or hunt_completed_today == 1)
        local has_already_bribed_today = (player_last_bribe_day == current_game_day_menu)

        if has_already_bribed_today then
            player:printToPlayer(MESSAGES.BRIBE_ALREADY_DONE, 0, npc:getPacketName())
        elseif not can_bribe then
            player:printToPlayer(MESSAGES.BRIBE_HUNT_ACTIVE, 0, npc:getPacketName())
        elseif player_total_gil >= BRIBE_GIL_AMOUNT then
            if not player:delGil(BRIBE_GIL_AMOUNT) then
                player:printToPlayer(MESSAGES.BRIBE_GIL_DEDUCTION_FAILED, 0, npc:getPacketName())
                delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
                return
            end

            player:setCharVar("DH_HuntCompletedToday", 0)
            local num_hunts = #zonedrops
            local new_hunt_id = math.random(1, num_hunts)
            player:setCharVar("DH_PlayerCurrentHuntID", new_hunt_id)
            player:setCharVar("DH_LastBribeDay", current_game_day_menu)

            player:printToPlayer(MESSAGES.BRIBE_SUCCESS, 0, npc:getPacketName())
            local new_hunt_details = zonedrops[new_hunt_id]
            if new_hunt_details then
                -- UPDATED: Added new_hunt_details.points
                player:printToPlayer(string.format(MESSAGES.BRIBE_NEW_HUNT_ASSIGNED, new_hunt_details.zonename, new_hunt_details.nmhunt, new_hunt_details.nmitem, new_hunt_details.points), 0, npc:getPacketName())
            end
        else
            player:printToPlayer(string.format(MESSAGES.BRIBE_INSUFFICIENT_GIL, addCommas(BRIBE_GIL_AMOUNT)), 0, npc:getPacketName())
        end
        delaySendMenu(player, npc, generateRewardsMainMenu(player, npc))
    end })

    -- Rewards Tier Selection Option (Unchanged)
    table.insert(NMHRewardsMainPage, { MESSAGES.SELECT_REWARD_TIER_OPTION, function(player)
        local NMHRedeemTierSelectionPage = generateTierSelectionMenu(player, npc)
        delaySendMenu(player, npc, NMHRedeemTierSelectionPage, string.format(MESSAGES.REDEEM_TIER_SELECTION_TITLE, player:getCharVar("DH_TotalPoints")))
    end })
    table.insert(NMHRewardsMainPage, { MESSAGES.LEAVE_OPTION, function(player)
        player:printToPlayer(string.format(MESSAGES.REDEEM_CURRENT_POINTS_INFO, player:getCharVar("DH_TotalPoints")), 0, npc:getPacketName())
    end })

    return NMHRewardsMainPage
end

--------------------------------------------------------------------------------
--                           NPC EVENT HANDLERS                               --
--------------------------------------------------------------------------------

local function setupMainPage(player, npc)
    local has_reset = checkAndResetDailyVars(player)
    if has_reset then
        player:printToPlayer(MESSAGES.DAILY_HUNT_RESET_SUCCESS, 0, npc:getPacketName())
    end

    local player_current_hunt_id = tonumber(player:getCharVar("DH_PlayerCurrentHuntID")) or 0
    local player_hunt_completed_today = tonumber(player:getCharVar("DH_HuntCompletedToday")) or 0
    local player_total_points = tonumber(player:getCharVar("DH_TotalPoints")) or 0

    local hunt_details = zonedrops[player_current_hunt_id]

    if player_current_hunt_id == 0 then
        player:printToPlayer(MESSAGES.WOULD_YOU_LIKE_TO_FETCH_SOMETHING, 0, npc:getPacketName())
    elseif hunt_details == nil then
        player:printToPlayer(MESSAGES.ISSUE_WITH_HUNT_DATA, 0, npc:getPacketName())
        player:setCharVar("DH_PlayerCurrentHuntID", 0)
    else
        if player_hunt_completed_today == 0 then
            -- UPDATED: Added hunt_details.points to the format string
            player:printToPlayer(string.format(MESSAGES.HUNT_ASSIGNMENT_PART1,
                hunt_details.zonename, hunt_details.nmhunt, hunt_details.nmitem, hunt_details.points), 0, npc:getPacketName())
            player:printToPlayer(MESSAGES.HUNT_ASSIGNMENT_PART2, 0, npc:getPacketName())
        else
            player:printToPlayer(string.format(MESSAGES.ALREADY_COMPLETED_HUNT, player_total_points), 0, npc:getPacketName())
        end
    end

    local NMHRewardsMainPage = generateRewardsMainMenu(player, npc)
    delaySendMenu(player, npc, NMHRewardsMainPage)
end

local function handleTrade(player, npc, trade)
    local has_reset = checkAndResetDailyVars(player)
    if has_reset then
        player:printToPlayer(MESSAGES.HUNT_EXPIRED, 0, npc:getPacketName())
        return
    end

    if trade == nil then
        player:printToPlayer(MESSAGES.ISSUE_PROCESSING_TRADE, 0, npc:getPacketName())
        return
    end

    local player_current_hunt_id = tonumber(player:getCharVar("DH_PlayerCurrentHuntID")) or 0
    local player_hunt_completed_today = tonumber(player:getCharVar("DH_HuntCompletedToday")) or 0

    if player_current_hunt_id == 0 then
        player:printToPlayer(MESSAGES.HUNT_NOT_ACTIVE_FOR_PLAYER, 0, npc:getPacketName())
        return
    end

    if player_hunt_completed_today == 1 then
        local hunt_details_for_check = zonedrops[player_current_hunt_id]
        local traded_item_name = "item"
        if hunt_details_for_check and trade:getItemId(0) == hunt_details_for_check.nmitemid then
            traded_item_name = hunt_details_for_check.nmitem
        end
        player:printToPlayer(string.format(MESSAGES.NM_ALREADY_TRADED_ON_TRADE, traded_item_name), 0, npc:getPacketName())
        return
    end

    local hunt_details = zonedrops[player_current_hunt_id]
    if hunt_details == nil then
        player:printToPlayer(MESSAGES.ISSUE_WITH_HUNT_DATA, 0, npc:getPacketName())
        player:setCharVar("DH_PlayerCurrentHuntID", 0)
        return
    end

    local trade_accepted = false
    local nm_item_in_trade_id = trade:getItemId(0)
    local nm_item_in_trade_qty = trade:getItemQty(hunt_details.nmitemid)
    local num_trade_slots = trade:getSlotCount()

    if num_trade_slots == 1 and nm_item_in_trade_id == hunt_details.nmitemid and nm_item_in_trade_qty == NM_ITEM_PER_TRADE_QTY then

        local final_points_earned = hunt_details.points

        player:printToPlayer(string.format(MESSAGES.TRADE_NM_SUCCESS, hunt_details.nmitem), 0, npc:getPacketName())
        player:confirmTrade()
        player:delItem(hunt_details.nmitemid, NM_ITEM_PER_TRADE_QTY)
        player:incrementCharVar("DH_TotalPoints", final_points_earned)
        player:printToPlayer(string.format(MESSAGES.POINTS_EARNED_MESSAGE, final_points_earned), 0, npc:getPacketName())

        player:setCharVar("DH_HuntCompletedToday", 1)
        trade_accepted = true

    else
        player:printToPlayer(string.format(MESSAGES.INVALID_TRADE_ITEM, hunt_details.nmitem), 0, npc:getPacketName())
    end

    if trade_accepted then
        player:printToPlayer(MESSAGES.POST_TRADE_COMPLETED, 0, npc:getPacketName())
    end
end

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    local ok, err = pcall(function() super(zone) end)
    if not ok then print('ERROR: super(zone) failed in Mog Garden: ' .. tostring(err)) end

    local badHavok = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Bad Havok',
        look = 73,
        x         = 363.7069,
        y         = -3.4901,
        z         = -541.3649,
        rotation = 48,
        widescan = 1,
        onTrigger = function(player, npc)
            setupMainPage(player, npc)
        end,
        onTrade = function(player, npc, trade)
            handleTrade(player, npc, trade)
        end,
    })
end)

return m
