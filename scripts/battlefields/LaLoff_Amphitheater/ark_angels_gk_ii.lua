-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Galka)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_GK_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 10,
    entryNpc              = 'qm1_5',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_RAGE, keep = false  },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_GK_HTBF     },
            { laLoffID.mob.ARK_ANGEL_GK_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_GK_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },

    -- Wyvern
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_GK + 3 },
            { laLoffID.mob.ARK_ANGEL_GK + 4 },
            { laLoffID.mob.ARK_ANGEL_GK + 5 },
        },

        spawned = false,
    },
}

return content:register()
