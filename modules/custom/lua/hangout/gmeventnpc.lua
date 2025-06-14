-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("gmeventnpc")

local menu  = {}
local page1 = {}
local page2 = {}
local page3 = {}
local page4 = {}
local page5 = {}
local page6 = {}
local page7 = {}
local page8 = {}
local page9 = {}
local page10 = {}
local page11 = {}
local page12 = {}
local page13 = {}
local page14 = {}
local page15 = {}

local delaySendMenu = function(player)
      player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'What whould you like to do?',
    options = {},
}
page1 =
{
    {
        'Nothing!',
        function(player)
        end,
    },
    {
        'Hide and Seek Rewards',
         function(player)
         if player:getCharVar('[GMEvent]HS') == 1 then
                    menu.options = page2
                    delaySendMenu(player)
         else
            player:printToPlayer('You are not a winner in this event!. ', 0, 'General')                    
         end
         end,
    },
    {
        'Naked run to Jeuno',
         function(player)
         if player:getCharVar('[GMEvent]NR') == 1 then
                    menu.options = page9
                    delaySendMenu(player)
         else
            player:printToPlayer('You are not a winner in this event!. ', 0, 'General')                    
         end
         end,
    },
    --[[
    {
        'Another Event!',
         function(player)              
         end,
    },
    {
        'Next Page!',
         function(player)          
         end,
    },
    ]]--
}
page2 =
{
    {
        '5,000,000 Gil!',
         function(player)
           player:setCharVar('GMEitem', 65535 )
                    menu.options = page3
                    delaySendMenu(player)  
         end
    },
    {
        'Tokko Weapon!',
        function(player)
                    menu.options = page4
                    delaySendMenu(player)          
        end,
    },
    {
        'Level Craft to 100!',
        function(player)
                    menu.options = page7
                    delaySendMenu(player)          
        end,
    },
    {
        'Level Current job to 99!',
        function(player)
           player:setCharVar('GMEitem', 99 )
                    menu.options = page3
                    delaySendMenu(player)          
        end,
    },
    {
        'Back!',
        function(player)
                    menu.options = page1
                    delaySendMenu(player)           
        end,
    },
}
page3 =
{
    {
        'Yes',
         function(player)
         if player:getCharVar('GMEitem') == 65535 then
         npcUtil.giveItem(player, { { 65535, 5000000 } })
         player:setCharVar('GMEitem', 0)
         player:setCharVar('[GMEvent]HS', 0)
         end
         if player:getCharVar('GMEitem') == 99 then
         player:setLevel(99)
         player:setCharVar('GMEitem', 0)
         player:setCharVar('[GMEvent]HS', 0)
         end
         if player:getCharVar('GMEitem') == 21515 then
            npcUtil.giveItem(player, { { 21515, 1 } })
            player:setCharVar('GMEitem', 0)
            player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21561 then
                npcUtil.giveItem(player, { { 21561, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21617 then
                npcUtil.giveItem(player, { { 21617, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21670 then
                npcUtil.giveItem(player, { { 21670, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21718 then
                npcUtil.giveItem(player, { { 21718, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21775 then
                npcUtil.giveItem(player, { { 21775, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21826 then
                npcUtil.giveItem(player, { { 21826, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21827 then
                npcUtil.giveItem(player, { { 21827, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21918 then
                npcUtil.giveItem(player, { { 21918, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 21971 then
                npcUtil.giveItem(player, { { 21971, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 22027 then
                npcUtil.giveItem(player, { { 22027, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 22082 then
                npcUtil.giveItem(player, { { 22082, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 22108 then
                npcUtil.giveItem(player, { { 22108, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 22214 then
                npcUtil.giveItem(player, { { 22214, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         end
         if player:getCharVar('GMEitem') == 90000 then
            player:setSkillRank(49, 10)
            player:setSkillLevel(49, 1000)
            player:setCharVar('GMEitem', 0)
            player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90001 then
                player:setSkillRank(53, 10)
                player:setSkillLevel(53, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90002 then
                player:setSkillRank(51, 10)
                player:setSkillLevel(51, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90003 then
                player:setSkillRank(50, 10)
                player:setSkillLevel(50, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90004 then
                player:setSkillRank(56, 10)
                player:setSkillLevel(56, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90005 then
                player:setSkillRank(55, 10)
                player:setSkillLevel(55, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90006 then
                player:setSkillRank(54, 10)
                player:setSkillLevel(54, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90007 then
                player:setSkillRank(52, 10)
                player:setSkillLevel(52, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         elseif player:getCharVar('GMEitem') == 90008 then
                player:setSkillRank(48, 10)
                player:setSkillLevel(48, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]HS', 0)
         end

         end
    },
    {
        'No',
        function(player)
                    menu.options = page2
                    delaySendMenu(player)                 
        end,
    },
}
page4 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Knuckles',
         function(player)
           player:setCharVar('GMEitem', 21515)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Knife',
         function(player)
           player:setCharVar('GMEitem', 21561)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Sword',
         function(player)
           player:setCharVar('GMEitem', 21617)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Claymore',
         function(player)
           player:setCharVar('GMEitem', 21670)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Axe',
         function(player)
           player:setCharVar('GMEitem', 21718)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page2
            delaySendMenu(player)
         end
    },
        {
        'Next Page',
         function(player)
            menu.options = page5
            delaySendMenu(player)
         end
    },
}
page5 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Chopper',
         function(player)
           player:setCharVar('GMEitem', 21775)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Scyth',
         function(player)
           player:setCharVar('GMEitem', 21826)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Lance',
         function(player)
           player:setCharVar('GMEitem', 21879)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Katana',
         function(player)
           player:setCharVar('GMEitem', 21918)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Tachi',
         function(player)
           player:setCharVar('GMEitem', 21971)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page4
            delaySendMenu(player)
         end
    },
        {
        'Next Page',
         function(player)
            menu.options = page6
            delaySendMenu(player)
         end
    },
}
page6 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Rod',
         function(player)
           player:setCharVar('GMEitem', 22027)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Staff',
         function(player)
           player:setCharVar('GMEitem', 22082)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Bow',
         function(player)
           player:setCharVar('GMEitem', 22108)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Grip',
         function(player)
           player:setCharVar('GMEitem', 22214)
           menu.options = page3
            delaySendMenu(player)
         end
    },
     {
        'Previouse Page',
         function(player)
           menu.options = page5
            delaySendMenu(player)
         end
    },
}
page7 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'WoodWorking',
         function(player)
           player:setCharVar('GMEitem', 90000)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'LeatherCraft',
         function(player)
           player:setCharVar('GMEitem', 90001)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'GoldSmithing',
         function(player)
           player:setCharVar('GMEitem', 90002)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Smithing',
         function(player)
           player:setCharVar('GMEitem', 90003)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page2
            delaySendMenu(player)
         end
    },
    {
        'Next Page',
         function(player)
           menu.options = page8
            delaySendMenu(player)
         end
    },
}
page8 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Cooking',
         function(player)
           player:setCharVar('GMEitem', 90004)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Alchemy',
         function(player)
           player:setCharVar('GMEitem', 90005)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'BoneCraft',
         function(player)
           player:setCharVar('GMEitem', 90006)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'ClothCraft',
         function(player)
           player:setCharVar('GMEitem', 90007)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Fishing',
         function(player)
           player:setCharVar('GMEitem', 90008)
           menu.options = page3
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page7
            delaySendMenu(player)
         end
    },
}

page9 =
{
    {
        '5,000,000 Gil!',
         function(player)
           player:setCharVar('GMEitem', 65535 )
                    menu.options = page15
                    delaySendMenu(player)  
         end
    },
    {
        'Tokko Weapon!',
        function(player)
                    menu.options = page10
                    delaySendMenu(player)          
        end,
    },
    {
        'Level Craft to 100!',
        function(player)
                    menu.options = page13
                    delaySendMenu(player)          
        end,
    },
    {
        'Level Current job to 99!',
        function(player)
           player:setCharVar('GMEitem', 99 )
                    menu.options = page15
                    delaySendMenu(player)          
        end,
    },
    {
        'Back!',
        function(player)
                    menu.options = page1
                    delaySendMenu(player)           
        end,
    },
}
page10 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Knuckles',
         function(player)
           player:setCharVar('GMEitem', 21515)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Knife',
         function(player)
           player:setCharVar('GMEitem', 21561)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Sword',
         function(player)
           player:setCharVar('GMEitem', 21617)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Claymore',
         function(player)
           player:setCharVar('GMEitem', 21670)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Axe',
         function(player)
           player:setCharVar('GMEitem', 21718)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page9
            delaySendMenu(player)
         end
    },
        {
        'Next Page',
         function(player)
            menu.options = page11
            delaySendMenu(player)
         end
    },
}
page11 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Chopper',
         function(player)
           player:setCharVar('GMEitem', 21775)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Scyth',
         function(player)
           player:setCharVar('GMEitem', 21826)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Lance',
         function(player)
           player:setCharVar('GMEitem', 21879)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Katana',
         function(player)
           player:setCharVar('GMEitem', 21918)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Tachi',
         function(player)
           player:setCharVar('GMEitem', 21971)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page10
            delaySendMenu(player)
         end
    },
        {
        'Next Page',
         function(player)
            menu.options = page12
            delaySendMenu(player)
         end
    },
}
page12 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Rod',
         function(player)
           player:setCharVar('GMEitem', 22027)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Staff',
         function(player)
           player:setCharVar('GMEitem', 22082)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Bow',
         function(player)
           player:setCharVar('GMEitem', 22108)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Grip',
         function(player)
           player:setCharVar('GMEitem', 22214)
           menu.options = page15
            delaySendMenu(player)
         end
    },
     {
        'Previouse Page',
         function(player)
           menu.options = page11
            delaySendMenu(player)
         end
    },
}
page13 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'WoodWorking',
         function(player)
           player:setCharVar('GMEitem', 90000)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'LeatherCraft',
         function(player)
           player:setCharVar('GMEitem', 90001)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'GoldSmithing',
         function(player)
           player:setCharVar('GMEitem', 90002)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Smithing',
         function(player)
           player:setCharVar('GMEitem', 90003)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page9
            delaySendMenu(player)
         end
    },
    {
        'Next Page',
         function(player)
           menu.options = page14
            delaySendMenu(player)
         end
    },
}
page14 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Cooking',
         function(player)
           player:setCharVar('GMEitem', 90004)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Alchemy',
         function(player)
           player:setCharVar('GMEitem', 90005)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'BoneCraft',
         function(player)
           player:setCharVar('GMEitem', 90006)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'ClothCraft',
         function(player)
           player:setCharVar('GMEitem', 90007)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Fishing',
         function(player)
           player:setCharVar('GMEitem', 90008)
           menu.options = page15
            delaySendMenu(player)
         end
    },
    {
        'Previouse Page',
         function(player)
           menu.options = page13
            delaySendMenu(player)
         end
    },
}

page15 =
{
    {
        'Yes',
         function(player)
         if player:getCharVar('GMEitem') == 65535 then
         npcUtil.giveItem(player, { { 65535, 5000000 } })
         player:setCharVar('GMEitem', 0)
         player:setCharVar('[GMEvent]NR', 0)
         end
         if player:getCharVar('GMEitem') == 99 then
         player:setLevel(99)
         player:setCharVar('GMEitem', 0)
         player:setCharVar('[GMEvent]NR', 0)
         end
         if player:getCharVar('GMEitem') == 21515 then
            npcUtil.giveItem(player, { { 21515, 1 } })
            player:setCharVar('GMEitem', 0)
            player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21561 then
                npcUtil.giveItem(player, { { 21561, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21617 then
                npcUtil.giveItem(player, { { 21617, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21670 then
                npcUtil.giveItem(player, { { 21670, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21718 then
                npcUtil.giveItem(player, { { 21718, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21775 then
                npcUtil.giveItem(player, { { 21775, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21826 then
                npcUtil.giveItem(player, { { 21826, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21827 then
                npcUtil.giveItem(player, { { 21827, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21918 then
                npcUtil.giveItem(player, { { 21918, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 21971 then
                npcUtil.giveItem(player, { { 21971, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 22027 then
                npcUtil.giveItem(player, { { 22027, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 22082 then
                npcUtil.giveItem(player, { { 22082, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 22108 then
                npcUtil.giveItem(player, { { 22108, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 22214 then
                npcUtil.giveItem(player, { { 22214, 1 } })
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         end
         if player:getCharVar('GMEitem') == 90000 then
            player:setSkillRank(49, 10)
            player:setSkillLevel(49, 1000)
            player:setCharVar('GMEitem', 0)
            player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90001 then
                player:setSkillRank(53, 10)
                player:setSkillLevel(53, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90002 then
                player:setSkillRank(51, 10)
                player:setSkillLevel(51, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90003 then
                player:setSkillRank(50, 10)
                player:setSkillLevel(50, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90004 then
                player:setSkillRank(56, 10)
                player:setSkillLevel(56, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90005 then
                player:setSkillRank(55, 10)
                player:setSkillLevel(55, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90006 then
                player:setSkillRank(54, 10)
                player:setSkillLevel(54, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90007 then
                player:setSkillRank(52, 10)
                player:setSkillLevel(52, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         elseif player:getCharVar('GMEitem') == 90008 then
                player:setSkillRank(48, 10)
                player:setSkillLevel(48, 1000)
                player:setCharVar('GMEitem', 0)
                player:setCharVar('[GMEvent]NR', 0)
         end

         end
    },
    {
        'No',
        function(player)
                    menu.options = page9
                    delaySendMenu(player)                 
        end,
    },
}

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)
    local GMNpc = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'GM Event NPC',
        look = 1548,
        x = 376.5812,
        y = -2.1266,
        z = -570.4529,
        rotation = 115,
        widescan = 1,

        onTrade = function(player, npc, trade)
local EGtrade =
{ -- [ 2] = { trade = {1506, 1509, {1488, 2}, {1507, 2}}, reward = 15544}, --SATTVA Sattva Ring
[ 1] = { trade = {1505, 1497, 1506, 1508, 1494, {1488, 3}},        reward = 15543, aug1 = 327, aug1MAX =  4}, --RAJASAUG Rajas Ring
[ 2] = { trade = {1506, 1509, 1508, 1494, {1488, 2}, {1507, 2}},   reward = 15544, aug1 =  71, aug1MAX =  4}, --SATTVAUG Sattva Ring
[ 3] = { trade = {1507, 1500, 1506, 1508, 1494, {1488, 3}},        reward = 15545, aug1 = 140, aug1MAX =  4}, --TAMASAUG Tamas Ring
[ 4] = { trade = {1503, 1505, 1507, 1496, 1508, 1494, {1488, 2}},  reward = 28498, aug1 = 339, aug1MAX =  9}, --PRATIAUG Pratik earring
[ 5] = { trade = {1488, 1494, {1498, 2},{1502, 2}, {1508, 2}},     reward = 10295, aug1 = 142, aug1MAX =  4}, --KOKOUAUG Kokous earring
[ 6] = { trade = {1499, 1492, 1500, 1503, 1502, 1488, 1508, 1494}, reward = 27538, aug1 =  80, aug1MAX =  4}, --LEMPOAUG Lempo earring
[ 7] = { trade = {1507, 1495, 1505, 1488, 1508, 1494, {1492, 2}},  reward = 15965, aug1 =  49, aug1MAX =  4}, --ETHERAUG Ethereal earring
[ 8] = { trade = {1495, 1488, 1508, 1494, {1502, 2}, {1499, 2}},   reward = 15964, aug1 = 132, aug1MAX =  4}, --HOLLOAUG Hollow Earring
[ 9] = { trade = {1500, 1501, 1492, 1508, {1494, 2}, {1488, 2}},   reward = 15963, aug1 = 138, aug1MAX =  1}, --MAGNEAUG Magnetic Earring
[10] = { trade = {1506, 1496, 1508, 1494, {1507, 2}, {1488, 2}},   reward = 15962, aug1 =  80, aug1MAX =  4}, --STATIAUG Static Earring
[11] = { trade = {1501, 1497, 1506, 1508, 1494, {1488, 3}},        reward = 26219, aug1 = 323, aug1MAX =  9}, --NAJASAUG Najis loop
[12] = { trade = {1499, 1513, 1493, 1494, {1488, 2}, {1508, 2}},   reward = 15810, aug1 = 340, aug1MAX =  9}, --LUZAFAUG Luzafs ring
[13] = { trade = {1506, 1499, 1497, 1502, 1505, 1488, 1508, 1494}, reward = 10799, aug1 = 332, aug1MAX =  4}, --SLJORAUG Sljor ring
[14] = { trade = {1491, 1500, 1498, 1494, {1488, 2}, {1508, 2}},   reward = 28530, aug1 = 144, aug1MAX =  4}, --DUMAKAUG Dumakulems ring
[15] = { trade = {1500, 1507, 1501, 1508, 1494, {1488, 3}},        reward = 28468, aug1 =  29, aug1MAX =  9}, --MATANAUG Matanki earring
[16] = { trade = {1490, 1501, 1491, 1492, 1508, 1494, {1488, 2}},  reward = 28532, aug1 = 326, aug1MAX =  9}, --CANDEAUG Candent ring
[17] = { trade = {1490, 1495, 1505, 1496, 1508, 1494, {1488, 2}},  reward = 10296, aug1 = 109, aug1MAX =  9}, --CHARIAUG Charivari earring
[18] = { trade = {1492, 1501, 1490, 1495, 1508, 1494, {1488, 2}},  reward = 28494, aug1 = 322, aug1MAX =  4}, --ENCHAAUG enchanter earring +1
[19] = { trade = {1489, 1505, 1507, 1494, {1488, 2}, {1508, 2}},   reward = 14813, aug1 = 142, aug1MAX =  4}, --BRUTAAUG Brutal earring
[20] = { trade = {1499, 1502, 1504, 1494, {1488, 2}, {1508, 2}},   reward = 14812, aug1 = 140, aug1MAX =  4}, --LOQUAAUG Loquacious earring
[21] = { trade = {1489, 1502, 1511, 1492, 1505, 1488, 1508, 1494}, reward = 15477, aug1 = 137, aug1MAX =  4}, --BOXERAUG boxer mantle
[22] = { trade = {1507, 1500, 1503, 1488, 1508, 1494, {1492, 2}},  reward = 15513, aug1 = 322, aug1MAX =  6}, --TEMPEAUG temperance torque
[23] = { trade = {1493, 1502, 1505, 1507, 1496, 1488, 1508, 1494}, reward = 15511, aug1 =  39, aug1MAX =  8}, --FORTIAUG fortitude torque
[24] = { trade = {1493, 1496, 1507, 1495, 1508, 1494, {1488, 2}},  reward = 15512, aug1 = 132, aug1MAX =  4}, --FAITHAUG faith torque
[25] = { trade = {1495, 1502, 1503, 1492, 1507, 1488, 1508, 1494}, reward = 15509, aug1 =  49, aug1MAX =  4}, --HOPETAUG hope torque
[26] = { trade = {1497, 1508, 1506, 1507, 1496, 1488, 1508, 1494}, reward = 15508, aug1 = 132, aug1MAX =  4}, --JUSTIAUG justice torque
[27] = { trade = {1499, 1502, 1509, 1492, 1507, 1488, 1508, 1494}, reward = 15514, aug1 = 144, aug1MAX =  4}, --LOVETAUG love torque
[28] = { trade = {1503, 1505, 1491, 1492, 1488, 1494, {1508, 2}},  reward = 15510, aug1 =  80, aug1MAX =  4}, --PRUDEAUG prudence torque
[29] = { trade = {1499, 1502, 1494, 1496, 1501}, reward = 'login_points'}, --LOGIN 1500 Log in points
[30] = { trade = {1506, 1503, 1488, 1505, 1498, 1506}, reward = 'spark_of_eminence'}, --SPARKS 25k sparks
[31] = { trade = {1488, 1490, 1490, 1502, 1499, 1488, 1491, 1492}, reward = 'unity_accolades'}, --ACCOLADE 10k Accolades
[32] = { trade = {1499, 1508, 1506, 1495, 1488, 1501, 1494}, reward = 17386}, --LUSHANG Lushangs fishing rod
[33] = { trade = {1492, 1489, 1496, 1506, 1508, 1493, 1505}, reward = 17011}, --EBISUFR Ebisu Fishing rod
[34] = { trade = {1493, 1488, 1490, 1492}, reward = '[GMEvent]freefc'}, --FACE free face change
[35] = { trade = {1505, 1488, 1490, 1492}, reward = '[GMEvent]freerc'}, --RACE free race change
-- trade egss + item to get augment
[36] = { trade = {1505, 1497, 1506, 1508, 15543, {1488, 3}},        reward = 15543, aug1 = 327, aug1MAX =  4}, --RAJASAU Rajas Ring
[37] = { trade = {1506, 1509, 1508, 15544, {1488, 2}, {1507, 2}},   reward = 15544, aug1 =  71, aug1MAX =  4}, --SATTVAU Sattva Ring
[38] = { trade = {1507, 1500, 1506, 1508, 15545, {1488, 3}},        reward = 15545, aug1 = 140, aug1MAX =  4}, --TAMASAU Tamas Ring
[39] = { trade = {1503, 1505, 1507, 1496, 1508, 28498, {1488, 2}},  reward = 28498, aug1 = 339, aug1MAX =  9}, --PRATIAU Pratik earring
[40] = { trade = {1488, 10295, {1498, 2},{1502, 2}, {1508, 2}},     reward = 10295, aug1 = 142, aug1MAX =  4}, --KOKOUAU Kokous earring
[41] = { trade = {1499, 1492, 1500, 1503, 1502, 1488, 1508, 27538}, reward = 27538, aug1 =  80, aug1MAX =  4}, --LEMPOAU Lempo earring
[42] = { trade = {1507, 1495, 1505, 1488, 1508, 15965, {1492, 2}},  reward = 15965, aug1 =  49, aug1MAX =  4}, --ETHERAU Ethereal earring
[43] = { trade = {1495, 1488, 1508, 15964, {1502, 2}, {1499, 2}},   reward = 15964, aug1 = 132, aug1MAX =  4}, --HOLLOAU Hollow Earring
[44] = { trade = {1500, 1494, 1501, 1492, 1508, 15963, {1488, 2}},  reward = 15963, aug1 = 138, aug1MAX =  1}, --MAGNEAU Magnetic Earring
[45] = { trade = {1506, 1496, 1508, 15962, {1507, 2}, {1488, 2}},   reward = 15962, aug1 =  80, aug1MAX =  4}, --STATIAU Static Earring
[46] = { trade = {1501, 1497, 1506, 1508, 26219, {1488, 3}},        reward = 26219, aug1 = 323, aug1MAX =  9}, --NAJASAU Najis loop
[47] = { trade = {1499, 1513, 1493, 15810, {1488, 2}, {1508, 2}},   reward = 15810, aug1 = 340, aug1MAX =  9}, --LUZAFAU Luzafs ring
[48] = { trade = {1506, 1499, 1497, 1502, 1505, 1488, 1508, 10799}, reward = 10799, aug1 = 332, aug1MAX =  4}, --SLJORAU Sljor ring
[49] = { trade = {1491, 1500, 1498, 28530, {1488, 2}, {1508, 2}},   reward = 28530, aug1 = 144, aug1MAX =  4}, --DUMAKAU Dumakulems ring
[50] = { trade = {1500, 1507, 1501, 1508, 28468, {1488, 3}},        reward = 28468, aug1 =  29, aug1MAX =  9}, --MATANAU Matanki earring
[51] = { trade = {1490, 1501, 1491, 1492, 1508, 28532, {1488, 2}},  reward = 28532, aug1 = 326, aug1MAX =  9}, --CANDEAU Candent ring
[52] = { trade = {1490, 1495, 1505, 1496, 1508, 10296, {1488, 2}},  reward = 10296, aug1 = 109, aug1MAX =  9}, --CHARIAU Charivari earring
[53] = { trade = {1492, 1501, 1490, 1495, 1508, 28494, {1488, 2}},  reward = 28494, aug1 = 322, aug1MAX =  4}, --ENCHAAU enchanter earring +1
[54] = { trade = {1489, 1505, 1507, 14813, {1488, 2}, {1508, 2}},   reward = 14813, aug1 = 142, aug1MAX =  4}, --BRUTAAU Brutal earring
[55] = { trade = {1499, 1502, 1504, 14812, {1488, 2}, {1508, 2}},   reward = 14812, aug1 = 140, aug1MAX =  4}, --LOQUAAU Loquacious earring
[56] = { trade = {1489, 1502, 1511, 1492, 1505, 1488, 1508, 15477}, reward = 15477, aug1 = 137, aug1MAX =  4}, --BOXERAU boxer mantle
[57] = { trade = {1507, 1500, 1503, 1488, 1508, 15513, {1492, 2}},  reward = 15513, aug1 = 322, aug1MAX =  6}, --TEMPEAU temperance torque
[58] = { trade = {1493, 1502, 1505, 1507, 1496, 1488, 1508, 15511}, reward = 15511, aug1 =  39, aug1MAX =  8}, --FORTIAU fortitude torque
[59] = { trade = {1493, 1496, 1507, 1495, 1508, 15512, {1488, 2}},  reward = 15512, aug1 = 132, aug1MAX =  4}, --FAITHAU faith torque
[60] = { trade = {1495, 1502, 1503, 1492, 1507, 1488, 1508, 15509}, reward = 15509, aug1 =  49, aug1MAX =  4}, --HOPETAU hope torque
[61] = { trade = {1497, 1508, 1506, 1507, 1496, 1488, 1508, 15508}, reward = 15508, aug1 = 132, aug1MAX =  4}, --JUSTIAU justice torque
[62] = { trade = {1499, 1502, 1509, 1492, 1507, 1488, 1508, 15514}, reward = 15514, aug1 = 144, aug1MAX =  4}, --LOVETAU love torque
[63] = { trade = {1503, 1505, 1491, 1492, 1488, 15510, {1508, 2}},  reward = 15510, aug1 =  80, aug1MAX =  4}, --PRUDEAU prudence torque

}
        local tradedCombo = 0
        local eggreward = 0
        local eggrewardaug = 0
        local eggrewardaugmax = 0
        if tradedCombo == 0 then
            for k, v in pairs(EGtrade) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    eggreward = v.reward
                    eggrewardaug = v.aug1
                    eggrewardaugmax = v.aug1MAX
                    break
                end
            end
        end
            if tradedCombo == 29 then
               player:tradeComplete()
               player:addCurrency('login_points', 1500)
               player:printToPlayer('Congratulations, you have obtained 1500 LogIn Points!.', 0, 'General')
            elseif tradedCombo == 34 then
               player:tradeComplete()
               player:setCharVar('[GMEvent]freefc', player:getCharVar('[GMEvent]freefc') +1)
               player:printToPlayer('Congratulations, you have won 1 Free Face change, Please see the change NPC.', 0, 'General')
            elseif tradedCombo == 35 then
               player:tradeComplete()
               player:setCharVar('[GMEvent]freerc', player:getCharVar('[GMEvent]freerc') +1)
               player:printToPlayer('Congratulations, you have won 1 Free Race change, Please see the change NPC.', 0, 'General')
            elseif tradedCombo == 30 then
               player:tradeComplete()
               player:addCurrency('spark_of_eminence', 25000)
               player:printToPlayer('Congratulations, you have obtained 25,000 Sparks!.', 0, 'General')
            elseif tradedCombo == 31 then
               player:tradeComplete()
               player:addCurrency('unity_accolades', 10000)
               player:printToPlayer('Congratulations, you have obtained 10,000 Accolade Points!.', 0, 'General')
            elseif tradedCombo == 32 or
                   tradedCombo == 33 then
               player:tradeComplete()
               npcUtil.giveItem(player, { { eggreward, 1 } })
            elseif tradedCombo == 0 or
               tradedCombo == nil then
               player:printToPlayer('This is not a valid word!.', 0, 'General')
               return
            else
               player:tradeComplete()
               player:addItem(eggreward, 1, eggrewardaug, eggrewardaugmax)
               player:printToPlayer(string.format('Congratulations, you have obtained %s!.',GetItemByID(eggreward):getName()), 0, 'General')

            end
        end,

        onTrigger = function(player, npc)
            if player:getCharVar('[GMEvent]HS') == 0 and
               player:getCharVar('[GMEvent]NR') == 0 then
               player:printToPlayer('I am here to distribute rewards to the winners for the GM Events!. ', 0, 'General')
               player:printToPlayer('I do not show that you have won any events yet, come back after you have won!. ', 0, 'General')
            elseif player:getCharVar('[GMEvent]HS') == 1 or
                   player:getCharVar('[GMEvent]NR') == 1 then
               player:printToPlayer('Congratulations on your win, please select a reward!. ', 0, 'General')
                    menu.options = page1
                    delaySendMenu(player)
            end
        end,

    })
    utils.unused(GMNpc)
end)


m:addOverride('xi.zones.Batallia_Downs.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)
    local npc = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Event NPC',
        look = 2423,
        x = 446.1063,
        y = 8.1920,
        z = -154.1094,
        rotation = 139,
        widescan = 0,

        onTrigger = function(player, npc)
        if player:getCharVar('NakedRun') >= 1 then
        local playerz = player:getName()
        player:printToArea(string.format('GM General : Congratulations %s, you have made it in 1st place!!!!!!', playerz), xi.msg.channel.SYSTEM_3, 0, '')
        player:printToArea(string.format('GM General : Please see the GM Event NPC in the Library to claim your reward!'), xi.msg.channel.SYSTEM_3, 0, '')
        player:printToArea(string.format('GM General : Thank you to everyone who participated in the event!'), xi.msg.channel.SYSTEM_3, 0, '')
        player:setCharVar('[GMEvent]NR', 1)
            local alliance = player:getAlliance()
                for _, partyMember in ipairs(alliance) do
                    if partyMember:getCharVar('NakedRun') >= 1 then
                       partyMember:delStatusEffect(xi.effect.EGG)
                    end
                end
        else
        player:printToPlayer('Your are not a participant in the Run to Jeuno event!')
        end
        end,
    })
    utils.unused(npc)
end)
return m


