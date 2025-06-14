-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("Tyo_Mythic")

-- add alexandrite, linen and cloth purses to mob drops around toau

local mythicupgrade =
{
[  1]={trade={18492,2616,2617,2618},cost=100,reward=18971},
[  2]={trade={18753,2616,2617,2618},cost=100,reward=18972},
[  3]={trade={18851,2616,2617,2618},cost=100,reward=18973},
[  4]={trade={18589,2616,2617,2618},cost=100,reward=18974},
[  5]={trade={17742,2616,2617,2618},cost=100,reward=18975},
[  6]={trade={18003,2616,2617,2618},cost=100,reward=18976},
[  7]={trade={17744,2616,2617,2618},cost=100,reward=18977},
[  8]={trade={18944,2616,2617,2618},cost=100,reward=18978},
[  9]={trade={17956,2616,2617,2618},cost=100,reward=18979},
[ 10]={trade={18034,2616,2617,2618},cost=100,reward=18980},
[ 11]={trade={18719,2616,2617,2618},cost=100,reward=18981},
[ 12]={trade={18443,2616,2617,2618},cost=100,reward=18982},
[ 13]={trade={18426,2616,2617,2618},cost=100,reward=18983},
[ 14]={trade={18120,2616,2617,2618},cost=100,reward=18984},
[ 15]={trade={18590,2616,2617,2618},cost=100,reward=18985},
[ 16]={trade={17743,2616,2617,2618},cost=100,reward=18986},
[ 17]={trade={18720,2616,2617,2618},cost=100,reward=18987},
[ 18]={trade={18754,2616,2617,2618},cost=100,reward=18988},
[ 19]={trade={19102,2616,2617,2618},cost=100,reward=18969},
[ 20]={trade={18592,2616,2617,2618},cost=100,reward=18970},
[ 21]={trade={18971,2626,2627,2628},cost=150,reward=18991},
[ 22]={trade={18972,2626,2627,2628},cost=150,reward=18992},
[ 23]={trade={18973,2626,2627,2628},cost=150,reward=18993},
[ 24]={trade={18974,2626,2627,2628},cost=150,reward=18994},
[ 25]={trade={18975,2626,2627,2628},cost=150,reward=18995},
[ 26]={trade={18976,2626,2627,2628},cost=150,reward=18996},
[ 27]={trade={18977,2626,2627,2628},cost=150,reward=18997},
[ 28]={trade={18978,2626,2627,2628},cost=150,reward=18998},
[ 29]={trade={18979,2626,2627,2628},cost=150,reward=18999},
[ 30]={trade={18980,2626,2627,2628},cost=150,reward=19000},
[ 31]={trade={18981,2626,2627,2628},cost=150,reward=19001},
[ 32]={trade={18982,2626,2627,2628},cost=150,reward=19002},
[ 33]={trade={18983,2626,2627,2628},cost=150,reward=19003},
[ 34]={trade={18984,2626,2627,2628},cost=150,reward=19004},
[ 35]={trade={18985,2626,2627,2628},cost=150,reward=19005},
[ 36]={trade={18986,2626,2627,2628},cost=150,reward=19006},
[ 37]={trade={18987,2626,2627,2628},cost=150,reward=19007},
[ 38]={trade={18988,2626,2627,2628},cost=150,reward=19008},
[ 39]={trade={18969,2626,2627,2628},cost=150,reward=18989},
[ 40]={trade={18970,2626,2627,2628},cost=150,reward=18990},
[ 41]={trade={18991,2636,2637,2638},cost=200,reward=19060},
[ 42]={trade={18992,2636,2637,2638},cost=200,reward=19061},
[ 43]={trade={18993,2636,2637,2638},cost=200,reward=19062},
[ 44]={trade={18994,2636,2637,2638},cost=200,reward=19063},
[ 45]={trade={18995,2636,2637,2638},cost=200,reward=19064},
[ 46]={trade={18996,2636,2637,2638},cost=200,reward=19065},
[ 47]={trade={18997,2636,2637,2638},cost=200,reward=19066},
[ 48]={trade={18998,2636,2637,2638},cost=200,reward=19067},
[ 49]={trade={18999,2636,2637,2638},cost=200,reward=19068},
[ 50]={trade={19000,2636,2637,2638},cost=200,reward=19069},
[ 51]={trade={19001,2636,2637,2638},cost=200,reward=19070},
[ 52]={trade={19002,2636,2637,2638},cost=200,reward=19071},
[ 53]={trade={19003,2636,2637,2638},cost=200,reward=19072},
[ 54]={trade={19004,2636,2637,2638},cost=200,reward=19073},
[ 55]={trade={19005,2636,2637,2638},cost=200,reward=19074},
[ 56]={trade={19006,2636,2637,2638},cost=200,reward=19075},
[ 57]={trade={19007,2636,2637,2638},cost=200,reward=19076},
[ 58]={trade={19008,2636,2637,2638},cost=200,reward=19077},
[ 59]={trade={18989,2636,2637,2638},cost=200,reward=19078},
[ 60]={trade={18990,2636,2637,2638},cost=200,reward=19079},
[ 61]={trade={19060,2613,2614,2615},cost=250,reward=19080},
[ 62]={trade={19061,2613,2614,2615},cost=250,reward=19081},
[ 63]={trade={19062,2613,2614,2615},cost=250,reward=19082},
[ 64]={trade={19063,2613,2614,2615},cost=250,reward=19083},
[ 65]={trade={19064,2613,2614,2615},cost=250,reward=19084},
[ 66]={trade={19065,2613,2614,2615},cost=250,reward=19085},
[ 67]={trade={19066,2613,2614,2615},cost=250,reward=19086},
[ 68]={trade={19067,2613,2614,2615},cost=250,reward=19087},
[ 69]={trade={19068,2613,2614,2615},cost=250,reward=19088},
[ 70]={trade={19069,2613,2614,2615},cost=250,reward=19089},
[ 71]={trade={19070,2613,2614,2615},cost=250,reward=19090},
[ 72]={trade={19071,2613,2614,2615},cost=250,reward=19091},
[ 73]={trade={19072,2613,2614,2615},cost=250,reward=19092},
[ 74]={trade={19073,2613,2614,2615},cost=250,reward=19093},
[ 75]={trade={19074,2613,2614,2615},cost=250,reward=19094},
[ 76]={trade={19075,2613,2614,2615},cost=250,reward=19095},
[ 77]={trade={19076,2613,2614,2615},cost=250,reward=19096},
[ 78]={trade={19077,2613,2614,2615},cost=250,reward=19097},
[ 79]={trade={19078,2613,2614,2615},cost=250,reward=19098},
[ 80]={trade={19079,2613,2614,2615},cost=250,reward=19099},
[ 81]={trade={19080,2623,2624,2625},cost=300,reward=19612},
[ 82]={trade={19081,2623,2624,2625},cost=300,reward=19613},
[ 83]={trade={19082,2623,2624,2625},cost=300,reward=19614},
[ 84]={trade={19083,2623,2624,2625},cost=300,reward=19615},
[ 85]={trade={19084,2623,2624,2625},cost=300,reward=19616},
[ 86]={trade={19085,2623,2624,2625},cost=300,reward=19617},
[ 87]={trade={19086,2623,2624,2625},cost=300,reward=19618},
[ 88]={trade={19087,2623,2624,2625},cost=300,reward=19619},
[ 89]={trade={19088,2623,2624,2625},cost=300,reward=19620},
[ 90]={trade={19089,2623,2624,2625},cost=300,reward=19621},
[ 91]={trade={19090,2623,2624,2625},cost=300,reward=19622},
[ 92]={trade={19091,2623,2624,2625},cost=300,reward=19623},
[ 93]={trade={19092,2623,2624,2625},cost=300,reward=19624},
[ 94]={trade={19093,2623,2624,2625},cost=300,reward=19625},
[ 95]={trade={19094,2623,2624,2625},cost=300,reward=19626},
[ 96]={trade={19095,2623,2624,2625},cost=300,reward=19627},
[ 97]={trade={19096,2623,2624,2625},cost=300,reward=19628},
[ 98]={trade={19097,2623,2624,2625},cost=300,reward=19629},
[ 99]={trade={19098,2623,2624,2625},cost=300,reward=19630},
[100]={trade={19099,2623,2624,2625},cost=300,reward=19631},
[101]={trade={19612,2633,2634,2635},cost=350,reward=19710},
[102]={trade={19613,2633,2634,2635},cost=350,reward=19711},
[103]={trade={19614,2633,2634,2635},cost=350,reward=19712},
[104]={trade={19615,2633,2634,2635},cost=350,reward=19713},
[105]={trade={19616,2633,2634,2635},cost=350,reward=19714},
[106]={trade={19617,2633,2634,2635},cost=350,reward=19715},
[107]={trade={19618,2633,2634,2635},cost=350,reward=19716},
[108]={trade={19619,2633,2634,2635},cost=350,reward=19717},
[109]={trade={19620,2633,2634,2635},cost=350,reward=19718},
[110]={trade={19621,2633,2634,2635},cost=350,reward=19719},
[111]={trade={19622,2633,2634,2635},cost=350,reward=19720},
[112]={trade={19623,2633,2634,2635},cost=350,reward=19721},
[113]={trade={19624,2633,2634,2635},cost=350,reward=19722},
[114]={trade={19625,2633,2634,2635},cost=350,reward=19723},
[115]={trade={19626,2633,2634,2635},cost=350,reward=19724},
[116]={trade={19627,2633,2634,2635},cost=350,reward=19725},
[117]={trade={19628,2633,2634,2635},cost=350,reward=19726},
[118]={trade={19629,2633,2634,2635},cost=350,reward=19727},
[119]={trade={19630,2633,2634,2635},cost=350,reward=19728},
[120]={trade={19631,2633,2634,2635},cost=350,reward=19729},
[121]={trade={19710,2610,2611,2612},cost=400,reward=19819},
[122]={trade={19711,2620,2621,2622},cost=400,reward=19820},
[123]={trade={19712,2630,2631,2632},cost=400,reward=19821},
[124]={trade={19713,2610,2611,2612},cost=400,reward=19822},
[125]={trade={19714,2620,2621,2622},cost=400,reward=19823},
[126]={trade={19715,2630,2631,2632},cost=400,reward=19824},
[127]={trade={19716,2610,2611,2612},cost=400,reward=19825},
[128]={trade={19717,2620,2621,2622},cost=400,reward=19826},
[129]={trade={19718,2630,2631,2632},cost=400,reward=19827},
[130]={trade={19719,2610,2611,2612},cost=400,reward=19828},
[131]={trade={19720,2620,2621,2622},cost=400,reward=19829},
[132]={trade={19721,2630,2631,2632},cost=400,reward=19830},
[133]={trade={19722,2610,2611,2612},cost=400,reward=19831},
[134]={trade={19723,2620,2621,2622},cost=400,reward=19832},
[135]={trade={19724,2630,2631,2632},cost=400,reward=19833},
[136]={trade={19725,2610,2611,2612},cost=400,reward=19834},
[137]={trade={19726,2620,2621,2622},cost=400,reward=19835},
[138]={trade={19727,2630,2631,2632},cost=400,reward=19836},
[139]={trade={19728,2610,2611,2612},cost=400,reward=19837},
[140]={trade={19729,2620,2621,2622},cost=400,reward=19838},
[141]={trade={19819,2609,2619,2629},cost=450,reward=19948},
[142]={trade={19820,2609,2619,2629},cost=450,reward=19949},
[143]={trade={19821,2609,2619,2629},cost=450,reward=19950},
[144]={trade={19822,2609,2619,2629},cost=450,reward=19951},
[145]={trade={19823,2609,2619,2629},cost=450,reward=19952},
[146]={trade={19824,2609,2619,2629},cost=450,reward=19953},
[147]={trade={19825,2609,2619,2629},cost=450,reward=19954},
[148]={trade={19826,2609,2619,2629},cost=450,reward=19955},
[149]={trade={19827,2609,2619,2629},cost=450,reward=19956},
[150]={trade={19828,2609,2619,2629},cost=450,reward=19957},
[151]={trade={19829,2609,2619,2629},cost=450,reward=19958},
[152]={trade={19830,2609,2619,2629},cost=450,reward=19959},
[153]={trade={19831,2609,2619,2629},cost=450,reward=19960},
[154]={trade={19832,2609,2619,2629},cost=450,reward=19961},
[155]={trade={19833,2609,2619,2629},cost=450,reward=19962},
[156]={trade={19834,2609,2619,2629},cost=450,reward=19963},
[157]={trade={19835,2609,2619,2629},cost=450,reward=19964},
[158]={trade={19836,2609,2619,2629},cost=450,reward=19965},
[159]={trade={19837,2609,2619,2629},cost=450,reward=19966},
[160]={trade={19838,2609,2619,2629},cost=450,reward=19967},
[161]={trade={18852,2609,2619,2629},cost=2200,reward=21070},
[162]={trade={19163,2609,2619,2629},cost=2200,reward=20753},
}

