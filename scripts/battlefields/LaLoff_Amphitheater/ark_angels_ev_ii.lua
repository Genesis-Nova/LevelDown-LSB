-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Elvaan)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_EV_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 9,
    entryNpc              = 'qm1_4',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_ARROGANCE, keep = false   },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_EV_HTBF     },
            { laLoffID.mob.ARK_ANGEL_EV_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_EV_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
