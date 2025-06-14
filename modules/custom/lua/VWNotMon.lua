
local info = 
{
{'Abununnu',             'Lufaise_Meadows',            1},
{'Aello',                'RuAun_Gardens',              3},
{'Agathos',              'Rolanberry_Fields_[S]',      1},
{'Akupara',              'Meriphataud_Mountains_[S]',  3},
{'Akvan',                'Lower_Delkfutts_Tower',      3},
{'Belphoebe',            'Jugner_Forest',              3},
{'Bhishani',             'South_Gustaberg',            4},
{'Bismarck',             'Bibiki_Bay',                 2},
{'Botulus_Rex',          'Buburimu_Peninsula',         6},
{'Brekekekex',           'Caedarva_Mire',              1},
{'Cath_Palug',           'The_Sanctuary_of_ZiTah',     2},
{'Celaeno',              'Dangruf_Wadi',               4},
{'Cherufe',              'Batallia_Downs',             1},
{'Cottus',               'East_Ronfaure_[S]',          1},
{'Dimgruzub',            'Arrapago_Reef',              1},
{'Fjalar',               'Attohwa_Chasm',              1},
{'Gasha',                'The_Eldieme_Necropolis',     2},
{'Gaunab',               'Vunkerl_Inlet_[S]',          6},
{'Giltine',              'The_Eldieme_Necropolis_[S]', 2},
{'Goji',                 'Sauromugue_Champaign',       1},
{'Gugalanna',            'Sauromugue_Champaign_[S]',   1},
{'Gwynn_ap_Nudd',        'Konschtat_Highlands',        5},
{'Hahava',               'King_Ranperres_Tomb',        4},
{'Holy_Moly',            'Yuhtunga_Jungle',            1},
{'Ig-Alima',             'Valkurm_Dunes',              6},
{'Ildebrann',            'Ifrits_Cauldron',            1},
{'Isarukitsck',          'Uleguerand_Range',           1},
{'Kaggen',               'Qufim_Island',               3},
{'Kalasutrax',           'Fort_Karugo-Narugo_[S]',     6},
{'Kholomodumo',          'Jugner_Forest_[S]',          3},
{'Krabimanjaro',         'Ordelles_Caves',             2},
{'Laidly_Laurence',      'Garlaige_Citadel_[S]',       2},
{'Lancing_Lamorak',      'West_Ronfaure',              4},
{'Lorbulcrud',           'Gusgen_Mines',               2},
{'Lord_Asag',            'Meriphataud_Mountains',      3},
{'Malleator_Maurok',     'Quicksand_Caves',            1},
{'Melancholic_Moira',    'Pashhow_Marshlands_[S]',     3},
{'Mellonia',             'Crawlers_Nest',              2},
{'Mimic_King',           'RoMaeve',                    2},
{'Modron',               'The_Boyahda_Tree',           2},
{'Morta',                'Aydeewa_Subterrane',         2},
{'Murk-veined_Baneberry','Pashhow_Marshlands',         3},
{'Neith',                'Temple_of_Uggalepih',        1},
{'Nympha_Eunomia',       'Crawlers_Nest_[S]',          2},
{'Ocythoe',              'Grauberg_[S]',               6},
{'Ogbunabali',           'Maze_of_Shakhrami',          2},
{'Pancimanci',           'West_Sarutabaruta_[S]',      1},
{'Pil',                  'Behemoths_Dominion',         3},
{'Qilin',                'The_Shrine_of_RuAvitau',     3},
{'Roly-Poly',            'Garlaige_Citadel',           2},
{'Rw_Nw_Prt_M_Hrw',      'East_Sarutabaruta',          4},
{'Sabotender_Campeador', 'Western_Altepa_Desert',      1},
{'Sallow_Seymour',       'North_Gustaberg',            1},
{'Sarimanok',            'East_Ronfaure',              1},
{'Smierc',               'Tahrongi_Canyon',            5},
{'Stachysaurus',         'La_Theine_Plateau',          5},
{'Tangaroa',             'Kuftal_Tunnel',              1},
{'Taweret',              'Batallia_Downs_[S]',         1},
{'Tsui-Goab',            'Misareaux_Coast',            1},
{'Uptala',               'VeLugannon_Palace',          3},
{'Ushumgal',             'North_Gustaberg_[S]',        1},
{'Vanasarvik',           'Mount_Zhayolm',              1},
{'Virvatuli',            'West_Sarutabaruta',          1},
{'Voidwrought',          'Outer_Horutoto_Ruins',       4},
{'Yalungur',             'Mamook',                     1},
{'Yatagarasu',           'Rolanberry_Fields',          1},
}