local znmtele =
{
[163]={trade={2580},zone=51,X= -695.558,Y=    -7.5,Z= -126.721,Rot= 252},
[164]={trade={2577},zone=51,X=  257.462,Y= -23.433,Z=  120.741,Rot= 187},
[165]={trade={2575},zone=51,X= -339.551,Y= -31.525,Z=  675.203,Rot= 186},
[166]={trade={2573},zone=51,X=  276.116,Y=  -0.085,Z= -694.632,Rot= 162},
[167]={trade={2578},zone=52,X=  331.456,Y=  -10.00,Z=  182.845,Rot= 104},
[168]={trade={2576},zone=52,X=  -32.405,Y= -32.529,Z=  484.546,Rot= 208},
[169]={trade={2601},zone=54,X=  490.819,Y=   -2.37,Z=  167.028,Rot=   0},
[170]={trade={2600},zone=54,X=  313.172,Y=  -3.602,Z=   26.211,Rot=   0},
[171]={trade={2598},zone=54,X=  177.644,Y=  -4.668,Z=    181.4,Rot=   0},
[172]={trade={2596},zone=54,X= -453.103,Y=  -7.308,Z=  387.904,Rot=   0},
[173]={trade={2590},zone=61,X=    402.6,Y= -27.513,Z=  121.544,Rot= 162},
[174]={trade={2591},zone=61,X=  501.415,Y=  -8.768,Z=   52.986,Rot= 238},
[175]={trade={2587},zone=61,X=  -363.61,Y=  -14.00,Z=  361.898,Rot=  89},
[176]={trade={2585},zone=61,X=    88.29,Y= -21.999,Z=   71.916,Rot= 128},
[177]={trade={2583},zone=61,X=  323.299,Y= -13.999,Z= -601.701,Rot= 159},
[178]={trade={2589},zone=62,X=  -140.35,Y=  10.222,Z=  464.194,Rot=  95},
[179]={trade={2588},zone=62,X=   19.145,Y=   -9.78,Z=  216.458,Rot=  32},
[180]={trade={2586},zone=62,X=  -34.486,Y=   9.999,Z=  339.257,Rot= 250},
[181]={trade={2581},zone=65,X=  208.856,Y=  14.878,Z=  -285.45,Rot= 124},
[182]={trade={2579},zone=65,X=  -119.00,Y=    7.10,Z=  -79.000,Rot= 192},
[183]={trade={2584},zone=68,X= -199.448,Y=    8.76,Z=  -61.712,Rot= 198},
[184]={trade={2572},zone=68,X=  200.000,Y=  33.991,Z= -140.000,Rot=  70},
[185]={trade={2602},zone=68,X=  -217.51,Y=  35.363,Z=   13.689,Rot=   0},
[186]={trade={2592},zone=72,X=  548.991,Y=   0.000,Z= -139.976,Rot= 126},
[187]={trade={2582},zone=72,X=   -184.6,Y=  -8.398,Z=   20.000,Rot=   0},
[188]={trade={2574},zone=72,X=  -19.957,Y=  -4.000,Z= -182.656,Rot=   0},
[189]={trade={2597},zone=72,X=  -20.081,Y=  -3.949,Z=  206.628,Rot=   0},
[190]={trade={2599},zone=79,X=  417.795,Y= -19.631,Z=  -74.338,Rot=   0},
[191]={trade={2595},zone=79,X= -771.466,Y=  -11.75,Z=  322.087,Rot=   0},
[192]={trade={2594},zone=79,X=  697.491,Y=  -7.000,Z=  526.015,Rot=   0},
[193]={trade={2593},zone=79,X= -756.499,Y= -12.413,Z=   632.74,Rot=   0},
}

