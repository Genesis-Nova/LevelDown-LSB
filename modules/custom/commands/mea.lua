-----------------------------------
-- Teleport  Mea
-- Enchantment: "Teleport-Mea"
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!mea')
end

commandObj.onTrigger = function(player, target)
    local result = 0
    if not player:hasKeyItem(xi.ki.MEA_GATE_CRYSTAL) then
        result = 445
        else
    player:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.MEA, 0, 1)
    end
    end

return commandObj