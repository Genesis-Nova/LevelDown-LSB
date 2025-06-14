-----------------------------------
-- Area: Cloister of Storms
-- BCNM: Trial by Lightning II HTBF
-----------------------------------
local cloisterOfStormsID = zones[xi.zone.CLOISTER_OF_STORMS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_STORMS,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_LIGHTNING_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'LP_Entrance',
    exitNpc          = 'Lightning_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfStormsID.mob.RAMUH_PRIME_HTBF     },
            { cloisterOfStormsID.mob.RAMUH_PRIME_HTBF + 1 },
            { cloisterOfStormsID.mob.RAMUH_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
