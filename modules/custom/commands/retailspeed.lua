-----------------------------------
-- func: retail speed 
-- desc: Sets the players speed to retail.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!retailspeed')
end

commandObj.onTrigger = function(player)
    if player:getSpeed() == 80 then
       player:printToPlayer('Your Speed has been reset to retail')
       player:setSpeed(50)
    else
       player:printToPlayer('Your Speed has been reset to LevelDown')
       player:setSpeed(80)
    end
end
return commandObj
