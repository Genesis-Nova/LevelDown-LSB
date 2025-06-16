local ccnpc =
{
    {'Ilsoire',     262};
    {'Foulneporde', 263};
    {'Mulaitrand',  264};
    {'Saffaullette',265};
    {'Boirie',      266};
    {'Couzanne',    332};
    {'Odersille',   331};
    {'Perdric',     330};
    {'Flige',       329};
    {'Azainnie',    328};
}

local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end

for _, entry in pairs(ccnpc) do
ensureTable(string.format('xi.zones.Chocobo_Circuit.npcs.%s', entry[1]))
end
ensureTable('xi.zones.Chocobo_Circuit.npcs.GateChocoboC')
ensureTable('xi.zones.Port_Jeuno.npcs.Gate_Chocobo_Circuit')
ensureTable('xi.zones.Windurst_Woods.npcs.Gate_Chocobo_Circuit')
ensureTable('xi.zones.Southern_San_dOria.npcs.Gate_Chocobo_Circuit')
ensureTable('xi.zones.Bastok_Mines.npcs.Gate_Chocobo_Circuit')
ensureTable('xi.zones.Aht_Urhgan_Whitegate.npcs.Gate_Chocobo_Circuit')


-----------------------------------
require("modules/module_utils")
-----------------------------------

local m = Module:new("choc_race")
-----------------------------------------------------------------------------------
--- below code to activate the portals---------------------------------------------
-----------------------------------------------------------------------------------
m:addOverride('xi.zones.Chocobo_Circuit.Zone.onInitialize', function(zone)
    super(super)
                
    zone:registerCylindricalTriggerArea(1,  -508.907, -356.975, 3) -- TA1  Sandy to GCS
    zone:registerCylindricalTriggerArea(2,  -360.071, -457.893, 3) -- TA2  GSC to Sandy
    zone:registerCylindricalTriggerArea(3,  -485.767, -533.127, 3) -- TA3  Bas to GCS 
    zone:registerCylindricalTriggerArea(4,  -359.982, -502.051, 3) -- TA4  GCS to Bas 
    zone:registerCylindricalTriggerArea(5,  -149.995, -548.087, 3) -- TA5  Win to GCS 
    zone:registerCylindricalTriggerArea(6,  -280.167, -502.102, 3) -- TA6  GCS to Win 
    zone:registerCylindricalTriggerArea(7,  -326.143, -287.949, 3) -- TA7  Jeu to GCS 
    zone:registerCylindricalTriggerArea(8,  -318.238, -440.042, 3) -- TA8  GCS to Jeu 
    zone:registerCylindricalTriggerArea(9,  -164.002, -367.984, 3) -- TA9  Whi to GCS 
    zone:registerCylindricalTriggerArea(10, -279.875, -457.891, 3) -- TA10 GCS to Whi

end)

m:addOverride('xi.zones.Chocobo_Circuit.Zone.onTriggerAreaEnter', function(player, triggerArea)
    switch (triggerArea:getTriggerAreaID()): caseof
    {
        [1] = function()
            player:startEvent(249)
        end,

        [2] = function()
            player:startEvent(250)
        end,

        [3] = function()
            player:startEvent(251)
        end,

        [4] = function()
            player:startEvent(252)
        end,

        [5] = function()
            player:startEvent(253)
        end,

        [6] = function()
            player:startEvent(254)
        end,

        [7] = function()
            player:startEvent(255)
        end,

        [8] = function()
            player:startEvent(256)
        end,

        [9] = function()
            player:startEvent(257)
        end,

        [10] = function()
            player:startEvent(258)
        end,
    }

end)

m:addOverride('xi.zones.Chocobo_Circuit.Zone.onEventFinish', function(player, csid, option, npc)
    for i = 249, 258 do
        if csid == i and
            option == 1 then  
        else return
        end
    end
end)
--------------------------------------------------------------------------------------
------------ add events to npcs inside of grand central station to get to and from chocobo race
--------------------------------------------------------------------------------------
for _, entry in pairs(ccnpc) do
m:addOverride(string.format('xi.zones.Chocobo_Circuit.npcs.%s.onTrigger', entry[1]), function(player, npc)
player:startEvent(entry[2], 0, 0, 1)
end)