local npcinfo =
{
{'Bastok_Markets',           'Voidwatch_Officer',    9, xi.ki.INDIGO_STRATUM_ABYSSITE},
{'Windurst_Waters',          'Voidwatch_Officer', 1024, xi.ki.JADE_STRATUM_ABYSSITE},
{'Southern_San_dOria',       'Voidwatch_Officer',  963, xi.ki.CRIMSON_STRATUM_ABYSSITE},
{'Norg',                     'Kieran',             259, xi.ki.ASHEN_STRATUM_ABYSSITE},
{'Tavnazian_Safehold',       'Owain',              626, xi.ki.HYACINTH_STRATUM_ABYSSITE},
{'Wajaom_Woodlands',         'Camille',             23, xi.ki.AMBER_STRATUM_ABYSSITE},
{'Southern_San_dOria_[S]',   'Voidwatch_Officer',  658, xi.ki.CRIMSON_STRATUM_ABYSSITE},
{'Bastok_Markets_[S]',       'Voidwatch_Officer',   80, xi.ki.INDIGO_STRATUM_ABYSSITE},
{'Windurst_Waters_[S]',      'Voidwatch_Officer',   47, xi.ki.JADE_STRATUM_ABYSSITE},
{'Rabao',                    'Gushing_Spring',      14, xi.ki.WHITE_STRATUM_ABYSSITE},
{'Kazham',                   'Hildegard',          314, xi.ki.WHITE_STRATUM_ABYSSITE},
{'Sauromugue_Champaign',     'Voidwatch_Officer',    8, xi.ki.JADE_STRATUM_ABYSSITE},
{'Rolanberry_Fields',        'Voidwatch_Officer',    7, xi.ki.INDIGO_STRATUM_ABYSSITE},
{'Batallia_Downs',           'Voidwatch_Officer',    8, xi.ki.CRIMSON_STRATUM_ABYSSITE},
{'Sauromugue_Champaign_[S]', 'Voidwatch_Officer',   16, xi.ki.JADE_STRATUM_ABYSSITE},
{'Rolanberry_Fields_[S]',    'Voidwatch_Officer',    9, xi.ki.INDIGO_STRATUM_ABYSSITE},
{'Batallia_Downs_[S]',       'Voidwatch_Officer',   26, xi.ki.CRIMSON_STRATUM_ABYSSITE},
}

local atmnpcinfo =
{
{'Bastok_Markets',           'Atmacite_Refiner',     8},
{'Windurst_Waters',          'Atmacite_Refiner',  1023},
{'Southern_San_dOria',       'Atmacite_Refiner',   962},
{'Norg',                     'Atmacite_Refiner',   264},
{'Tavnazian_Safehold',       'Atmacite_Refiner',   627},
{'Southern_San_dOria_[S]',   'Atmacite_Refiner',   657},
{'Bastok_Markets_[S]',       'Atmacite_Refiner',    79},
{'Windurst_Waters_[S]',      'Atmacite_Refiner',    46},
{'Rabao',                    'Atmacite_Refiner',    16},
{'Kazham',                   'Atmacite_Refiner',   316},
{'Sauromugue_Champaign',     'Atmacite_Refiner',     7},
{'Rolanberry_Fields',        'Atmacite_Refiner',     6},
{'Batallia_Downs',           'Atmacite_Refiner',     7},
{'Sauromugue_Champaign_[S]', 'Atmacite_Refiner',    15},
{'Rolanberry_Fields_[S]',    'Atmacite_Refiner',     8},
{'Batallia_Downs_[S]',       'Atmacite_Refiner',    25},
{'Wajaom_Woodlands',         'Atmacite_Refiner',    24},
}
local atmaPurveyor =
{
{'Aht_Urhgan_Whitegate',   'Voidwatch_Purveyor', 'imperial_standing', 968},
{'Al_Zahbi',               'Voidwatch_Purveyor', 'imperial_standing', 291}, -- 292
{'Bastok_Markets_[S]',     'Voidwatch_Purveyor', 'allied_notes',       81},
{'Bastok_Mines',           'Voidwatch_Purveyor', 'bastok_cp',         288},
{'Lower_Jeuno',            'Voidwatch_Purveyor', 'conquest_points', 10109},
{'Nashmau',                'Voidwatch_Purveyor', 'imperial_standing',  37},
{'Northern_San_dOria',     'Voidwatch_Purveyor', 'sandoria_cp',       877},
{'Port_Bastok',            'Voidwatch_Purveyor', 'bastok_cp',           9},
{'Port_Jeuno',             'Voidwatch_Purveyor', 'conquest_points',   351},
{'Port_Windurst',          'Voidwatch_Purveyor', 'windurst_cp',       875},
-- {'RuLude_Gardens',         'Voidwatch_Purveyor', 'conquest_points',      }, do not have capture of event
{'Southern_San_dOria_[S]', 'Voidwatch_Purveyor', 'allied_notes',      664},
{'Southern_San_dOria',     'Voidwatch_Purveyor', 'sandoria_cp',       975}, -- 976
{'Upper_Jeuno',            'Voidwatch_Purveyor', 'conquest_points', 10213},
{'Windurst_Waters_[S]',    'Voidwatch_Purveyor', 'allied_notes',       48},
{'Windurst_Waters',        'Voidwatch_Purveyor', 'windurst_cp',      1034},
{'Windurst_Woods',         'Voidwatch_Purveyor', 'windurst_cp',       836},
{'Bastok_Markets',         'Voidwatch_Purveyor', 'bastok_cp',          10},
}

