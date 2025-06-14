-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path II
-----------------------------------
local fullMoonFountainID = zones[xi.zone.FULL_MOON_FOUNTAIN]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.FULL_MOON_FOUNTAIN,
    battlefieldId    = xi.battlefield.id.MOONLIT_PATH_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'MS_Entrance',
    exitNpc          = 'Moon_Spiral',
    requiredKeyItems = { xi.ki.MOONLIT_PATH_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})


content.groups =
{
    {
        mobIds =
        {
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF     },
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF + 1 },
            { fullMoonFountainID.mob.FENRIR_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
