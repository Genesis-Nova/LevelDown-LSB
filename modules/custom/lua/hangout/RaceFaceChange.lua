-----------------------------------
-- Change your Wyverns skin
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('RaceFaceChange')

local menu   = {}
local page1  = {}
local page2  = {}
local page3  = {}
local page4  = {}
local page5  = {}
local page6  = {}
local page7  = {}
local page8  = {}
local page9  = {}
local page10 = {}
local page11 = {}
local page12 = {}
local page13 = {}
local page14 = {}
local page15 = {}
local page16 = {}
local page17 = {}
local page18 = {}
local page19 = {}
local page20 = {}
local page21 = {}
local page22 = {}
local page23 = {}
local page24 = {}
local page25 = {}
local page26 = {}
local page27 = {}
local page28 = {}
local page29 = {}
local page30 = {}
local page31 = {}
local page32 = {}
local page33 = {}
local page34 = {}
local page35 = {}
local page36 = {}
local page37 = {}
local page38 = {}
local page39 = {}



local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'What would you like?',
    options = {},
}
page1 =
{
    {
        'Nothing for now.',
        function(player)
        end
    },
    {
        'Race Change',
         function(player)
                    menu.options = page2
                    delaySendMenu(player)  
         end
    },
    {
        'Face Change',
         function(player)
                    menu.options = page5
                    delaySendMenu(player)  
         end
    },
}
page2 =
{
    {
        'Nothing!',
        function(player)           
        end
    },
    {
        'Galka',
        function(player)
        player:setCharVar('[RaceChange]', 8)
        menu.options = page4
        delaySendMenu(player)                 
        end
    },
    {
        'Mithra',
        function(player)
        player:setCharVar('[RaceChange]', 7)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Taru F',
        function(player)
        player:setCharVar('[RaceChange]', 6)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Taru M',
        function(player)
        player:setCharVar('[RaceChange]', 5)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Next Page!',
        function(player)
         menu.options = page3
         delaySendMenu(player)   
        end
    },
}
page3 =
{
    {
        'Previous Page!',
        function(player)
         menu.options = page2
         delaySendMenu(player)   
        end
    },
    {
        'Hume F',
        function(player)
        player:setCharVar('[RaceChange]', 2)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Hume M',
        function(player)
        player:setCharVar('[RaceChange]', 1)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Elvaan F',
        function(player)
        player:setCharVar('[RaceChange]', 4)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'Elvaan M',
        function(player)
        player:setCharVar('[RaceChange]', 3)
        menu.options = page4
        delaySendMenu(player) 
        end
    },
    {
        'I cant make up my mind!',
        function(player)
        end
    },
}
page4 =
{
    {
        'Yes',
        function(player)
        local race = player:getCharVar('[RaceChange]')
        local change = player:getCharVar('[GMEvent]freerc')
        local toString = { 'Hume Male', 'Hume Female', 'Elvan Male', 'Elvan Female', 'Taru Male', 'Taru Female', 'Mithra', 'Galka' }
        if change > 0 then
            player:printToPlayer(string.format('Thank you, your Race is now being changed to %s!',toString[race]), 0, 'Alfred')
            player:setRace(race)
            player:setCharVar('[RaceChange]', 0)
            player:setCharVar('[GMEvent]freerc', player:getCharVar('[GMEvent]freerc') -1 )
            player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
            player:timer(1000, function()
            player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
            end)
        elseif change == 0 and player:getGil() < 1000000 then
            player:printToPlayer('You do not have enough gil to make this purchase!. ', 0, 'Alfred')
        elseif change == 0 and player:getGil() > 1000000 then
            player:printToPlayer(string.format('Thank you, your Race is now being changed to %s!',toString[race]), 0, 'Alfred')
            player:delGil(1000000)
            player:setRace(race)
            player:setCharVar('[RaceChange]', 0)
            player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
            player:timer(1000, function()
            player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
            end)
        end
        end,
    },
    {
        'No',
        function(player)
                    player:setCharVar('[RaceChange]', 0)              
        end,
    },
}
page5 =
{
    {
        'Nothing!',
        function(player)           
        end
    },
    {
        'Galka Face',
        function(player)
        menu.options = page7
        delaySendMenu(player)                 
        end
    },
    {
        'Mithra Face',
        function(player)
        menu.options = page11
        delaySendMenu(player) 
        end
    },
    {
        'Taru F Face',
        function(player)
        menu.options = page16
        delaySendMenu(player) 
        end
    },
    {
        'Taru M Face',
        function(player)
        menu.options = page20
        delaySendMenu(player) 
        end
    },
    {
        'Next Page!',
        function(player)
         menu.options = page6
         delaySendMenu(player)   
        end
    },
}
page6 =
{
    {
        'Previous Page!',
        function(player)
         menu.options = page5
         delaySendMenu(player)   
        end
    },
    {
        'Hume F Face',
        function(player)
        menu.options = page24
        delaySendMenu(player) 
        end
    },
    {
        'Hume M Face',
        function(player)
        menu.options = page28
        delaySendMenu(player) 
        end
    },
    {
        'Elvaan F Face',
        function(player)
        menu.options = page32
        delaySendMenu(player) 
        end
    },
    {
        'Elvaan M Face',
        function(player)
        menu.options = page36
        delaySendMenu(player) 
        end
    },
    {
        'I cant make up my mind!',
        function(player)
        end
    },
}
--------------------------------------------------------------
----- Galka
--------------------------------------------------------------
page7 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
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
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page8 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page9
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page7
        delaySendMenu(player) 
        end
    },
}
page9 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 25)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
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
    {
        'Previous Page',
        function(player)
        menu.options = page10
        delaySendMenu(player) 
        end
    },
}
page10 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page9
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Mithra
--------------------------------------------------------------
page11 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
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
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page12 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page13
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page11
        delaySendMenu(player) 
        end
    },
}
page13 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 25)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
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
    {
        'Previous Page',
        function(player)
        menu.options = page12
        delaySendMenu(player) 
        end
    },
}
page14 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page13
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Taru F
--------------------------------------------------------------
page16 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page17
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page17 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page18
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page16
        delaySendMenu(player) 
        end
    },
}
page18 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page17
        delaySendMenu(player) 
        end
    },
}