local atmparam =
{
{xi.ki.AMBER_STRATUM_ABYSSITE,          33554432,  1500000, 'Path_Aht_Urhgan'},
{xi.ki.AMBER_STRATUM_ABYSSITE_II,       67108864,  1200000, 'Path_Aht_Urhgan'},
{xi.ki.ASHEN_STRATUM_ABYSSITE,          65536,    36000000, 'Path_Zilart'},
{xi.ki.ASHEN_STRATUM_ABYSSITE_II,       131072,   18000000, 'Path_Zilart'},
{xi.ki.ASHEN_STRATUM_ABYSSITE_III,      262144,   27000000, 'Path_Zilart'},
{xi.ki.CRIMSON_STRATUM_ABYSSITE,        1,            2000, 'Path_Sandoria'},
{xi.ki.CRIMSON_STRATUM_ABYSSITE_II,     2,             700, 'Path_Sandoria'},
{xi.ki.CRIMSON_STRATUM_ABYSSITE_III,    4,            1050, 'Path_Sandoria'},
{xi.ki.CRIMSON_STRATUM_ABYSSITE_IV,     8,            1750, 'Path_Sandoria'},
{xi.ki.HYACINTH_STRATUM_ABYSSITE,       8388608,    150000, 'Path_Tavnazia'},
{xi.ki.HYACINTH_STRATUM_ABYSSITE_II,    16777216,   120000, 'Path_Tavnazia'},
{xi.ki.INDIGO_STRATUM_ABYSSITE,         16,            300, 'Path_Bastok'},
{xi.ki.INDIGO_STRATUM_ABYSSITE_II,      32,            100, 'Path_Bastok'},
{xi.ki.INDIGO_STRATUM_ABYSSITE_III,     64,            150, 'Path_Bastok'},
{xi.ki.INDIGO_STRATUM_ABYSSITE_IV,      128,           250, 'Path_Bastok'},
{xi.ki.JADE_STRATUM_ABYSSITE,           256,         18000, 'Path_Windurst'},
{xi.ki.JADE_STRATUM_ABYSSITE_II,        512,          6000, 'Path_Windurst'},
{xi.ki.JADE_STRATUM_ABYSSITE_III,       1024,         9000, 'Path_Windurst'},
{xi.ki.JADE_STRATUM_ABYSSITE_IV,        2048,        15000, 'Path_Windurst'},
{xi.ki.WHITE_STRATUM_ABYSSITE,          4096,           26, 'Path_Jeuno'},
{xi.ki.WHITE_STRATUM_ABYSSITE_II,       8192,            6, 'Path_Jeuno'},
{xi.ki.WHITE_STRATUM_ABYSSITE_III,      16384,          12, 'Path_Jeuno'},
{xi.ki.WHITE_STRATUM_ABYSSITE_IV,       32768,          15, 'Path_Jeuno'},
{xi.ki.WHITE_STRATUM_ABYSSITE_V,        2097152,        18, 'Path_Jeuno'},
{xi.ki.WHITE_STRATUM_ABYSSITE_VI,       4194304,        21, 'Path_Jeuno'},
}

