-----------------------------------
-- Today's Horoscope
-- Horlais Peak KSNM, Lachesis Orb
-- !additem 1178
-----------------------------------
local horlaisID = zones[xi.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.HORLAIS_PEAK,
    battlefieldId    = xi.battlefield.id.TODAYS_HOROSCOPE,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 16,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { xi.item.LACHESIS_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },

    experimental     = true,
})

content:addEssentialMobs({ 'Aries' })

content.loot =
{
        {
            { item = xi.item.GIL, weight = 1000, amount = 24000 }, -- gil
        },
        
        {
            { item = xi.item.ARIES_MANTLE, 		weight = 250 },
            { item = xi.item.ADAMAN_INGOT, 		weight = 230 },
            { item = xi.item.ORICHALCUM_INGOT, 	weight = 178 },
        },
        
        {
            { item = xi.item.GRAVEDIGGER, 		weight = 222 },
            { item = xi.item.RAMPAGER, 			weight = 245 },
            { item = xi.item.RETRIBUTOR, 		weight = 231 },
            { item = xi.item.GONDO_SHIZUNORI,	weight = 302 },
        },
        
        {
            { item = xi.item.HIERARCH_BELT, 	weight = 250 },
            { item = xi.item.PALMERINS_SHIELD, 	weight = 206 },
            { item = xi.item.TRAINERS_GLOVES, 	weight = 206 },
            { item = xi.item.WARWOLF_BELT, 		weight = 338 },
        },
        
        {
            { item = xi.item.RAMPAGING_HORN, 	weight = 250 },
            { item = xi.item.LUMBERING_HORN, 	weight = 250 },
            { item = xi.item.SWORD_STRAP, 		weight = 250 },
            { item = xi.item.CLAYMORE_GRIP,		weight = 250 },
        },
        
        {
            { item = xi.item.CHUNK_OF_GOLD_ORE, 		weight = 109 },
            { item = xi.item.RERAISER, 					weight = 34 },
            { item = xi.item.CHUNK_OF_MYTHRIL_ORE, 		weight = 41 },
            { item = xi.item.DEMON_HORN, 				weight = 61 },
            { item = xi.item.EBONY_LOG, 				weight = 121 },
            { item = xi.item.HANDFUL_OF_WYVERN_SCALES, 	weight = 44 },
            { item = xi.item.VILE_ELIXIR_P1, 			weight = 27 },
            { item = xi.item.VILE_ELIXIR_P1, 			weight = 27 },
            { item = xi.item.MAHOGANY_LOG, 				weight = 41 },
            { item = xi.item.CORAL_FRAGMENT, 			weight = 80 },
            { item = xi.item.PETRIFIED_LOG, 			weight = 72 },
            { item = xi.item.PHOENIX_FEATHER, 			weight = 111 },
            { item = xi.item.CHUNK_OF_PLATINUM_ORE, 	weight = 44 },
            { item = xi.item.CHUNK_OF_DARKSTEEL_ORE, 	weight = 68 },
            { item = xi.item.RAM_HORN, 					weight = 14 },
        },

        {
            { item = xi.item.SQUARE_OF_DAMASCENE_CLOTH, 	weight = 90 },
            { item = xi.item.DAMASCUS_INGOT, 				weight = 29 },
            { item = xi.item.PHILOSOPHERS_STONE, 			weight = 148 },
            { item = xi.item.PHOENIX_FEATHER, 				weight = 234 },
            { item = xi.item.SPOOL_OF_MALBORO_FIBER, 		weight = 76 },
            { item = xi.item.SQUARE_OF_RAXA, 				weight = 232 },
            { item = xi.item.VIAL_OF_BLACK_BEETLE_BLOOD, 	weight = 41 },
        },

}

return content:register()
