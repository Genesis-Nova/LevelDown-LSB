-----------------------------------
-- Change your Wyverns skin
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('petskin')

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
    title = 'Change your Wyverns Skin?',
    options = {},
}

page1 =
{
    {
        'Nevermind!',
        function(player)
        end
    },
    {
        'White Dragon', -- - Page 1 RoE
        function(playerArg)
            playerArg:setCharVar('DrgSkin', 530)
        end,
    },
    {
        'Blue Dragon', -- - Page 1 RoE
        function(playerArg)
            playerArg:setCharVar('DrgSkin', 24)
        end,
    },
    {
        'Black Dragon', -- - Page 1 RoE
        function(playerArg)
            playerArg:setCharVar('DrgSkin', 761)
        end,
    },
    {
        'Pig Me',
        function(playerArg)
            playerArg:setCharVar('DrgSkin', 2928)
        end,
    },
}


m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone)
    super(zone)
    local draconius = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Draconius',
        look = 24,
        x         = -11.7552,
        y         = -6.0000,
        z         = -24.8302,
        rotation = 150,
        widescan = 1,
        onTrade = function(player, npc, trade)
        end,
        onTrigger = function(player, npc)
            menu.options = page1
     delaySendMenu(player)
        end,
    })
end)

return m