local VWCharVar =
{
{'[VWNM] Sallow_Seymour',       1, 'Path_Bastok',     50},
{'[VWNM] Ushumgal',             1, 'Path_Bastok',     50},
{'[VWNM] Sarimanok',            1, 'Path_Sandoria',   350},
{'[VWNM] Cottus',               1, 'Path_Sandoria',   350},
{'[VWNM] Virvatuli',            1, 'Path_Windurst',   3000},
{'[VWNM] Pancimanci',           1, 'Path_Windurst',   3000},
{'[VWNM] Goji',                 1, 'Path_Jeuno',      1},
{'[VWNM] Gugalanna',            1, 'Path_Jeuno',      1},
{'[VWNM] Yatagarasu',           1, 'Path_Jeuno',      1},
{'[VWNM] Agathos',              1, 'Path_Jeuno',      1},
{'[VWNM] Cherufe',              1, 'Path_Jeuno',      1},
{'[VWNM] Taweret',              1, 'Path_Jeuno',      1},
{'[VWNM] Holy_Moly',            1, 'Path_Zilart',     3000000},
{'[VWNM] Ildebrann',            1, 'Path_Zilart',     3000000},
{'[VWNM] Neith',                1, 'Path_Zilart',     3000000},
{'[VWNM] Sabotender_Campeador', 1, 'Path_Zilart',     3000000},
{'[VWNM] Tangaroa',             1, 'Path_Zilart',     3000000},
{'[VWNM] Malleator_Maurok',     1, 'Path_Zilart',     3000000},
{'[VWNM] Fjalar',               1, 'Path_Tavnazia',   30000},
{'[VWNM] Abununnu',             1, 'Path_Tavnazia',   30000},
{'[VWNM] Tsui-Goab',            1, 'Path_Tavnazia',   30000},
{'[VWNM] Isarukitsck',          1, 'Path_Tavnazia',   30000},
{'[VWNM] Dimgruzub',            1, 'Path_Aht_Urhgan', 300000},
{'[VWNM] Brekekekex',           1, 'Path_Aht_Urhgan', 300000},
{'[VWNM] Yalungur',             1, 'Path_Aht_Urhgan', 300000},
{'[VWNM] Vanasarvik',           1, 'Path_Aht_Urhgan', 300000},
{'[VWNM] Lorbulcrud',           2, 'Path_Bastok',     50},
{'[VWNM] Krabimanjaro',         2, 'Path_Sandoria',   350},
{'[VWNM] Ogbunabali',           2, 'Path_Windurst',   3000},
{'[VWNM] Roly-Poly',            2, 'Path_Jeuno',      1},
{'[VWNM] Laidly_Laurence',      2, 'Path_Jeuno',      1},
{'[VWNM] Mellonia',             2, 'Path_Jeuno',      1},
{'[VWNM] Nympha_Eunomia',       2, 'Path_Jeuno',      1},
{'[VWNM] Gasha',                2, 'Path_Jeuno',      1},
{'[VWNM] Giltine',              2, 'Path_Jeuno',      1},
{'[VWNM] Cath_Palug',           2, 'Path_Zilart',     3000000},
{'[VWNM] Modron',               2, 'Path_Zilart',     3000000},
{'[VWNM] Mimic_King',           2, 'Path_Zilart',     3000000},
{'[VWNM] Bismarck',             2, 'Path_Tavnazia',   30000},
{'[VWNM] Morta',                2, 'Path_Aht_Urhgan', 300000},
{'[VWNM] Murk-veined_Baneberry',3, 'Path_Bastok',     50},
{'[VWNM] Melancholic_Moira',    3, 'Path_Bastok',     50},
{'[VWNM] Belphoebe',            3, 'Path_Sandoria',   350},
{'[VWNM] Kholomodumo',          3, 'Path_Sandoria',   350},
{'[VWNM] Lord_Asag',            3, 'Path_Windurst',   3000},
{'[VWNM] Akupara',              3, 'Path_Windurst',   3000},
{'[VWNM] Kaggen',               3, 'Path_Jeuno',      1},
{'[VWNM] Akvan',                3, 'Path_Jeuno',      1},
{'[VWNM] Pil',                  3, 'Path_Jeuno',      1},
{'[VWNM] Aello',                3, 'Path_Zilart',     3000000},
{'[VWNM] Uptala',               3, 'Path_Zilart',     3000000},
{'[VWNM] Qilin',                3, 'Path_Zilart',     3000000},
{'[VWNM] Celaeno',              4, 'Path_Bastok',     50},
{'[VWNM] Hahava',               4, 'Path_Sandoria',   350},
{'[VWNM] Voidwrought',          4, 'Path_Windurst',   3000},
{'[VWNM] Lancing_Lamorak',      4, 'Path_Jeuno',    1},
{'[VWNM] Bhishani',             4, 'Path_Jeuno',    1},
{'[VWNM] Rw_Nw_Prt_M_Hrw',      4, 'Path_Jeuno',    1},
{'[VWNM] Stachysaurus',         5, 'Path_Jeuno',    1},
{'[VWNM] Gwynn_ap_Nudd',        5, 'Path_Jeuno',    1},
{'[VWNM] Smierc',               5, 'Path_Jeuno',    1},
{'[VWNM] Gaunab',               6, 'Path_Jeuno',    1},
{'[VWNM] Ocythoe',              6, 'Path_Jeuno',    1},
{'[VWNM] Kalasutrax',           6, 'Path_Jeuno',    1},
{'[VWNM] Ig-Alima',             6, 'Path_Jeuno',    1},
{'[VWNM] Botulus_Rex',          6, 'Path_Jeuno',    1},
}

