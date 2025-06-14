-----------------------------------
-- Area: Cloister of Tides
-- BCNM: Trial by Water II HTBF
-----------------------------------
local cloisterOfTidesID = zones[xi.zone.CLOISTER_OF_TIDES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_TIDES,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_WATER_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'WP_Entrance',
    exitNpc          = 'Water_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_HTBF     },
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_HTBF + 1 },
            { cloisterOfTidesID.mob.LEVIATHAN_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
