-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: Trial by Earth II HTBF
-----------------------------------
local cloisterOfTremorsID = zones[xi.zone.CLOISTER_OF_TREMORS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_TREMORS,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_EARTH_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'EP_Entrance',
    exitNpc          = 'Earth_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfTremorsID.mob.TITAN_PRIME_HTBF     },
            { cloisterOfTremorsID.mob.TITAN_PRIME_HTBF + 1 },
            { cloisterOfTremorsID.mob.TITAN_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