local atmtele =
{
[3997698] = {-456,          -3,     -405,  64,  54},--arrapago reef
[3866626] = {-159,          10,     -261,   0,   7},--attohwa
[4259842] = {356.503,   -0.364, -179.607, 122,  68},--aydeewa subt
[1310722] = {-500.451,  -39.71,  504.894,  39,  84},--batallia d s
[1245186] = {457,            8,     -156, 142, 105},--batilla downs
[3604482] = {-247.911, -82.165,  260.207, 248, 111},--beau glacier
[2162690] = {358.134,   24.806,  -60.001, 123, 127},--beh dom
[3932162] = {669.917,  -23.138,  911.655, 111,   4},--bibiki bay
[2686978] = {-140.008,   3.787,  202.715,  64, 153},--boyahda tree
[3538946] = {-276.529,  16.403, -324.519,  14, 118},--bubu
[4194306] = {339.996,      2.5, -721.286, 200,  79},--caedarva mire
[1835010] = {380.617,   -34.61,    4.581,  65, 171},--cral nest s
[1769474] = {380.617,   -34.61,    4.581,  59, 197},--crawl nest
[786434]  = {-4.025,    -4.449,    0.016, 112, 191},--dangruf
[2097154] = {460.022,    -1.77, -103.442, 188, 184},--delk tower
[65538]   = {86.131,   -65.817,  273.861,  25, 101},--east r
[131074]  = {86.131,   -65.817,  273.861,  25,  81},--east r s
[3014658] = {-125,          -3,     -519,   4, 116},--east saru
[1638402] = {-438.878, -26.091,  540.004, 126, 195},--eld necro
[1703938] = {420.035,  -58.114,  -119.51, 191, 175},--eld necro s
[3407874] = {135,          -21,      578, 171,  96},--fort karugo s
[1966082] = {-300,     -13.548,      157,  64, 164},--gar cit s
[1900546] = {-380.035, -13.548,  398.032,  64, 200},--gar cita
[3342338] = {495.063,   69.903,  924.102,  23,  89},--grauberg s
[589826]  = {45,           -67,     -340, 250, 196},--gusgen m
[2818050] = {-0.011,    -1.848, -176.133, 192, 251},--hall of the gods
[2293762] = {100,            0,     -320, 188, 205},--ifrit cal
[262146]  = {-594,          -7,     -442, 253, 104},--Jugner f
[327682]  = {621.865,   -6.665,  300.264, 149,  82},--jugner f s
[3145730] = {-193,          71,      842, 117, 108},--konschtat
[393218]  = {242.012,    5.305,  340.059, 121, 190},--KRT
[2490370] = {-20,          -20,     -241, 177, 174},--kuftal tunn
[3080194] = {-559,           0,      680,  73, 102},--la theine
[3670018] = {458,            6,       -4,  82,  24},--luf mead
[4128770] = {-117.491, -20.115, -299.997,   6,  65},--mamook
[983042]  = {-345,         -11,     -180, 239, 198},--maze of shak
[1048578] = {752.632,  -33.761,  -40.035, 129, 119},--meri mount
[1114114] = {-454.135,  28.409,   657.79,  49,  97},--meri mount s
[3735554] = {634,           22,     -222, 111,  25},--misar coast
[4063234] = {682,          -24,      363,  94,  61},--mount zhayolm
[458754]  = {660,            0,      306, 190, 106},--north g
[524290]  = {380.038,     -2.25, 147.627, 192,  88},--north g s
[196610]  = {-76.839,    -1.696, 659.969, 122, 193},--oredella c
[1179650] = {419.991,    -9.637, 716.991, 190, 194},--outer horu
[720898]  = {547.841,    23.192, 696.323, 134,  90},--pash m s
[655362]  = {547.841,    23.192, 696.323, 136, 109},--pashow m
[2031618] = {-286.271,  -21.619, 320.084, 255, 126},--quf islan
[2555906] = {-980.193,   14.913,-282.863,  60, 208},--quicksand cav
[2752514] = {-0.008,    -33.595, 123.478,  62, 122},--ro maeve
[1441794] = {-376.179,  -30.387,-776.159, 220,  91},--rolan f s
[1376258] = {339,            23,     607,  93, 110},--rolan field
[2621442] = {539.901,     3.379,-580.218, 126, 121},--sanc zi tah
[1507330] = {-471.8686,  0.7827,342.9518, 254, 120},--saur cham
[1572866] = {-104,       -25.36,    -410, 195, 98},--saur champ s
[2949122] = {579,             0,    -305,  62, 107},--south g
[3211266] = {442.781,    -1.641, -40.144, 160, 117},--tahrongi
[2359298] = {432.013,     5.353, 216.472, 153, 159},--temp ugga
[3801090] = {363.025,        16,     -60,  12,   5},--uleg range
[3473410] = {60.989,     -4.898,-151.001, 198, 103},--valk dunes
[3276802] = {-393.238,  -50.034, 741.199,   2,  83},--vunkerl inlet s
[851970]  = {320.018,    -6.684, -45.166, 189, 115},--w saruta
[917506]  = {320.018,    -6.684, -45.166, 189,  95},--w saruta s
[2424834] = {-19.901,    13.607, 440.058,  78, 125},--west altepe
[2883586] = {-126,          -62,     273,  99, 100},--west ron
[2228226] = {-237.8775,  0.4353,509.2727,  60, 123},--yuht jungle
}

