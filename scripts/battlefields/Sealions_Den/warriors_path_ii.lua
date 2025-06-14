-----------------------------------
-- Area: Sealion's Den
-- Name: The Warrior's Path HTBF
-----------------------------------
local sealionsDenID = zones[xi.zone.SEALIONS_DEN]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.SEALIONS_DEN,
    battlefieldId = xi.battlefield.id.WARRIORS_PATH_II,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 2,
    entryNpc      = '_0w0',
    exitNpc       = 'Airship_Door',
    requiredKeyItems = { xi.ki.WARRIORS_PATH_PHANTOM_GEM, keep = false   },
})

content.groups =
{
    {
        mobIds =
        {
            { sealionsDenID.mob.TENZEN_HTBF     },
            { sealionsDenID.mob.TENZEN_HTBF + 4 },
            { sealionsDenID.mob.TENZEN_HTBF + 8 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },

    {
        mobIds =
        {
            {
                sealionsDenID.mob.CHERUKIKI_HTBF         ,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF    ,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF    ,
            },

            {
                sealionsDenID.mob.CHERUKIKI_HTBF       +4,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF  +4,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF  +4,
            },

            {
                sealionsDenID.mob.CHERUKIKI_HTBF       +8,
                sealionsDenID.mob.KUKKI_CHEBUKKI_HTBF  +8,
                sealionsDenID.mob.MAKKI_CHEBUKKI_HTBF  +8,
            },
        },
    },
}

return content:register()