local menu  = {}
local page1 = {}
local page2 = {}
local page3 = {}
local page4 = {}
local page5 = {}
local page6 = {}
local delaySendMenu = function(player)
      player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'What whould you like to do?',
    options = {},
}
page1 =
{
    {
        'Nothing!',
        function(player)
        end,
    },
    {
        'Purchase Vigil Weapon!',
         function(player)
            menu.options = xi.shop.general(player, page2)
         end
    },
    {
        'Check Alexandrite Balance!',
         function(player)
               local storedalex = player:getCharVar('Alexandrite')
               player:printToPlayer(string.format('You current Alexandrite Balance is %s alexandrites. ',storedalex), 0, 'Tyo') 
         end
    },
    {
        'Retrieve stored Alexandrite!',
        function(player)
               player:printToPlayer('Please trade me gil in the amount of alexandrite you wish to withdraw', 0, 'Tyo')                      
        end,
    },
    {
        'Next Page!',
        function(player)
                    menu.options = page4
                    delaySendMenu(player)                 
        end,
    },
}
page4 =
{
    {
        'Retrieve Upgraded Mythical!',
         function(player)
                 local MythUpgrade = player:getCharVar('MytWupgrade')
                 if MythUpgrade >= 1 then
                       local info = mythicupgrade[MythUpgrade]
                       local cost = info.acc
                       player:printToPlayer('Your mythical weapon is ready! Make good use of it. ', 0, 'Tyo')
                         
                       npcUtil.giveItem(player, info.reward)
                       player:setCharVar('MytWupgrade', 0)
                 else
                       player:printToPlayer('You currently do not have a Mythical weapon ready for upgrade! ', 0, 'Tyo')
                 end
         end
    },
    {
        'Review upgrade requirements!',
        function(player)
                    menu.options = page3
                    delaySendMenu(player)                 
        end,
    },
    {
        'Back!',
        function(player)
                    menu.options = page1
                    delaySendMenu(player)                 
        end,
    },
}
page2 =
    {
            18492, 1000000,   -- Sturdy Axe
            18753, 1000000,   -- Burning Fists
            18851, 1000000,   -- Werebuster
            18589, 1000000,   -- Mages Staff
            17742, 1000000,   -- Vorpal Sword
            18003, 1000000,   -- Swordbreaker
            17744, 1000000,   -- Brave Blade
            18944, 1000000,   -- Death Sickle
            17956, 1000000,   -- Double Axe
            18034, 1000000,   -- Dancing Dagger
            18719, 1000000,   -- Killer Bow
            18443, 1000000,   -- Windslicer
            18426, 1000000,   -- Sasuke Katana
            18120, 1000000,   -- Radiant Lance
            18590, 1000000,   -- Scepter Staff
	        17743, 1000000,   -- Wightslayer
            18720, 1000000,   -- Quicksilver
            18754, 1000000,   -- Inferno Claws
            19102, 1000000,   -- Main Gauche
	        18592, 1000000,   -- Elder Staff
    }
