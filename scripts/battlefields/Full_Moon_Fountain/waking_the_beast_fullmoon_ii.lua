-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path II
-----------------------------------
local fullMoonFountainID = zones[xi.zone.FULL_MOON_FOUNTAIN]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.FULL_MOON_FOUNTAIN,
    battlefieldId    = xi.battlefield.id.WAKING_THE_BEAST_FULLMOON_II,
    maxPlayers       = 6,
    timeLimit        = utils.minutes(30),
    index            = 5,
    entryNpc         = 'MS_Entrance',
    exitNpc          = 'Moon_Spiral',
    requiredKeyItems = { xi.ki.WAKING_THE_BEAST_PHANTOM_GEM, keep = false   },
    allowTrusts      = true,
})


content.groups =
{
    {
        mobIds =
        {

            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF,
            },
            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF +1,
            },
            {
                fullMoonFountainID.mob.CARBUNCLE_PRIME_HTBF +2,
            },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF,  },
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF +1},
           { fullMoonFountainID.mob.IFRIT_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )            
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF,  },
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF +1},
           { fullMoonFountainID.mob.SHIVA_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF,  },
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF +1},
           { fullMoonFountainID.mob.GARUDA_PRIME_HTBF +2}, 
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF,  },
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF +1},
           { fullMoonFountainID.mob.TITAN_PRIME_HTBF +2},
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF,  },
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF +1},
           { fullMoonFountainID.mob.RAMUH_PRIME_HTBF +2},
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )         
        end,
    },
    {
        mobIds =
        {
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF,  },
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF +1},
           { fullMoonFountainID.mob.LEVIATHAN_PRIME_HTBF +2},
        },
        spawned  = false,
        allDeath = function(battlefield, mob)
        battlefield:setLocalVar('[RemoveImmortal]', 0 )
        end,
    },
}

return content:register()