local zname = 
{
{'Arrapago_Reef'},
{'Attohwa_Chasm'},
{'Aydeewa_Subterrane'},
{'Batallia_Downs'},
{'Batallia_Downs_[S]'},
{'Behemoths_Dominion'},
{'Bibiki_Bay'},
{'Buburimu_Peninsula'},
{'Caedarva_Mire'},
{'Crawlers_Nest'},
{'Crawlers_Nest_[S]'},
{'Dangruf_Wadi'},
{'East_Ronfaure'},
{'East_Ronfaure_[S]'},
{'East_Sarutabaruta'},
{'Fort_Karugo-Narugo_[S]'},
{'Garlaige_Citadel'},
{'Garlaige_Citadel_[S]'},
{'Grauberg_[S]'},
{'Gusgen_Mines'},
{'Ifrits_Cauldron'},
{'Jugner_Forest'},
{'Jugner_Forest_[S]'},
{'King_Ranperres_Tomb'},
{'Konschtat_Highlands'},
{'Kuftal_Tunnel'},
{'La_Theine_Plateau'},
{'Lower_Delkfutts_Tower'},
{'Lufaise_Meadows'},
{'Mamook'},
{'Maze_of_Shakhrami'},
{'Meriphataud_Mountains'},
{'Meriphataud_Mountains_[S]'},
{'Misareaux_Coast'},
{'Mount_Zhayolm'},
{'North_Gustaberg'},
{'North_Gustaberg_[S]'},
{'Ordelles_Caves'},
{'Outer_Horutoto_Ruins'},
{'Pashhow_Marshlands'},
{'Pashhow_Marshlands_[S]'},
{'Qufim_Island'},
{'Quicksand_Caves'},
{'RoMaeve'},
{'Rolanberry_Fields'},
{'Rolanberry_Fields_[S]'},
{'RuAun_Gardens'},
{'Sauromugue_Champaign'},
{'Sauromugue_Champaign_[S]'},
{'South_Gustaberg'},
{'Tahrongi_Canyon'},
{'Temple_of_Uggalepih'},
{'The_Boyahda_Tree'},
{'The_Eldieme_Necropolis'},
{'The_Eldieme_Necropolis_[S]'},
{'The_Sanctuary_of_ZiTah'},
{'The_Shrine_of_RuAvitau'},
{'Uleguerand_Range'},
{'Valkurm_Dunes'},
{'VeLugannon_Palace'},
{'Vunkerl_Inlet_[S]'},
{'West_Ronfaure'},
{'West_Sarutabaruta'},
{'West_Sarutabaruta_[S]'},
{'Western_Altepa_Desert'},
{'Yuhtunga_Jungle'},
}

local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
for _, entry in pairs(info) do
ensureTable(string.format("xi.zones.%s.mobs.%s", entry[2], entry[1]))
end
for _, entry in pairs(npcinfo) do
ensureTable(string.format("xi.zones.%s.npcs.%s", entry[1], entry[2]))
end
for _, entry in pairs(atmnpcinfo) do
ensureTable(string.format("xi.zones.%s.npcs.%s", entry[1], entry[2]))
end
for _, entry in pairs(zname) do
    ensureTable(string.format('xi.zones.%s.npcs.Planar_Rift', entry[1]))
end
for _, entry in pairs(atmaPurveyor) do
    ensureTable(string.format('xi.zones.%s.npcs.Voidwatch_Purveyor', entry[1]))
end
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/Voidwatch")
-----------------------------------

local m = Module:new("VWNotMon")
for _, entry in pairs(info) do
m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobInitialize", entry[2], entry[1]), function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)  -- Despawn mob after idle for 3 minutes
end)

m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobSpawn", entry[2], entry[1]), function(mob, npc)
if mob:getMainLvl() > 104 and mob:getMainLvl() <= 115 then
        mob:addMod(xi.mod.ATT, 1000)
        mob:addMod(xi.mod.DEF, 150)
        mob:addMod(xi.mod.ACC, 500)
        mob:addMod(xi.mod.EVA, 150)
        mob:addMod(xi.mod.MATT, 50)
        mob:addMod(xi.mod.MDEF, 150)
        mob:addMod(xi.mod.MACC, 500)
        mob:addMod(xi.mod.MEVA, 150)
        mob:addMod(xi.mod.HASTE_MAGIC, 10)
elseif mob:getMainLvl() > 116 and mob:getMainLvl() <= 119 then
        mob:addMod(xi.mod.ATT, 1400)
        mob:addMod(xi.mod.DEF, 250)
        mob:addMod(xi.mod.ACC, 700)
        mob:addMod(xi.mod.EVA, 200)
        mob:addMod(xi.mod.MATT, 100)
        mob:addMod(xi.mod.MDEF, 250)
        mob:addMod(xi.mod.MACC, 700)
        mob:addMod(xi.mod.MEVA, 200)
        mob:addMod(xi.mod.HASTE_MAGIC, 15)
        mob:addMod(xi.mod.REGEN, 10)
        mob:addMod(xi.mod.REFRESH, 10)
elseif mob:getMainLvl() > 120 and mob:getMainLvl() <= 122 then
        mob:addMod(xi.mod.ATT, 1800)
        mob:addMod(xi.mod.DEF, 350)
        mob:addMod(xi.mod.ACC, 900)
        mob:addMod(xi.mod.EVA, 250)
        mob:addMod(xi.mod.MATT, 150)
        mob:addMod(xi.mod.MDEF, 350)
        mob:addMod(xi.mod.MACC, 900)
        mob:addMod(xi.mod.MEVA, 250)
        mob:addMod(xi.mod.HASTE_MAGIC, 20)
        mob:addMod(xi.mod.REGEN, 20)
        mob:addMod(xi.mod.REFRESH, 20)
        mob:addMod(xi.mod.REGAIN, 20)
