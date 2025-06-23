-----------------------------------
-- Area: Bibiki Bay
--  NPC: Fheli Lapatzuo
-- Type: Manaclipper Timekeeper
-- !pos 488.793 -4.003 709.473 4
-----------------------------------
---@type TNpcEntity
require('modules/module_utils')
require("scripts/globals/npc_util")

local m = Module:new('Fheli_Lapatzuo')

m:addOverride('xi.zones.Bibiki_Bay.npcs.Fheli_Lapatzuo.onTrade', function(player, npc, trade)
    super(player, npc, trade)
	if trade:getGil() == 1000 then
        player:tradeComplete()
        player:setPos(-393.5172, -3.0001, -389.4102, 66, 4)
    end
end)

return m