m:addOverride(string.format('xi.zones.Chocobo_Circuit.npcs.%s.onEventUpdate', entry[1]), function(player, csid, option, npc)
end)

m:addOverride(string.format('xi.zones.Chocobo_Circuit.npcs.%s.onEventFinish', entry[1]), function(player, csid, option, npc)
end)
end
-----------------------------------------------------------------------------------
----- below is chocobo circuit exit door back to primary zones
-----------------------------------------------------------------------------------
m:addOverride('xi.zones.Chocobo_Circuit.npcs.GateChocoboC.onTrigger', function(player, npc)
    if
        npc:getID() == 17064139 or
        npc:getID() == 17064138 or
        npc:getID() == 17064137 or
        npc:getID() == 17064136 or
        npc:getID() == 17064135 then
        local exitz = npc:getID()
        if exitz == 17064139 then
             player:startEvent(248)
             return
        elseif exitz == 17064138 then
             player:startEvent(247)
             return
        elseif exitz == 17064137 then
             player:startEvent(246)
             return
        elseif exitz == 17064136 then
             player:startEvent(245)
             return
        elseif exitz == 17064135 then
             player:startEvent(244) 
             return
        end
    end
end)

m:addOverride('xi.zones.Chocobo_Circuit.npcs.GateChocoboC.onEventFinish', function(player, csid, option, npc)

     local ExSanPos = {x = -26.8885,  y = -2.0000, z = -84.1997,  rot = 1} -- npc 17064135
     local ExWhiPos = {x = -80.3384,  y = 0.0000,  z = 104.1053,  rot = 65} -- npc 17064139
     local ExBasPos = {x = 64.8047,   y = 0.0000,  z = -84.3337,  rot = 156} -- npc 17064136
     local ExWinPos = {x = 114.9722,  y = -5.0000, z = -137.4833, rot = 191} -- npc 17064137
     local ExPJuePos = {x = 23.2669,   y = 0.0000,  z = 10.5409,   rot = 70} -- npc 17064138
     local ExLJuePos = {x = -94.2640,  y = -0.1000, z = -196.6617, rot = 22}
     local ExUJuePos = {x = -53.3895,  y = 8.0000,  z = 114.4873,  rot = 113}
     local ExRJuePos = {x = 0.0344,    y = 3.0000,  z = -5.1820,   rot = 192} 

        if csid == 248 and option == 1 then
             player:setPos(ExWhiPos.x, ExWhiPos.y, ExWhiPos.z, ExWhiPos.rot, xi.zone.AHT_URHGAN_WHITEGATE)
             return
        elseif csid == 247 and option == 1 then 
             player:setPos(ExRJeuPos.x, ExRJeuPos.y, ExRJeuPos.z, ExRJeuPos.rot, xi.zone.RULUDE_GARDENS)
             return
        elseif csid == 247 and option == 2 then 
             player:setPos(ExUJeuPos.x, ExUJeuPos.y, ExUJeuPos.z, ExUJeuPos.rot, xi.zone.UPPER_JEUNO)
             return
        elseif csid == 247 and option == 3 then 
             player:setPos(ExLJeuPos.x, ExLJeuPos.y, ExLJeuPos.z, ExLJeuPos.rot, xi.zone.LOWER_JEUNO)
             return
        elseif csid == 247 and option == 4 then 
             player:setPos(ExPJeuPos.x, ExPJeuPos.y, ExPJeuPos.z, ExPJeuPos.rot, xi.zone.PORT_JEUNO)
             return
        elseif csid == 244 and option == 1 then
             player:setPos(ExSanPos.x, ExSanPos.y, ExSanPos.z, ExSanPos.rot, xi.zone.SOUTHERN_SAN_DORIA)
             return
        elseif csid == 245 and option == 1 then 
             player:setPos(ExBasPos.x, ExBasPos.y, ExBasPos.z, ExBasPos.rot, xi.zone.BASTOK_MINES)
             return
        elseif csid == 246 and option == 1 then 
             player:setPos(ExWinPos.x, ExWinPos.y, ExWinPos.z, ExWinPos.rot, xi.zone.WINDURST_WOODS)
             return
        end
end)
-----------------------------------------------------------------------------------
----- below code is the entrance doors in primary zones to get into chocobo circuit
-----------------------------------------------------------------------------------
m:addOverride('xi.zones.Port_Jeuno.npcs.Gate_Chocobo_Circuit.onTrigger', function(player, npc)
    player:startEvent(319)
end)

