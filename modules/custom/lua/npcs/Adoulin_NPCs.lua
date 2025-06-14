local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
    ensureTable('xi.zones.Western_Adoulin.npcs.Ornery_Dhole')
    ensureTable('xi.zones.Western_Adoulin.npcs.Detrovio')
    ensureTable('xi.zones.Eastern_Adoulin.npcs.Vesca')

require("modules/module_utils")
require("scripts/globals/npc_util")


local m = Module:new("Adoulin_NPCs")

m:addOverride("xi.zones.Western_Adoulin.npcs.Ornery_Dhole.onTrade", function(player, npc, trade)
            local count = trade:getItemCount()
local stones =
{
[1] = {trade = {{3954, count}}, base = 3954, currency = 'ghastly_stone',     buy =    50, sell =  10, id =    5, exchange = count, xreward = 4033},
[2] = {trade = {{3955, count}}, base = 3955, currency = 'ghastly_stone_1',   buy =   100, sell =  20, id =  261, exchange = count, xreward = 4034},
[3] = {trade = {{3956, count}}, base = 3956, currency = 'ghastly_stone_2',   buy =   500, sell = 100, id =  517, exchange = count, xreward = 4035},
[4] = {trade = {{4033, count}}, base = 4033, currency = 'verdigris_stone',   buy =   100, sell =  20, id =  773, exchange = count, xreward = 3951},
[5] = {trade = {{4034, count}}, base = 4034, currency = 'verdigris_stone_1', buy =   200, sell =  40, id = 1029, exchange = count, xreward = 3952},
[6] = {trade = {{4035, count}}, base = 4035, currency = 'verdigris_stone_2', buy =  1000, sell = 200, id = 1285, exchange = count, xreward = 3953},
[7] = {trade = {{3951, count}}, base = 3951, currency = 'wailing_stone',     buy =   200, sell =  40, id = 1541, exchange = count, xreward = 0},
[8] = {trade = {{3952, count}}, base = 3952, currency = 'wailing_stone_1',   buy =   400, sell =  80, id = 1797, exchange = count, xreward = 0},
[9] = {trade = {{3953, count}}, base = 3953, currency = 'wailing_stone_2',   buy =  2000, sell = 400, id = 2053, exchange = count, xreward = 0},
}
            local tradeditem = 0
            local buycost = 0
            local sellamount = 0
            local qty = 0
            local base = 0
            local reward = 0
            if tradeditem == 0 then 
             for k, v in pairs(stones) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                   tradeditem = k
                   base = v.base
                   buycost = v.buy
                   sellamount = v.sell
                   qty = v.exchange
                   reward = v.xreward
                  local exchangefor = math.floor(qty / 5)
                  local sellfor     = math.floor(sellamount * count)
                  npc:setLocalVar('OrneryDholeex', exchangefor)
                  npc:setLocalVar('OrneryDholese', sellfor)
                    if reward ~= 0 and exchangefor > 0 then
                       npc:setLocalVar('OrneryDholere', reward)
                       player:startEvent(7613, base,reward, qty, exchangefor, sellfor, 0)
                    return
                    else
                       player:startEvent(7613, base,reward, qty, exchangefor, sellfor, 4)
                    return
                    end
                end
             end
            end
end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Ornery_Dhole.onTrigger", function(player, npc)
    local amount  = player:getCurrency('obsidian_fragment')
          player:startEvent(7547, 0, 0, 12, amount,2)
end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Ornery_Dhole.onEventUpdate", function(player, csid, option, npc)

end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Ornery_Dhole.onEventFinish", function(player, csid, option, npc)
--player:printToPlayer(string.format('Finish csid %s option %s', csid, option))

--------------------------------------
-- purchase Stones
--------------------------------------
local stonez =
{
[1] = {trade = {{3954, count}}, base = 3954, currency = 'ghastly_stone',     buy =    50, sell =  10, id =    5, exchange = count, xreward = 4033},
[2] = {trade = {{3955, count}}, base = 3955, currency = 'ghastly_stone_1',   buy =   100, sell =  20, id =  261, exchange = count, xreward = 4034},
[3] = {trade = {{3956, count}}, base = 3956, currency = 'ghastly_stone_2',   buy =   500, sell = 100, id =  517, exchange = count, xreward = 4035},
[4] = {trade = {{4033, count}}, base = 4033, currency = 'verdigris_stone',   buy =   100, sell =  20, id =  773, exchange = count, xreward = 3951},
[5] = {trade = {{4034, count}}, base = 4034, currency = 'verdigris_stone_1', buy =   200, sell =  40, id = 1029, exchange = count, xreward = 3952},
[6] = {trade = {{4035, count}}, base = 4035, currency = 'verdigris_stone_2', buy =  1000, sell = 200, id = 1285, exchange = count, xreward = 3953},
[7] = {trade = {{3951, count}}, base = 3951, currency = 'wailing_stone',     buy =   200, sell =  40, id = 1541, exchange = count, xreward = 0},
[8] = {trade = {{3952, count}}, base = 3952, currency = 'wailing_stone_1',   buy =   400, sell =  80, id = 1797, exchange = count, xreward = 0},
[9] = {trade = {{3953, count}}, base = 3953, currency = 'wailing_stone_2',   buy =  2000, sell = 400, id = 2053, exchange = count, xreward = 0},
}

        local requestedQty = bit.rshift(option, 24)
        local requestedItm = bit.band(bit.rshift(option, 0), 0x0FFF)
        local id = 0
        local giveitem = 0
        local store = 0
        local sellvalue = 0
        if store == 0 then
            for k, v in pairs(stonez) do
                if requestedItm == v.id then
                   store = k
                   id = v.id
                   sellvalue = v.buy * requestedQty
                   giveitem = v.base
                end
            end
        end
            if csid == 7547 and
               option == 1073741824 or
               option == 0 then
               return
            elseif csid == 7547 then
                if player:getCurrency('obsidian_fragment') < sellvalue then
                   player:printToPlayer('You currently do not have enough Obsidian Fragments to complete this request! ', 0, 'Ornery Dhole')
                else
                   npcUtil.giveItem(player, {{giveitem, requestedQty}})
                   player:delCurrency('obsidian_fragment',sellvalue)
                end
            end
--------------------------------------
-- tradein for 
--------------------------------------
       if csid == 7613 and
          option == 1 then -- trade in for obsidian fragments
            local sellforobs = npc:getLocalVar('OrneryDholese', sellfor)
                  player:tradeComplete()
                  player:addCurrency('obsidian_fragment', sellforobs)
                  player:messageSpecial(zones[player:getZoneID()].text.YOU_NOW_HAVE_AMT_CURRENCY, 13, player:getCurrency('obsidian_fragment'))
          elseif csid == 7613 and
                 option == 2 then -- trade in for different stones
                   local exchangeforstones = npc:getLocalVar('OrneryDholeex')
                   local givereward        = npc:getLocalVar('OrneryDholere')
                      player:tradeComplete()
                      npcUtil.giveItem(player, {{givereward, exchangeforstones}})
          end

end)


