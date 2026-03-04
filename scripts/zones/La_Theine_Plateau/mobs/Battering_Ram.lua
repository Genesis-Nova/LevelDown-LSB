-----------------------------------
-- Area: La Theine Plateau
--  Mob: Battering Ram
-----------------------------------
local ID = zones[xi.zone.LA_THEINE_PLATEAU]
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.tutorial.onMobDeath(player)
end

entity.onMobDespawn = function(mob)
    local params =
    {
        immediate = true,
        spawnPoints =
        {
            { x = 79.000,   y = 8.000,   z = -241.000 },
            { x = 159.000,  y = 7.000,   z = -216.000 },
            { x = 64.000,   y = 8.000,   z = -165.000 },
            { x = -23.000,  y = 7.000,   z = -141.000 },
            { x = -90.000,  y = 0.000,   z = -97.000  },
            { x = -97.000,  y = 7.000,   z = -307.000 },
            { x = -41.000,  y = 8.000,   z = -264.000 },
            { x = -155.000, y = -7.000,  z = -187.000 },
            { x = -207.000, y = -7.000,  z = -132.000 },
            { x = -266.000, y = -7.000,  z = -49.000  },
            { x = -331.000, y = -15.000, z = -112.000 },
            { x = -320.000, y = -15.000, z = -14.000  },
            { x = -343.000, y = -7.000,  z = 50.000   },
        }
    }

    xi.mob.phOnDespawn(mob, ID.mob.LUMBERING_LAMBERT, 25, 1200, params) -- 20 minutes
end

return entity
