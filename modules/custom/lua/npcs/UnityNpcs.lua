-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("UnityNpcs")
local kiShop = {}

local upgradeplusone =
{
[  1]={trade={28271,{8975, 3}},acc= 1000,reward=28272},-- Adsilio Boots +1
[  2]={trade={27598,{8976, 3}},acc= 1000,reward=27599},-- Dew Silk Cape +1
[  3]={trade={11504,{8975, 3}},acc= 1000,reward=26712},-- Aurore Beret +1
[  4]={trade={14257,{8975, 3}},acc= 1000,reward=28139},-- Aurore Brais +1
[  5]={trade={13760,{8975, 3}},acc= 1000,reward=27852},-- Aurore Doublet +1
[  6]={trade={11414,{8975, 3}},acc= 1000,reward=28278},-- Aurore Gaiters +1
[  7]={trade={12746,{8975, 3}},acc= 1000,reward=27998},-- Aurore Gloves +1
[  8]={trade={14210,{8974, 3}},acc= 1000,reward=28138},-- Perle Brayettes +1
[  9]={trade={13759,{8974, 3}},acc= 1000,reward=27851},-- Perle Hauberk +1
[ 10]={trade={12745,{8974, 3}},acc= 1000,reward=27997},-- Perle Moufles +1
[ 11]={trade={11503,{8974, 3}},acc= 1000,reward=26711},-- Perle Salade +1
[ 12]={trade={11413,{8974, 3}},acc= 1000,reward=28277},-- Perle Sollerets +1
[ 13]={trade={11505,{8976, 3}},acc= 1000,reward=26713},-- Teal Chapeau +1
[ 14]={trade={12747,{8976, 3}},acc= 1000,reward=27999},-- Teal Cuffs +1
[ 15]={trade={11415,{8976, 3}},acc= 1000,reward=28279},-- Teal Pigaches +1
[ 16]={trade={13778,{8976, 3}},acc= 1000,reward=27853},-- Teal Saio +1
[ 17]={trade={14258,{8976, 3}},acc= 1000,reward=28140},-- Teal Slops +1
[ 18]={trade={28350,{8980,30}},acc= 5000,reward=28351},-- Cloud Hairpin +1
[ 19]={trade={21402,{8978,30}},acc= 5000,reward=21403},-- Damani Horn +1
[ 20]={trade={27633,{8977,30}},acc= 5000,reward=27634},-- Thorfinn Shield +1
[ 21]={trade={21164,{8989,50}},acc=10000,reward=21165},-- Ababinili +1
[ 22]={trade={26714,{8991,50}},acc=10000,reward=26715},-- Adorned Helm +1
[ 23]={trade={26942,{9054,50}},acc=10000,reward=26943},-- Agony Jerkin +1
[ 24]={trade={20851,{9059,50}},acc=10000,reward=20852},-- Aizkora +1
[ 25]={trade={27638,{9056,50}},acc=10000,reward=27639},-- Ajax +1
[ 26]={trade={26786,{9059,50}},acc=10000,reward=26787},-- Alhazen Hat +1
[ 27]={trade={20606,{9048,50}},acc=10000,reward=20607},-- Anathema Harpe +1
[ 28]={trade={22266,{9151,50}},acc=10000,reward=22267},-- Antitail +1
[ 29]={trade={28134,{8982,50}},acc=10000,reward=28135},-- Assid. Pants +1
[ 30]={trade={27106,{9094,50}},acc=10000,reward=27107},-- Asteria Mitts +1
[ 31]={trade={28136,{8983,50}},acc=10000,reward=28137},-- Augury Cuisses +1
[ 32]={trade={20853,{9060,50}},acc=10000,reward=20854},-- Beheader +1
[ 33]={trade={25601,{9095,50}},acc=10000,reward=25602},-- Blistering Sallet +1
[ 34]={trade={20806,{8992,50}},acc=10000,reward=20807},-- Buramgh +1
[ 35]={trade={25680,{9104,50}},acc=10000,reward=25681},-- Cohort Cloak +1
[ 36]={trade={20696,{9149,50}},acc=10000,reward=20697},-- Combuster +1
[ 37]={trade={20507,{9203,50}},acc=10000,reward=20508},-- Comeuppances +1
[ 38]={trade={22057,{9203,50}},acc=10000,reward=22058},-- Contemplator +1
[ 39]={trade={27640,{9060,50}},acc=10000,reward=27641},-- Deliverance +1
[ 40]={trade={20708,{9093,50}},acc=10000,reward=20709},-- Demers. Degen +1
[ 41]={trade={20521,{9092,50}},acc=10000,reward=20522},-- Emeici +1
[ 42]={trade={26870,{8990,50}},acc=10000,reward=26871},-- Emet Harness +1
[ 43]={trade={27636,{8992,50}},acc=10000,reward=27637},-- Evalach +1
[ 44]={trade={20527,{9060,50}},acc=10000,reward=20528},-- Fists of Fury +1
[ 45]={trade={20681,{9206,50}},acc=10000,reward=20682},-- Flyssa +1
[ 46]={trade={26401,{9150,50}},acc=10000,reward=26402},-- Forfend +1
[ 47]={trade={20942,{9056,50}},acc=10000,reward=20943},-- Gae Derg +1
[ 48]={trade={27150,{9208,50}},acc=10000,reward=27151},-- Gazu Bracelets +1
[ 49]={trade={21748,{9204,50}},acc=10000,reward=21749},-- Habilitator +1
[ 50]={trade={26784,{9057,50}},acc=10000,reward=26785},-- Hike Khat +1
[ 51]={trade={26872,{8991,50}},acc=10000,reward=26873},-- Hime Domaru +1
[ 52]={trade={27409,{9047,50}},acc=10000,reward=27410},-- Hippo. Socks +1
[ 53]={trade={27407,{9051,50}},acc=10000,reward=27408},-- Hygieia Clogs +1
[ 54]={trade={22120,{9209,50}},acc=10000,reward=22121},-- Imati +1
[ 55]={trade={26709,{8979,50}},acc=10000,reward=26710},-- Imp. Wing Hair. +1
[ 56]={trade={20608,{9031,50}},acc=10000,reward=20609},-- Jugo Kukri +1
[ 57]={trade={28275,{8987,50}},acc=10000,reward=28276},-- Jute Boots +1
[ 58]={trade={27050,{9048,50}},acc=10000,reward=27051},-- Kachi. Kote +1
[ 59]={trade={21702,{9058,50}},acc=10000,reward=21703},-- Kladenets +1
[ 60]={trade={21034,{9028,50}},acc=10000,reward=21035},-- Kunimune +1
[ 61]={trade={20580,{9207,50}},acc=10000,reward=20581},-- Kustawi +1
[ 62]={trade={27108,{9094,50}},acc=10000,reward=27109},-- Lamassu Mitts +1
[ 63]={trade={25635,{9149,50}},acc=10000,reward=25636},-- Loess Barbuta +1
[ 64]={trade={21090,{9098,50}},acc=10000,reward=21091},-- Loxotic Mace +1
[ 65]={trade={26896,{9046,50}},acc=10000,reward=26897},-- Lugra Cloak +1
[ 66]={trade={27993,{8981,50}},acc=10000,reward=27994},-- Macabre Gaunt. +1
[ 67]={trade={21099,{8987,50}},acc=10000,reward=21100},-- Magesmasher +1
[ 68]={trade={21483,{9150,50}},acc=10000,reward=21484},-- Malison +1
[ 69]={trade={21159,{9031,50}},acc=10000,reward=21160},-- Marin Staff +1
[ 70]={trade={20799,{9097,50}},acc=10000,reward=20800},-- Mdomo Axe +1
[ 71]={trade={21222,{8993,50}},acc=10000,reward=21223},-- Mengado +1
[ 72]={trade={21688,{9205,50}},acc=10000,reward=21689},-- Montante +1
[ 73]={trade={21029,{9096,50}},acc=10000,reward=21030},-- Norifusa +1
[ 74]={trade={21695,{9149,50}},acc=10000,reward=21696},-- Nullis +1
[ 75]={trade={25709,{9150,50}},acc=10000,reward=25710},-- Obviat. Cuirass +1
[ 76]={trade={21219,{9060,50}},acc=10000,reward=21220},-- Paloma Bow +1
[ 77]={trade={20804,{9057,50}},acc=10000,reward=20805},-- Perun +1
[ 78]={trade={21805,{9209,50}},acc=10000,reward=21806},-- Pixquizpan +1
[ 79]={trade={21162,{8994,50}},acc=10000,reward=21163},-- Pouwhenua +1
[ 80]={trade={20613,{8989,50}},acc=10000,reward=20614},-- Pukulatmuj +1
[ 81]={trade={20980,{9103,50}},acc=10000,reward=20981},-- Raicho +1
[ 82]={trade={28273,{8979,50}},acc=10000,reward=28274},-- Regal Pumps +1
[ 83]={trade={26868,{8994,50}},acc=10000,reward=26869},-- Ros. Jaseran +1
[ 84]={trade={20611,{8985,50}},acc=10000,reward=20612},-- Sangarius +1
[ 85]={trade={21075,{9206,50}},acc=10000,reward=21076},-- Septoptic +1
[ 86]={trade={27995,{8988,50}},acc=10000,reward=27996},-- Shigure Tekko +1
[ 87]={trade={26887,{9029,50}},acc=10000,reward=26888},-- Shomonjijoe +1
[ 88]={trade={26731,{9030,50}},acc=10000,reward=26732},-- Stinger Helm +1
[ 89]={trade={20987,{8984,50}},acc=10000,reward=20988},-- Tancho +1
[ 90]={trade={20679,{9205,50}},acc=10000,reward=20680},-- Tanmogayi +1
[ 91]={trade={27148,{9206,50}},acc=10000,reward=27149},-- Tatena. Gote +1
[ 92]={trade={25855,{9205,50}},acc=10000,reward=25856},-- Tatena. Haidate +1
[ 93]={trade={25732,{9203,50}},acc=10000,reward=25733},-- Tatena. Harama. +1
[ 94]={trade={25923,{9204,50}},acc=10000,reward=25924},-- Tatena. Sune. +1
[ 95]={trade={20603,{9055,50}},acc=10000,reward=20604},-- Ternion Dagger +1
[ 96]={trade={20898,{9051,50}},acc=10000,reward=20899},-- Triska Scythe +1
[ 97]={trade={21690,{9207,50}},acc=10000,reward=21691},-- Ushenzi +1
[ 98]={trade={21349,{8981,50}},acc=10000,reward=21350},-- Wingcutter +1
[ 99]={trade={27230,{9028,50}},acc=10000,reward=27231},-- Zoar Subligar +1
[100]={trade={28429,{8986,50}},acc=10000,reward=28430},-- Acuity Belt +1
[101]={trade={27560,{9047,50}},acc=10000,reward=27561},-- Apeile Ring +1
[102]={trade={28486,{8993,50}},acc=10000,reward=28487},-- Arete del Luna +1
[103]={trade={27619,{9096,50}},acc=10000,reward=27620},-- Aurists Cape +1
[104]={trade={27517,{9093,50}},acc=10000,reward=27518},-- Bathy Choker +1
[105]={trade={10770,{9095,50}},acc=10000,reward=10771},-- Cacoethic Ring +1
[106]={trade={28352,{8986,50}},acc=10000,reward=28353},-- Canto Necklace +1
[107]={trade={27542,{9151,50}},acc=10000,reward=27543},-- Domin. Earring +1
[108]={trade={27609,{9103,50}},acc=10000,reward=27610},-- Fi Follet Cape +1
[109]={trade={10768,{9092,50}},acc=10000,reward=10769},-- Gelatinous Ring +1
[110]={trade={21343,{9058,50}},acc=10000,reward=21344},-- Ghastly Tathlum +1
[111]={trade={27601,{8985,50}},acc=10000,reward=27602},-- Ground. Mantle +1
[112]={trade={28490,{8988,50}},acc=10000,reward=28491},-- Handlers Earring +1
[113]={trade={28412,{9104,50}},acc=10000,reward=28413},-- Kentarch Belt +1
[114]={trade={26001,{9151,50}},acc=10000,reward=26002},-- Loricate Torque +1
[115]={trade={28481,{9046,50}},acc=10000,reward=28482},-- Lugra Earring +1
[116]={trade={27558,{9055,50}},acc=10000,reward=27559},-- Mephitass Ring +1
[117]={trade={27562,{9027,50}},acc=10000,reward=27563},-- Metamor. Ring +1
[118]={trade={28484,{8982,50}},acc=10000,reward=28485},-- Nourish. Earring +1
[119]={trade={27548,{9208,50}},acc=10000,reward=27549},-- Odnowa Earring +1
[120]={trade={21416,{9054,50}},acc=10000,reward=21417},-- Refined Grip +1
[121]={trade={21418,{9029,50}},acc=10000,reward=21419},-- Rigorous Grip +1
[122]={trade={28427,{8983,50}},acc=10000,reward=28428},-- Sailfi Belt +1
[123]={trade={22254,{9098,50}},acc=10000,reward=22255},-- Seeth. Bomblet +1
[124]={trade={28423,{8984,50}},acc=10000,reward=28424},-- Shinjutsu-no-Obi +1
[125]={trade={27508,{9027,50}},acc=10000,reward=27509},-- Unmoving Collar +1
[126]={trade={26021,{9204,50}},acc=10000,reward=26022},-- Vim Torque +1
[127]={trade={27504,{8990,50}},acc=10000,reward=27505},-- Warders Charm +1
[128]={trade={27532,{9097,50}},acc=10000,reward=27533},-- Zwazo Earring +1
}

