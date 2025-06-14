-----------------------------------
-- Home Point Crystal
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('homepoint')
m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)
    local homepoint = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = ' ',
        look = 51,
        x         = 317.3220,
        y         = -1.4680,
        z         = -579.5084,
        rotation = 248,
        widescan = 1,
        onTrade = function(player, npc, trade)
        end,
        onTrigger = function(player, npc)
        player:setHP(player:getMaxHP())
        player:setMP(player:getMaxMP())
local menu   = {}
local page1 =  {}
local page2 =  {}
local page3 =  {}
local page4 =  {}
local page5 =  {}
local page6 =  {}
local page7 =  {}
local page8 =  {}
local page9 =  {}
local page10 =  {}
local page11 =  {}
local page12 =  {}
local page13 =  {}
local page14 =  {}
local page15 =  {}
local page16 =  {}
local page17 =  {}
local page18 =  {}
local page19 =  {}
local page20 =  {}
local page21 =  {}
local page22 =  {}
local page23 =  {}
local page24 =  {}
local page25 =  {}
local page26 =  {}
local page27 =  {}
local page28 =  {}
local page29 =  {}
local page30 =  {}
local page31 =  {}
local page32 =  {}
local page33 =  {}
local page34 =  {}
local page35 =  {}
local page36 =  {}
local page37 =  {}
local page38 =  {}
local page39 =  {}
local page40 =  {}
local page41 =  {}
local page42 =  {}
local page43 =  {}
local page44 =  {}
local page45 =  {}
local page46 =  {}
local page47 =  {}
local page48 =  {}
local page49 =  {}
local page50 =  {}
local page51 =  {}
local page52 =  {}
local page53 =  {}
local page54 =  {}
local page55 =  {}
local page56 =  {}
local page57 =  {}
local page58 =  {}
local page59 =  {}
local page60 =  {}
local page61 =  {}
local page62 =  {}
local page63 =  {}
local page64 =  {}
local page65 =  {}
local page66 =  {}
local page67 =  {}
local page68 =  {}
local page69 =  {}
local page70 =  {}
local page71 =  {}
local page72 =  {}
local page73 =  {}
local page74 =  {}
local page75 =  {}
local page76 =  {}
local page77 =  {}
local page78 =  {}
local page79 =  {}
local page80 =  {}
local page81 =  {}
local page82 =  {}
local page83 =  {}
local page84 =  {}
local page85 =  {}
local page86 =  {}
local page87 =  {}
local page88 =  {}
local page89 =  {}
local page90 =  {}
local page91 =  {}
local page92 =  {}
local page93 =  {}
local page94 =  {}
local page95 =  {}
local page96 =  {}
local page97 =  {}
local page98 =  {}
local page99 =  {}
local page100 =  {}
local page101 =  {}
local page102 =  {}
local page103 =  {}
local page104 =  {}
local page105 =  {}
local page106 =  {}
local page107 =  {}
local page108 =  {}
local page109 =  {}
local page110 =  {}

