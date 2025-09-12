-- This file is called by login_campaign.lua and require()'s no file, it should not be require()'d by any
-- other lua scripts, which should instead require() login_campaign.lua directly.

-- TODO: Move this table somewhere untracked so it can be freely modified without polluting the
--       git workspace

-- TODO: Fill in with _commented out entries_ for all the things seen in each category
---@class prizes : { [integer] : { ['price']: integer, ['items']: { [integer]: xi.item } } }
local prizes =
{
    [1] =
    {
        ['price'] = 10,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            1126, -- beastmens_seal
            1127, -- kindreds_seal
            2955, -- kindreds_crest
            2956, -- h._kindred_crest
            2957, -- s._kindred_crest
            1455, -- one byne bill
            1452, -- ordelle bronzepiece
            1449, -- tukuku whiteshell
            1875, -- ancient beastcoin
            --[[
            --- Month 1 ---------------------------------------------
            6377, -- imperial chair set
            6378, -- decorative chair set
            6379, -- ornate stool set
            ]]--
            --- Month 2 ---------------------------------------------

            6380, -- refined chair set
            6408, -- portable container
            6409, -- ephramadian throne
            --[[
            --- Month 3 ---------------------------------------------
            6410, -- shadow throne
            6411, -- chocobo chair
            6412, -- leaf bench
            6413, -- astral cube
            ]]--
        },
    },

    [5] =
    {
        ['price'] = 100,
        ['items'] =
        {
            --- Alway active ----------------------------------------
             8711, -- copper aman voucher
             --[[
            --- Month 1 ---------------------------------------------
            10124, -- cipher of luzafs alter ego
            10125, -- cipher of najeliths alter ego
            10112, -- cipher of zeids alter ego
            10113, -- cipher of lions alter ego
            10065, -- ♪spectral chair
            10066, -- ♪spheroid
            10067, -- ♪omega
            10068, -- ♪coeurl
            10069, -- ♪goobbue
            10070, -- ♪raaz
            10129, -- cipher of d. shantottos alter ego
             ]]--
            --- Month 2 ---------------------------------------------

            10134, -- cipher of star sibyls alter ego
            10142, -- cipher of karahas alter ego
            10149, -- cipher of areuhats alter ego
            10071, -- ♪levitus
            10072, -- ♪adamantoise
            10073, -- ♪dhalmel
            10074, -- ♪doll
            10075, -- ♪red raptor
            10076, -- ♪golden bomb
            --[[
            --- Month 3 ---------------------------------------------
            10179, -- cipher of teodors alter ego
            10183, -- cipher of darrcuilns alter ego
            10077, -- ♪buffalo
            10078, -- ♪wivre
            10079, -- ♪iron giant
            10080, -- ♪byakko
            10082, -- ♪ixion
            ]]--
        },
    },

    [9] =
    {
        ['price'] = 100,
        ['items'] =
        {
            --[[
            --- Month 1 ---------------------------------------------
            10136, -- cipher of ukas alter ego
            10141, -- cipher of kuyins alter ego
            10144, -- cipher of abenzios alter ego
            10145, -- cipher of rughadjeens alter ego
            10049, -- ♪raptor
            10050, -- ♪tiger
            10051, -- ♪crab
            10052, -- ♪red crab
            10053, -- ♪bomb
            10054, -- ♪ram
            10150, -- cipher of lhes alter ego
            ]]--
            --- Month 2 ---------------------------------------------

            10151, -- cipher of mayakovs alter ego
            10155, -- cipher of brygids alter ego
            10156, -- cipher of mildaurions alter ego
            10055, -- ♪morbol
            10056, -- ♪crawler
            10057, -- ♪fenrir
            10058, -- ♪beetle
            10059, -- ♪moogle
            10060, -- ♪magic pot
            --[[
            --- Month 3 ---------------------------------------------
            10161, -- cipher of rongeloutss alter ego
            10166, -- cipher of robel-akbels alter ego
            10187, -- cipher of shantottos alter ego ii
            10061, -- ♪tulfaire
            10062, -- ♪warmachine
            10063, -- ♪xzomit
            10064, -- ♪hippogryph
            10083, -- ♪phuabo
            ]]--
        },
    },

    [13] =
    {
        ['price'] = 300,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            4064, -- copy of rems tale, chapter 1
            4065, -- copy of rems tale, chapter 2
            4066, -- copy of rems tale, chapter 3
            4067, -- copy of rems tale, chapter 4
            4068, -- copy of rems tale, chapter 5
            --[[
            --- Month 1 ---------------------------------------------
            27760, -- chocobo masque +1
            27906, -- chocobo suit +1
            25607, -- Starlet Flower
            26975, -- Starlet Jabot
            27112, -- Starlet Gloves
            27297, -- Starlet Skirt
            27468, -- Starlet Boots
            25715, -- Korrigan Suite
            25639, -- Korrigan Masque
            ]]--            
            --- Month 2 ---------------------------------------------

            25658, -- Wyrm. Masque +1
            25757, -- Wyrmking Suit +1
            25606, -- Agent Hood
            26974, -- Agent Coat
            27111, -- Agent Cuffs
            27296, -- Agent Pants
            27467, -- Agent Boots
            --[[
            --- Month 3 ---------------------------------------------
            1854, -- deed of moderation
            1851, -- deed of placidity
            1870, -- deed of sensibility
            26799, -- behemoth masque +1
            26955, -- behemoth suit +1
            10250, -- moogle suit
            10429, -- moogle masque
            ]]--
        },
    },

    [17] =
    {
        ['price'] = 500,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            15515, -- peacock amulet
            15351, -- bounding boots
            14986, -- ochimusha kote
            13250, -- sonic belt +1
            15737, -- sarutobi kyahan
             3676, -- celestial globe
             4254, -- Megalixir
            --[[
            --- Month 1 ---------------------------------------------
            20713, -- Excalipoor
            20666, -- Blizzard Brand
            11957, -- novennial thigh boots
            11854, -- Novennial Dress
            10431, -- decennial tiara
            10252, -- decennial dress
            ]]--                    
            --- Month 2 ---------------------------------------------

            20668, -- Fire Tongue
            21965, -- Zanmato
            10594, -- decennial hose
            10430, -- Decennial Crown
            10251, -- Decennial Coat
            11853, -- Novennial Coat
            11956, -- Novennial Hose
            10593, -- Decennial tights
            --[[
            --- Month 3 ---------------------------------------------
            1850, -- first virtue
            1853, -- second virtue
            1856, -- third virtue
            21867, -- Sha Wujing Lance
            20665, -- kamlanauts sword
            11355, -- Dinner Jacket
            16378, -- Dinner Hose
            ]]--
        },
    },

    [21] =
    {
        ['price'] = 750,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            4069, -- copy of rems tale, chapter 6
            4070, -- copy of rems tale, chapter 7
            4071, -- copy of rems tale, chapter 8
            4072, -- copy of rems tale, chapter 9
            4073, -- copy of rems tale, chapter 10
            3355, -- Divine Bijou
            3353, -- Barbaric Bijou
            3354, -- Steelwall BiJou
            3356, -- Roving Bijou
            --[[
            --- Month 1 ---------------------------------------------
            3339, -- Honey Wine
            3341, -- Beastly Shank
            3343, -- Blue Pond Water
            ]]--            
            --- Month 2 ---------------------------------------------

            1419, -- Spring Stone
            1421, -- Summer Stone
            1423, -- Autumn Stone
            1425, -- Winter Stone
            1418, -- Gem of the East
            1422, -- Gem of the West
            1424, -- Gem of the North
            1420, -- Gem of the South
            --[[
            --- Month 3 ---------------------------------------------
            1848, -- fourth virtue
            1847, -- fifth virtue
            1849, -- sixth virtue
            ]]--
        },
    },

    [25] =
    {
        ['price'] = 1000,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            14739, -- Suppanomimi
            14741, -- Abyssal Earring
            14742, -- Beastly Earring
            14743, -- Bushinomimi Earring
            14740, -- Knights Earring
            1450, -- lungo-nango jadeshell
            1453, -- montiont silverpiece
            1456, -- one hundred byne bill
            3357, -- leering bijou
            3456, -- creepers juju
            3457, -- revelatory juju
            3458, -- undying juju
            3459, -- heralds juju
            3358, -- Shrouded Bijou
            --[[
            --- Month 1 ---------------------------------------------
            15543, -- rajas ring
            15544, -- sattva ring
            15545, -- tamas ring
            ]]--            
            --- Month 2 ---------------------------------------------

            15807, -- balrahns ring
            15808, -- ulthalams ring
            15809, -- jalzahns ring
            --[[
            --- Month 3 ---------------------------------------------
            15962, -- static earring
            15963, -- magnetic earring
            15964, -- hollow earring
            15965, -- ethereal earring
            ]]--
        },
    },

    [29] =
    {
        ['price'] = 1500,
        ['items'] =
        {
            --- Alway active ----------------------------------------
            3340, -- Sweet Tea
            3342, -- Savory Shank
            3344, -- Red Pondweed
            8720, -- Maliya. Coral Orb
            10178, -- cipher of ullegores alter ego
            --[[
            --- Month 1 ---------------------------------------------
            10193, -- cipher of monberauxs alter ego
            28419, -- hachirin-no-obi
            18852, -- octave club
            25679, -- white rarab cap +1
             ]]--                       
            --- Month 2 ---------------------------------------------

            8722, -- Hepatizon Ingot
            8724, -- Beryllium Ingot
            10120, -- cipher of lehkos alter ego
            19163, -- nightfall
            28450, -- chaac belt
            --[[
            --- Month 3 ---------------------------------------------
            8726, -- Exalted Lumber
            8728, -- Sif's Macrame
            27510, -- fotia gorget
            28420, -- fotia belt
            27585, -- gorney ring
            ]]--
        },
    },
}
return prizes
