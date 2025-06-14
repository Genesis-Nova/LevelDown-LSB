require('modules/module_utils')
require('scripts/globals/mobs')
require('scripts/globals/player')
-----------------------------------
local m = Module:new('log_in_announcements')

local openingDecoration = '\129\155'
local mid1Decoration = '\129\154'
local mid2Decoration = '\129\154'
local closingDecoration = '\129\154'
local end1Decoration = '\129\154'
local end2Decoration = '\129\155'


local checkWorldServerVar = function(player, varName, worldMessage)
            super(player)
    if  player:getLocalVar('gameLogin') == 1 then
        local decoratedMessage = string.format('%s %s %s %s %s %s %s', openingDecoration, mid1Decoration, mid2Decoration, worldMessage, end1Decoration, end2Decoration, closingDecoration)
        player:PrintToArea(decoratedMessage, xi.msg.channel.SYSTEM_3, 0, '')
    end
end

m:addOverride('xi.player.onGameIn', function(player)

        checkWorldServerVar(player,
        'gameLogin',
        string.format('%s has logged in!', player:getName()))

end)

return m