end

end)

m:addOverride(string.format("xi.zones.%s.mobs.%s.onAdditionalEffect", entry[2], entry[1]), function(mob, target, damage)
end)

m:addOverride(string.format("xi.zones.%s.mobs.%s.onSpellPrecast", entry[2], entry[1]), function(mob, spell)
end)

m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobDeath", entry[2], entry[1]), function(mob, player, params, npc)
        local party = player:getParty()
        local mobName = entry[1]
        local varName = '[VWNM] ' .. mobName
        local varib = player:getCharVar(varName)
              --  npcUtil.giveItem(player, {{4059, entry[3]}})
              --  if player:isPC() == true -- and
               -- not player:setCharVar(varName, 1)
              -- if varib >= 0 
              --  then
        local randb = math.random(10,25) * entry[3]
                 --   npcUtil.giveCurrency(player, 'bayld', math.random(10,25) * entry[3])
          player:addCurrency('bayld', randb)
          player:printToPlayer(string.format("You obtained %s Bayld!", randb),xi.msg.channel.SYSTEM_3)
                   varib = varib +1

              --  end
        local totalkill = player:getCharVar('[VWNM]TKills')
        local killcount = player:getCharVar(varName)
        if killcount == 0 then
        player:setCharVar('[VWNM]TKills', totalkill + 1)
        end
                   player:setCharVar(varName, varib)
        local kirand = math.random(1,20)
        if not player:hasKeyItem(xi.keyItem.VIAL_OF_TRANSLURRY) then
            if kirand == 10 then 
               npcUtil.giveKeyItem(player, xi.ki.VIAL_OF_TRANSLURRY)
            end
        end

        if not player:hasKeyItem(xi.keyItem.VIAL_OF_TRANSMELANGE) then
            if kirand == 7 then
               npcUtil.giveKeyItem(player, xi.ki.VIAL_OF_TRANSMELANGE)
            end
        end
end)

m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobDespawn", entry[2], entry[1]), function(mob, npc)
end)
end
-----------------------------------------------------------------------------------------------------
-----------------Voidwatch Purveyor NPCS-------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
for _, entry in pairs(atmaPurveyor) do
m:addOverride(string.format('xi.zones.%s.npcs.%s.onTrigger', entry[1], entry[2]),  function(player, npc)
local amount = 0
                if amount == 0 then 
                   if entry[3] == 'conquest_points' then
                      if player:getNation() == 0 then
                         amount = player:getCurrency('sandoria_cp')
                         elseif player:getNation() == 1 then
                                amount = player:getCurrency('bastok_cp')
                         elseif player:getNation() == 2 then
                                amount = player:getCurrency('windurst_cp')
                         end
                   else
                       amount = player:getCurrency(entry[3])
                   end
                   player:startEvent(entry[4], 0, amount)
                end
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onEventFinish', entry[1], entry[2]),  function(player, csid, option, npc)
local quantity      = bit.band(bit.rshift(option, 22), 0xFFFF)
local itemRequested = bit.band(bit.rshift(option, 16), 0xF)
local items = {3434, 3435, 3436, 3437, 3450}
local stock = {}
        for itemID = 1, 5 do
            table.insert(stock, items[itemID])
        end
            for itemSelected, item in pairs(stock) do
                if itemRequested == itemSelected then
                   npcUtil.giveItem(player, {{ item, quantity}})
                   if entry[3] == 'conquest_points' then
                      if player:getNation() == 0 then
                         player:delCurrency('sandoria_cp', 2000 * quantity)
                         elseif player:getNation() == 1 then
                                player:delCurrency('bastok_cp', 2000 * quantity)
                         elseif player:getNation() == 2 then
                                player:delCurrency('windurst_cp', 2000 * quantity)
                         end
                   else
                                player:delCurrency(entry[3], 2000 * quantity)
                   end
                end
            end
end)
end
-----------------------------------------------------------------------------------------------------
-----------------Voidwatch Officer NPCS--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
for _, entry in pairs(npcinfo) do

