-----------------------------------
-- Area: Cloister of Flames
-- BCNM: Trial by Fire II HTBF
-----------------------------------
local cloisterOfFlamesID = zones[xi.zone.CLOISTER_OF_FLAMES]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.CLOISTER_OF_FLAMES,
    battlefieldId    = xi.battlefield.id.TRIAL_BY_FIRE_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'FP_Entrance',
    exitNpc          = 'Fire_Protocrystal',
    requiredKeyItems = { xi.ki.AVATAR_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})

content.groups =
{
    {
        mobIds =
        {
            { cloisterOfFlamesID.mob.IFRIT_PRIME_HTBF     },
            { cloisterOfFlamesID.mob.IFRIT_PRIME_HTBF + 1 },
            { cloisterOfFlamesID.mob.IFRIT_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