m:addOverride("xi.zones.Bastok_Markets.npcs.Igsli.onTrade", function(player, npc, trade)
        local accolades = player:getCurrency('unity_accolades')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeplusone) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    cost = v.acc
                    itrade = v.trade[1]
                    player:setCharVar('Utyupgrade', tradedCombo)
                    break
                end
            end
        end
       
        if tradedCombo > 0 and cost <= accolades then
            player:startOptionalCutscene(599, cost, itrade, accolades, 0)
            else
            player:startOptionalCutscene(599, cost, itrade, accolades, 3)
        end
end)

m:addOverride("xi.zones.Bastok_Markets.npcs.Igsli.onEventFinish", function(player, csid, option, npc)
    if csid == 599 and option == 1 then
        local accolades = player:getCurrency('unity_accolades')
        local Utypgrade = player:getCharVar('Utyupgrade')
        local info = upgradeplusone[Utypgrade]
        local cost = info.acc
              player:confirmTrade()
              npcUtil.giveItem(player, info.reward)
              player:delCurrency('unity_accolades', cost)
              player:setCharVar('Utyupgrade', 0)
    else
        xi.unity.onEventFinish(player, csid, option, npc)
    end
end)

m:addOverride("xi.zones.Southern_San_dOria.npcs.Urbiolaine.onTrade", function(player, npc, trade)
        local accolades = player:getCurrency('unity_accolades')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeplusone) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    cost = v.acc
                    itrade = v.trade[1]
                    player:setCharVar('Utyupgrade', tradedCombo)
                    break
                end
            end
        end
       
        if tradedCombo > 0 and cost <= accolades then
            player:startOptionalCutscene(3530, cost, itrade, accolades, 0)
            else
            player:startOptionalCutscene(3530, cost, itrade, accolades, 3)
        end
