-----------------------------------
-- Updated to include accepting Omega and Fenrir 
-----------------------------------

require("modules/module_utils")
require("scripts/globals/npc_util")
local ID = zones[xi.zone.UPPER_JEUNO]

local m = Module:new("Mapitoto")

m:addOverride("xi.zones.Upper_Jeuno.npcs.Mapitoto.onTrade", function(player, npc, trade)
    if
        player:hasKeyItem(xi.ki.TRAINERS_WHISTLE) and
        trade:getSlotCount() == 1 and
        npcUtil.tradeHasExactly(trade, xi.item.MOUNT_FENRIR) then
        player:tradeComplete()
        npcUtil.giveKeyItem(player, xi.ki.FENRIR_WHISTLE)
    elseif
           player:hasKeyItem(xi.ki.TRAINERS_WHISTLE) and
           trade:getSlotCount() == 1 and
           npcUtil.tradeHasExactly(trade, xi.item.MOUNT_OMEGA) then
           player:tradeComplete()
           npcUtil.giveKeyItem(player, xi.ki.OMEGA_WHISTLE) 
    elseif  player:hasKeyItem(xi.ki.TRAINERS_WHISTLE) and
            trade:getSlotCount() == 1 and
        -- The Fenrir (10057) and Omega (10067) items and mounts have their own questlines, so they aren't valid trades here
            not (npcUtil.tradeHasExactly(trade, xi.item.MOUNT_FENRIR) or npcUtil.tradeHasExactly(trade, xi.item.MOUNT_OMEGA))
    then
        local item = trade:getItemId(0)
        local mount = item - xi.item.MOUNT_TIGER
        if item == xi.item.CHOCOBO_WHISTLE then
            player:startEvent(10227, xi.item.CHOCOBO_WHISTLE, xi.ki.TRAINERS_WHISTLE, xi.mount.CHOCOBO)
            player:setLocalVar('FullSpeedAheadReward', xi.ki.CHOCOBO_COMPANION)
        elseif item == xi.item.RED_RAPTOR_NOTEBOOK then -- Key Items, Items, and Mount IDs don't line up for 4 mounts starting with Red Raptor
            player:setLocalVar('FullSpeedAheadReward', xi.ki.TIGER_COMPANION + mount + 3)
            player:startEvent(10227, item, xi.ki.TRAINERS_WHISTLE, xi.mount.TIGER + mount + 2)
        elseif
            item >= xi.item.GOLDEN_BOMB_NOTEBOOK and
            item <= xi.item.WIVRE_NOTEBOOK
        then
            -- These are all offset by one due to Red Raptor
            player:setLocalVar('FullSpeedAheadReward', xi.ki.TIGER_COMPANION + mount - 1)
            player:startEvent(10227, item, xi.ki.TRAINERS_WHISTLE, xi.mount.TIGER + mount - 2)
        elseif mount >= xi.mount.CHOCOBO and mount <= xi.mount.MOUNT_MAX then
            player:setLocalVar('FullSpeedAheadReward', xi.ki.TIGER_COMPANION + mount)
            player:startEvent(10227, item, xi.ki.TRAINERS_WHISTLE, xi.mount.TIGER + mount - 1)
        end
    end
end)


return m