-------------------------------------------------------------------
----    Detrovio NPC
-------------------------------------------------------------------

m:addOverride("xi.zones.Western_Adoulin.npcs.Detrovio.onTrade", function(player, npc, trade)
local JSEAugs =
{
[ 1] = {trade = {28617, 9049}, base = 28617, aug1 = 512, aug1MAX =  4, aug2 =  513, aug2MAX =  4, aug3 =   23, aug3MAX =  6, aug4 =  328, aug4MAX =  2, cost = 400}, --Maulers Mantle
[ 2] = {trade = {28618, 9049}, base = 28618, aug1 = 512, aug1MAX =  4, aug2 =  513, aug2MAX =  4, aug3 =  145, aug3MAX =  4, aug4 =  195, aug4MAX =  4, cost = 400}, --Anchorets Mantle
[ 3] = {trade = {28619, 9049}, base = 28619, aug1 =  35, aug1MAX =  9, aug2 =  289, aug2MAX =  9, aug3 =  290, aug3MAX =  9, aug4 =  329, aug4MAX =  4, cost = 400}, --Mending Cape
[ 4] = {trade = {28620, 9049}, base = 28620, aug1 = 133, aug1MAX =  4, aug2 =  292, aug2MAX =  9, aug3 =  293, aug3MAX =  9, aug4 =  140, aug4MAX =  4, cost = 400}, --Bane Cape
[ 5] = {trade = {28621, 9049}, base = 28621, aug1 =  35, aug1MAX =  9, aug2 =  291, aug2MAX =  9, aug3 =  290, aug3MAX =  9, aug4 = 1248, aug4MAX = 19, cost = 400}, --Ghostfyre Cape
[ 6] = {trade = {28622, 9049}, base = 28622, aug1 = 513, aug1MAX =  4, aug2 =  515, aug2MAX =  4, aug3 =  146, aug3MAX =  4, aug4 =  328, aug4MAX =  2, cost = 400}, --Canny Cape
[ 7] = {trade = {28623, 9049}, base = 28623, aug1 = 513, aug1MAX =  4, aug2 =  514, aug2MAX =  4, aug3 =   39, aug3MAX =  6, aug4 =  368, aug4MAX =  4, cost = 400}, --Weard Mantle
[ 8] = {trade = {28624, 9049}, base = 28624, aug1 =  25, aug1MAX = 14, aug2 =  293, aug2MAX =  9, aug3 =  343, aug3MAX = 24, aug4 = 1592, aug4MAX =  0, cost = 400}, --Niht Mantle
[ 9] = {trade = {28625, 9049}, base = 28625, aug1 = 550, aug1MAX =  4, aug2 =   23, aug2MAX =  4, aug3 =  106, aug3MAX = 19, aug4 =  112, aug4MAX =  4, cost = 400}, --Pastoralists Mantle
[10] = {trade = {28626, 9049}, base = 28626, aug1 =   1, aug1MAX = 29, aug2 =   35, aug2MAX =  6, aug3 =   39, aug3MAX =  9, aug4 =   71, aug4MAX =  2, cost = 400}, --Rhapsodes Cape
[11] = {trade = {28627, 9049}, base = 28627, aug1 = 513, aug1MAX =  4, aug2 =  515, aug2MAX =  4, aug3 =  142, aug3MAX =  2, aug4 =  211, aug4MAX =  2, cost = 400}, --Lutian Cape
[12] = {trade = {28628, 9049}, base = 28628, aug1 = 512, aug1MAX =  4, aug2 =  142, aug2MAX =  2, aug3 =  198, aug3MAX =  4, aug4 = 1264, aug4MAX =  7, cost = 400}, --Takaha Mantle
[13] = {trade = {28629, 9049}, base = 28629, aug1 = 512, aug1MAX =  4, aug2 =  513, aug2MAX =  4, aug3 =  332, aug3MAX =  4, aug4 = 1592, aug4MAX =  0, cost = 400}, --Yokaze Mantle
[14] = {trade = {28630, 9049}, base = 28630, aug1 = 512, aug1MAX =  4, aug2 = 1592, aug2MAX =  0, aug3 =  112, aug3MAX =  4, aug4 =  121, aug4MAX =  4, cost = 400}, --Updraft Mantle
[15] = {trade = {28631, 9049}, base = 28631, aug1 = 294, aug1MAX =  4, aug2 =  369, aug2MAX =  4, aug3 =  320, aug3MAX =  2, aug4 =  104, aug4MAX = 14, cost = 400}, --Conveyance Cape
[16] = {trade = {28632, 9049}, base = 28632, aug1 =   9, aug1MAX = 29, aug2 =  513, aug2MAX =  4, aug3 =   23, aug3MAX =  6, aug4 =  299, aug4MAX =  9, cost = 400}, --Cornflower Cape
[17] = {trade = {28633, 9049}, base = 28633, aug1 = 133, aug1MAX =  4, aug2 =   39, aug2MAX =  4, aug3 =  340, aug3MAX =  4, aug4 = 1592, aug4MAX =  0, cost = 400}, --Gunslingers Cape
[18] = {trade = {28634, 9049}, base = 28634, aug1 = 512, aug1MAX =  4, aug2 =  513, aug2MAX =  4, aug3 =  151, aug3MAX = 19, aug4 =  122, aug4MAX = 24, cost = 400}, --Dispersal Mantle
[19] = {trade = {28635, 9049}, base = 28635, aug1 = 142, aug1MAX =  4, aug2 =  146, aug2MAX =  4, aug3 =  370, aug3MAX = 29, aug4 = 1592, aug4MAX =  0, cost = 400}, --Toetapper Mantle
[20] = {trade = {28636, 9049}, base = 28636, aug1 = 516, aug1MAX =  4, aug2 =  517, aug2MAX =  4, aug3 = 1249, aug3MAX = 19, aug4 =  371, aug4MAX =  9, cost = 400}, --Bookworms Cape
[21] = {trade = {28637, 9049}, base = 28637, aug1 = 300, aug1MAX =  9, aug2 = 1250, aug2MAX = 19, aug3 =   71, aug3MAX =  4, aug4 =  112, aug4MAX =  4, cost = 400}, --Lifestream Cape
[22] = {trade = {28638, 9049}, base = 28638, aug1 = 143, aug1MAX =  4, aug2 =   39, aug2MAX =  6, aug3 =  372, aug3MAX = 14, aug4 =   71, aug4MAX =  4, cost = 400}, --Evasionists Cape
}
    local tradeedItema = 0
    if tradeedItema == 0 then
			for k, v in pairs(JSEAugs) do
				if npcUtil.tradeHasExactly(trade, v.trade) then 
					tradeedItema = k
					break
                end
			end
    end
		if tradeedItema > 0 then
			local rewardItemIda = JSEAugs[tradeedItema].base
			player:setCharVar("[JSEAug]item", rewardItemIda) 
			npc:setLocalVar("rewardItemId", JSEAugs[tradeedItema].base)
			npc:setLocalVar("aug1", JSEAugs[tradeedItema].aug1)
			npc:setLocalVar("aug2", JSEAugs[tradeedItema].aug2)
			npc:setLocalVar("aug3", JSEAugs[tradeedItema].aug3)
			npc:setLocalVar("aug4", JSEAugs[tradeedItema].aug4)
			npc:setLocalVar("aug1MAX", JSEAugs[tradeedItema].aug1MAX)
			npc:setLocalVar("aug2MAX", JSEAugs[tradeedItema].aug2MAX)
			npc:setLocalVar("aug3MAX", JSEAugs[tradeedItema].aug3MAX)
			npc:setLocalVar("aug4MAX", JSEAugs[tradeedItema].aug4MAX)
			npc:setLocalVar("augcost", JSEAugs[tradeedItema].cost)
local amountb    = player:getCurrency('bayld')
local itemID    = rewardItemIda
local itemparam = itemID * 65536 + 2047
local augone    = 2048 * npc:getLocalVar("aug1MAX", JSEAugs[tradeedItema].aug1MAX) + npc:getLocalVar("aug1", JSEAugs[tradeedItema].aug1)
local augonea   = augone * 65536
local aug1param = augonea + 770
local augtwo    = 2048 * npc:getLocalVar("aug2MAX", JSEAugs[tradeedItema].aug2MAX) + npc:getLocalVar("aug2", JSEAugs[tradeedItema].aug2)
local augthree  = 2048 * npc:getLocalVar("aug3MAX", JSEAugs[tradeedItema].aug3MAX) + npc:getLocalVar("aug3", JSEAugs[tradeedItema].aug3)
local aug23param = augthree * 65536 + augtwo
local augfour   = 2048 * npc:getLocalVar("aug4MAX", JSEAugs[tradeedItema].aug4MAX)
local aug4param = augfour +  npc:getLocalVar("aug4", JSEAugs[tradeedItema].aug4)
player:startEvent(7620, itemparam, amount, 0, 0, 0, aug1param, aug23param, aug4param)
        end
end)


