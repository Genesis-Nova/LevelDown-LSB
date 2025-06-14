-----------------------------------
-- Teleport  Holla
-- Enchantment: "Teleport-Holla"
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!holla')
end

commandObj.onTrigger = function(player, target)
    local result = 0
    if not player:hasKeyItem(xi.ki.HOLLA_GATE_CRYSTAL) then
        result = 445
        else
    player:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.HOLLA, 0, 1)
    end
    end


return commandObj