end)

m:addOverride("xi.zones.Southern_San_dOria.npcs.Urbiolaine.onEventFinish", function(player, csid, option, npc)
    if csid == 3530 and option == 1 then
        local accolades = player:getCurrency('unity_accolades')
        local Utypgrade = player:getCharVar('Utyupgrade')
        local info = upgradeplusone[Utypgrade]
        local cost = info.acc
              player:confirmTrade()
              npcUtil.giveItem(player, info.reward)
              player:delCurrency('unity_accolades', cost)
              player:setCharVar('Utyupgrade', 0)
    else
        xi.unity.onEventFinish(player, csid, option, npc)
    end
end)

m:addOverride("xi.zones.Windurst_Woods.npcs.Teldro-Kesdrodo.onTrade", function(player, npc, trade)
        local accolades = player:getCurrency('unity_accolades')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeplusone) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    cost = v.acc
                    itrade = v.trade[1]
                    player:setCharVar('Utyupgrade', tradedCombo)
                    break
                end
            end
        end
       
        if tradedCombo > 0 and cost <= accolades then
            player:startOptionalCutscene(880, cost, itrade, accolades, 0)
            else
            player:startOptionalCutscene(880, cost, itrade, accolades, 3)
        end
end)

m:addOverride("xi.zones.Windurst_Woods.npcs.Teldro-Kesdrodo.onEventFinish", function(player, csid, option, npc)
    if csid == 880 and option == 1 then
        local accolades = player:getCurrency('unity_accolades')
        local Utypgrade = player:getCharVar('Utyupgrade')
        local info = upgradeplusone[Utypgrade]
        local cost = info.acc
              player:confirmTrade()
              npcUtil.giveItem(player, info.reward)
              player:delCurrency('unity_accolades', cost)
              player:setCharVar('Utyupgrade', 0)
    else
        xi.unity.onEventFinish(player, csid, option, npc)
    end
end)

