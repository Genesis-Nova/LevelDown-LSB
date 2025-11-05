-----------------------------------
-- Change your Wyverns skin
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('hokutens')

-- Forward declarations (required)
local menu  = {}
local page1 = {}
local page2 = {}
local page3 = {}
local page4 = {}
local page5 = {}
local page6 = {}
local page7 = {}
local page8 = {}
local page9 = {}

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'What would you like?',
    options = {},
}
page1 =
{
    {
        'Season Event Shops',
         function(player)
                menu.options = page2
                delaySendMenu(player)
         end
    },
}

page2 =
{
    {
        'Nothing',
         function(player)
         end
    },
    {
        'Fireworks',
         function(player)
            menu.options = xi.shop.general(player, page4)
         end
    },
    {
        'Seasonal Events Wear 1',
         function(player)
            menu.options = xi.shop.general(player, page5)
         end
    },
    {
        'Seasonal Events Wear 2',
         function(player)
            menu.options = xi.shop.general(player, page6)
         end
    },
    {
        'Seasonal Events Wear 3',
         function(player)
            menu.options = xi.shop.general(player, page7)
         end
    },
    {
        'Next',
        function(player)
         menu.options = page3
         delaySendMenu(player)   
        end
    },

}
page3 =
{
    {
        'Seasonal Events Wear 4',
         function(player)
            menu.options = xi.shop.general(player, page8)
         end
    },
    {
        'Seasonal Events Wear 5',
         function(player)
            menu.options = xi.shop.general(player, page9)
         end
    },
    {
        'Prev',
        function(player)
         menu.options = page2
         delaySendMenu(player)   
        end
    },
}

