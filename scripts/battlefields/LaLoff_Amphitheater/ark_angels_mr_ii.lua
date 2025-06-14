-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels HTBF (Mithra)
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId                = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId         = xi.battlefield.id.ARK_ANGELS_MR_II,
    allowTrusts           = true,
    maxPlayers            = 6,
    timeLimit             = utils.minutes(30),
    index                 = 8,
    entryNpc              = 'qm1_3',
    exitNpc               = 'qm2',
    requiredKeyItems      = { xi.ki.PHANTOM_GEM_OF_ENVY, keep = false   },
})

content.groups =
{
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF     },
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 1 },
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 2 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },

    -- Tiger Pets
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR + 3 }, -- check these
            { laLoffID.mob.ARK_ANGEL_MR + 4 },
            { laLoffID.mob.ARK_ANGEL_MR + 5 },
        },

        spawned = false,
    },

    -- Mandragora Pets
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR + 6 },
            { laLoffID.mob.ARK_ANGEL_MR + 7 },
            { laLoffID.mob.ARK_ANGEL_MR + 8 },
        },

        spawned = false,
    },
}

return content:register()
