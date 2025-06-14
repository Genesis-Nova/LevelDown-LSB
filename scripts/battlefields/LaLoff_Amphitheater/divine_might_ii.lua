-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Divine Might II
-----------------------------------
local laLoffID = zones[xi.zone.LALOFF_AMPHITHEATER]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.LALOFF_AMPHITHEATER,
    battlefieldId    = xi.battlefield.id.DIVINE_MIGHT_II,
    canLoseExp       = false,
    allowTrusts      = true,
    maxPlayers       = 18,
    levelCap         = 99,
    timeLimit        = utils.minutes(30),
    index            = 11,
    entryNpcs        = { 'qm1_1', 'qm1_2', 'qm1_3', 'qm1_4', 'qm1_5' },
    exitNpc          = 'qm2',
    requiredKeyItems = { xi.ki.P_PERPETRATOR_PHANTOM_GEM, keep = false   },
})

content.groups =
{
    {
        mobIds =
        {
            {
                laLoffID.mob.ARK_ANGEL_HM_HTBF + 40,      
                laLoffID.mob.ARK_ANGEL_MR_HTBF + 38,
                laLoffID.mob.ARK_ANGEL_EV_HTBF + 80,
                laLoffID.mob.ARK_ANGEL_TT_HTBF + 78,
                laLoffID.mob.ARK_ANGEL_GK_HTBF + 76,
            },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },

    -- AAMR: Tiger
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF +39 },
        },

        spawned = false,
    },

    -- AAMR: Mandragora
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_MR_HTBF + 40 },
        },

        spawned = false,
    },

    -- AAGK: Wyvern
    {
        mobIds =
        {
            { laLoffID.mob.ARK_ANGEL_GK_HTBF + 77 },
        },

        spawned = false,
    },
}

return content:register()