m:addOverride('xi.zones.Port_Jeuno.npcs.Gate_Chocobo_Circuit.onEventFinish', function(player, csid, option, npc)
     local EnJeuPos = {x = -339.5964, y = -0.0162, z = -311.8636, rot = 193} -- npc 17784965
     if csid == 319 and option == 1 then
                  player:setPos(EnJeuPos.x, EnJeuPos.y, EnJeuPos.z, EnJeuPos.rot, xi.zone.CHOCOBO_CIRCUIT)
     end 
end)

m:addOverride('xi.zones.Windurst_Woods.npcs.Gate_Chocobo_Circuit.onTrigger', function(player, npc)
    player:startEvent(795)
end)

m:addOverride('xi.zones.Windurst_Woods.npcs.Gate_Chocobo_Circuit.onEventFinish', function(player, csid, option, npc)
     local EnWinPos = {x = -136.2420, y = 0.0001,  z = -524.5361, rot = 67} -- npc 17764598
     if csid == 795 and option == 1 then
                  player:setPos(EnWinPos.x, EnWinPos.y, EnWinPos.z, EnWinPos.rot, xi.zone.CHOCOBO_CIRCUIT)
     end 
end)

m:addOverride('xi.zones.Southern_San_dOria.npcs.Gate_Chocobo_Circuit.onTrigger', function(player, npc)
    player:startEvent(882)
end)

m:addOverride('xi.zones.Southern_San_dOria.npcs.Gate_Chocobo_Circuit.onEventFinish', function(player, csid, option, npc)
     local EnSanPos = {x = -487.5752, y = -0.0198, z = -371.0724, rot = 127} -- npc 17719609
     if csid == 882 and option == 1 then
                  player:setPos(EnSanPos.x, EnSanPos.y, EnSanPos.z, EnSanPos.rot, xi.zone.CHOCOBO_CIRCUIT)
     end 
end)

m:addOverride('xi.zones.Bastok_Mines.npcs.Gate_Chocobo_Circuit.onTrigger', function(player, npc)
    player:startEvent(566)
end)

m:addOverride('xi.zones.Bastok_Mines.npcs.Gate_Chocobo_Circuit.onEventFinish', function(player, csid, option, npc)
     local EnBasPos = {x = -513.0621, y = -0.0199, z = -526.3980, rot = 25} -- npc 17735858
     if csid == 566 and option == 1 then
                  player:setPos(EnBasPos.x, EnBasPos.y, EnBasPos.z, EnBasPos.rot, xi.zone.CHOCOBO_CIRCUIT)
     end 
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Gate_Chocobo_Circuit.onTrigger', function(player, npc)
    player:startEvent(132)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Gate_Chocobo_Circuit.onEventFinish', function(player, csid, option, npc)
     local EnWhiPos = {x = -150.5147, y = 0.0000,  z = -390.0557, rot = 194} -- npc 16982083
     if csid == 132 and option == 1 then
                  player:setPos(EnWhiPos.x, EnWhiPos.y, EnWhiPos.z, EnWhiPos.rot, xi.zone.CHOCOBO_CIRCUIT)
     end 
end)

return m

