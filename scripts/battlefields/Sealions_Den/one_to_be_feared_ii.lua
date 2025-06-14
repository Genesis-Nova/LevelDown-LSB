-----------------------------------
-- Area: Sealion's Den
-- Name: One to be Feared HTBF
-----------------------------------
local sealionsDenID = zones[xi.zone.SEALIONS_DEN]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.SEALIONS_DEN,
    battlefieldId = xi.battlefield.id.ONE_TO_BE_FEARED_II,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(45),
    index         = 3,
    entryNpc      = '_0w0',
    exitNpc       = 'Airship_Door',
    requiredKeyItems = { xi.ki.FEARED_ONE_PHANTOM_GEM, keep = false   },
})

-- NOTE: Mob spawning for phase changes in this battlefield is triggered
-- by the airship door, which is also the battlefield exit.  Exit has been
-- purposefully omitted from this to allow that function.

local function healCharacter(player)
    if player:isAlive() then
        player:setHP(player:getMaxHP())
        player:setMP(player:getMaxMP())
        player:setTP(0)

        if player:getPet() ~= nil then
            local pet = player:getPet()
            pet:setHP(pet:getMaxHP())
            pet:setMP(pet:getMaxMP())
            pet:setTP(0)
        end
    end
end

local function returnToAirship(player)
    local battlefieldArea = player:getBattlefield():getArea()

    if battlefieldArea == 1 then
        player:setPos(-780.132, -103.347, -88.692, 193)
    elseif battlefieldArea == 2 then
        player:setPos(-140.029, -23.348, -446.376, 193)
    elseif battlefieldArea == 3 then
        player:setPos(499.969, 56.652, -806.132, 193)
    end

    if player:isDead() then
        player:allowSendRaisePrompt()
    end
end

content.groups =
{
    {
        mobIds =
        {
            { sealionsDenID.mob.OMEGA_HTBF      },
            { sealionsDenID.mob.OMEGA_HTBF + 2  },
            { sealionsDenID.mob.OMEGA_HTBF + 4  },
        },


        allDeath = function(battlefield, mob)
            for _, player in pairs(battlefield:getPlayers()) do
                    healCharacter(player)
                    returnToAirship(player)
                    player:startEvent(11)
            end
        end,
    },

    {
        mobIds =
        {
            { sealionsDenID.mob.ULTIMA_HTBF      },
            { sealionsDenID.mob.ULTIMA_HTBF + 2  },
            { sealionsDenID.mob.ULTIMA_HTBF + 4  },
        },

        spawned  = true,
        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