local homepointData =
{
    -- [Index]= [1]group(if to/from both same group, then no cost) [2]fee multiplier [3]dest { x, y, z, rot, zone } [4] return page# [5] title verbaig
    [  1] = { group = 1, fee = 1, dest = {  -85.554,       1, -64.554,  45, xi.zone.SOUTHERN_SAN_DORIA     }, page =  page42, verb = 'Teleport where? (Southern San dOria)' }, -- Southern San d'Oria #1
    [  2] = { group = 1, fee = 1, dest = {     44.1,       2,   -34.5, 170, xi.zone.SOUTHERN_SAN_DORIA     }, page =  page42, verb = 'Teleport where? (Southern San dOria)' }, -- Southern San d'Oria #2
    [  3] = { group = 1, fee = 1, dest = {    140.5,      -2,     121,   0, xi.zone.SOUTHERN_SAN_DORIA     }, page =  page42, verb = 'Teleport where? (Southern San dOria)' }, -- Southern San d'Oria #3
    [  4] = { group = 1, fee = 1, dest = {     -178,       4,      71,   0, xi.zone.NORTHERN_SAN_DORIA     }, page =  page43, verb = 'Teleport where? (Northern San dOria)' }, -- Northern San d'Oria #1
    [  5] = { group = 1, fee = 1, dest = {       10,    -0.2,      95,   0, xi.zone.NORTHERN_SAN_DORIA     }, page =  page43, verb = 'Teleport where? (Northern San dOria)' }, -- Northern San d'Oria #2
    [  6] = { group = 1, fee = 1, dest = {       70,    -0.2,      10,   0, xi.zone.NORTHERN_SAN_DORIA     }, page =  page43, verb = 'Teleport where? (Northern San dOria)' }, -- Northern San d'Oria #3
    [  7] = { group = 1, fee = 1, dest = {      -38,      -4,     -63,   0, xi.zone.PORT_SAN_DORIA         }, page =  page44, verb = 'Teleport where? (Port San dOria)' }, -- Port San d'Oria #1
    [  8] = { group = 1, fee = 1, dest = {       48,     -12,    -105,   0, xi.zone.PORT_SAN_DORIA         }, page =  page44, verb = 'Teleport where? (Port San dOria)' }, -- Port San d'Oria #2
    [  9] = { group = 1, fee = 1, dest = {       -6,     -13,    -150,   0, xi.zone.PORT_SAN_DORIA         }, page =  page44, verb = 'Teleport where? (Port San dOria)' }, -- Port San d'Oria #3
    [ 10] = { group = 2, fee = 1, dest = {       39,       0,     -43,   0, xi.zone.BASTOK_MINES           }, page =  page45, verb = 'Teleport where? (Bastok Mines)' }, -- Bastok Mines #1
    [ 11] = { group = 2, fee = 1, dest = {      118,       1,     -58,   0, xi.zone.BASTOK_MINES           }, page =  page45, verb = 'Teleport where? (Bastok Mines)' }, -- Bastok Mines #2
    [ 12] = { group = 2, fee = 1, dest = {     -342,     -10,    -154,   0, xi.zone.BASTOK_MARKETS         }, page =  page46, verb = 'Teleport where? (Bastok Markets)' }, -- Bastok Markets #1
    [ 13] = { group = 2, fee = 1, dest = {     -328,     -12,     -33,   0, xi.zone.BASTOK_MARKETS         }, page =  page46, verb = 'Teleport where? (Bastok Markets)' }, -- Bastok Markets #2
    [ 14] = { group = 2, fee = 1, dest = {     -189,      -8,      26,   0, xi.zone.BASTOK_MARKETS         }, page =  page46, verb = 'Teleport where? (Bastok Markets)' }, -- Bastok Markets #3
    [ 15] = { group = 2, fee = 1, dest = {      124,       8,       7,   0, xi.zone.PORT_BASTOK            }, page =  page47, verb = 'Teleport where? (Port Bastok)' }, -- Port Bastok #1
    [ 16] = { group = 2, fee = 1, dest = {       42,     8.5,    -244,   0, xi.zone.PORT_BASTOK            }, page =  page47, verb = 'Teleport where? (Port Bastok)' }, -- Port Bastok #2
    [ 17] = { group = 2, fee = 1, dest = {       46,     -14,     -19,   0, xi.zone.METALWORKS             }, page =  page48, verb = 'Teleport where? (Metalworks)' }, -- Metalworks #1
    [ 18] = { group = 3, fee = 1, dest = {      -32,      -5,     132,   0, xi.zone.WINDURST_WATERS        }, page =  page49, verb = 'Teleport where? (Windurst Waters)' }, -- Windurst Waters #1
    [ 19] = { group = 3, fee = 1, dest = {    138.5,       0,     -14,   0, xi.zone.WINDURST_WATERS        }, page =  page49, verb = 'Teleport where? (Windurst Waters)' }, -- Windurst Waters #2
    [ 20] = { group = 3, fee = 1, dest = {      -72,      -5,     125,   0, xi.zone.WINDURST_WALLS         }, page =  page50, verb = 'Teleport where? (Windurst Walls)' }, -- Windurst Walls #1
    [ 21] = { group = 3, fee = 1, dest = {     -212,       0,     -99,   0, xi.zone.WINDURST_WALLS         }, page =  page50, verb = 'Teleport where? (Windurst Walls)' }, -- Windurst Walls #2
    [ 22] = { group = 3, fee = 1, dest = {       31,    -6.5,     -40,   0, xi.zone.WINDURST_WALLS         }, page =  page50, verb = 'Teleport where? (Windurst Walls)' }, -- Windurst Walls #3
    [ 23] = { group = 3, fee = 1, dest = {     -188,      -4,     101,   0, xi.zone.PORT_WINDURST          }, page =  page51, verb = 'Teleport where? (Port Windurst)' }, -- Port Windurst #1
    [ 24] = { group = 3, fee = 1, dest = {     -207,      -8,     210,   0, xi.zone.PORT_WINDURST          }, page =  page51, verb = 'Teleport where? (Port Windurst)' }, -- Port Windurst #2
    [ 25] = { group = 3, fee = 1, dest = {      180,     -12,     226,   0, xi.zone.PORT_WINDURST          }, page =  page51, verb = 'Teleport where? (Port Windurst)' }, -- Port Windurst #3
    [ 26] = { group = 3, fee = 1, dest = {        9,      -2,       0,   0, xi.zone.WINDURST_WOODS         }, page =  page52, verb = 'Teleport where? (Windurst Woods)' }, -- Windurst Woods #1
    [ 27] = { group = 3, fee = 1, dest = {      107,      -5,     -56,   0, xi.zone.WINDURST_WOODS         }, page =  page52, verb = 'Teleport where? (Windurst Woods)' }, -- Windurst Woods #2
    [ 28] = { group = 3, fee = 1, dest = {      -92,      -5,      62,   0, xi.zone.WINDURST_WOODS         }, page =  page52, verb = 'Teleport where? (Windurst Woods)' }, -- Windurst Woods #3
    [ 29] = { group = 3, fee = 1, dest = {       74,      -7,    -139,   0, xi.zone.WINDURST_WOODS         }, page =  page52, verb = 'Teleport where? (Windurst Woods)' }, -- Windurst Woods #4
    [ 30] = { group = 4, fee = 1, dest = {       -6,       3,       0,   0, xi.zone.RULUDE_GARDENS         }, page =  page53, verb = 'Teleport where? (RuLude Gardens)' }, -- Ru'Lude Gardens #1
    [ 31] = { group = 4, fee = 1, dest = {       53,       9,     -57,   0, xi.zone.RULUDE_GARDENS         }, page =  page53, verb = 'Teleport where? (RuLude Gardens)' }, -- Ru'Lude Gardens #2
    [ 32] = { group = 4, fee = 1, dest = {      -67,       6,     -25,   1, xi.zone.RULUDE_GARDENS         }, page =  page53, verb = 'Teleport where? (RuLude Gardens)' }, -- Ru'Lude Gardens #3
    [ 33] = { group = 4, fee = 1, dest = {      -99,       0,     167,   0, xi.zone.UPPER_JEUNO            }, page =  page54, verb = 'Teleport where? (Upper Jeuno)' }, -- Upper Jeuno #1
    [ 34] = { group = 4, fee = 1, dest = {       32,      -1,     -44,   0, xi.zone.UPPER_JEUNO            }, page =  page54, verb = 'Teleport where? (Upper Jeuno)' }, -- Upper Jeuno #2
    [ 35] = { group = 4, fee = 1, dest = {      -52,       1,      16,   0, xi.zone.UPPER_JEUNO            }, page =  page54, verb = 'Teleport where? (Upper Jeuno)' }, -- Upper Jeuno #3
    [ 36] = { group = 4, fee = 1, dest = {      -99,       0,    -183,   0, xi.zone.LOWER_JEUNO            }, page =  page55, verb = 'Teleport where? (Lower Jeuno)' }, -- Lower Jeuno #1
    [ 37] = { group = 4, fee = 1, dest = {       18,      -1,      54,   0, xi.zone.LOWER_JEUNO            }, page =  page55, verb = 'Teleport where? (Lower Jeuno)' }, -- Lower Jeuno #2
    [ 38] = { group = 4, fee = 1, dest = {       37,       0,       9,   0, xi.zone.PORT_JEUNO             }, page =  page56, verb = 'Teleport where? (Port Jeuno)' }, -- Port Jeuno #1
    [ 39] = { group = 4, fee = 1, dest = {     -155,      -1,      -4,   0, xi.zone.PORT_JEUNO             }, page =  page56, verb = 'Teleport where? (Port Jeuno)' }, -- Port Jeuno #2
    [ 40] = { group = 0, fee = 1, dest = {       78,     -13,     -94,   0, xi.zone.KAZHAM                 }, page =  page80, verb = 'Teleport where? (Kazham)' }, -- Kazham #1
    [ 41] = { group = 0, fee = 1, dest = {      -13,     -15,      87,   0, xi.zone.MHAURA                 }, page =  page68, verb = 'Teleport where? (Mhaura)' }, -- Mhaura #1
    [ 42] = { group = 8, fee = 1, dest = {      -27,       0,     -47,   0, xi.zone.NORG                   }, page =  page81, verb = 'Teleport where? (Norg)' }, -- Norg #1
    [ 43] = { group = 9, fee = 1, dest = {      -29,       0,     -76,   0, xi.zone.RABAO                  }, page =  page78, verb = 'Teleport where? (Rabao)' }, -- Rabao #1
    [ 44] = { group = 0, fee = 1, dest = {       36,     -11,      35,   0, xi.zone.SELBINA                }, page =  page64, verb = 'Teleport where? (Selbina)' }, -- Selbina #1
    [ 45] = { group = 5, fee = 1, dest = {      -84,       4,     -32, 128, xi.zone.WESTERN_ADOULIN        }, page =  page61, verb = 'Teleport where? (Western Adoulin)' }, -- Western Adoulin #1
    [ 46] = { group = 5, fee = 1, dest = {      -51,       0,      59, 128, xi.zone.EASTERN_ADOULIN        }, page =  page62, verb = 'Teleport where? (Eastern Adoulin)' }, -- Eastern Adoulin #1
    [ 47] = { group = 0, fee = 2, dest = {     -107,       3,     295, 128, xi.zone.CEIZAK_BATTLEGROUNDS   }, page = page101, verb = 'Teleport where? (Ceizak Battlegrounds)' }, -- Ceizak Battlegrounds #1
    [ 48] = { group = 0, fee = 2, dest = {     -193,    -0.5,    -252, 128, xi.zone.FORET_DE_HENNETIEL     }, page = page102, verb = 'Teleport where? (Foret de Hennetiel)' }, -- Foret de Hennetiel #1
    [ 49] = { group = 0, fee = 2, dest = {     -415,   -63.2,     409, 106, xi.zone.MORIMAR_BASALT_FIELDS  }, page = page104, verb = 'Teleport where? (Morimar Basalt Fields)' }, -- Morimar Basalt Fields #1
    [ 50] = { group = 0, fee = 2, dest = {     -420,       0,     -62,  64, xi.zone.YORCIA_WEALD           }, page = page103, verb = 'Teleport where? (Yorcia Weald)' }, -- Yorcia Weald #1
    [ 51] = { group = 0, fee = 2, dest = {      -23,       0,     174,   0, xi.zone.MARJAMI_RAVINE         }, page = page105, verb = 'Teleport where? (Marjami Ravine)' }, -- Marjami Ravine #1
    [ 52] = { group = 0, fee = 2, dest = {      210,  20.299,     315, 192, xi.zone.KAMIHR_DRIFTS          }, page = page106, verb = 'Teleport where? (Kamihr Drifts)' }, -- Kamihr Drifts #1
    [ 53] = { group = 0, fee = 2, dest = {      434,     -40,     171,   0, xi.zone.YUGHOTT_GROTTO         }, page =  page63, verb = 'Teleport where? (Yughott Grotto)' }, -- Yughott Grotto #1
    [ 54] = { group = 0, fee = 2, dest = {      109,     -38,    -147,   0, xi.zone.PALBOROUGH_MINES       }, page =  page65, verb = 'Teleport where? (Palborough Mines)' }, -- Palborough Mines #1
    [ 55] = { group = 0, fee = 2, dest = {     -132,      -3,    -303,   0, xi.zone.GIDDEUS                }, page =  page66, verb = 'Teleport where? (Giddeus)' }, -- Giddeus #1
    [ 56] = { group = 0, fee = 2, dest = {      243,     -24,      62,   0, xi.zone.FEIYIN                 }, page =  page71, verb = 'Teleport where? (FeiYin)' }, -- Fei'Yin #1
    [ 57] = { group = 0, fee = 2, dest = {     -984,      17,    -289,   0, xi.zone.QUICKSAND_CAVES        }, page =  page77, verb = 'Teleport where? (Quicksand Caves)' }, -- Quicksand Caves #1
    [ 58] = { group = 0, fee = 2, dest = {      -80,      46,      62,   0, xi.zone.DEN_OF_RANCOR          }, page =  page82, verb = 'Teleport where? (Den of Rancor)' }, -- Den of Rancor #1
    [ 59] = { group = 0, fee = 2, dest = {     -554,     -70,      66,   0, xi.zone.CASTLE_ZVAHL_KEEP      }, page =  page73, verb = 'Teleport where? (Castle Zvahl Keep)' }, -- Castle Zvahl Keep #1
    [ 60] = { group = 0, fee = 2, dest = {        5,     -42,     526,   0, xi.zone.RUAUN_GARDENS          }, page =  page84, verb = 'Teleport where? (RuAun Gardens)' }, -- Ru'Aun Gardens #1
    [ 61] = { group = 0, fee = 2, dest = {     -312,     -42,    -422,   0, xi.zone.RUAUN_GARDENS          }, page =  page84, verb = 'Teleport where? (RuAun Gardens)' }, -- Ru'Aun Gardens #3
    [ 62] = { group = 0, fee = 2, dest = {     -499,     -42,     167,   0, xi.zone.RUAUN_GARDENS          }, page =  page84, verb = 'Teleport where? (RuAun Gardens)' }, -- Ru'Aun Gardens #2
    [ 63] = { group = 0, fee = 2, dest = {      500,     -42,     158,   0, xi.zone.RUAUN_GARDENS          }, page =  page84, verb = 'Teleport where? (RuAun Gardens)' }, -- Ru'Aun Gardens #4
    [ 64] = { group = 0, fee = 2, dest = {      305,     -42,    -427,   0, xi.zone.RUAUN_GARDENS          }, page =  page84, verb = 'Teleport where? (RuAun Gardens)' }, -- Ru'Aun Gardens #5
    [ 65] = { group = 6, fee = 1, dest = {       -1,     -28,     107,   0, xi.zone.TAVNAZIAN_SAFEHOLD     }, page =  page57, verb = 'Teleport where? (Tavnazian Safehold)' }, -- Tavnazian Safehold #1
    [ 66] = { group = 7, fee = 1, dest = {      -21,       0,     -21,   0, xi.zone.AHT_URHGAN_WHITEGATE   }, page =  page59, verb = 'Teleport where? (Aht Urhgan Whitegate)' }, -- Aht Urhgan Whitegate #1
    [ 67] = { group = 0, fee = 1, dest = {      -20,       0,     -25,   0, xi.zone.NASHMAU                }, page =  page94, verb = 'Teleport where? (Nashmau)' }, -- Nashmau #1
    [ 68] = { group = 0, fee = 1, dest = {        0,       0,       0,   0, xi.zone.AL_ZAHBI               }, page =  page58, verb = 'Teleport where? (Al Zahbi)' }, -- Al Zahbi #1 (DOESN'T CURRENTLY EXIST)
    [ 69] = { group = 0, fee = 1, dest = {      -85,       1,     -66,   0, xi.zone.SOUTHERN_SAN_DORIA_S   }, page =  page96, verb = 'Teleport where? (Southern San dOria)' }, -- Southern San d'Oria [ S] #1
    [ 70] = { group = 0, fee = 1, dest = {     -293,     -10,    -102,   0, xi.zone.BASTOK_MARKETS_S       }, page =  page97, verb = 'Teleport where? (Bastok Markets [S])' }, -- Bastok Markets [S] #1
    [ 71] = { group = 0, fee = 1, dest = {      -32,      -5,     131,   0, xi.zone.WINDURST_WATERS_S      }, page =  page98, verb = 'Teleport where? (Windurst Waters [S])' }, -- Windurst Waters [S] #1
    [ 72] = { group = 0, fee = 2, dest = {     -365,  -176.5,     -36,   0, xi.zone.UPPER_DELKFUTTS_TOWER  }, page =  page75, verb = 'Teleport where? (Upper Delkfutts Tower)' }, -- Upper Delkfutt's Tower #1
    [ 73] = { group = 0, fee = 2, dest = {      -13,      48,      61,   0, xi.zone.THE_SHRINE_OF_RUAVITAU }, page =  page85, verb = 'Teleport where? (The Shrine of RuAvitau)' }, -- The Shrine of Ru'Avitau #1
    [ 74] = { group = 0, fee = 2, dest = {     -520,     -18,     505, 127, xi.zone.RIVERNE_SITE_B01       }, page =  page88, verb = 'Teleport where? (Riverne - Site #B01)' }, -- Riverne - Site #B01 #1
    [ 75] = { group = 0, fee = 2, dest = {      -98,     -10,    -493, 192, xi.zone.BHAFLAU_THICKETS       }, page =  page60, verb = 'Teleport where? (Bhaflau Thickets)' }, -- Bhaflau Thickets #1
    [ 76] = { group = 0, fee = 2, dest = {     -449,      13,    -497,   0, xi.zone.CAEDARVA_MIRE          }, page =  page95, verb = 'Teleport where? (Caedarva Mire)' }, -- Caedarva Mire #1
    [ 77] = { group = 0, fee = 2, dest = {       64,    -196,     181,   0, xi.zone.ULEGUERAND_RANGE       }, page =  page72, verb = 'Teleport where? (Uleguerand Range)' }, -- Uleguerand Range #1
    [ 78] = { group = 0, fee = 2, dest = {      380,      23,     -62,   0, xi.zone.ULEGUERAND_RANGE       }, page =  page72, verb = 'Teleport where? (Uleguerand Range)' }, -- Uleguerand Range #2
    [ 79] = { group = 0, fee = 2, dest = {      424,     -32,     221,   0, xi.zone.ULEGUERAND_RANGE       }, page =  page72, verb = 'Teleport where? (Uleguerand Range)' }, -- Uleguerand Range #3
    [ 80] = { group = 0, fee = 2, dest = {       64,     -96,     461,   0, xi.zone.ULEGUERAND_RANGE       }, page =  page72, verb = 'Teleport where? (Uleguerand Range)' }, -- Uleguerand Range #4
    [ 81] = { group = 0, fee = 2, dest = {     -220,      -1,     -62,   0, xi.zone.ULEGUERAND_RANGE       }, page =  page72, verb = 'Teleport where? (Uleguerand Range)' }, -- Uleguerand Range #5
    [ 82] = { group = 0, fee = 2, dest = {     -200,     -10,     342,   0, xi.zone.ATTOHWA_CHASM          }, page =  page69, verb = 'Teleport where? (Attohwa Chasm)' }, -- Attohwa Chasm #1
    [ 83] = { group = 0, fee = 2, dest = {      -58,      40,      14,  64, xi.zone.PSOXJA                 }, page =  page70, verb = 'Teleport where? (PsoXja)' }, -- Pso'Xja #1
    [ 84] = { group = 0, fee = 2, dest = {      445,      27,     -22,   0, xi.zone.NEWTON_MOVALPOLOS      }, page =  page86, verb = 'Teleport where? (Newton Movalpolos)' }, -- Newton Movalpolos #1
    [ 85] = { group = 0, fee = 2, dest = {      189,       0,     362,   0, xi.zone.RIVERNE_SITE_A01       }, page =  page89, verb = 'Teleport where? ( Riveren - Site #A01)' }, -- Riveren - Site #A01 #1
    [ 86] = { group = 0, fee = 2, dest = {        7,       0,     709, 192, xi.zone.ALTAIEU                }, page =  page90, verb = 'Teleport where? (AlTaieu)' }, -- Al'Taieu #1
    [ 87] = { group = 0, fee = 2, dest = {     -532,       0,     447, 128, xi.zone.ALTAIEU                }, page =  page90, verb = 'Teleport where? (AlTaieu)' }, -- Al'Taieu #2
    [ 88] = { group = 0, fee = 2, dest = {      569,       0,     410, 192, xi.zone.ALTAIEU                }, page =  page90, verb = 'Teleport where? (AlTaieu)' }, -- Al'Taieu #3
    [ 89] = { group = 0, fee = 2, dest = {      -12,       0,    -288, 192, xi.zone.GRAND_PALACE_OF_HUXZOI }, page =  page91, verb = 'Teleport where? (Grand Palace of HuXzoi)' }, -- Grand Palace of Hu'Xzoi #1
    [ 90] = { group = 0, fee = 2, dest = {     -426,       0,     368, 224, xi.zone.THE_GARDEN_OF_RUHMET   }, page =  page92, verb = 'Teleport where? (The Garden of RuHmet)' }, -- The Garden of Ru'Hmet #1
    [ 91] = { group = 0, fee = 2, dest = { -540.844,  -4.000,  70.809,  74, xi.zone.MOUNT_ZHAYOLM          }, page =  page93, verb = 'Teleport where? (Mount Zhayolm)' }, -- Mount Zhayolm #1
    [ 92] = { group = 0, fee = 2, dest = {     -303,      -8,     526,   0, xi.zone.CAPE_TERIGGAN          }, page =  page79, verb = 'Teleport where? (Cape Teriggan)' }, -- Cape Teriggan #1
    [ 93] = { group = 0, fee = 2, dest = {       88,     -15,    -217,   0, xi.zone.THE_BOYAHDA_TREE       }, page =  page76, verb = 'Teleport where? (The Boyahda Tree)' }, -- The Boyahda Tree #1
    [ 94] = { group = 0, fee = 2, dest = {      182,      34,     -62, 223, xi.zone.DEN_OF_RANCOR          }, page =  page82, verb = 'Teleport where? (Den of Rancor)' }, -- Den of Rancor #2
    [ 95] = { group = 0, fee = 2, dest = {      102,       0,     269, 191, xi.zone.FEIYIN                 }, page =  page71, verb = 'Teleport where? (FeiYin)' }, -- Fei'Yin #2
    [ 96] = { group = 0, fee = 2, dest = {      -63,      50,      81, 192, xi.zone.IFRITS_CAULDRON        }, page =  page83, verb = 'Teleport where? (Ifrits Cauldron)' }, -- Ifrit's Cauldron #1
    [ 97] = { group = 0, fee = 2, dest = {      573,       9,    -500,   0, xi.zone.QUICKSAND_CAVES        }, page =  page77, verb = 'Teleport where? (Quicksand Caves)' }, -- Quicksand Caves #2
    [ 98] = { group = 1, fee = 1, dest = {     -165,      -1,      12,  65, xi.zone.SOUTHERN_SAN_DORIA     }, page =  page42, verb = 'Teleport where? (Southern San dOria)' }, -- Southern San d'Oria #4
    [ 99] = { group = 1, fee = 1, dest = {     -132,      12,     194, 170, xi.zone.NORTHERN_SAN_DORIA     }, page =  page43, verb = 'Teleport where? (Northern San dOria)' }, -- Northern San d'Oria #4
    [100] = { group = 2, fee = 1, dest = {       87,       7,       1,   0, xi.zone.BASTOK_MINES           }, page =  page45, verb = 'Teleport where? (Bastok Mines)' }, -- Bastok Mines #3
    [101] = { group = 2, fee = 1, dest = {     -192,      -6,     -69,   0, xi.zone.BASTOK_MARKETS         }, page =  page46, verb = 'Teleport where? (Bastok Markets)' }, -- Bastok Markets #4
    [102] = { group = 2, fee = 1, dest = {     -127,      -6,       8, 206, xi.zone.PORT_BASTOK            }, page =  page47, verb = 'Teleport where? (Port Bastok)' }, -- Port Bastok #3
    [103] = { group = 2, fee = 1, dest = {      -76,       2,       3, 124, xi.zone.METALWORKS             }, page =  page48, verb = 'Teleport where? (Metalworks)' }, -- Metalworks #2
    [104] = { group = 3, fee = 1, dest = {        5,      -4,    -175, 130, xi.zone.WINDURST_WATERS        }, page =  page49, verb = 'Teleport where? (Windurst Waters)' }, -- Windurst Waters #3
    [105] = { group = 8, fee = 1, dest = {      -65,      -5,      54, 127, xi.zone.NORG                   }, page =  page81, verb = 'Teleport where? (Norg)' }, -- Norg #2
    [106] = { group = 9, fee = 1, dest = {      -21,       8,     110,  64, xi.zone.RABAO                  }, page =  page78, verb = 'Teleport where? (Rabao)' }, -- Rabao #2
    [107] = { group = 7, fee = 1, dest = {      130,       0,     -16,   0, xi.zone.AHT_URHGAN_WHITEGATE   }, page =  page59, verb = 'Teleport where? (Aht Urhgan Whitegate)' }, -- Aht Urhgan Whitegate #2
    [108] = { group = 7, fee = 1, dest = {     -108,      -6,     108, 192, xi.zone.AHT_URHGAN_WHITEGATE   }, page =  page59, verb = 'Teleport where? (Aht Urhgan Whitegate)' }, -- Aht Urhgan Whitegate #3
    [109] = { group = 7, fee = 1, dest = {      -99,       0,     -68,   0, xi.zone.AHT_URHGAN_WHITEGATE   }, page =  page59, verb = 'Teleport where? (Aht Urhgan Whitegate)' }, -- Aht Urhgan Whitegate #4
    [110] = { group = 5, fee = 1, dest = {       32,       0,    -164,  32, xi.zone.WESTERN_ADOULIN        }, page =  page61, verb = 'Teleport where? (Western Adoulin)' }, -- Western Adoulin #2
    [111] = { group = 5, fee = 1, dest = {      -51,       0,     -96,  96, xi.zone.EASTERN_ADOULIN        }, page =  page62, verb = 'Teleport where? (Eastern Adoulin)' }, -- Eastern Adoulin #2
    [112] = { group = 0, fee = 2, dest = {      223,     -13,    -254,   0, xi.zone.XARCABARD_S            }, page =  page99, verb = 'Teleport where? (Xarcabard)' }, -- Xarcabard [S] #1
    [113] = { group = 0, fee = 2, dest = {    5.539,  -0.434,   8.133,  73, xi.zone.LEAFALLIA              }, page = page107, verb = 'Teleport where? (Leafallia)' }, -- Leafallia #1
    [114] = { group = 0, fee = 2, dest = {     -554,     -70,      66, 128, xi.zone.CASTLE_ZVAHL_KEEP_S    }, page = page100, verb = 'Teleport where? (Castle Zvahl Keep [S])' }, -- Castle Zvahl Keep [S] #1
    [115] = { group = 0, fee = 1, dest = {     -212,     -21,      93,  64, xi.zone.QUFIM_ISLAND           }, page =  page74, verb = 'Teleport where? (Qufim Island)' }, -- Qufim Island #1
    [116] = { group = 0, fee = 1, dest = {   -257.5,      24,      82, 192, xi.zone.TORAIMARAI_CANAL       }, page =  page67, verb = 'Teleport where? (Toraimorai Canal)' }, -- Toraimorai Canal #1
    [117] = { group = 0, fee = 2, dest = {      757,     120,    17.5, 128, xi.zone.RAKAZNAR_INNER_COURT   }, page = page108, verb = 'Teleport where? (RaKaznar Inner Court)' }, -- Ra'Kaznar Inner Court #1
    [118] = { group = 0, fee = 2, dest = {      -65,   -17.5,     563, 224, xi.zone.MISAREAUX_COAST        }, page =  page87, verb = 'Teleport where? (Misareaux Coast)' }, -- Misareaux Coast #1
    [119] = { group = 3, fee = 1, dest = {      -92,      -2,      54, 155, xi.zone.WINDURST_WATERS        }, page =  page49, verb = 'Teleport where? (Windurst Waters)' }, -- Windurst Waters #4
    [120] = { group = 3, fee = 1, dest = {    -43.5,       0,    -145,   0, xi.zone.WINDURST_WOODS         }, page =  page52, verb = 'Teleport where? (Windurst Woods)' }, -- Windurst Woods #5
    [121] = { group = 6, fee = 1, dest = {       14,   -9.96,      -5,   0, xi.zone.TAVNAZIAN_SAFEHOLD     }, page =  page57, verb = 'Teleport where? (Tavnazian Safehold)' }, -- Tavnazian Safehold #2
    [122] = { group = 6, fee = 1, dest = {    73.59, -36.149,   38.87,   0, xi.zone.TAVNAZIAN_SAFEHOLD     }, page =  page57, verb = 'Teleport where? (Tavnazian Safehold)' }, -- Tavnazian Safehold #3
}
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
        'Travel to another home point.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)
        end
    },
    {
        'Set this as your home point.',
         function(player)
         menu = {
                title = 'Set this as current home point?',
                options = {},
                 }
             menu.options = page110
            delaySendMenu(player)
         end
    },
    {
        'On second thought, never mind.',
         function(player)
         end
    },

}