m:addOverride("xi.zones.Western_Adoulin.npcs.Detrovio.onTrigger", function(player, npc)
local amountb = player:getCurrency('bayld')
player:startEvent(7619, 0, 0, 65535,  amountb)
end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Detrovio.onEventFinish", function(player, csid, option, npc)
local amountb = player:getCurrency('bayld')
local costa = npc:getLocalVar("augcost")
        if amountb >= costa then 
                 if csid == 7620 and option == 7 then
                    player:tradeComplete()
					local reward = player:getCharVar("[JSEAug]item")
					local aug1A = npc:getLocalVar("aug1")
					local aug2A = npc:getLocalVar("aug2")
					local aug3A = npc:getLocalVar("aug3")
					local aug4A = npc:getLocalVar("aug4")
					local aug1MAXA = npc:getLocalVar("aug1MAX")
					local aug2MAXA = npc:getLocalVar("aug2MAX")
					local aug3MAXA = npc:getLocalVar("aug3MAX")
					local aug4MAXA = npc:getLocalVar("aug4MAX")
					local costA = npc:getLocalVar("augcost")
						player:addItem(reward, 1, aug1A, aug1MAXA, aug2A, aug2MAXA, aug3A, aug3MAXA, aug4A, aug4MAXA)
                        player:delCurrency('bayld', costA)
						player:setCharVar("[JSEAug]item", 0)
                        player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, reward)
                end
        else
                        player:printToPlayer('You currently do not have enough Baylds to complete this request! ', 0, 'Divainy-Gamainy')
        end 
