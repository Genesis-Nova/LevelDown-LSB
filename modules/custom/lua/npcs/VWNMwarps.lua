-----------------------------------
-- Area: Bastok Markets
-- NPC: Voidwatch Warper
-- Type: Teleport NPC
-----------------------------------
require("modules/module_utils")
-----------------------------------

local m = Module:new("VWNMwarps")

local telepoints = {
    -- Crimson Stratum Abyssite
    {
        ki = xi.ki.CRIMSON_STRATUM_ABYSSITE,
        name = "Crimson Stratum Abyssite",
        destinations = {
            { name = "East Ronfaure",      x = 159.6277, y = -20.0000, z = -317.9538, rot = 250, zone = xi.zone.EAST_RONFAURE },
            { name = "East Ronfaure [S]",  x = 159.6277, y = -20.0000, z = -317.9538, rot = 250, zone = xi.zone.EAST_RONFAURE_S },
        }
    },
    {
        ki = xi.ki.CRIMSON_STRATUM_ABYSSITE_II,
        name = "Crimson Stratum Abyssite II",
        destinations = {
            { name = "Ordelle's Caves",    x = -127.4745, y = 0.0000, z = 249.7766, rot = 37, zone = xi.zone.ORDELLES_CAVES },
        }
    },
    {
        ki = xi.ki.CRIMSON_STRATUM_ABYSSITE_III,
        name = "Crimson Stratum Abyssite III",
        destinations = {
            { name = "Jugner Forest",      x = 64.5858, y = -4.0368, z = 136.8595, rot = 38, zone = xi.zone.JUGNER_FOREST },
            { name = "Jugner Forest [S]",  x = 64.5858, y = -4.0368, z = 136.8595, rot = 38, zone = xi.zone.JUGNER_FOREST_S },
        }
    },
    {
        ki = xi.ki.CRIMSON_STRATUM_ABYSSITE_IV,
        name = "Crimson Stratum Abyssite IV",
        destinations = {
            { name = "King Ranperre's Tomb", x = -89.6564, y = 9.0000, z = 59.8695, rot = 127, zone = xi.zone.KING_RANPERRES_TOMB },
        }
    },

    -- Indigo Stratum Abyssite
    {
        ki = xi.ki.INDIGO_STRATUM_ABYSSITE,
        name = "Indigo Stratum Abyssite",
        destinations = {
            { name = "North Gustaberg",    x = 773.2616, y = -0.4483, z = 437.4450, rot = 251, zone = xi.zone.NORTH_GUSTABERG },
            { name = "North Gustaberg [S]", x = 773.2616, y = -0.4483, z = 437.4450, rot = 251, zone = xi.zone.NORTH_GUSTABERG_S },
        }
    },
    {
        ki = xi.ki.INDIGO_STRATUM_ABYSSITE_II,
        name = "Indigo Stratum Abyssite II",
        destinations = {
            { name = "Gusgen Mines",       x = -89.9951, y = -60.2111, z = -100.1853, rot = 128, zone = xi.zone.GUSGEN_MINES },
        }
    },
    {
        ki = xi.ki.INDIGO_STRATUM_ABYSSITE_III,
        name = "Indigo Stratum Abyssite III",
        destinations = {
            { name = "Pashhow Marshlands", x = 573.1102, y = 25.0000, z = 478.4675, rot = 151, zone = xi.zone.PASHHOW_MARSHLANDS },
            { name = "Pashhow Marshlands [S]", x = 573.1102, y = 25.0000, z = 478.4675, rot = 151, zone = xi.zone.PASHHOW_MARSHLANDS_S },
        }
    },
    {
        ki = xi.ki.INDIGO_STRATUM_ABYSSITE_IV,
        name = "Indigo Stratum Abyssite IV",
        destinations = {
            { name = "Dangruf Wadi",       x = -156.9781, y = 4.0000, z = -139.1361, rot = 64, zone = xi.zone.DANGRUF_WADI },
        }
    },

    -- Jade Stratum Abyssite
    {
        ki = xi.ki.JADE_STRATUM_ABYSSITE,
        name = "Jade Stratum Abyssite",
        destinations = {
            { name = "West Sarutabaruta",  x = -5.5755, y = -26.3711, z = 535.5740, rot = 201, zone = xi.zone.WEST_SARUTABARUTA },
            { name = "West Sarutabaruta [S]", x = -5.5755, y = -26.3711, z = 535.5740, rot = 201, zone = xi.zone.WEST_SARUTABARUTA_S },
        }
    },
    {
        ki = xi.ki.JADE_STRATUM_ABYSSITE_II,
        name = "Jade Stratum Abyssite II",
        destinations = {
            { name = "Maze of Shakhrami",  x = -294.9758, y = -1.0994, z = -135.9010, rot = 209, zone = xi.zone.MAZE_OF_SHAKHRAMI },
        }
    },
    {
        ki = xi.ki.JADE_STRATUM_ABYSSITE_III,
        name = "Jade Stratum Abyssite III",
        destinations = {
            { name = "Meriphataud Mountains", x = -280.4275, y = 16.8663, z = 577.3464, rot = 189, zone = xi.zone.MERIPHATAUD_MOUNTAINS },
            { name = "Meriphataud Mountains [S]", x = -280.4275, y = 16.8663, z = 577.3464, rot = 189, zone = xi.zone.MERIPHATAUD_MOUNTAINS_S },
        }
    },
    {
        ki = xi.ki.JADE_STRATUM_ABYSSITE_IV,
        name = "Jade Stratum Abyssite IV",
        destinations = {
            { name = "Outer Horutoto Ruins", x = -355.9728, y = -0.0626, z = 740.0472, rot = 127, zone = xi.zone.OUTER_HORUTOTO_RUINS },
        }
    },

    -- White Stratum Abyssite
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE,
        name = "White Stratum Abyssite",
        destinations = {
            { name = "Batallia Downs",     x = 297.7236, y = 3.9919, z = -379.4792, rot = 109, zone = xi.zone.BATALLIA_DOWNS },
            { name = "Batallia Downs [S]", x = 297.7236, y = 3.9919, z = -379.4792, rot = 109, zone = xi.zone.BATALLIA_DOWNS_S },
            { name = "Rolanberry Fields",  x = -459.7618, y = -12.0108, z = 17.1620, rot = 3, zone = xi.zone.ROLANBERRY_FIELDS },
            { name = "Rolanberry Fields [S]", x = -459.7618, y = -12.0108, z = 17.1620, rot = 3, zone = xi.zone.ROLANBERRY_FIELDS_S },
            { name = "Sauromugue Champaign", x = 523.1749, y = 8.0000, z = -280.6145, rot = 112, zone = xi.zone.SAUROMUGUE_CHAMPAIGN },
            { name = "Sauromugue Champaign [S]", x = 523.1749, y = 8.0000, z = -280.6145, rot = 112, zone = xi.zone.SAUROMUGUE_CHAMPAIGN_S },
        }
    },
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE_II,
        name = "White Stratum Abyssite II",
        destinations = {
            { name = "The Eldieme Necropolis", x = -20.6361, y = 0.0392, z = 63.5496, rot = 33, zone = xi.zone.THE_ELDIEME_NECROPOLIS },
            { name = "The Eldieme Necropolis [S]", x = -20.6361, y = 0.0392, z = 63.5496, rot = 33, zone = xi.zone.THE_ELDIEME_NECROPOLIS_S },
            { name = "Crawlers' Nest",     x = 61.5856, y = -0.2102, z = 283.1987, rot = 75, zone = xi.zone.CRAWLERS_NEST },
            { name = "Crawlers' Nest [S]", x = 61.5856, y = -0.2102, z = 283.1987, rot = 75, zone = xi.zone.CRAWLERS_NEST_S },
            { name = "Garlaige Citadel",   x = -139.8021, y = 0.0000, z = 154.9570, rot = 191, zone = xi.zone.GARLAIGE_CITADEL },
            { name = "Garlaige Citadel [S]", x = -139.8021, y = 0.0000, z = 154.9570, rot = 191, zone = xi.zone.GARLAIGE_CITADEL_S },
        }
    },
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE_III,
        name = "White Stratum Abyssite III",
        destinations = {
            { name = "Qufim Island",       x = 89.4305, y = -20.3410, z = 226.5686, rot = 161, zone = xi.zone.QUFIM_ISLAND },
            { name = "Lower Delkfutt's Tower", x = 395.9535, y = 15.1250, z = -20.7790, rot = 254, zone = xi.zone.LOWER_DELKFUTTS_TOWER },
            { name = "Behemoth's Dominion", x = 168.5774, y = 5.3056, z = -128.2351, rot = 136, zone = xi.zone.BEHEMOTHS_DOMINION },
        }
    },
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE_IV,
        name = "White Stratum Abyssite IV",
        destinations = {
            { name = "West Ronfaure",      x = -385.0244, y = -54.5450, z = 276.2872, rot = 10, zone = xi.zone.WEST_RONFAURE },
            { name = "South Gustaberg",    x = 225.2890, y = -1.0368, z = -643.7410, rot = 249, zone = xi.zone.SOUTH_GUSTABERG },
            { name = "East Sarutabaruta",  x = -113.8021, y = -4.1390, z = -441.3150, rot = 182, zone = xi.zone.EAST_SARUTABARUTA },
        }
    },
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE_V,
        name = "White Stratum Abyssite V",
        destinations = {
            { name = "La Theine Plateau",  x = 614.3815, y = 24.4373, z = 10.5438, rot = 14, zone = xi.zone.LA_THEINE_PLATEAU },
            { name = "Konschtat Highlands", x = -152.8086, y = 70.8692, z = 725.3206, rot = 7, zone = xi.zone.KONSCHTAT_HIGHLANDS },
            { name = "Tahrongi Canyon",    x = 340.7459, y = 22.8448, z = 262.3759, rot = 225, zone = xi.zone.TAHRONGI_CANYON },
        }
    },
    {
        ki = xi.ki.WHITE_STRATUM_ABYSSITE_VI,
        name = "White Stratum Abyssite VI",
        destinations = {
            { name = "Vunkerl Inlet [S]",  x = -382.9045, y = -36.9396, z = 540.0593, rot = 92, zone = xi.zone.VUNKERL_INLET_S },
            { name = "Grauberg [S]",       x = 84.2412, y = -42.2747, z = 306.8144, rot = 84, zone = xi.zone.GRAUBERG_S },
            { name = "Fort Karugo-Narugo [S]", x = 204.2139, y = -48.5960, z = -219.8202, rot = 70, zone = xi.zone.FORT_KARUGO_NARUGO_S },
            { name = "Valkurm Dunes",      x = 731.5075, y = -7.8862, z = 216.0506, rot = 83, zone = xi.zone.VALKURM_DUNES },
            { name = "Buburimu Peninsula", x = 96.9352, y = -1.0000, z = -176.6545, rot = 94, zone = xi.zone.BUBURIMU_PENINSULA },
        }
    },

    -- Ashen Stratum Abyssite
    {
        ki = xi.ki.ASHEN_STRATUM_ABYSSITE,
        name = "Ashen Stratum Abyssite",
        destinations = {
            { name = "Yuhtunga Jungle",    x = 349.6856, y = 13.9643, z = 181.7688, rot = 119, zone = xi.zone.YUHTUNGA_JUNGLE },
            { name = "Ifrit's Cauldron",   x = -138.0165, y = 3.9960, z = 177.5879, rot = 21, zone = xi.zone.IFRITS_CAULDRON },
            { name = "Temple of Uggalepih", x = -127.0268, y = 0.0080, z = -31.6719, rot = 148, zone = xi.zone.TEMPLE_OF_UGGALEPIH },
            { name = "Western Altepa Desert", x = 579.0291, y = -0.3643, z = 258.5627, rot = 130, zone = xi.zone.WESTERN_ALTEPA_DESERT },
            { name = "Kuftal Tunnel",      x = -29.8836, y = 0.0265, z = 26.2959, rot = 175, zone = xi.zone.KUFTAL_TUNNEL },
            { name = "Quicksand Caves",    x = 63.0406, y = 0.0000, z = -139.9715, rot = 144, zone = xi.zone.QUICKSAND_CAVES },
        }
    },
    {
        ki = xi.ki.ASHEN_STRATUM_ABYSSITE_II,
        name = "Ashen Stratum Abyssite II",
        destinations = {
            { name = "The Sanctuary of Zi'Tah", x = -69.9355, y = 0.2513, z = -325.7281, rot = 152, zone = xi.zone.THE_SANCTUARY_OF_ZITAH },
            { name = "The Boyahda Tree",   x = -59.2033, y = -21.0613, z = -48.7885, rot = 200, zone = xi.zone.THE_BOYAHDA_TREE },
            { name = "Ro'Maeve",           x = -149.5835, y = -10.9382, z = 37.8202, rot = 248, zone = xi.zone.ROMAEVE },
        }
    },
    {
        ki = xi.ki.ASHEN_STRATUM_ABYSSITE_III,
        name = "Ashen Stratum Abyssite III",
        destinations = {
            { name = "Ru'Aun Gardens",     x = -136.4042, y = -40.2000, z = 450.4319, rot = 25, zone = xi.zone.RUAUN_GARDENS },
            { name = "Ve'Lugannon Palace", x = -330.9850, y = 0.0000, z = 301.2823, rot = 83, zone = xi.zone.VELUGANNON_PALACE },
            { name = "The Shrine of Ru'Avitau", x = -91.5770, y = -15.9935, z = 79.7104, rot = 18, zone = xi.zone.THE_SHRINE_OF_RUAVITAU },
        }
    },

    -- Hyacinth Stratum Abyssite
    {
        ki = xi.ki.HYACINTH_STRATUM_ABYSSITE,
        name = "Hyacinth Stratum Abyssite",
        destinations = {
            { name = "Lufaise Meadows",    x = -393.1521, y = -8.1343, z = 65.4848, rot = 85, zone = xi.zone.LUFAISE_MEADOWS },
            { name = "Misareaux Coast",    x = 508.5678, y = 15.5279, z = -288.4471, rot = 50, zone = xi.zone.MISAREAUX_COAST },
            { name = "Uleguerand Range",   x = -247.5361, y = -40.1778, z = -521.0648, rot = 232, zone = xi.zone.ULEGUERAND_RANGE },
            { name = "Attohwa Chasm",      x = 30.4648, y = -5.7537, z = -140.8613, rot = 208, zone = xi.zone.ATTOHWA_CHASM },
        }
    },
    {
        ki = xi.ki.HYACINTH_STRATUM_ABYSSITE_II,
        name = "Hyacinth Stratum Abyssite II",
        destinations = {
            { name = "Bibiki Bay - Purgonorgo Isle", x = -112.1624, y = 0.3000, z = -604.6865, rot = 76, zone = xi.zone.BIBIKI_BAY },
        }
    },

    -- Amber Stratum Abyssite
    {
        ki = xi.ki.AMBER_STRATUM_ABYSSITE,
        name = "Amber Stratum Abyssite",
        destinations = {
            { name = "Arrapago Reef",      x = 538.3172, y = -7.7768, z = 56.3660, rot = 208, zone = xi.zone.ARRAPAGO_REEF },
            { name = "Mount Zhayolm",      x = 877.4844, y = -14.0000, z = 332.2757, rot = 249, zone = xi.zone.MOUNT_ZHAYOLM },
            { name = "Mamook",             x = 69.1555, y = -5.2112, z = -61.9301, rot = 75, zone = xi.zone.MAMOOK },
            { name = "Caedarva Mire",      x = -293.4584, y = -3.9900, z = -729.1631, rot = 98, zone = xi.zone.CAEDARVA_MIRE },
        }
    },
    {
        ki = xi.ki.AMBER_STRATUM_ABYSSITE_II,
        name = "Amber Stratum Abyssite II",
        destinations = {
            { name = "Aydeewa Subterrane", x = 456.2274, y = -26.7997, z = 416.2627, rot = 91, zone = xi.zone.AYDEEWA_SUBTERRANE },
        }
    },
}

