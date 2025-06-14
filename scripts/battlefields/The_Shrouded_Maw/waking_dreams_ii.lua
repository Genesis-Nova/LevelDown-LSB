-----------------------------------
-- Area: Shrouded Maw
-- BCNM: Waking Dreams II HTBF
-----------------------------------
local shroudedMawID = zones[xi.zone.THE_SHROUDED_MAW]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.THE_SHROUDED_MAW,
    battlefieldId    = xi.battlefield.id.WAKING_DREAMS_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 3,
    entryNpc         = 'MC_Entrance',
    exitNpc          = 'Memento_Circle',
    requiredKeyItems = { xi.ki.WAKING_DREAMS_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})


content.groups =
{
    {
        mobIds =
        {
            { shroudedMawID.mob.DIABOLOS_PRIME_HTBF     },
            { shroudedMawID.mob.DIABOLOS_PRIME_HTBF + 1 },
            { shroudedMawID.mob.DIABOLOS_PRIME_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
