local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
    ensureTable('xi.zones.Nashmau.npcs.Rararoon')

require("modules/module_utils")
require("scripts/globals/npc_util")
local ID = zones[xi.zone.NASHMAU]

local m = Module:new("Rararoon")

m:addOverride("xi.zones.Nashmau.npcs.Rararoon.onTrade", function(player, npc, trade)

end)

m:addOverride("xi.zones.Nashmau.npcs.Rararoon.onTrigger", function(player, npc)
    local stock =
    {
2261,29640, -- Mana Jammer II
2412,41496, -- Hammermill
9068,41496, -- Barrier Module
9070,41496, -- Resister
2265,41496, -- Auto-Repair Kit II
9072,41496, -- Arcanic Cell
2269,41496, -- Mana Tank II
9032,53352, -- Strobe II
9066,65208, -- Amplifier
9042,65208, -- Mana Jammer III
9065,82992, -- Inhibitor II
9230,82992, -- Speedloader II
9067,82992, -- Repeater
9043,82992, -- Stealth Screen II
9071,88920, -- Resister II
9044,88920, -- Auto-Repair Kit III
9073,88920, -- Arcanic Cell II
9045,88920, -- Mana Tank III
9885,88920, -- Magniplug I
9035,100776, -- Tranquilizer II
9038,100776, -- Shock Absorber II
9041,100776, -- Coiler II
9069,100776, -- Dynamo II
9131,112632, -- Tension Spring IV
9132,112632, -- Heat Capacitor II
9133,112632, -- Loudspeaker IV
9134,112632, -- Tranquilizer III
9135,112632, -- Amplifier II
9136,112632, -- Accelerator IV
9137,112632, -- Scope III
9138,112632, -- Armor Plate IV
9139,112632, -- Shock Absorber III
9140,112632, -- Stabilizer IV
9141,112632, -- Dynamo III
9142,112632, -- Mana Jammer IV
9143,112632, -- Auto-Repair Kit IV
9074,112632, -- Regulator
9144,112632, -- Mana Tank IV
9889,112632, -- Truesights
2322,118560, -- Attuner
3307,118560, -- Heat Capacitor
2323,118560, -- Tactical Processor
3308,118560, -- Power Cooler
2324,118560, -- Drum Magazine
3309,118560, -- Barrage Turbine
2325,118560, -- Equalizer
3310,118560, -- Barrier Module II
2326,118560, -- Target Marker
3311,118560, -- Galvanizer
2327,118560, -- Mana Channeler
3312,118560, -- Percolator
2328,118560, -- Eraser
3313,118560, -- Vivi-Valve
2329,118560, -- Smoke Screen
3314,118560, -- Disruptor
9880,118560, -- tension spring v
9883,118560, -- styabilizer v
9881,118560, -- loudspeaker v
9882,112632, -- Tranquilizer IV
9884,112632, -- Scope IV
2413,185250, -- Coiler
9233,185250, -- Mana Channeler II
2414,185250, -- Steam Jacket
2347,222300, -- Reactive Shield
2348,222300, -- Tranquilizer
2349,222300, -- Turbo Charger
2350,222300, -- Schurzen
2351,222300, -- Dynamo
2352,222300, -- Condenser
2353,222300, -- Optic Fiber
2354,222300, -- Economizer
9234,321100, -- Optic Fiber II
2415,750880, -- Turbo Charger II
2416,750880, -- Vivi-Valve II
9888,750880, -- Arcanoclutch II

    }
    xi.shop.general(player, stock)

end)

m:addOverride("xi.zones.Nashmau.npcs.Rararoon.onEventUpdate", function(player, csid, option, npc)

end)

m:addOverride("xi.zones.Nashmau.npcs.Rararoon.onEventFinish", function(player, csid, option, npc)
				
end)

return m