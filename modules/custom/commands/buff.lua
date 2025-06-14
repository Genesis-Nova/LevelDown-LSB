-----------------------------------
-- func: buff
-- desc: Toggles buff on the player, granting them several special abilities.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}



commandObj.onTrigger = function(player)
    local state = player:getCharVar('Buff')

    if state == 0 then -- add buff
        player:addStatusEffect(xi.effect.BUFF,3,0,0)
    elseif state == 1 then -- remove buff
        player:delStatusEffect(xi.effect.BUFF)
    end
end

return commandObj