page2 = -- too many to fit on one
{
    {
        'On second thought, none.',
        function(player)
         menu = {
                title = 'What will you do?',
                options = {},
                 }
             menu.options = page1
            delaySendMenu(player)  
        end,
    },
    {
        'San dOria.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page8
            delaySendMenu(player)        
        end,
    },
    {
        'Bastok.',
        function(player)
          menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page9
            delaySendMenu(player)         
        end,
    },
    {
        'Windurst.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page10
            delaySendMenu(player)          
        end,
    },
    {
        'Jeuno.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page11
            delaySendMenu(player)          
        end,
    },
    {
        'Tavnazia.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page12
            delaySendMenu(player)          
        end,
    },
    {
        'West. Aht Urhgan.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page13
            delaySendMenu(player)          
        end,
    },
    {
        'Next page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)        
        end,
    },
}
page3 = 
{
    {
        'Adoulin Isles.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page14
            delaySendMenu(player)          
        end,
    },
    {
        'Ronfoure.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page15
            delaySendMenu(player)         
        end,
    },
    {
        'Zulkheim.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page16
            delaySendMenu(player)         
        end,
    },
    {
        'Gustaberg.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page17
            delaySendMenu(player)         
        end,
    },
    {
        'Sarutabaruta.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page18
            delaySendMenu(player)         
        end,
    },
    {
        'Kolshushu.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page19
            delaySendMenu(player)         
        end,
    },
    {
        'Next page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'Previous page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)        
        end,
    },
}
page4 =
{
    {
        'Aragoneu.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page20
            delaySendMenu(player)         
        end,
    },
    {
        'Fauregandi.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page21
            delaySendMenu(player)         
        end,
    },
    {
        'Valdeaunia.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page22
            delaySendMenu(player)         
        end,
    },
    {
        'Qufim.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page23
            delaySendMenu(player)         
        end,
    },
    {
        'LiTelor.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page24
            delaySendMenu(player)         
        end,
    },
    {
        'Kuzotz.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page25
            delaySendMenu(player)         
        end,
    },
    {
        'Next page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Previous page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)        
        end,
    },
}
page5 =
{
    {
        'Vollbow.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page26
            delaySendMenu(player)         
        end,
    },
    {
        'Elshimo Low.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page27
            delaySendMenu(player)         
        end,
    },
    {
        'Elshimo Up.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page28
            delaySendMenu(player)         
        end,
    },
    {
        'TuLia.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page29
            delaySendMenu(player)         
        end,
    },
    {
        'Movalpolos.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page30
            delaySendMenu(player)         
        end,
    },
    {
        'Tavnazian Arch.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page31
            delaySendMenu(player)         
        end,
    },
    {
        'Next page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'Previous page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)        
        end,
    },
}
page6 =
{
    {
        'Lumoria.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page32
            delaySendMenu(player)         
        end,
    },
    {
        'Halvung.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page33
            delaySendMenu(player)          
        end,
    },
    {
        'Arrapago Is.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page34
            delaySendMenu(player)          
        end,
    },
    {
        'Ronfaure Front.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page35
            delaySendMenu(player)          
        end,
    },
    {
        'Gustaberg Front.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page36
            delaySendMenu(player)          
        end,
    },
    {
        'Next page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page7
            delaySendMenu(player)          
        end,
    },
    {
        'Previous page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)        
        end,
    },
}
page7 =
{
    {
        'Sarutabaruta Front.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page37
            delaySendMenu(player)          
        end,
    },
    {
        'Valdeaunia Front.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page38
            delaySendMenu(player)          
        end,
    },
    {
        'East. Ulbuka.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)          
        end,
    },
    {
        'RaKaznar.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page41
            delaySendMenu(player)          
        end,
    },
    {
        'Previous page.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)        
        end,
    },
}
page8 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'Southern San dOria.',
        function(player)
         menu = {
                title = 'Teleport where? (Southern San dOria)',
                options = {},
                 }
             menu.options = page42
            delaySendMenu(player)        
        end,
    },
    {
        'Northern San dOria.',
        function(player)
         menu = {
                title = 'Teleport where? (Northern San dOria)',
                options = {},
                 }
             menu.options = page43
            delaySendMenu(player)        
        end,
    },
    {
        'Port San dOria.',
        function(player)
         menu = {
                title = 'Teleport where? (Port San dOria)',
                options = {},
                 }
             menu.options = page44
            delaySendMenu(player)        
        end,
    },
}
page9 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'Bastok Mines.',
        function(player)
         menu = {
                title = 'Teleport where? (Bastok Mines)',
                options = {},
                 }
             menu.options = page45
            delaySendMenu(player)        
        end,    },
    {
        'Bastok Markets.',
        function(player)
         menu = {
                title = 'Teleport where? (Bastok Markets)',
                options = {},
                 }
             menu.options = page46
            delaySendMenu(player)        
        end,
    },
    {
        'Port Bastok.',
        function(player)
         menu = {
                title = 'Teleport where? (Port Bastok)',
                options = {},
                 }
             menu.options = page47
            delaySendMenu(player)        
        end,
    },
    {
        'Metalworks.',
        function(player)
         menu = {
                title = 'Teleport where? (Metalworks)',
                options = {},
                 }
             menu.options = page48
            delaySendMenu(player)        
        end,
    },
}
page10 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'Windurst Waters.',
        function(player)
         menu = {
                title = 'Teleport where? (Windurst Waters)',
                options = {},
                 }
             menu.options = page49
            delaySendMenu(player)        
        end,
    },
    {
        'Windurst Walls.',
        function(player)
         menu = {
                title = 'Teleport where? (Windurst Walls)',
                options = {},
                 }
             menu.options = page50
            delaySendMenu(player)        
        end,
    },
    {
        'Port Windurst.',
        function(player)
         menu = {
                title = 'Teleport where? (Port Windurst)',
                options = {},
                 }
             menu.options = page51
            delaySendMenu(player)        
        end,
    },
    {
        'Windurst Woods.',
        function(player)
         menu = {
                title = 'Teleport where? (Windurst Woods)',
                options = {},
                 }
             menu.options = page52
            delaySendMenu(player)        
        end,
    },
}
page11 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'RuLude Gardens.',
        function(player)
         menu = {
                title = 'Teleport where? (RuLude Gardens)',
                options = {},
                 }
             menu.options = page53
            delaySendMenu(player)        
        end,
    },
    {
        'Upper Jeuno.',
        function(player)
         menu = {
                title = 'Teleport where? (Upper Jeuno)',
                options = {},
                 }
             menu.options = page54
            delaySendMenu(player)        
        end,
    },
    {
        'Lower Jeuno.',
        function(player)
         menu = {
                title = 'Teleport where? (Lower Jeuno)',
                options = {},
                 }
             menu.options = page55
            delaySendMenu(player)        
        end,
    },
    {
        'Port Jeuno.',
        function(player)
         menu = {
                title = 'Teleport where? (Port Jeuno)',
                options = {},
                 }
             menu.options = page56
            delaySendMenu(player)        
        end,
    },
}
page12 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'Tavnazian Safehold.',
        function(player)
         menu = {
                title = 'Teleport where? (Tavnazian Safehold)',
                options = {},
                 }
             menu.options = page57
            delaySendMenu(player)        
        end,
    },
}
page13 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page2
            delaySendMenu(player)          
        end,
    },
    {
        'Al Zahbi.',
        function(player)
         menu = {
                title = 'Teleport where? (Al Zahbi)',
                options = {},
                 }
             menu.options = page58
            delaySendMenu(player)        
        end,
    },
    {
        'Aht Urhgan Whitegate.',
        function(player)
         menu = {
                title = 'Teleport where? (Aht Urhgan Whitegate)',
                options = {},
                 }
             menu.options = page59
            delaySendMenu(player)        
        end,
    },
    {
        'Bhaflau Thickets.',
        function(player)
         menu = {
                title = 'Teleport where? (Bhaflau Thickets)',
                options = {},
                 }
             menu.options = page60
            delaySendMenu(player)        
        end,
    },
}
page14 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Western Adoulin.',
        function(player)
         menu = {
                title = 'Teleport where? (Western Adoulin)',
                options = {},
                 }
             menu.options = page61
            delaySendMenu(player)        
        end,
    },
    {
        'Eastern Adoulin.',
        function(player)
         menu = {
                title = 'Teleport where? (Eastern Adoulin)',
                options = {},
                 }
             menu.options = page62
            delaySendMenu(player)        
        end,
    },
}
page15 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Yughott Grotto.',
        function(player)
         menu = {
                title = 'Teleport where? (Yughott Grotto)',
                options = {},
                 }
             menu.options = page63
            delaySendMenu(player)        
        end,
    },
}
page16 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Selbina.',
        function(player)
         menu = {
                title = 'Teleport where? (Selbina)',
                options = {},
                 }
             menu.options = page64
            delaySendMenu(player)        
        end,
    },
}
page17 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Palborough Mines.',
        function(player)
         menu = {
                title = 'Teleport where? (Palborough Mines)',
                options = {},
                 }
             menu.options = page65
            delaySendMenu(player)        
        end,
    },
}
page18 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Giddeus.',
        function(player)
         menu = {
                title = 'Teleport where? (Giddeus)',
                options = {},
                 }
             menu.options = page66
            delaySendMenu(player)        
        end,
    },
    {
        'Toraimarai Canal.',
        function(player)
         menu = {
                title = 'Teleport where? (Toraimarai Canal)',
                options = {},
                 }
             menu.options = page67
            delaySendMenu(player)        
        end,
    },
}
page19 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page3
            delaySendMenu(player)          
        end,
    },
    {
        'Mhaura.',
        function(player)
         menu = {
                title = 'Teleport where? (Mhaura)',
                options = {},
                 }
             menu.options = page68
            delaySendMenu(player)        
        end,
    },
}
page20 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'Attohwa Chasm.',
        function(player)
         menu = {
                title = 'Teleport where? (Attohwa Chasm)',
                options = {},
                 }
             menu.options = page69
            delaySendMenu(player)        
        end,
    },
}
page21 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'PsoXja.',
        function(player)
         menu = {
                title = 'Teleport where? (PsoXja)',
                options = {},
                 }
             menu.options = page70
            delaySendMenu(player)        
        end,
    },
    {
        'FeiYin.',
        function(player)
         menu = {
                title = 'Teleport where? (FeiYin)',
                options = {},
                 }
             menu.options = page71
            delaySendMenu(player)        
        end,
    },
}
page22 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'Uleguerand Range.',
        function(player)
         menu = {
                title = 'Teleport where? (Uleguerand Range)',
                options = {},
                 }
             menu.options = page72
            delaySendMenu(player)        
        end,
    },
    {
        'Castle Zvahl Keep.',
        function(player)
         menu = {
                title = 'Teleport where? (Castle Zvahl Keep)',
                options = {},
                 }
             menu.options = page73
            delaySendMenu(player)        
        end,
    },
}
page23 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'Qufim Island.',
        function(player)
         menu = {
                title = 'Teleport where? (Qufim Island)',
                options = {},
                 }
             menu.options = page74
            delaySendMenu(player)        
        end,
    },
    {
        'Upper Delkfutts Tower.',
        function(player)
         menu = {
                title = 'Teleport where? (Upper Delkfutts Tower)',
                options = {},
                 }
             menu.options = page75
            delaySendMenu(player)        
        end,
    },
}
page24 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'The Boyahda Tree.',
        function(player)
         menu = {
                title = 'Teleport where? (The Boyahda Tree)',
                options = {},
                 }
             menu.options = page76
            delaySendMenu(player)        
        end,
    },
}
page25 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page4
            delaySendMenu(player)          
        end,
    },
    {
        'Quicksand Caves.',
        function(player)
         menu = {
                title = 'Teleport where? (Quicksand Caves)',
                options = {},
                 }
             menu.options = page77
            delaySendMenu(player)        
        end,
    },
    {
        'Rabao.',
        function(player)
         menu = {
                title = 'Teleport where? (Rabao)',
                options = {},
                 }
             menu.options = page78
            delaySendMenu(player)        
        end,
    },
}
page26 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Cape Teriggan.',
        function(player)
         menu = {
                title = 'Teleport where? (Cape Teriggan)',
                options = {},
                 }
             menu.options = page79
            delaySendMenu(player)        
        end,
    },
}
page27 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Kazham.',
        function(player)
         menu = {
                title = 'Teleport where? (Kazham)',
                options = {},
                 }
             menu.options = page80
            delaySendMenu(player)        
        end,
    },
    {
        'Norg.',
        function(player)
         menu = {
                title = 'Teleport where? (Norg)',
                options = {},
                 }
             menu.options = page81
            delaySendMenu(player)        
        end,
    },
}
page28 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Den of Rencor.',
        function(player)
         menu = {
                title = 'Teleport where? (Den of Rencor)',
                options = {},
                 }
             menu.options = page82
            delaySendMenu(player)        
        end,
    },
    {
        'Ifrits Cauldron.',
        function(player)
         menu = {
                title = 'Teleport where? (Ifrits Cauldron)',
                options = {},
                 }
             menu.options = page83
            delaySendMenu(player)        
        end,
    },
}
page29 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'RuAun Gardens.',
        function(player)
         menu = {
                title = 'Teleport where? (RuAun Gardens)',
                options = {},
                 }
             menu.options = page84
            delaySendMenu(player)        
        end,
    },
    {
        'The Shrine of RuAvitau.',
        function(player)
         menu = {
                title = 'Teleport where? (The Shrine of RuAvitau)',
                options = {},
                 }
             menu.options = page85
            delaySendMenu(player)        
        end,
    },
}
page30 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Newton Movalpolos.',
        function(player)
         menu = {
                title = 'Teleport where? (Newton Movalpolos)',
                options = {},
                 }
             menu.options = page86
            delaySendMenu(player)        
        end,
    },
}
page31 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page5
            delaySendMenu(player)          
        end,
    },
    {
        'Misareauxx Coast.',
        function(player)
         menu = {
                title = 'Teleport where? (Misareauxx Coast)',
                options = {},
                 }
             menu.options = page87
            delaySendMenu(player)        
        end,
    },
    {
        'Riverne - Site B01.',
        function(player)
         menu = {
                title = 'Teleport where? (Riverne - Site B01)',
                options = {},
                 }
             menu.options = page88
            delaySendMenu(player)        
        end,
    },
    {
        'Riverne - Site A01.',
        function(player)
         menu = {
                title = 'Teleport where? (Riverne - Site A01)',
                options = {},
                 }
             menu.options = page89
            delaySendMenu(player)        
        end,
    },
}
page32 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'AlTaieu.',
        function(player)
         menu = {
                title = 'Teleport where? (AlTaieu)',
                options = {},
                 }
             menu.options = page90
            delaySendMenu(player)        
        end,
    },
    {
        'Grand Palace of HuXzoi.',
        function(player)
         menu = {
                title = 'Teleport where? (Grand Palace of HuXzoi)',
                options = {},
                 }
             menu.options = page91
            delaySendMenu(player)        
        end,
    },
    {
        'The Garden of RuHmete.',
        function(player)
         menu = {
                title = 'Teleport where? (The Garden of RuHmete)',
                options = {},
                 }
             menu.options = page92
            delaySendMenu(player)        
        end,
    },
}
page33 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'Mount Zhayolm.',
        function(player)
         menu = {
                title = 'Teleport where? (Mount Zhayolm)',
                options = {},
                 }
             menu.options = page93
            delaySendMenu(player)        
        end,
    },
}
page34 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'Nashmau.',
        function(player)
         menu = {
                title = 'Teleport where? (Nashmau)',
                options = {},
                 }
             menu.options = page94
            delaySendMenu(player)        
        end,
    },
    {
        'Caedarva Mire.',
        function(player)
         menu = {
                title = 'Teleport where? (Caedarva Mire)',
                options = {},
                 }
             menu.options = page95
            delaySendMenu(player)        
        end,
    },
}
page35 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'Southern San dOria [S].',
        function(player)
         menu = {
                title = 'Teleport where? (Southern San dOria [S])',
                options = {},
                 }
             menu.options = page96
            delaySendMenu(player)        
        end,
    },
}
page36 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page6
            delaySendMenu(player)          
        end,
    },
    {
        'Bastok Market [S].',
        function(player)
         menu = {
                title = 'Teleport where? (Bastok Market [S])',
                options = {},
                 }
             menu.options = page97
            delaySendMenu(player)        
        end,
    },
}
page37 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page7
            delaySendMenu(player)          
        end,
    },
    {
        'Windurst Waters [S].',
        function(player)
         menu = {
                title = 'Teleport where? (Windurst Waters [S])',
                options = {},
                 }
             menu.options = page98
            delaySendMenu(player)        
        end,
    },
}
page38 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page7
            delaySendMenu(player)          
        end,
    },
    {
        'Xarcabard [S].',
        function(player)
         menu = {
                title = 'Teleport where? (Xarcabard [S])',
                options = {},
                 }
             menu.options = page99
            delaySendMenu(player)        
        end,
    },
    {
        'Castle Zvahl Keep [S].',
        function(player)
         menu = {
                title = 'Teleport where? (Castle Zvahl Keep [S])',
                options = {},
                 }
             menu.options = page100
            delaySendMenu(player)        
        end,
    },
}
page39 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page7
            delaySendMenu(player)          
        end,
    },
    {
        'Ceizak Battlegrounds.',
        function(player)
         menu = {
                title = 'Teleport where? (Ceizak Battlegrounds)',
                options = {},
                 }
             menu.options = page101
            delaySendMenu(player)        
        end,
    },
    {
        'Foret de Hennetiel.',
        function(player)
         menu = {
                title = 'Teleport where? (Foret de Hennetiel)',
                options = {},
                 }
             menu.options = page102
            delaySendMenu(player)        
        end,
    },
    {
        'Yorcia Weald.',
        function(player)
         menu = {
                title = 'Teleport where? (Yorcia Weald)',
                options = {},
                 }
             menu.options = page103
            delaySendMenu(player)        
        end,
    },
    {
        'Morimar Basalt Fields.',
        function(player)
         menu = {
                title = 'Teleport where? (Morimar Basalt Fields)',
                options = {},
                 }
             menu.options = page104
            delaySendMenu(player)        
        end,
    },
    {
        'Marjami Ravine.',
        function(player)
         menu = {
                title = 'Teleport where? (Marjami Ravine)',
                options = {},
                 }
             menu.options = page105
            delaySendMenu(player)        
        end,
    },
    {
        'Next page.',
        function(player)
             menu.options = page40
            delaySendMenu(player)             
        end,
    },
}
page40 =
{
    {
        'Kamihr Drits.',
        function(player)
         menu = {
                title = 'Teleport where? (Kamihr Drits)',
                options = {},
                 }
             menu.options = page106
            delaySendMenu(player)        
        end,
    },
    {
        'Leafallia.',
        function(player)
         menu = {
                title = 'Teleport where? (Leafallia)',
                options = {},
                 }
             menu.options = page107
            delaySendMenu(player)        
        end,
    },
    {
        'Previous page.',
        function(player)
             menu.options = page39
            delaySendMenu(player)          
        end,
    },
}
page41 =
{
    {
        'Nevermind.',
        function(player)
         menu = {
                title = 'Teleport to which region?',
                options = {},
                 }
             menu.options = page7
            delaySendMenu(player)          
        end,
    },
    {
        'RaKaznar Inner Court.',
        function(player)
         menu = {
                title = 'Teleport where? (RaKaznar Inner Court)',
                options = {},
                 }
             menu.options = page108
            delaySendMenu(player)        
        end,
    },
}
page42 = -- SOUTHERN_SAN_DORIA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page8
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 1)
             menu.options = page109
            delaySendMenu(player)                   
        end,
    },
    {
        'Home Point #2 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 2)
             menu.options = page109
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #3 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 3)
             menu.options = page109
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 98)
             menu.options = page109
            delaySendMenu(player)           
        end,
    },
}
page43 = -- NORTHERN_SAN_DORIA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page8
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 4)
             menu.options = page109
            delaySendMenu(player)                   
                 
        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 5)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 6)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 99)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page44 = -- PORT_SAN_DORIA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page8
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 7)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 8)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 9)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page45 = -- BASTOK_MINES
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page9
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 10)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 11)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)        
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 100)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page46 = -- BASTOK_MARKETS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page9
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 12)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 13)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 14)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 101)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page47 = -- PORT_BASTOK
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page9
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 15)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 16)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 102)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page48 = -- METALWORKS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page9
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 17)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 103)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page49 = -- WINDURST_WATERS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page10
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 18)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 19)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 104)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 119)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page50 = -- WINDURST_WALLS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page10
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 20)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 21)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 22)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page51 = -- PORT_WINDURST
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page10
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 23)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 24)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 25)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page52 = -- WINDURST_WOODS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page10
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 26)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 27)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 28)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 29)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #5.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 120)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page53 = -- RULUDE_GARDENS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page11
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 30)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 31)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 32)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page54 = -- UPPER_JEUNO
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page11
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 33)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal',34)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 35)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page55 = -- LOWER_JEUNO
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page11
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 36)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 37)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page56 = -- PORT_JEUNO
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page11
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (E).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 38)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 39)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page57 = -- TAVNAZIAN_SAFEHOLD
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page12
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 65)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 121)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 122)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page58 = -- AL_ZAHBI
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page13
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 68)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page59 = -- AHT_URHGAN_WHITEGATE
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page13
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 66)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 107)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 108)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 109)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page60 = -- BHAFLAU_THICKETS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page13
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 75)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page61 = -- WESTERN_ADOULIN
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page14
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 45)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 110)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page62 = -- EASTERN_ADOULIN
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page14
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 46)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (M).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 111)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page63 = -- YUGHOTT_GROTTO
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page15
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 53)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page64 = -- SELBINA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page16
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 44)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page65 = -- PALBOROUGH_MINES
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page17
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 54)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page66 = -- GIDDEUS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page18
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 55)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page67 = -- TORAIMARAI_CANAL
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page18
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 116)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page68 = -- MHAURA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page19
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 41)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page69 = -- ATTOHWA_CHASM
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page20
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 82)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page70 = -- PSOXJA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page21
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 83)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page71 = -- FEIYIN
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page21
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 56)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 95)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page72 = -- ULEGUERAND_RANGE
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page22
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 77)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 78)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 79)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 80)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #5.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 81)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page73 = -- CASTLE_ZVAHL_KEEP
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page22
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 59)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page74 = -- QUFIM_ISLAND
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page23
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 115)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page75 = -- UPPER_DELKFUTTS_TOWER
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page23
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 72)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page76 = -- THE_BOYAHDA_TREE
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page24
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 93)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page77 = -- QUICKSAND_CAVES
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page25
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 57)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 97)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page78 = -- Rabao
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page25
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 43)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 106)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page79 = -- CAPE_TERIGGAN
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page26
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 92)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page80 = -- KAZHAM
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page27
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 39)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page81 = -- NORG
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page27
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 42)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2 (A).',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 105)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page82 = -- DEN_OF_RANCOR
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page28
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 58)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 94)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page83 = -- IFRITS_CAULDRON
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page28
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 96)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page84 = -- RUAUN_GARDENS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page29
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 60)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 61)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 62)        
        end,
    },
    {
        'Home Point #4.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 63)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #5.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 64)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page85 = -- THE_SHRINE_OF_RUAVITAU
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page29
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 73)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page86 = -- NEWTON_MOVALPOLOS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page30
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 84)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page87 = -- MISAREAUX_COAST
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page31
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 118)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page88 = -- RIVERNE_SITE_B01
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page31
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 74)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page89 = -- RIVERNE_SITE_A01
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page31
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 85)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page90 = -- ALTAIEU
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page32
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 86)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #2.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 87)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #3.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 88)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page91 = -- GRAND_PALACE_OF_HUXZOI
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page32
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 89)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page92 = -- THE_GARDEN_OF_RUHMET
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page32
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 90)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page93 = -- MOUNT_ZHAYOLM
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page33
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 91)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page94 = -- NASHMAU
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page34
            delaySendMenu(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 67)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
    {
        'Home Point #1.',
        function(player)        
        end,
    },
}
page95 = -- CAEDARVA_MIRE
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page34
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 76)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page96 = -- SOUTHERN_SAN_DORIA_S
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page35
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 69)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page97 = -- BASTOK_MARKETS_S
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page36
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 70)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page98 = -- WINDURST_WATERS_S
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page37
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 71)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page99 = -- XARCABARD_S
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page38
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 112)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page100 = -- CASTLE_ZVAHL_KEEP_S
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page38
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 114)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page101 = -- CEIZAK_BATTLEGROUNDS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 47)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page102 = -- FORET_DE_HENNETIEL
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 48)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page103 = -- YORCIA_WEALD
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 50)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page104 = -- MORIMAR_BASALT_FIELDS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 49)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page105 = -- MARJAMI_RAVINE
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 51)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page106 = -- KAMIHR_DRIFTS
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 52)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page107 = -- LEAFALLIA
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page39
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 113)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page108 = -- RAKAZNAR_INNER_COURT
{
    {
        'Nowhere.',
        function(player)
         menu = {
                title = 'Teleport where?',
                options = {},
                 }
             menu.options = page41
            delaySendMenu(player)           
        end,
    },
    {
        'Home Point #1.',
        function(player)
         menu = {
                title = string.format('Teleport? (Current gil: %s)', player:getGil()),
                options = {},
                 }
                 player:setLocalVar('TeleCrystal', 117)
                              menu.options = page109
            delaySendMenu(player)                   

        end,
    },
}
page109 =
{
    {
        'Yes, please.',
        function(player)
         if player:getLocalVar('TeleCrystal') > 0 then
			for k, v in pairs(homepointData) do
				if player:getLocalVar('TeleCrystal') == k then
                    player:independentAnimation(player, 1, 3)
                    player:timer(1200, function()
                    player:setPos(unpack(homepointData[k].dest))
                    end)

                end
			end
         end
        end,
    },
    {
        'No, thank you.', ------- wtf why wont is save data on the module
        function(player)
        return
        --[[
        local blah = 0
        local blahblah = 0
         if player:getLocalVar('TeleCrystal') > 0 then
			for k, v in pairs(homepointData) do
				if player:getLocalVar('TeleCrystal') == k then
                   blah = v.verb
                   blahblah = v.page

                end
            end
         end
                  menu = {
                  title = blah, -- works
                  options = {},
                   }
                   menu.options = blahblah, --- this does not work, closes the box immediatly because it is not registering the page# table
                  delaySendMenu(player)
                  ]]--
        end,
    },
}

page110 =
{
    {
        'Yes.',
        function(player)
            player:printToPlayer("Home point set!", xi.msg.channel.NS_SAY)
            player:setHomePoint()
            player:independentAnimation(player, 26, 3)
        end,
    },
    {
        'No.',
        function(player)
         menu = {
                title = 'What will you do?',
                options = {},
                 }
            menu.options = page1
            delaySendMenu(player)        
        end,
    },
}
             menu.options = page1
            delaySendMenu(player)
        end,
    })
end)

return m

