-----------------------------------
require("modules/module_utils")
-----------------------------------


local m = Module:new("nexuscape_update")
-----------------------------------------------------------------------------------
--- adjust nexus cape---------------------------------------------
-----------------------------------------------------------------------------------

m:addOverride("xi.items.nexus_cape.onItemCheck", function(target)

local function player_hate()
    local party = target:getParty()
    for _, partyMember in pairs(party) do
         if partyMember:hasEnmity() then
            local a, b = partyMember:hasEnmity(), true
                     if a==b then
                        return true
                     end
                        end
                        return false
         end 
    end


    local result = xi.msg.basic.ITEM_UNABLE_TO_USE
    local leader = target:getPartyLeader()

    if leader ~= nil and not leader:isInMogHouse() then
        if leader:hasStatusEffect(xi.effect.BATTLEFIELD) or
           player_hate() == true or
           leader:isEngaged() or
           target:getID() == leader:getID() or
           leader:getZone() == 222 then -- update to not allow nexus cap to transport player to Provenance
                    result = xi.msg.basic.ITEM_UNABLE_TO_USE_PARTY_LEADER
        else
                    result = 0
        end
    end

    return result
end)

m:addOverride("xi.items.nexus_cape.onItemUse", function(target)
    local leader = target:getPartyLeader()
    target:setPos(leader:getXPos(), leader:getYPos(), leader:getZPos(), leader:getRotPos(), leader:getZoneID())
end)

return m