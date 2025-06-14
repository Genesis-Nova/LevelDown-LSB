-----------------------------------
-- Survival Guide
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require('scripts/globals/teleports')
require("scripts/globals/missions")
require("modules/module_utils")
require('scripts/globals/teleports/survival_guide')
local survival = require('scripts/globals/teleports/survival_guide_map')
-----------------------------------
local m = Module:new("survival_guide")

m:addOverride("xi.zones.Mog_Garden.Zone.onInitialize", function(zone)
    super(zone)

    local function paymentWindow(player, npc, posX, posY, posZ, posRot, zoneChosen)
local verbaige =
{
{44,'Abdhaljs Isle-Purgonorgo'},
{218,'Abyssea-Altepa'},
{215,'Abyssea-Attohwa'},
{255,'Abyssea-Empyreal Paradox'},
{254,'Abyssea-Grauberg'},
{15,'Abyssea-Konschtat'},
{132,'Abyssea-La Theine'},
{216,'Abyssea-Misareaux'},
{45,'Abyssea-Tahrongi'},
{253,'Abyssea-Uleguerand'},
{217,'Abyssea-Vunkerl'},
{50,'Aht Urhgan Whitegate'},
{33,'AlTaieu'},
{152,'Altar Room'},
{72,'Alzadaal Undersea Ruins'},
{48,'Al Zahbi'},
{38,'Apollyon'},
{54,'Arrapago Reef'},
{74,'Arrapago Remnants'},
{7,'Attohwa Chasm'},
{68,'Aydeewa Subterrane'},
{146,'Balgas Dais'},
{224,'Bastok-Jeuno Airship'},
{235,'Bastok Markets'},
{87,'Bastok Markets [S]'},
{234,'Bastok Mines'},
{105,'Batallia Downs'},
{84,'Batallia Downs [S]'},
{147,'Beadeaux'},
{92,'Beadeaux [S]'},
{6,'Bearclaw Pinnacle'},
{111,'Beaucedine Glacier'},
{136,'Beaucedine Glacier [S]'},
{127,'Behemoths Dominion'},
{75,'Bhaflau Remnants'},
{52,'Bhaflau Thickets'},
{4,'Bibiki Bay'},
{8,'Boneyard Gully'},
{167,'Bostaunieux Oubliette'},
{118,'Buburimu Peninsula'},
{79,'Caedarva Mire'},
{113,'Cape Teriggan'},
{2,'Carpenters Landing'},
{151,'Castle Oztroja'},
{99,'Castle Oztroja [S]'},
{161,'Castle Zvahl Baileys'},
{138,'Castle Zvahl Baileys [S]'},
{162,'Castle Zvahl Keep'},
{155,'Castle Zvahl Keep [S]'},
{261,'Ceizak Battlegrounds'},
{284,'Celennia Memorial Library'},
{168,'Chamber of Oracles'},
{233,'Chateau dOraguille'},
{70,'Chocobo Circuit'},
{270,'Cirdas Caverns'},
{271,'Cirdas Caverns U'},
{207,'Cloister of Flames'},
{203,'Cloister of Frost'},
{201,'Cloister of Gales'},
{202,'Cloister of Storms'},
{211,'Cloister of Tides'},
{209,'Cloister of Tremors'},
{197,'Crawlers Nest'},
{171,'Crawlers Nest [S]'},
{191,'Dangruf Wadi'},
{149,'Davoi'},
{160,'Den of Rancor'},
{290,'Desuetia Empyreal Paradox'},
{272,'Dho Gates'},
{43,'Diorama Abdhaljs-Ghelsba'},
{154,'Dragons Aery'},
{186,'Dynamis-Bastok'},
{295,'Dynamis-Bastok [D]'},
{134,'Dynamis-Beaucedine'},
{40,'Dynamis-Buburimu'},
{188,'Dynamis-Jeuno'},
{297,'Dynamis-Jeuno [D]'},
{41,'Dynamis-Qufim'},
{185,'Dynamis-San dOria'},
{294,'Dynamis-San dOria [D]'},
{42,'Dynamis-Tavnazia'},
{39,'Dynamis-Valkurm'},
{187,'Dynamis-Windurst'},
{296,'Dynamis-Windurst [D]'},
{135,'Dynamis-Xarcabard'},
{257,'Eastern Adoulin'},
{114,'Eastern Altepa Desert'},
{101,'East Ronfaure'},
{81,'East Ronfaure [S]'},
{116,'East Sarutabaruta'},
{36,'Empyreal Paradox'},
{289,'Escha RuAun'},
{288,'Escha ZiTah'},
{86,'Everbloom Hollow'},
{204,'FeiYin'},
{285,'Feretory'},
{262,'Foret de Hennetiel'},
{141,'Fort Ghelsba'},
{96,'Fort Karugo-Narugo [S]'},
{170,'Full Moon Fountain'},
{200,'Garlaige Citadel'},
{164,'Garlaige Citadel [S]'},
{140,'Ghelsba Outpost'},
{129,'Ghoyus Reverie'},
{145,'Giddeus'},
{210,'GM Home'},
{34,'Grand Palace of HuXzoi'},
{89,'Grauberg [S]'},
{196,'Gusgen Mines'},
{212,'Gustav Tunnel'},
{278,'Gwora-Corridor'},
{299,'Gwora-Throne Room'},
{251,'Hall of the Gods'},
{14,'Hall of Transference'},
{62,'Halvung'},
{78,'Hazhalm Testing Grounds'},
{242,'Heavens Tower'},
{139,'Horlais Peak'},
{205,'Ifrits Cauldron'},
{55,'Ilrusi Atoll'},
{192,'Inner Horutoto Ruins'},
{67,'Jade Sepulcher'},
{104,'Jugner Forest'},
{82,'Jugner Forest [S]'},
{267,'Kamihr Drifts'},
{250,'Kazham'},
{226,'Kazham-Jeuno Airship'},
{190,'King Ranperres Tomb'},
{108,'Konschtat Highlands'},
{173,'Korroloka Tunnel'},
{174,'Kuftal Tunnel'},
{213,'Labyrinth of Onzozo'},
{180,'LaLoff Amphitheater'},
{102,'La Theine Plateau'},
{85,'La Vaule [S]'},
{281,'Leafallia'},
{63,'Lebros Cavern'},
{69,'Leujaoam Sanctum'},
{184,'Lower Delkfutts Tower'},
{245,'Lower Jeuno'},
{24,'Lufaise Meadows'},
{65,'Mamook'},
{66,'Mamool Ja Training Grounds'},
{3,'Manaclipper'},
{183,'Maquette Abdhaljs-Legion A'},
{287,'Maquette Abdhaljs-Legion B'},
{266,'Marjami Ravine'},
{198,'Maze of Shakhrami'},
{119,'Meriphataud Mountains'},
{97,'Meriphataud Mountains [S]'},
{237,'Metalworks'},
{249,'Mhaura'},
{157,'Middle Delkfutts Tower'},
{13,'Mine Shaft 2716'},
{25,'Misareaux Coast'},
{280,'Mog Garden'},
{269,'Moh Gates'},
{31,'Monarch Linn'},
{150,'Monastic Cavern'},
{131,'Mordion Gaol'},
{265,'Morimar Basalt Fields'},
{282,'Mount Kamihr'},
{61,'Mount Zhayolm'},
{53,'Nashmau'},
{64,'Navukgo Execution Chamber'},
{12,'Newton Movalpolos'},
{49,'none'},
{252,'Norg'},
{231,'Northern San dOria'},
{106,'North Gustaberg'},
{88,'North Gustaberg [S]'},
{77,'Nyzul Isle'},
{11,'Oldton Movalpolos'},
{46,'Open sea route to Al Zahbi'},
{47,'Open sea route to Mhaura'},
{193,'Ordelles Caves'},
{194,'Outer Horutoto Ruins'},
{274,'Outer RaKaznar'},
{275,'Outer RaKaznar [U1]'},
{133,'Outer RaKaznar [U2]'},
{189,'Outer RaKaznar [U3]'},
{143,'Palborough Mines'},
{109,'Pashhow Marshlands'},
{90,'Pashhow Marshlands [S]'},
{56,'Periqia'},
{1,'Phanauet Channel'},
{27,'Phomiuna Aqueducts'},
{236,'Port Bastok'},
{246,'Port Jeuno'},
{232,'Port San dOria'},
{240,'Port Windurst'},
{18,'Promyvion-Dem'},
{16,'Promyvion-Holla'},
{20,'Promyvion-Mea'},
{22,'Promyvion-Vahzl'},
{222,'Provenance'},
{9,'PsoXja'},
{206,'QuBia Arena'},
{126,'Qufim Island'},
{208,'Quicksand Caves'},
{148,'Qulun Dome'},
{247,'Rabao'},
{276,'RaKaznar Inner Court'},
{277,'RaKaznar Turris'},
{258,'Rala Waterways'},
{259,'Rala Waterways U'},
{166,'Ranguemont Pass'},
{291,'Reisenjima'},
{292,'Reisenjima Henge'},
{293,'Reisenjima Sanctorium'},
{199,'Residential Area'},
{214,'Residential Area'},
{219,'Residential Area'},
{30,'Riverne-Site A01'},
{29,'Riverne-Site B01'},
{110,'Rolanberry Fields'},
{91,'Rolanberry Fields [S]'},
{122,'RoMaeve'},
{130,'RuAun Gardens'},
{93,'Ruhotz Silvermines'},
{243,'RuLude Gardens'},
{28,'Sacrarium'},
{163,'Sacrificial Chamber'},
{223,'San dOria-Jeuno Airship'},
{120,'Sauromugue Champaign'},
{98,'Sauromugue Champaign [S]'},
{32,'Sealions Den'},
{176,'Sea Serpent Grotto'},
{248,'Selbina'},
{221,'Ship bound for Mhaura'},
{228,'Ship bound for Mhaura Pirates'},
{220,'Ship bound for Selbina'},
{227,'Ship bound for Selbina Pirates'},
{268,'Sih Gates'},
{283,'Silver Knife'},
{76,'Silver Sea Remnants'},
{59,'Silver Sea route to Al Zahbi'},
{58,'Silver Sea route to Nashmau'},
{230,'Southern San dOria'},
{80,'Southern San dOria [S]'},
{107,'South Gustaberg'},
{19,'Spire of Dem'},
{17,'Spire of Holla'},
{21,'Spire of Mea'},
{23,'Spire of Vahzl'},
{179,'Stellar Fulcrum'},
{117,'Tahrongi Canyon'},
{57,'Talacca Cove'},
{26,'Tavnazian Safehold'},
{37,'Temenos'},
{159,'Temple of Uggalepih'},
{60,'The Ashu Talif'},
{153,'The Boyahda Tree'},
{181,'The Celestial Nexus'},
{71,'The Colosseum'},
{195,'The Eldieme Necropolis'},
{175,'The Eldieme Necropolis [S]'},
{35,'The Garden of RuHmet'},
{121,'The Sanctuary of ZiTah'},
{178,'The Shrine of RuAvitau'},
{10,'The Shrouded Maw'},
{165,'Throne Room'},
{156,'Throne Room [S]'},
{229,'Throne Room [V]'},
{169,'Toraimarai Canal'},
{5,'Uleguerand Range'},
{0,'unknown'},
{158,'Upper Delkfutts Tower'},
{244,'Upper Jeuno'},
{103,'Valkurm Dunes'},
{128,'Valley of Sorrows'},
{177,'VeLugannon Palace'},
{83,'Vunkerl Inlet [S]'},
{51,'Wajaom Woodlands'},
{182,'Walk of Echoes'},
{298,'Walk of Echoes [P1]'},
{279,'Walk of Echoes [P2]'},
{144,'Waughroon Shrine'},
{256,'Western Adoulin'},
{125,'Western Altepa Desert'},
{100,'West Ronfaure'},
{115,'West Sarutabaruta'},
{95,'West Sarutabaruta [S]'},
{225,'Windurst-Jeuno Airship'},
{239,'Windurst Walls'},
{238,'Windurst Waters'},
{94,'Windurst Waters [S]'},
{241,'Windurst Woods'},
{273,'Woh Gates'},
{112,'Xarcabard'},
{137,'Xarcabard [S]'},
{260,'Yahse Hunting Grounds'},
{124,'Yhoator Jungle'},
{263,'Yorcia Weald'},
{264,'Yorcia Weald U'},
{142,'Yughott Grotto'},
{123,'Yuhtunga Jungle'},
{172,'Zeruhn Mines'},
{73,'Zhayolm Remnants'},
}
        local zoneVerb = 0
        local gilCost = 1000
        local tabCost = 50
        if player:hasKeyItem(xi.keyItem.RHAPSODY_IN_WHITE) then
            gilCost = gilCost / 10
            tabCost = tabCost / 5
        end
        if zoneChosen ~= 0 then
			for k, v in pairs(verbaige) do
				if v[1] == zoneChosen then
                zoneVerb = v[2]
                end
            end
        end
        local paymentWindow =
        {
            title = string.format('Travel to %s?', zoneVerb), -- Travel to Zone name?
    
            options =
            {
                {
                    string.format("Travel using 1000 gil. (%s gil)",player:getGil()),
                    function(playerArg)
                        if player:getGil() >= gilCost then
                            player:delGil(gilCost)
                            player:injectActionPacket(player:getID(), 6, 600, 0, 0, 0, 0, 0)

                            player:timer(1250, function(playerArg)
                                player:setPos(posX, posY, posZ, posRot, zoneChosen)
                            end)
                        else
                            player:printToPlayer("You do not have enough Gil.", 0, npc:getPacketName())
                        end
                    end,
                },
                {
                    string.format("Travel using 50 tabs. (%s total)",player:getCurrency('valor_point')),
                    function(playerArg)
                        if player:getCurrency('valor_point') >= tabCost then
                            player:delCurrency('valor_point', tabCost)
                            player:injectActionPacket(player:getID(), 6, 600, 0, 0, 0, 0, 0)

                            player:timer(1250, function(playerArg)
                                player:setPos(posX, posY, posZ, posRot, zoneChosen)
                            end)
                        else
                            player:printToPlayer("You do not have enough tabs.", 0, npc:getPacketName())
                        end
                    end,
                },
                {
                    "Not just yet.",
                    function(playerArg)
                        return
                    end,
                },
            },
        }
    
        player:customMenu(paymentWindow)
    end
    
    local function processOptionChosen(player, npc, posX, posY, posZ, posRot, zoneChosen, zoneVal)
        local guide = survival.survivalGuides[zoneVal]
        if player:hasTeleport(xi.teleport.type.SURVIVAL, guide.groupIndex - 1, guide.group - 1) then
            paymentWindow(player, npc, posX, posY, posZ, posRot, zoneChosen)
        else
            player:printToPlayer("You have not unlocked that survival guide.", 0, npc:getPacketName())
        end
    end

    local survivalguide = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Survival Guide",
        look = "0x0000810900000000000000000000000000000000",
        x = 359.1759,
        y = -2.7104,
        z = -545.0611,
        rotation = 191,
        widescan = 1,

        onTrigger = function(player, npc)
            local menu   = {}
            local menu1  = {}
            local menu2  = {}
            local page1  = {}
            local region1 = {}
            local region2 = {}
            local region3 = {}
            local region4 = {}
            local region5 = {}
            local region6 = {}
            local region7 = {}
            local region8 = {}
            local region9 = {}
            local reg_Gustaberg_Front = {}
            local reg_Zulkheim = {}
            local reg_Sarutabaruta_Front = {}
            local reg_Kuzotz = {}
            local reg_TuLia = {}
            local reg_Elshimo_Low = {}
            local reg_Elshimo_Up = {}
            local reg_Norvallen = {}
            local reg_Derfland = {}
            local reg_Vollbow = {}
            local reg_Gustaberg = {}
            local reg_Aragoneu = {}
            local reg_Windurst = {}
            local reg_Jeuno = {}
            local reg_San_dOria = {}
            local reg_Valdeaunia = {}
            local reg_LiTelor = {}
            local reg_Valdeaunia_Front = {}
            local reg_Ronfaure = {}
            local reg_Tavnazian_Archipelago = {}
            local reg_Fauregandi_Front = {}
            local reg_Sarutabaruta = {}
            local reg_Ronfaure_Front = {}
            local reg_Fauregandi = {}
            local reg_Derfland_Front = {}
            local reg_Arrapago_Islands = {}
            local reg_Aragoneu_Front = {}
            local reg_Qufim = {}
            local reg_Mamool_Ja_Savagelands = {}
            local reg_Norvallen_Front = {}
            local reg_Movalpolis = {}
            local reg_West_Aht_Urhgan = {}
            local reg_Kolshushu = {}
            local reg_Halvung_Territory = {}
            local reg_Bastok = {}            

            local delaySendMenu = function(playerArg, menu)
                player:timer(100, function(playerArgMenu)
                    playerArgMenu:customMenu(menu)
                end)
            end

            -- Region Menu
            menu1 =
            {
                title   = "Travel to which region?",
                options = {},
            }

            -- Zone Menu
            menu2 =
            {
                title   = "Where will you travel?",
                options = {},
            }

            region1 =
            {
                {
                    "San d'Oria.",
                    function(playerArg)
                        menu2.options = reg_San_dOria
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Bastok.",
                    function(playerArg)
                        menu2.options = reg_Bastok
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Windurst.",
                    function(playerArg)
                        menu2.options = reg_Windurst
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Jeuno.",
                    function(playerArg)
                        menu2.options = reg_Jeuno
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region2 =
            {
                {
                    "Ronfaure.",
                    function(playerArg)
                        menu2.options = reg_Ronfaure
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Gustaberg.",
                    function(playerArg)
                        menu2.options = reg_Gustaberg
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Sarutabaruta.",
                    function(playerArg)
                        menu2.options = reg_Sarutabaruta
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Zulkheim.",
                    function(playerArg)
                        menu2.options = reg_Zulkheim
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region3 =
            {
                {
                    "Derfland.",
                    function(playerArg)
                        menu2.options = reg_Derfland
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Kolshushu.",
                    function(playerArg)
                        menu2.options = reg_Kolshushu
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Aragoneu.",
                    function(playerArg)
                        menu2.options = reg_Aragoneu
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Qufim.",
                    function(playerArg)
                        menu2.options = reg_Qufim
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region4 =
            {
                {
                    "Kuzotz.",
                    function(playerArg)
                        menu2.options = reg_Kuzotz
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Vollbow.",
                    function(playerArg)
                        menu2.options = reg_Vollbow
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Elshimo Low.",
                    function(playerArg)
                        menu2.options = reg_Elshimo_Low
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Elshimo Up.",
                    function(playerArg)
                        menu2.options = reg_Elshimo_Up
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region5 =
            {
                {
                    "Norvallen.",
                    function(playerArg)
                        menu2.options = reg_Norvallen
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Movalpolis.",
                    function(playerArg)
                        menu2.options = reg_Movalpolis
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Li'Telor.",
                    function(playerArg)
                        menu2.options = reg_LiTelor
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Tu'Lia.",
                    function(playerArg)
                        menu2.options = reg_TuLia
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region6 =
            {
                {
                    "Fauregandi.",
                    function(playerArg)
                        menu2.options = reg_Fauregandi
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Valdeaunia.",
                    function(playerArg)
                        menu2.options = reg_Valdeaunia
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "West. Aht Urhgan.",
                    function(playerArg)
                        menu2.options = reg_West_Aht_Urhgan
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Arrapago Islands.",
                    function(playerArg)
                        menu2.options = reg_Arrapago_Islands
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region7 =
            {
                {
                    "Mamool Ja Savagelands.",
                    function(playerArg)
                        menu2.options = reg_Mamool_Ja_Savagelands
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Halvung Territory.",
                    function(playerArg)
                        menu2.options = reg_Halvung_Territory
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Tavnazian Archipelago.",
                    function(playerArg)
                        menu2.options = reg_Tavnazian_Archipelago
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Ronfaure Front.",
                    function(playerArg)
                        menu2.options = reg_Ronfaure_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region8 =
            {
                {
                    "Gustaberg Front.",
                    function(playerArg)
                        menu2.options = reg_Gustaberg_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Sarutabaruta Front.",
                    function(playerArg)
                        menu2.options = reg_Sarutabaruta_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Derfland Front.",
                    function(playerArg)
                        menu2.options = reg_Derfland_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Norvallen Front.",
                    function(playerArg)
                        menu2.options = reg_Norvallen_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Next",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            region9 =
            {
                {
                    "Aragoneu Front.",
                    function(playerArg)
                        menu2.options = reg_Aragoneu_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Fauregandi Front.",
                    function(playerArg)
                        menu2.options = reg_Fauregandi_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Valdeaunia Front.",
                    function(playerArg)
                        menu2.options = reg_Valdeaunia_Front
                        delaySendMenu(playerArg, menu2)
                    end,
                },
                {
                    "Prev",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
            }
            reg_San_dOria =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Northern San d'Oria.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -175.21, -4.0, 80.0, 0, xi.zone.NORTHERN_SAN_DORIA, 0)
                        end)
                    end,
                },

            }
            reg_Bastok =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Bastok Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 18.82, 0.0, -115.0, 0, xi.zone.BASTOK_MINES, 1)
                        end)
                    end,
                },
            }
            reg_Windurst =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Port Windurst.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -220.0, -8.09, 180.15, 64, xi.zone.PORT_WINDURST, 2)
                        end)
                    end,
                },
            }
            reg_Jeuno =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region1
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Ru'Lude Gardens.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 44.25, 10.0, -69.0, 128, xi.zone.RULUDE_GARDENS, 3)
                        end)
                    end,
                },
            }
            reg_Ronfaure =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "West. Ronfaure.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -451.4, -19.75, -218.0, 128, xi.zone.WEST_RONFAURE, 6)
                        end)
                    end,
                },
                {
                    "Bostaunieux Oubliette.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -12.88, 0.1, 25.45, 0, xi.zone.BOSTAUNIEUX_OUBLIETTE, 8)
                        end)
                    end,
                },
                {
                    "Fort Ghelsba.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -142.24, -19.93, 7.75, 96, xi.zone.FORT_GHELSBA, 7)
                        end)
                    end,
                },
                {
                    "King Ranperre's Tomb.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -120.23, 0.0, 248.57, 0, xi.zone.KING_RANPERRES_TOMB, 9)
                        end)
                    end,
                },
            }
            reg_Gustaberg =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "North Gustaberg.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -581.84, 40.0, 53.14, 96, xi.zone.NORTH_GUSTABERG, 20)
                        end)
                    end,
                },
                {
                    "Dangruf Wadi.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -23.16, 0.35, 0.15, 160, xi.zone.DANGRUF_WADI, 23)
                        end)
                    end,
                },
                {
                    "Korroloka Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -463.82, -10.08, -22.2, 32, xi.zone.KORROLOKA_TUNNEL, 22)
                        end)
                    end,
                },
                {
                    "Zeruhn Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -10.05, 0.0, 5.81, 192, xi.zone.ZERUHN_MINES, 21)
                        end)
                    end,
                },
            }
            reg_Sarutabaruta =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "West. Sarutabaruta.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -14.75, -12.0, 315.75, 0, xi.zone.WEST_SARUTABARUTA, 28)
                        end)
                    end,
                },
                {
                    "Toraimarai Canal.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -308.25, 15.0, 260.78, 192, xi.zone.TORAIMARAI_CANAL, 29)
                        end)
                    end,
                },
                {
                    "Inner Horutoto Ruins.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 452.94, -8.0, 181.07, 192, xi.zone.INNER_HORUTOTO_RUINS, 30)
                        end)
                    end,
                },
            }
            reg_Zulkheim =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region2
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Valkurm Dunes.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 137.9, -7.5, 97.0, 162, xi.zone.VALKURM_DUNES, 11)
                        end)
                    end,
                },
                {
                    "La Theine Plateau.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 774.35, 29.0, -18.57, 224, xi.zone.LA_THEINE_PLATEAU, 10)
                        end)
                    end,
                },
                {
                    "Konschtat Highlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -223.0, 71.07, 828.0, 32, xi.zone.KONSCHTAT_HIGHLANDS, 12)
                        end)
                    end,
                },
                {
                    "Ordelle's Caves.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -102.91, 0.1, 632.9, 128, xi.zone.ORDELLES_CAVES, 13)
                        end)
                    end,
                },
                {
                    "Gusgen Mines.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 59.91, -67.93, -267.18, 192, xi.zone.GUSGEN_MINES, 14)
                        end)
                    end,
                }
            }
            reg_Derfland =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Pashhow Marshlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 466.06, 24.0, 410.91, 32, xi.zone.PASHHOW_MARSHLANDS, 24)
                        end)
                    end,
                },
                {
                    "Crawler's Nest.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 364.0, -32.2, -22.03, 64, xi.zone.CRAWLERS_NEST, 27)
                        end)
                    end,
                },
                {
                    "Rolanberry Fields.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -227.97, 4.54, 386.94, 64, xi.zone.ROLANBERRY_FIELDS, 25)
                        end)
                    end,
                },
                {
                    "Beadeaux.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -263.99, 1.59, 105.86, 192, xi.zone.BEADEAUX, 26)
                        end)
                    end,
                },
            }
            reg_Kolshushu =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Buburimu Peninsula.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -485.74, -32.0, 47.32, 64, xi.zone.BUBURIMU_PENINSULA, 33)
                        end)
                    end,
                },
                {
                    "Tahrongi Canyon.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -160.0, 47.25, 647.11, 192, xi.zone.TAHRONGI_CANYON, 32)
                        end)
                    end,
                },
                {
                    "Maze Of Shakhrami.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -338.99, -12.21, -179.0, 0, xi.zone.MAZE_OF_SHAKHRAMI, 34)
                        end)
                    end,
                },
                {
                    "Labyrinth Of Onzozo.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -62.3, -20.1, -280.69, 160, xi.zone.LABYRINTH_OF_ONZOZO, 35)
                        end)
                    end,
                },
                {
                    "Bibiki Bay.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 493.72, -3.04, 728.05, 0, xi.zone.BIBIKI_BAY, 31)
                        end)
                    end,
                },
            }
            reg_Aragoneu =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Meriphataud Mountains.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -297.76, 17.0, 422.22, 224, xi.zone.MERIPHATAUD_MOUNTAINS, 36)
                        end)
                    end,
                },
                {
                    "Garlaige Citadel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -381.75, -6.0, 363.5, 128, xi.zone.GARLAIGE_CITADEL, 39)
                        end)
                    end,
                },
                {
                    "Sauromugue Champaign.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 344.83, 6.22, -255.3, 96, xi.zone.SAUROMUGUE_CHAMPAIGN, 37)
                        end)
                    end,
                },
                {
                    "Castle Oztroja.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -221.0, 0.25, -14.25, 192, xi.zone.CASTLE_OZTROJA, 38)
                        end)
                    end,
                },
            }
            reg_Qufim =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region3
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Qufim Island.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -251.98, -19.96, 298.21, 64, xi.zone.QUFIM_ISLAND, 44)
                        end)
                    end,
                },
                {
                    "Lower Delkfutt's Tower.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 462.73, 0.0, -51.0, 0, xi.zone.LOWER_DELKFUTTS_TOWER, 46)
                        end)
                    end,
                },
                {
                    "Behemoth's Dominion.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 337.41, 26.63, -73.95, 128, xi.zone.BEHEMOTHS_DOMINION, 45)
                        end)
                    end,
                },
            }
            reg_Kuzotz =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Eastern Altepa Desert.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -258.88, 8.6, -265.0, 128, xi.zone.EASTERN_ALTEPA_DESERT, 50)
                        end)
                    end,
                },
                {
                    "Western Altepa Desert.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.33, -3.12, 11.68, 32, xi.zone.WESTERN_ALTEPA_DESERT, 51)
                        end)
                    end,
                },
                {
                    "Rabao.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -3.41, -2.7, -93.6, 64, xi.zone.RABAO, 52)
                        end)
                    end,
                },
            }
            reg_Vollbow =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Cape Teriggan.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -186.67, 7.9, -67.0, 128, xi.zone.CAPE_TERIGGAN, 53)
                        end)
                    end,
                },
                {
                    "Kuftal Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -16.84, -20.47, -237.0, 0, xi.zone.KUFTAL_TUNNEL, 55)
                        end)
                    end,
                },
                {
                    "Gustav Tunnel.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 296.68, -40.42, 64.68, 96, xi.zone.GUSTAV_TUNNEL, 56)
                        end)
                    end,
                },
                {
                    "Valley Of Sorrows.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -163.3, -8.29, 23.04, 0, xi.zone.VALLEY_OF_SORROWS, 54)
                        end)
                    end,
                },
            }
            reg_Elshimo_Low =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Yuhtunga Jungle.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -239.51, 0.0, -402.77, 64, xi.zone.YUHTUNGA_JUNGLE, 57)
                        end)
                    end,
                },
                {
                    "Sea Serpent Grotto.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 223.97, -23.71, 334.99, 128, xi.zone.SEA_SERPENT_GROTTO, 58)
                        end)
                    end,
                },
                {
                    "Kazham.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -41.21, -10.0, -93.0, 0, xi.zone.KAZHAM, 59)
                        end)
                    end,
                },
                {
                    "Norg.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -13.84, 1.1, -33.14, 32, xi.zone.NORG, 60)
                        end)
                    end,
                },
            }
            reg_Elshimo_Up =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region4
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Yhoator Jungle.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 197.82, 0.0, -81.82, 160, xi.zone.YHOATOR_JUNGLE, 61)
                        end)
                    end,
                },
                {
                    "Temple Of Uggalepih.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 60.01, -8.0, 58.19, 64, xi.zone.TEMPLE_OF_UGGALEPIH, 62)
                        end)
                    end,
                },
                {
                    "Ifrit's Cauldron.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 89.0, 0.32, -298.11, 192, xi.zone.IFRITS_CAULDRON, 63)
                        end)
                    end,
                },
            }
            reg_Norvallen =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Jugner Forest.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 62.99, 0.0, -12.75, 65, xi.zone.JUGNER_FOREST, 16)
                        end)
                    end,
                },
                {
                    "Eldieme Necropolis.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.21, -52.25, -99.5, 128, xi.zone.THE_ELDIEME_NECROPOLIS, 19)
                        end)
                    end,
                },
                {
                    "Batallia Downs.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -67.0, -1.7, 448.25, 192, xi.zone.BATALLIA_DOWNS, 17)
                        end)
                    end,
                },
                {
                    "Davoi.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 221.75, -1.0, -10.0, 0, xi.zone.DAVOI, 18)
                        end)
                    end,
                },
                {
                    "Carpenter's Landing.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 224.99, -2.0, -529.26, 192, xi.zone.CARPENTERS_LANDING, 15)
                        end)
                    end,
                },
            }
            reg_Movalpolis =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Oldton Movalpolos.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -260.78, 8.0, -54.0, 128, xi.zone.OLDTON_MOVALPOLOS, 65)
                        end)
                    end,
                },
            }
            reg_LiTelor =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Sanctuary Of Zi'Tah.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -44.98, 0.27, -149.86, 64, xi.zone.THE_SANCTUARY_OF_ZITAH, 47)
                        end)
                    end,
                },
                {
                    "Ro'Maeve.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 13.75, -28.25, 54.04, 32, xi.zone.ROMAEVE, 48)
                        end)
                    end,
                },
                {
                    "Dragon's Aery.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -60.33, -1.17, -33.69, 160, xi.zone.DRAGONS_AERY, 49)
                        end)
                    end,
                },
            }
            reg_TuLia =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region5
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Ru'Aun Gardens.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 12.99, -54.16, -594.21, 192, xi.zone.RUAUN_GARDENS, 64)
                        end)
                    end,
                },
            }
            reg_Fauregandi =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Beaucedine Glacier.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -28.92, -59.0, -124.07, 32, xi.zone.BEAUCEDINE_GLACIER, 40)
                        end)
                    end,
                },
                {
                    "Ranguemont Pass.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -145.24, 4.37, -298.79, 160, xi.zone.RANGUEMONT_PASS, 41)
                        end)
                    end,
                },
            }
            reg_Valdeaunia =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Xarcabard.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 203.98, -24.27, -204.31, 192, xi.zone.XARCABARD, 42)
                        end)
                    end,
                },
                {
                    "Castle Zvahl Bailey's.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 372.0, -12.05, -23.85, 64, xi.zone.CASTLE_ZVAHL_BAILEYS, 43)
                        end)
                    end,
                },
            }
            reg_West_Aht_Urhgan =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Aht Urhgan Whitegate.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 133.13, 0.0, 16.17, 224, xi.zone.AHT_URHGAN_WHITEGATE, 5)
                        end)
                    end,
                },
            }
            reg_Arrapago_Islands =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region6
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Nashmau.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -18.8, 0.0, -33.01, 128, xi.zone.NASHMAU, 74)
                        end)
                    end,
                },
                {
                    "Caedarva Mire.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -660.0, -13.36, 342.78, 64, xi.zone.CAEDARVA_MIRE, 76)
                        end)
                    end,
                },
                {
                    "Arrapago Reef.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 475.97, -15.64, -20.0, 128, xi.zone.ARRAPAGO_REEF, 75)
                        end)
                    end,
                },
            }
            reg_Mamool_Ja_Savagelands =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Wajaom Woodlands.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -838.97, -20.0, 99.19, 64, xi.zone.WAJAOM_WOODLANDS, 70)
                        end)
                    end,
                },
                {
                    "Mamook.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 217.16, -23.84, -103.14, 32, xi.zone.MAMOOK, 71)
                        end)
                    end,
                },
                {
                    "Aydeewa Subterrane.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 5.0, 20.67, -89.98, 128, xi.zone.AYDEEWA_SUBTERRANE, 72)
                        end)
                    end,
                },
            }
            reg_Halvung_Territory =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Halvung.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 503.23, -0.17, 241.76, 32, xi.zone.HALVUNG, 73)
                        end)
                    end,
                },
            }
            reg_Tavnazian_Archipelago =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Lufaise Meadows.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -554.0, -6.2, -57.11, 192, xi.zone.LUFAISE_MEADOWS, 66)
                        end)
                    end,
                },
                {
                    "Misareaux Coast.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -60.98, -29.96, 262.22, 64, xi.zone.MISAREAUX_COAST, 67)
                        end)
                    end,
                },
                {
                    "Phomiuna Aqueducts.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 253.18, 0.0, -266.02, 128, xi.zone.PHOMIUNA_AQUEDUCTS, 68)
                        end)
                    end,
                },
                {
                    "Sacrarium.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -219.99, -12.0, 58.27, 64, xi.zone.SACRARIUM, 69)
                        end)
                    end,
                },
                {
                    "Tavnazian Safehold.",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -4.99, -28.08, 103.1, 64, xi.zone.TAVNAZIAN_SAFEHOLD, 4)
                        end)
                    end,
                },
            }
            reg_Ronfaure_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region7
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "East Ronfaure [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 662.02, -18.96, -595.91, 64, xi.zone.EAST_RONFAURE_S, 78)
                        end)
                    end,
                },
                {
                    "Southern San d'Oria [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 82.02, 1.0, -66.79, 64, xi.zone.SOUTHERN_SAN_DORIA_S, 77)
                        end)
                    end,
                },
            }
            reg_Gustaberg_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "North Gustaberg [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -289.0, 38.64, 531.99, 192, xi.zone.NORTH_GUSTABERG_S, 83)
                        end)
                    end,
                },
                {
                    "Grauberg [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 794.0, 71.48, 773.16, 64, xi.zone.GRAUBERG_S, 84)
                        end)
                    end,
                },
                {
                    "Bastok Markets [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -246.17, 0.0, 94.13, 160, xi.zone.BASTOK_MARKETS_S, 82)
                        end)
                    end,
                },
            }
            reg_Sarutabaruta_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "West. Sarutabaruta [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 83.0, -24.65, 566.09, 192, xi.zone.WEST_SARUTABARUTA_S, 90)
                        end)
                    end,
                },
                {
                    "Fort Karugo-Narugo [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 125.37, -20.91, 605.38, 224, xi.zone.FORT_KARUGO_NARUGO_S, 91)
                        end)
                    end,
                },
                {
                    "Windurst Waters [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -57.08, -5.71, 215.99, 128, xi.zone.WINDURST_WATERS_S, 89)
                        end)
                    end,
                },
            }
            reg_Derfland_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Vunkerl Inlet [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -521.01, -32.36, 205.91, 192, xi.zone.VUNKERL_INLET_S, 85)
                        end)
                    end,
                },
                {
                    "Pashhow Marshlands [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 547.8, 25.0, -341.0, 0, xi.zone.PASHHOW_MARSHLANDS_S, 86)
                        end)
                    end,
                },
                {
                    "Rolanberry Fields [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -38.0, 0.5, -866.97, 224, xi.zone.ROLANBERRY_FIELDS_S, 87)
                        end)
                    end,
                },
                {
                    "Crawler's Nest [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 363.99, -32.2, -22.07, 64, xi.zone.CRAWLERS_NEST_S, 88)
                        end)
                    end,
                },
            }
            reg_Norvallen_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region8
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Jugner Forest [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -193.97, -7.75, -493.8, 64, xi.zone.JUGNER_FOREST_S, 79)
                        end)
                    end,
                },
                {
                    "Batallia Downs [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -404.0, -16.02, -164.28, 192, xi.zone.BATALLIA_DOWNS_S, 80)
                        end)
                    end,
                },
                {
                    "Eldieme Necropolis [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 419.29, -52.25, -99.41, 128, xi.zone.THE_ELDIEME_NECROPOLIS_S, 81)
                        end)
                    end,
                },
            }
            reg_Aragoneu_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Meriphataud Mountains [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 732.9, -33.5, -10.0, 0, xi.zone.MERIPHATAUD_MOUNTAINS_S, 92)
                        end)
                    end,
                },
                {
                    "Sauromugue Champaign [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 475.97, -8.04, -438.29, 192, xi.zone.SAUROMUGUE_CHAMPAIGN_S, 93)
                        end)
                    end,
                },
                {
                    "Garlaige Citadel [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -301.8, -6.08, 127.37, 128, xi.zone.GARLAIGE_CITADEL_S, 94)
                        end)
                    end,
                },
            }
            reg_Fauregandi_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Beaucedine Glacier [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, -144.01, -80.13, 232.59, 192, xi.zone.BEAUCEDINE_GLACIER_S, 95)
                        end)
                    end,
                },
            }
            reg_Valdeaunia_Front =
            {
                {
                    "Nowhere.",
                    function(playerArg)
                        menu1.options = region9
                        delaySendMenu(playerArg, menu1)
                    end,
                },
                {
                    "Castle Zvahl Bailey's [S].",
                    function(playerArg)
                        playerArg:timer(50, function(playerArgMenu)
                            processOptionChosen(playerArgMenu, npc, 372.0, -12.05, -23.78, 64, xi.zone.CASTLE_ZVAHL_BAILEYS_S, 96)
                        end)
                    end,
                },
            }
menu =
{
    title = 'What chapter will you read?',
    options = {},
}
            page1 =
            {
                {
                    "None.",
                    function(playerArg)
                    end,
                },
                {
                    'Teleportation Assistance.',
                    function(playerArg)
                    menu1.options = region1
                    delaySendMenu(player, menu1)
                    end,
                },
            }
            player:printToPlayer("Before you lies a survival guide penned by the Adventurers Mutual Aid Network. It touches on such topics as teleportation and battle records.", xi.msg.channel.NS_SAY)
            player:timer(600, function()
            menu.options = page1
            delaySendMenu(player, menu)
            end)
        end,
    })

    utils.unused(survivalguide)
end)

return m