page4 =
{
    { 4218, 10 }, -- Air Rider
    { 4216, 10 }, -- Brilliant Snow
    { 4250, 10 }, -- Crackler
    { 4251, 10 }, -- Festive Fan
    { 2394, 10 }, -- Gysahl Bomb
    { 4184, 10 }, -- Kongou Inaho
    { 5882, 10 }, -- Marine Bliss
    { 5360, 10 }, -- Muteppo
    { 5769, 10 }, -- Popper
    { 6186, 10 }, -- Slime Rocket
    { 2395, 10 }, -- Spore Bomb
    { 4168, 10 }, -- Twinkle Shower
    { 4186, 10 }, -- Airborne
    { 5937, 10 }, -- Bubble Breeze
    { 5361, 10 }, -- Datechochin
    { 5532, 10 }, -- chinintousen Koma
    { 4183, 10 }, -- Konron Hassen
    { 4185, 10 }, -- Meifu Goma
    { 4256, 10 }, -- Ouka Ranman
    { 5884, 10 }, -- Rengedama
    { 4217, 10 }, -- Sparkling Hand
    { 6190, 10 }, -- Spriggan Spark
    { 5441, 10 }, -- Angelwing
    { 4167, 10 }, -- Cracker
    { 5883, 10 }, -- Falling Star
    { 5725, 10 }, -- Goshikitenge
    { 6268, 10 }, -- Komanezumi
    { 4169, 10 }, -- Little Comet
    { 5936, 10 }, -- Mog Missile
    { 4257, 10 }, -- Papillion
    { 4215, 10 }, -- Popstar
    { 5881, 10 }, -- Shisai Kaboku
    { 4253, 10 }, -- Spirit Masque
    { 4252, 10 }, -- Summer Fan
}
page5 =
{
    { 22048,1000 }, -- Adenium Mallet
    { 10446,1000 }, -- Ahriman Cap
    { 26520,1000 }, -- Akitu Shirt
    { 18399,1000 }, -- Charm Wand
    { 18400,1000 }, -- Charm Wand +1
    { 22049,1000 }, -- Citrullus Mallet
    { 27293,1000 }, -- Cossie Bottom
    { 27294,1000 }, -- Cossie Bottom +1
    { 26967,1000 }, -- Cossie Top
    { 26968,1000 }, -- Cossie Top +1
    { 10334,1000 }, -- Creek Boxers
    { 10342,1000 }, -- Creek Boxers +1
    { 10260,1000 }, -- Creek Maillot
    { 10268,1000 }, -- Creek Maillot +1
    { 10335,1000 }, -- Creek Shorts
    { 10343,1000 }, -- Creek Shorts +1
    { 10261,1000 }, -- Creek Top
    { 10269,1000 }, -- Creek Top +1
    { 25755,1000 }, -- Crustacean Shirt
    { 11265,1000 }, -- Custom Gilet
    { 11273,1000 }, -- Custom Gilet +1
    { 16322,1000 }, -- Custom Shorts
    { 16330,1000 }, -- Custom Shorts +1
    { 11266,1000 }, -- Custom Top
    { 11274,1000 }, -- Custom Top +1
    { 16321,1000 }, -- Custom Trunks
    { 16329,1000 }, -- Custom Trunks +1
    { 18863,1000 }, -- Dream Bell
    { 18864,1000 }, -- Dream Bell +1
    { 15752,1000 }, -- Dream Boots
    { 15753,1000 }, -- Dream Boots +1
    { 15178,1000 }, -- Dream Hat
    { 15179,1000 }, -- Dream Hat +1
    { 11967,1000 }, -- Dream Pants
    { 11968,1000 }, -- Dream Pants +1
    { 14519,1000 }, -- Dream Robe
    { 14520,1000 }, -- Dream Robe +1
    { 11965,1000 }, -- Dream Trousers
    { 11966,1000 }, -- Dream Trousers +1
    { 10337,1000 }, -- Dune Boxers
    { 10345,1000 }, -- Dune Boxers +1
    { 10263,1000 }, -- Dune Gilet
    { 10271,1000 }, -- Dune Gilet +1
    { 11300,1000 }, -- Eerie Cloak
    { 11301,1000 }, -- Eerie Cloak +1
    { 16109,1000 }, -- Egg Helm
    { 11272,1000 }, -- Elder Gilet
    { 11280,1000 }, -- Elder Gilet +1
    { 16328,1000 }, -- Elder Trunks
    { 16336,1000 }, -- Elder Trunks +1
}
page6 =
{
    { 14452,1000 }, -- Elvaan Gilet
    { 14459,1000 }, -- Elvaan Gilet +1
    { 15411,1000 }, -- Elvaan Shorts
    { 15418,1000 }, -- Elvaan Shorts +1
    { 14453,1000 }, -- Elvaan Top
    { 14460,1000 }, -- Elvaan Top +1
    { 15410,1000 }, -- Elvaan Trunks
    { 15417,1000 }, -- Elvaan Trunks +1
    { 26707,1000 }, -- Flan Masque
    { 26708,1000 }, -- Flan Masque +1
    { 14456,1000 }, -- Galka Gilet
    { 14463,1000 }, -- Galka Gilet +1
    { 15414,1000 }, -- Galka Trunks
    { 15421,1000 }, -- Galka Trunks +1
    { 27715,1000 }, -- Goblin Masque
    { 27866,1000 }, -- Goblin Suit
    { 22069,1000 }, -- Hapy Staff
    { 26889,1000 }, -- Heart Apron
    { 26890,1000 }, -- Heart Apron +1
    { 11861,1000 }, -- Hikogami Yukata
    { 11862,1000 }, -- Himegami Yukata
    { 13917,1000 }, -- Horror Head
    { 15177,1000 }, -- Horror Head II
    { 14450,1000 }, -- Hume Gilet
    { 14457,1000 }, -- Hume Gilet +1
    { 15409,1000 }, -- Hume Shorts
    { 15416,1000 }, -- Hume Shorts +1
    { 14451,1000 }, -- Hume Top
    { 14458,1000 }, -- Hume Top +1
    { 15408,1000 }, -- Hume Trunks
    { 15415,1000 }, -- Hume Trunks +1
    { 27623,1000 }, -- Jody Sheild
    { 26518,1000 }, -- Jody Shirt
    { 25586,1000 }, -- Kakai Cap
    { 25587,1000 }, -- Kakai Cap +1
    { 28149,1000 }, -- Kengyu Hanmomohiki
    { 27859,1000 }, -- Kengyu Happi
    { 22047,1000 }, -- Korrigan Mallet
    { 13822,1000 }, -- Ladys Yukata
    { 21097,1000 }, -- Leafkin Bopper
    { 21098,1000 }, -- Leafkin Bopper +1
    { 13821,1000 }, -- Lords Yukata
    { 22051,1000 }, -- Lycopodium Mallet
    { 11267,1000 }, -- Magna Gilet
    { 11275,1000 }, -- Magna Gilet +1
    { 16324,1000 }, -- Magna Shorts
    { 16332,1000 }, -- Magna Shorts +1
    { 11268,1000 }, -- Magna Top
    { 11276,1000 }, -- Magna Top +1
    { 16323,1000 }, -- Magna Trunks
}
page7 =
{
    { 16331,1000 }, -- Magna Trunks +1
    { 26706,1000 }, -- Mandragora Masque +1
    { 26519,1000 }, -- Mandragora Shirt
    { 27855,1000 }, -- Mandragora Suit +1
    { 10330,1000 }, -- Marine Boxers
    { 10338,1000 }, -- Marine Boxers +1
    { 10256,1000 }, -- Marine Gilet
    { 10264,1000 }, -- Marine Gilet +1
    { 10331,1000 }, -- Marine Shorts
    { 10339,1000 }, -- Marine Shorts +1
    { 10257,1000 }, -- Marine Top
    { 10265,1000 }, -- Marine Top +1
    { 18844,1000 }, -- Miracle Wand
    { 18845,1000 }, -- Miracle Wand +1
    { 15413,1000 }, -- Mithra Shorts
    { 15420,1000 }, -- Mithra Shorts +1
    { 14455,1000 }, -- Mithra Top
    { 14462,1000 }, -- Mithra Top +1
    { 10809,1000 }, -- Moogle Guard
    { 26546,1000 }, -- Moogle Shirt
    { 23805,1000 }, -- Morbol Apron
    { 26693,1000 }, -- Morbol Cap
    { 27625,1000 }, -- Morbol Shield
    { 25909,1000 }, -- Morbol Subligar
    { 13820,1000 }, -- Omina Yukata
    { 11319,1000 }, -- Ominaeshi Yukata
    { 14533,1000 }, -- Onago Yukata
    { 14535,1000 }, -- Onnagimi Yukata
    { 11317,1000 }, -- Onnagusa Yukata
    { 13819,1000 }, -- Onoko Yukata
    { 14532,1000 }, -- Otoko Yukata
    { 11318,1000 }, -- Otokoeshi Yukata
    { 14534,1000 }, -- Otokogimi Yukata
    { 11316,1000 }, -- Otokogusa Yukata
    { 18102,1000 }, -- Pitchfork
    { 18103,1000 }, -- Pitchfork +1
    { 13916,1000 }, -- Pumpkin Head
    { 15176,1000 }, -- Pumpkin Head II
    { 10447,1000 }, -- Pyracmon Cap
    { 26788,1000 }, -- Rabbit Cap
    { 10336,1000 }, -- River Shorts
    { 10344,1000 }, -- River Shorts +1
    { 10262,1000 }, -- River Top
    { 10270,1000 }, -- River Top +1
    { 27803,1000 }, -- Rustic Maillot
    { 27805,1000 }, -- Rustic Maillot +1
    { 28086,1000 }, -- Rustic Trunks
    { 28088,1000 }, -- Rustic Trunks +1
    { 16327,1000 }, -- Savage Shorts
    { 16335,1000 }, -- Savage Shorts +1
}
page8 =
{
    { 11271,1000 }, -- Savage Top
    { 11279,1000 }, -- Savage Top +1
    { 27804,1000 }, -- Shoal Maillot
    { 27806,1000 }, -- Shoal Maillot +1
    { 28087,1000 }, -- Shoal Trunks
    { 28089,1000 }, -- Shoal Trunks +1
    { 28150,1000 }, -- Shokujo Hanmomohiki
    { 27860,1000 }, -- Shokujo Happi
    { 17588,1000 }, -- Treat Staff II
    { 22052,1000 }, -- Summer uchiwa
    { 27291,1000 }, -- Swimming Togs
    { 27292,1000 }, -- Swimming Togs +1
    { 26965,1000 }, -- Ta Moko
    { 26966,1000 }, -- Ta Moko +1
    { 14461,1000 }, -- tarutaru Maillot +1
    { 15424,1000 }, -- tarutaru shorts +1
    { 15419,1000 }, -- tarutaru trunks +1
    { 14454,1000 }, -- Tarutaru Maillot
    { 15423,1000 }, -- Tarutaru Shorts
    { 14471,1000 }, -- Tarutaru Top
    { 14472,1000 }, -- Tarutaru Top +1
    { 15412,1000 }, -- Tarutaru Trunks
    { 17566,1000 }, -- Treat Staff
    { 17565,1000 }, -- Trick Staff
    { 17587,1000 }, -- Trick Staff II
    { 11269,1000 }, -- Wonder Maillot
    { 11277,1000 }, -- Wonder Maillot +1
    { 16326,1000 }, -- Wonder Shorts
    { 16334,1000 }, -- Wonder Shorts +1
    { 11270,1000 }, -- Wonder Top
    { 11278,1000 }, -- Wonder Top +1
    { 16325,1000 }, -- Wonder Trunks
    { 16333,1000 }, -- Wonder Trunks +1
    { 10332,1000 }, -- Woodsy Boxers
    { 10340,1000 }, -- Woodsy Boxers +1
    { 10258,1000 }, -- Woodsy Gilet
    { 10266,1000 }, -- Woodsy Gilet +1
    { 10333,1000 }, -- Woodsy Shorts
    { 10341,1000 }, -- Woodsy Shorts +1
    { 10259,1000 }, -- Woodsy Top
    { 10267,1000 }, -- Woodsy Top +1
}
page9 =
{
    { 25774,1000 }, -- fancy gilet
    { 25775,1000 }, -- fancy top
    { 25838,1000 }, -- fancy trunks
    { 25839,1000 }, -- fancy shorts
    { 23810,1000 }, -- knit cap
    { 23811,1000 }, -- knit cap +1
    { 23871,1000 }, -- hebenus_gilet
    { 23872,1000 }, -- hebenus_boxers
    { 23873,1000 }, -- hebenus_top
    { 23874,1000 }, -- hebenus_shorts
}

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)
    local Hokutens = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Hokutens',
        look = 3110,
        x         = 377.8299,
        y         = -3.7896,
        z         = -560.0650,
        rotation = 123,
        widescan = 1,
        onTrade = function(player, npc, trade)
            
        end,
        onTrigger = function(player, npc)
                menu.options = page1
                delaySendMenu(player)
        end,
    })
end)

return m