--------------------------------------------------------------
----- Taru M
--------------------------------------------------------------
page20 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player)  
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page21
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page21 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page22
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page20
        delaySendMenu(player) 
        end
    },
}
page22 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 24)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 25)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page23
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page21
        delaySendMenu(player) 
        end
    },
}
page23 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '21',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '22',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page22
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Hume F
--------------------------------------------------------------
page24 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page25
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page25 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page26
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page24
        delaySendMenu(player) 
        end
    },
}
page26 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page27
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page25
        delaySendMenu(player) 
        end
    },
}
page27 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '21',
        function(player)
        player:setCharVar('[FaceChange]', 31)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page26
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Hume M
--------------------------------------------------------------
page28 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page29
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page29 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page30
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page28
        delaySendMenu(player) 
        end
    },
}
page30 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 25)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page31
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page29
        delaySendMenu(player) 
        end
    },
}
page31 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '21',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '22',
        function(player)
        player:setCharVar('[FaceChange]', 32)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page30
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Elvaan F
--------------------------------------------------------------
page32 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page33
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page33 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page34
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page32
        delaySendMenu(player) 
        end
    },
}
page34 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page35
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page33
        delaySendMenu(player) 
        end
    },
}
page35 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 29)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page34
        delaySendMenu(player) 
        end
    },
}
--------------------------------------------------------------
----- Elvaan M
--------------------------------------------------------------
page36 =
{
    {
        '1',
        function(player)
        player:setCharVar('[FaceChange]', 1)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '2',
        function(player)
        player:setCharVar('[FaceChange]', 2)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '3',
        function(player)
        player:setCharVar('[FaceChange]', 3)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '4',
        function(player)
        player:setCharVar('[FaceChange]', 4)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '5',
        function(player)
        player:setCharVar('[FaceChange]', 5)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '6',
        function(player)
        player:setCharVar('[FaceChange]', 6)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page37
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page6
        delaySendMenu(player) 
        end
    },
}