local showAbyssiteMenu -- Forward declaration

showAbyssiteMenu = function(player, page)
    local menu = {
        title = "Select an Abyssite",
        options = {},
    }

    local available_groups = {}
    for _, group in ipairs(telepoints) do
        if player:hasKeyItem(group.ki) then
            table.insert(available_groups, group)
        end
    end

    if #available_groups == 0 then
        player:showMessage(1000) -- "You do not have the necessary key items." (Generic message, adjust ID if needed)
        return
    end

    local items_per_page = 3
    local total_pages = math.ceil(#available_groups / items_per_page)
    page = math.max(1, math.min(page, total_pages))

    local start_index = (page - 1) * items_per_page + 1
    local end_index = math.min(start_index + items_per_page - 1, #available_groups)

    if page > 1 then
        table.insert(menu.options, { "Previous Page", function(p)
            p:timer(50, function(p2) showAbyssiteMenu(p2, page - 1) end)
        end })
    end

    for i = start_index, end_index do
        local group = available_groups[i]
        table.insert(menu.options, {
            group.name,
            function(p)
                local submenu = {
                    title = group.name,
                    options = {},
                }
                for _, dest in ipairs(group.destinations) do
                    table.insert(submenu.options, {
                        dest.name,
                        function(p2)
                            p2:setPos(dest.x, dest.y, dest.z, dest.rot, dest.zone)
                        end,
                    })
                end
                table.sort(submenu.options, function(a, b) return a[1] < b[1] end)
                table.insert(submenu.options, { "Back", function(p2)
                    p2:timer(50, function(p3) showAbyssiteMenu(p3, page) end)
                end })
                p:timer(50, function(p2) p2:customMenu(submenu) end)
            end,
        })
    end

    if page < total_pages then
        table.insert(menu.options, { "Next Page", function(p)
            p:timer(50, function(p2) showAbyssiteMenu(p2, page + 1) end)
        end })
    end

    player:customMenu(menu)
end

local function onTrigger(player, npc)
    showAbyssiteMenu(player, 1)
end

m:addOverride("xi.zones.Bastok_Markets.Zone.onInitialize", function(zone)
    pcall(function() super(zone) end)

    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Voidwatch Warp",
        look = '01000c08141019200c3002400250006000700000',
        x = -358.6420,
        y = -10.0491,
        z = -158.3945,
        rotation = 16,
        widescan = 1,
        onTrigger = onTrigger,
    })
end)

m:addOverride("xi.zones.Southern_San_dOria.Zone.onInitialize", function(zone)
    pcall(function() super(zone) end)

    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Voidwatch Warp",
        look = '01000c03141019200c3002400250006000700000',
        x = -99.8402,
        y = 2.0000,
        z = -17.6927,
        rotation = 138,
        widescan = 1,
        onTrigger = onTrigger,
    })
end)

m:addOverride("xi.zones.Windurst_Waters.Zone.onInitialize", function(zone)
    pcall(function() super(zone) end)

    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "Voidwatch Warp",
        look = '01000c05141019200c3002400250006000700000',
        x = -27.6083,
        y = -4.9307,
        z = 218.8790,
        rotation = 138,
        widescan = 1,
        onTrigger = onTrigger,
    })
end)

return m