m:addOverride(string.format('xi.zones.%s.npcs.%s.onTrade', entry[1], entry[2]),  function(player, npc, trade)
  local amount   = trade:getItemCount()
    if npcUtil.tradeHas(trade, {{3450, amount}}) then
       player:tradeComplete()
       player:addCurrency('voidstones', amount)
       player:printToPlayer(string.format('You have obtained %s Voidstones.', amount), 0, npc:getPacketName())
    end
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onTrigger', entry[1], entry[2]),  function(player, npc)
    if not player:hasKeyItem(entry[4]) then
          npcUtil.giveKeyItem(player, entry[4])
    end
    player:startEvent(entry[3], 4987406)
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onEventUpdate', entry[1], entry[2]),  function(player, csid, option, npc)
    local vsamount = player:getCurrency('voidstones')
    local timex = player:getCharVar('VSTimer')
    local timey = os.time()
    local timez = timex - timey
        if csid == entry[3] and option == 4 then
           player:updateEvent(vsamount)
        end
        if csid == entry[3] and option == 3 then
          if timex >= os.time() then
             player:updateEvent(0, timez)
          else
             player:updateEvent(1)
          end
        end
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onEventFinish', entry[1], entry[2]),  function(player, csid, option, npc)
        local timer = player:getCharVar('VSTimer')
        local hours = os.time()
        local blah = hours - timer
        local count =   blah / 21600  
        local vsgive = math.floor(count)
      --  player:printToPlayer(string.format('finish csid %s option %s', csid, option))
    if csid == entry[3] and not option == 1 or not option == 65537 then -- fill me up
       return
       elseif csid == entry[3] and option == 1 or option == 65537 then
    --   player:printToPlayer(string.format('finish csid %s option %s', csid, option))
                    if player:getCharVar('VSTimer') == 0 then
                       player:addCurrency('voidstones', 1)
                       player:setCharVar('VSTimer', os.time() + 21600) -- 6 hours
                       player:printToPlayer('You have obtained 1 Voidstone.', 0, npc:getPacketName())
                    elseif player:getCharVar('VSTimer') > 0 then
                       player:addCurrency('voidstones', vsgive +1)
                       player:setCharVar('VSTimer', os.time() + 21600) -- 6 hours
                       player:printToPlayer(string.format('You have obtained %s Voidstone.', vsgive +1), 0, npc:getPacketName())
                    end
    end
end)
end
-----------------------------------------------------------------------------------------------------
-----------------Atmacite Refiner NPCS---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
for _, entry in pairs(atmnpcinfo) do
m:addOverride(string.format('xi.zones.%s.npcs.%s.onTrigger', entry[1], entry[2]),  function(player, npc)
local npczone = npc:getZoneName(tostring)
            if npczone ==
                                   'Southern_San_dOria_[S]' or
                        npczone == 'Bastok_Markets_[S]' or
                        npczone == 'Windurst_Waters_[S]' or
                        npczone == 'Sauromugue_Champaign_[S]' or
                        npczone == 'Rolanberry_Fields_[S]' or
                        npczone == 'Batallia_Downs_[S]' then
                        pastpresent = 20196022
            else
                        pastpresent = 2
            end
    local upgradecount = 0
    local upgradecounta = 0
    local upgradecountb = 0
    local upgradecountc = 0
    local upgradecountd = 0
    local upgradecounte = 0
    local upgradecountf = 0
    local upgradecountg = 0

        for _, entry in pairs(VWCharVar) do
            if player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Sandoria' then 
               upgradecount = upgradecount + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Bastok' then 
               upgradecounta = upgradecounta + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Windurst' then 
               upgradecountb = upgradecountb + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Jeuno' then 
               upgradecountc = upgradecountc + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Zilart' then 
               upgradecountd = upgradecountd + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Tavnazia' then 
               upgradecounte = upgradecounte + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_Aht_Urhgan' then 
               upgradecountf = upgradecountf + entry[4]
            elseif player:getCharVar(entry[1]) >= 1 and entry[3] == 'Path_JeunoII' then 
               upgradecountg = upgradecountg + entry[4]
            end

                    for _, entryx in pairs(atmparam) do

                         if not player:hasKeyItem(entryx[1]) then
                             if upgradecount == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecounta == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecountb == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecountc == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecountd == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecounte == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecountf == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             elseif upgradecountg == entryx[3] then
                                npcUtil.giveKeyItem(player, entryx[1])
                             end
                         end
                    end
        end
local atmcruor = player:getCurrency('cruor')
local abykitotal = 0
        for _, entry in pairs(atmparam) do
               if player:hasKeyItem(entry[1]) then 
                  abykitotal = abykitotal + entry[2]
               end
        end
               player:startEvent(entry[3], pastpresent, 0, 0, 0, atmcruor, abykitotal, 7, 7)
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onEventUpdate', entry[1], entry[2]),  function(player, csid, option, npc)
end)

m:addOverride(string.format('xi.zones.%s.npcs.%s.onEventFinish', entry[1], entry[2]),  function(player, csid, option, npc)
    local dest = atmtele[option]
    if dest then
        player:setPos(unpack(dest))
    end
end)
end
-----------------------------------------------------------------------------------------------------
-----------------Planar Rifts---- NPCS---------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
for _, entry in pairs(zname) do
m:addOverride(string.format("xi.zones.%s.npcs.Planar_Rift.onTrigger",entry[1]), function(player, npc)
xi.voidwatch.qmOnTrigger(player, npc)
end)
end

for _, entry in pairs(zname) do
m:addOverride(string.format("xi.zones.%s.npcs.Planar_Rift.onEventFinish", entry[1]), function(player, csid, option, npc, trade)
xi.voidwatch.qmOnEventFinish(player, npc, mob, option)
end)
end
return m


