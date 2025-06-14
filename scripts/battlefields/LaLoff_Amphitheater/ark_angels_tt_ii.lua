-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Tarutaru)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_TT_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 7,
    entryNpc              = 'qm1_2',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_COWARDICE, keep = false   },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_TT_HTBF     },
            { laLoffID.mob.ARK_ANGEL_TT_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_TT_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
