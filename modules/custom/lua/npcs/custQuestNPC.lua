-----------------------------------
-- Custom Quest NPCS
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('custQuestNPC')

m:addOverride('xi.zones.Bastok_Markets.Zone.onInitialize', function(zone)
    --  Call the zone's original function for onInitialize
    super(zone)

    local questNPC1 = zone:insertDynamicEntity({

        --  NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Quest Purveyor', 
        look = '0x01000c08141019200c3002400250006000700000',
        x = -211.1315,
        y = 2.0000,
        z = -149.4073,
        rotation = 2,
        widescan = 1,


         onTrade = function(player, npc, trade)
            xi.custom_quest.onTrade(player, npc, trade)
         end,

         onTrigger = function(player, npc)
            xi.custom_quest.onTrigger(player, npc)
         end,
    })
    utils.unused(questNPC1)
end)

m:addOverride('xi.zones.Southern_San_dOria.Zone.onInitialize', function(zone)
    --  Call the zone's original function for onInitialize
    super(zone)

    local questNPC2 = zone:insertDynamicEntity({

        --  NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Quest Purveyor', 
        look = '0x01000c03141019200c3002400250006000700000',
        x = 34.0392,
        y = 0.0000,
        z = 33.9942,
        rotation = 97,
        widescan = 1,


         onTrade = function(player, npc, trade)
            xi.custom_quest.onTrade(player, npc, trade)
         end,

         onTrigger = function(player, npc)
            xi.custom_quest.onTrigger(player, npc)
         end,
    })
    utils.unused(questNPC2)
end)

m:addOverride('xi.zones.Windurst_Woods.Zone.onInitialize', function(zone)
    --  Call the zone's original function for onInitialize
    super(zone)

    local questNPC3 = zone:insertDynamicEntity({

        --  NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Quest Purveyor', 
        look = '0x01000c06141019200c3002400250006000700000',
        x = -3.9805,
        y = 2.6214,
        z = -45.5793,
        rotation = 63,
        widescan = 1,


         onTrade = function(player, npc, trade)
            xi.custom_quest.onTrade(player, npc, trade)
         end,

         onTrigger = function(player, npc)
            xi.custom_quest.onTrigger(player, npc)
         end,
    })
    utils.unused(questNPC3)
end)

m:addOverride('xi.zones.Upper_Jeuno.Zone.onInitialize', function(zone)
    --  Call the zone's original function for onInitialize
    super(zone)

    local questNPC4 = zone:insertDynamicEntity({

        --  NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Quest Purveyor', 
        look = '0x01000303141019200c3002400250056000700000',
        x = -75.4864,
        y = 0.0001,
        z = 118.8782,
        rotation = 231,
        widescan = 1,


         onTrade = function(player, npc, trade)
            xi.custom_quest.onTrade(player, npc, trade)
         end,

         onTrigger = function(player, npc)
            xi.custom_quest.onTrigger(player, npc)
         end,
    })
    utils.unused(questNPC4)
end)

return m