end)
-------------------------------------------------------------------
----    Vesca NPC
-------------------------------------------------------------------
m:addOverride("xi.zones.Eastern_Adoulin.npcs.Vesca.onTrade", function(player, npc, trade)
end)

m:addOverride("xi.zones.Eastern_Adoulin.npcs.Vesca.onTrigger", function(player, npc)
local amountd = player:getCurrency('bayld')
player:startEvent(7510, 0, 0, 65535,  amountd)
end)

m:addOverride("xi.zones.Eastern_Adoulin.npcs.Vesca.onEventFinish", function(player, csid, option, npc)
local VescaBuy =
{
{16777217,27785,505},--Karieyh Morion
{16777473,27925,680},--Karieyh Haubert
{16777729,28065,500},--Karieyh Moufles
{16777985,28205,505},--Karieyh Brayettes
{16778241,28345,500},--Karieyh Sollerets
{16778497,27784,505},--Thurandaut Chapeau
{16778753,27924,680},--Thurandaut Tabard
{16779009,28064,500},--Thurandaut Gloves
{16779265,28204,505},--Thurandaut Tights
{16779521,28344,500},--Thurandaut Boots
{16779777,27782,505},--Orvail Corona
{16780033,27922,680},--Orvail Robe
{16780289,28061,500},--Orvail Cuffs
{16780545,28203,505},--Orvail Pants
{16780801,28342,500},--Orvail Souliers
{16781057,28666,500},--Coalition Shield
{16781313,27761,780},--Gorney Morion
{16781569,27907,1050},--Gorney Haubert
{16781825,28046,650},--Gorney Moufles
{16782081,28188,780},--Gorney Brayettes
{16782337,28327,650},--Gorney Sollerets
{16782593,27762,780},--Shneddick Chapeau
{16782849,27908,1050},--Shneddick Tabard
{16783105,28047,650},--Shneddick Gloves
{16783361,28189,780},--Shneddick Tights
{16783617,28328,650},--Shneddick Boots
{16783873,27763,780},--Weatherspoon Corona
{16784129,27909,1050},--Weatherspoon Robe
{16784385,28048,650},--Weatherspoon Cuffs
{16784641,28190,780},--Weatherspoon Pants
{16784897,28329,650},--Weatherspoon Souliers
{16785153,28639,850},--Repulse Mantle
{16785409,28660,1300},--Huactzin Shield
{16785665,27752,1200},--Karieyh Morion +1
{16785921,27895,1600},--Karieyh Haubert +1
{16786177,28042,1000},--Karieyh Moufles +1
{16786433,28182,1200},--Karieyh Brayettes +1
{16786689,28320,1000},--Karieyh Sollerets +1
{16786945,27753,1200},--Thurandaut Chapeau +1
{16787201,27896,1600},--Thurandaut Tabard +1
{16787457,28043,1000},--Thurandaut Gloves +1
{16787713,28183,1200},--Thurandaut Tights +1
{16787969,28321,1000},--Thurandaut Boots +1
{16788225,27754,1200},--Orvail Corona +1
{16788481,27897,1600},--Orvail Robe +1
{16788737,28044,1000},--Orvail Cuffs +1
{16788993,28184,1200},--Orvail Pants +1
{16789249,28322,1000},--Orvail Souliers +1
{16789505,28659,2000},--Camaraderie Shield
{16789761,27711,1800},--Gorney Morion +1
{16790017,27863,2500},--Gorney Haubert +1
{16790273,28010,1500},--Gorney Moufles +1
{16790529,28152,1800},--Gorney Brayettes +1
{16790785,28289,1500},--Gorney Sollerets +1
{16791041,27712,1800},--Shneddick Chapeau +1
{16791297,27864,2500},--Shneddick Tabard +1
{16791553,28011,1500},--Shneddick Gloves +1
{16791809,28153,1800},--Shneddick Tights +1
{16792065,28290,1500},--Shneddick Boots +1
{16792321,27713,1800},--Weatherspoon Corona +1
{16792577,27865,2500},--Weatherspoon Robe +1
{16792833,28012,1500},--Weatherspoon Cuffs +1
{16793089,28154,1800},--Weatherspoon Pants +1
{16793345,28291,1800},--Weatherspoon Souliers +1
{16793601,27624,3000},--Homestead Shield
}
local requestedItmc = bit.band(bit.lshift(option, 0), 0xFFF)
local amountd = player:getCurrency('bayld')
 if option == 1073741824 then return else
   local purchaseOption = 0
   local purchaseCost = 0
   local purchaseItem = 0
			for _, entry in pairs(VescaBuy) do
                if option == entry[1] then
                    purchaseItem = entry[2]
                    purchaseCost = entry[3]
                    purchaseOption = entry[1]
            break
                end
			end
       if option == purchaseOption then
            if purchaseCost <= amountd then
               if player:hasItem(purchaseItem) or
                  player:getFreeSlotsCount() < 1 then
                  player:printToPlayer('Please check your inventory and try again!', 0, 'Vesca')
               else
                  npcUtil.giveItem(player, purchaseItem)
                  player:delCurrency('bayld', purchaseCost)
               end
            else
                  player:printToPlayer('You currently do not have enough Baylds to complete this request! ', 0, 'Vesca')
            end
       end
 end
end)
return m