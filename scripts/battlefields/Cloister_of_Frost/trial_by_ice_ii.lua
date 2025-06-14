-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice II HTBF
-----------------------------------
local cloisterOfFrostID = zones[xi.zone.CLOISTER_OF_FROST]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_FROST,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_ICE_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'IP_Entrance',
    exitNpc          = 'Ice_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfFrostID.mob.SHIVA_PRIME_HTBF     },
            { cloisterOfFrostID.mob.SHIVA_PRIME_HTBF + 1 },
            { cloisterOfFrostID.mob.SHIVA_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