m:addOverride("xi.zones.Windurst_Woods.npcs.Yonolala.onTrade", function(player, npc, trade)
        local accolades = player:getCurrency('unity_accolades')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeplusone) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    cost = v.acc
                    itrade = v.trade[1]
                    player:setCharVar('Utyupgrade', tradedCombo)
                    break
                end
            end
        end
       
        if tradedCombo > 0 and cost <= accolades then
            player:startOptionalCutscene(880, cost, itrade, accolades, 0)
            else
            player:startOptionalCutscene(880, cost, itrade, accolades, 3)
        end
end)

m:addOverride("xi.zones.Windurst_Woods.npcs.Yonolala.onEventFinish", function(player, csid, option, npc)
    if csid == 880 and option == 1 then
        local accolades = player:getCurrency('unity_accolades')
        local Utypgrade = player:getCharVar('Utyupgrade')
        local info = upgradeplusone[Utypgrade]
        local cost = info.acc
              player:confirmTrade()
              npcUtil.giveItem(player, info.reward)
              player:delCurrency('unity_accolades', cost)
              player:setCharVar('Utyupgrade', 0)
    else
        xi.unity.onEventFinish(player, csid, option, npc)
    end
end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Nunaarl_Bthtrogg.onTrade", function(player, npc, trade)
        local accolades = player:getCurrency('unity_accolades')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for armor upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(upgradeplusone) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    cost = v.acc
                    itrade = v.trade[1]
                    player:setCharVar('Utyupgrade', tradedCombo)
                    break
                end
            end
        end
       
        if tradedCombo > 0 and cost <= accolades then
            player:startOptionalCutscene(5150, cost, itrade, accolades, 0)
            else
            player:startOptionalCutscene(5150, cost, itrade, accolades, 3)
        end
end)

m:addOverride("xi.zones.Western_Adoulin.npcs.Nunaarl_Bthtrogg.onEventFinish", function(player, csid, option, npc)
    if csid == 5150 and option == 1 then
        local accolades = player:getCurrency('unity_accolades')
        local Utypgrade = player:getCharVar('Utyupgrade')
        local info = upgradeplusone[Utypgrade]
        local cost = info.acc
              player:confirmTrade()
              npcUtil.giveItem(player, info.reward)
              player:delCurrency('unity_accolades', cost)
              player:setCharVar('Utyupgrade', 0)
    else
        xi.unity.onEventFinish(player, csid, option, npc)
    end
end)

return m

--[[
1. Cost to upgrade item
2. trade in item
3. player currency amount
4. dialog - 0 has enough currency, 1 the item is not ready for pick up, 2 item is ready for pick up, 3 player doesnt have enough currency, 4 for augmenting
5. 2 for augmenting
6. aug id
7. aug id
8. aug id
]]--