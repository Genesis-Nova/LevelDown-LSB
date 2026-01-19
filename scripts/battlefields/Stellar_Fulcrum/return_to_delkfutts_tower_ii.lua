-----------------------------------
-- Area: Stellar Fulcrum
-- Name: Return to Delkfutt's Tower II
-----------------------------------
local stellarFulcrumID = zones[xi.zone.STELLAR_FULCRUM]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.STELLAR_FULCRUM,
    battlefieldId    = xi.battlefield.id.RETURN_TO_DELKFUTTS_TOWER_II,
    canLoseExp       = false,
    allowTrusts      = true,
    maxPlayers       = 6,
    levelCap         = 99,
    timeLimit        = utils.minutes(30),
    index            = 7, 
    area             = 1,
    entryNpc         = '_4z0',
    exitNpcs         = { '_4z1', '_4z2', '_4z3' },
    requiredKeyItems = { xi.ki.STELLAR_FULCRUM_PHANTOM_GEM, keep = false}, 
})

content.groups =
{
    {
        -- CHECK OFFSETS: HTBF offsets often differ from NQ
        mobIds =
        {
            stellarFulcrumID.mob.KAMLANAUT_HTBF,
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
    {
        mobIds = { stellarFulcrumID.mob.ESOTERIC_SCRIVENING },
        spawned = false,
    },
    {
        mobIds =
        {
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 1,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 2,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 3,
            stellarFulcrumID.mob.KAMLANAUT_HTBF + 4,
        },
        spawned = false,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  1000}, -- Rem Tale Ch 6 
    },

    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_6,     weight =  250}, -- Rem Tale Ch 6 
    },

    {
        { itemId = xi.item.NONE,            weight = 250 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,     weight = 250 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,   weight = 250 }, -- Hepatizon Ore
        { itemId = xi.item.WYRM_BLOOD,      weight = 250 }, -- Wyrm Blood
    },

    {
        { itemId = xi.item.NONE,                    weight = 500 }, -- nothing
        { itemId = xi.item.MESYOHI_SWORD,           weight = 100 }, -- Mes'yohi Sword
        { itemId = xi.item.MESYOHI_ROD,             weight= 100 }, -- Mes'yohi Rod
        { itemId = xi.item.SERAPHICALLER,           weight = 100 }, -- Seraphicaller
        { itemId = xi.item.DIVINATOR,               weight = 100 }, -- Divinator
        { itemId = xi.item.DIVINATOR_II,            weight = 100 }, -- Divinator II
    },

    {
        { itemId = xi.item.NONE,                weight = 250 }, -- nothing
        { itemId = xi.item.MESYOHI_HAUBERGEON,  weight = 375 }, -- 
        { itemId = xi.item.MESYOHI_SLACKS,      weight = 375 }, -- 
    },
}


return content:register()