page3 =
{
    {
        'Vigil Weapon to Base Mythic',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your base weapon and one each; Vulpangues Wing, Gigiroons Cape, Chamroshs Beak', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 100 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Base Mythic to 75',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Obs Arm, Claret Globule, Brass Borers Cocoon', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 150 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Mythic Lvl 75 to 80',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Velionis Bone, Lil Apkallus Egg, Chigre', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 200 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Mythic Lvl 80 to 85',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Iriz Imas Hide, Amooshahs Tendril, Iriri Samariris Hat', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 250 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Next Page!',
        function(player)
                    menu.options = page5
                    delaySendMenu(player)                 
        end,
    },
}
page5 =
{
    {
        'Mythic Lvl 85 to 90',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Anantabogas Heart, Dextroses Blubber, Reactons Ashes', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 300 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Mythic Lvl 90 to 95',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Verdelets Wing, Wulgarus Head, Zareehkls Neckpiece', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 350 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Mythic Lvl 95 to 99', 
        function(player)
           player:printToPlayer('We will require the following items to upgrade to the following weapons! ', 0, 'Tyo')
           player:printToPlayer('Conqueror, Laevateinn, Burtgang, Carnwenhan, Nagi, Tizona, Terpsichore', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Armed Gears Fragment, Deas Horn, Gotoh Zhas Necklace', 0, 'Tyo')
           player:printToPlayer('We will require the following items to upgrade to the following weapons! ', 0, 'Tyo')
           player:printToPlayer('Glanzfaust, Murgleis, Liberator, Gastraphetes, Ryunohige, Death Penalty, Tupsimati', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Achamoths Antenna, Bhurborlors Vambrace, Nosferatus Claw ', 0, 'Tyo')
           player:printToPlayer('We will require the following items to upgrade to the following weapons! ', 0, 'Tyo')
           player:printToPlayer('Yagrush, Vajra, Aymur, Kogarasumaru, Nirvana, Kenkonken', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Experimental Lamias Armband, Mahjlaefs Staff, Nuhns Esca', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 400 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Mythic Lvl 99 to 99 II',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('Your weapon and one each; Tinnins Fang, Sarameyas Hide, Tygers Tail', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 450 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Next Page!',
        function(player)
                    menu.options = page6
                    delaySendMenu(player)                 
        end,
    },
    {
        'Previous Page!',
        function(player)
                    menu.options = page3
                    delaySendMenu(player)                 
        end,
    },
}
page6 = 
{
    {
        'Ergon Idris Lvl 119',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('An Octave Club and one each; Tinnins Fang, Sarameyas Hide, Tygers Tail', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 2200 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Ergon Epeolatry Lvl 119',
        function(player)
           player:printToPlayer('We will require the following items to upgrade to this weapon! ', 0, 'Tyo')
           player:printToPlayer('A Nightfall greatwsord and one each; Tinnins Fang, Sarameyas Hide, Tygers Tail', 0, 'Tyo')
           player:printToPlayer('The upgrade fee will be 2200 Alexandrite', 0, 'Tyo')
        end,
    },
    {
        'Previous Page!',
        function(player)
                    menu.options = page5
                    delaySendMenu(player)                 
        end,
    },
}

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)
    local Tyo = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Tyo',
        look = '01000301ab10ab20ab30ab40ab50006000700000',
        x = -124.8966,
        y = 2.0000,
        z = 20.3235,
        rotation = 127,
        widescan = 1,


     onTrade = function(player, npc, trade)
         -- store alexandrite
             local storedalex = player:getCharVar('Alexandrite')
             local count = trade:getItemCount()
             if trade:hasItemQty(xi.item.ALEXANDRITE, count) then
                      local total = player:getCharVar('Alexandrite') + count
                      if total > 1 then 
                         player:setCharVar('Alexandrite', total)
                         player:tradeComplete()
                      end
               player:printToPlayer(string.format('Thank you for allowing me to hold your %s alexandrite.',count), 0, 'Tyo') 
               player:printToPlayer(string.format('You current Alexandrite Balance is %s alexandrites. ',storedalex + count), 0, 'Tyo') 
             end

         -- Mythical weapon upgrade
        local storedalex = player:getCharVar('Alexandrite')
        local tradedCombo = 0
        local cost = 0
        local itrade = 0
        -- check for weapon upgrade trades
             if tradedCombo == 0 then
                    for k, v in pairs(mythicupgrade) do
                      if npcUtil.tradeHasExactly(trade, v.trade) then
                            if v.cost <= storedalex then
                               player:setCharVar('Alexandrite', storedalex - v.cost)
                               tradedCombo = k
                               itrade = v.trade[1]
                               player:setCharVar('MytWupgrade', tradedCombo)
                               player:confirmTrade()
                               cost = v.acc
                            end
                               player:printToPlayer('Thank you for the materials, We will begin working on your upgrade right away!. ', 0, 'Tyo') 
                         break
                      end
                    end
             end
            -- trade pop item to teleport to znm location
            local tradedpop = 0
            if tradedpop == 0 then
                    for k, v in pairs(znmtele) do
                        if npcUtil.tradeHasExactly(trade, v.trade) then
                           player:setPos(v.X, v.Y, v.Z, v.Rot, v.zone)
                            break
                        end
                    end
            end
                 -- give alexandrite back base on amount of gil traded, if you have the inventory space
               if npcUtil.tradeHas(trade, xi.item.GIL) then
                     local countx = trade:getItemQty(65535)
                     local quantity  = player:getCharVar('Alexandrite')
                     local stacks    = math.floor(countx / 99)
                     local remainder = countx % 99
                     local slotsNeeded = stacks
                           if remainder > 0 then
                              slotsNeeded = slotsNeeded + 1
                           end
                                  if countx < quantity then
                                    if countx > 0 then
                                     if player:getFreeSlotsCount() < slotsNeeded then
                                        player:printToPlayer('You cannot withdrawn that amount. ', 0, 'Tyo')
                                        player:printToPlayer('Please check your inventory and try again. ', 0, 'Tyo')
                                        return
                                     else
                                       player:addItem(2488, countx)
                                       player:setCharVar('Alexandrite', quantity - countx)
                                       player:printToPlayer(string.format('You have withdrawn %s alexandrites. ',countx), 0, 'Tyo')
                                       player:printToPlayer(string.format('Your remaining balance of alexandrite is %s. ',player:getCharVar('Alexandrite')), 0, 'Tyo') 
                                     end
                                    end
                                  else
                                       player:printToPlayer('You cannot withdrawn that amount. You are trying to withdraw more alexandrite', 0, 'Tyo')
                                       player:printToPlayer(string.format('than you have. Your current stored alexandrite is %s',quantity), 0, 'Tyo')
                                  end  
               end
    end,

        onTrigger = function(player, npc)
                    menu.options = page1
                    delaySendMenu(player)
        end,

    })
    utils.unused(Tyo)
end)

return m


