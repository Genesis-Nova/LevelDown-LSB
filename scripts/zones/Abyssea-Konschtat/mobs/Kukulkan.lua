-----------------------------------
-- Area: Abyssea - Konschtat (15)
--   NM: Kukulkan
-----------------------------------
mixins = { require('scripts/mixins/families/peiste') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.KUKULKAN_DEFANGER)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2932)
        else
            local obtained = member:addItem(2932, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 2932)
            end
        end
     end
end

return entity
