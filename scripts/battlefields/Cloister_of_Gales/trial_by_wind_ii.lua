-----------------------------------
-- Area: Cloister of Gales
-- BCNM: Trial by Wind II HTBF
-----------------------------------
local cloisterOfGalesID = zones[xi.zone.CLOISTER_OF_GALES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_GALES,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_WIND_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Wind_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfGalesID.mob.GARUDA_PRIME_HTBF     },
            { cloisterOfGalesID.mob.GARUDA_PRIME_HTBF + 1 },
            { cloisterOfGalesID.mob.GARUDA_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
