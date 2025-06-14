-----------------------------------
-- Crystal Merchant (Mog_Garden)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
require("scripts/globals/missions")
require("modules/module_utils")
require("scripts/zones/Mog_Garden/Zone")
local ID = require("scripts/zones/Mog_Garden/IDs")
-----------------------------------
local m = Module:new("crystal_merchant")

m:addOverride('xi.zones.Mog_Garden.Zone.onInitialize', function(zone)
super(zone)

    local crystal_stock =
    {
        4096,   100,   -- Fire Crystal
        4097,   100,   -- Ice Crystal
        4098,   100,   -- Wind Crystal
        4099,   100,   -- Earth Crystal
        4100,   100,   -- Lightning Crystal
        4101,   100,   -- Water Crystal
        4102,   100,   -- Light Crystal
        4103,   100,   -- Dark Crystal
        4238,   5000,  -- HQ Fire Crystal
        4239,   5000,  -- HQ Ice Crystal
        4240,   5000,  -- HQ Wind Crystal
        4241,   5000,  -- HQ Earth Crystal
        4242,   5000,  -- HQ Lightning Crystal
        4243,   5000,  -- HQ Water Crystal
        4244,   5000,  -- HQ Light Crystal
        4245,   5000,  -- HQ Dark Crystal
    }

    local crystalmerchant = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Melon Head",
        look = 3158,
        x = 335.2805,
        y = -3.0842,
        z = -545.6152,
        rotation = 52,
        widescan = 1,

        onTrade = function(player, npc, trade)
        end,

        -- Offer crystals to buy
        onTrigger = function(player, npc)
            player:printToPlayer("Welcome to the Crystal Shop!", 0, npc:getPacketName())
            xi.shop.general(player, crystal_stock)
        end,
    })

    utils.unused(crystalmerchant)
end)

return m
