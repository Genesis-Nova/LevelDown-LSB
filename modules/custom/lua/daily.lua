-----------------------------------
-- Daily Quests
-----------------------------------
require('modules/module_utils')

-----------------------------------
local m = Module:new('daily_quests')

-- Forward declarations (required)
local menu  = {}
local page1 = {}
local page2 = {}
local page3 = {}
local page4 = {}

local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'Where would you like to go?',
    options = {},
}

page1 =
{
    {
        'Nothing!',
        function(player)
        end
    },
    {
        'Quest 1 Rabbits', 
        function(playerArg)
            menu.options = page2
            delaySendMenu(playerArg)
        end,
    },
}

page2 =
{
    {
        'Yes', 
        function(playerArg)
            playerArg:setCharVar('DQRabbitKills', 1)
        end,
    },
    {
        'No',
        function(playerArg)
        end,
    },
}



m:addOverride('xi.zones.Leafallia.Zone.onInitialize', function(zone)
    super(zone)
    local exp_guidetwo = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Daily Quests',
        look = 2433,
        x         = -227530,
        y         = -0.7706,
        z         = -4.9695,
        rotation = 214,
        widescan = 1,
        onTrade = function(player, npc, trade)
        end,
        onTrigger = function(player, npc)
        if player:getCharVar('DQRabbitKills') == 10 then
        player:printToPlayer('You go boy!!!!')
        else
     menu.options = page1
     delaySendMenu(player)
        end
        end,
    })
end)

return m