page37 = 
{
    {
        '7',
        function(player)
        player:setCharVar('[FaceChange]', 7)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '8',
        function(player)
        player:setCharVar('[FaceChange]', 8)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '9',
        function(player)
        player:setCharVar('[FaceChange]', 9)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '10',
        function(player)
        player:setCharVar('[FaceChange]', 10)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '11',
        function(player)
        player:setCharVar('[FaceChange]', 11)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '12',
        function(player)
        player:setCharVar('[FaceChange]', 12)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page38
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page36
        delaySendMenu(player) 
        end
    },
}
page38 =
{
    {
        '13',
        function(player)
        player:setCharVar('[FaceChange]', 13)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '14',
        function(player)
        player:setCharVar('[FaceChange]', 14)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '15',
        function(player)
        player:setCharVar('[FaceChange]', 15)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '16',
        function(player)
        player:setCharVar('[FaceChange]', 16)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '17',
        function(player)
        player:setCharVar('[FaceChange]', 26)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '18',
        function(player)
        player:setCharVar('[FaceChange]', 27)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Next Page',
        function(player)
        menu.options = page39
        delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page37
        delaySendMenu(player) 
        end
    },
}
page39 =
{
    {
        '19',
        function(player)
        player:setCharVar('[FaceChange]', 28)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '20',
        function(player)
        player:setCharVar('[FaceChange]', 30)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        '21',
        function(player)
        player:setCharVar('[FaceChange]', 31)
        menu.options = page15
         delaySendMenu(player) 
        end
    },
    {
        'Previous Page',
        function(player)
        menu.options = page38
        delaySendMenu(player) 
        end
    },
}

page15 =
{
    {
        'Yes',
        function(player)
        local face = player:getCharVar('[FaceChange]')
        local change = player:getCharVar('[GMEvent]freefc')
        local toString = { 'Hume Male', 'Hume Female', 'Elvan Male', 'Elvan Female', 'Taru Male', 'Taru Female', 'Mithra', 'Galka' }
        if change > 0 then
            player:printToPlayer('Thank you, your Face is now being changed!', 0, 'Alfred')
            player:setFace(face)
            player:setCharVar('[FaceChange]', 0)
            player:setCharVar('[GMEvent]freefc', player:getCharVar('[GMEvent]freefc') -1 )
            player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
            player:timer(1000, function()
            player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
            end)
        elseif change == 0 and player:getGil() < 500000 then
            player:printToPlayer('You do not have enough gil to make this purchase!. ', 0, 'Alfred')
        elseif change == 0 and player:getGil() > 500000 then
            player:printToPlayer('Thank you, your Face is now being changed!', 0, 'Alfred')
            player:delGil(500000)
            player:setFace(face)
            player:setCharVar('[FaceChange]', 0)
            player:injectActionPacket(player:getID(), 6, 643, 0, 0, 0, 10, 1)
            player:timer(1000, function()
            player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
            end)
        end
        end,
    },
    {
        'No',
        function(player)
                    player:setCharVar('[FaceChange]', 0)             
        end,
    },
}


m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
    super(zone)
    local npc = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Alfred',
        look = '01000001cd10e620e630eb40eb50006000700000',
        x = 376.0488,
        y = -2.2232,
        z = -568.0360,
        rotation = 119,

        onTrade = function(player, npc, trade)
            -- Do stuff
        end,
        onTrigger = function(player, npc)
               player:printToPlayer('So you wish to change your Race and or Face do you?.', 0, 'Alfred')
               player:printToPlayer('A small fee will be charged to make this change if you do not have a ', 0, 'Alfred')
               player:printToPlayer('free race or free face change certificate. The fee is..', 0, 'Alfred')
               player:printToPlayer('1 Million gil for Race change, 500k for face change. No refund will be provided', 0, 'Alfred')
               player:printToPlayer('if you chose a face or race you do not like!', 0, 'Alfred')
               menu.options = page1
               delaySendMenu(player)
        end,
        releaseIdOnDisappear = true,
    })
    utils.unused(npc)
end)


return m

