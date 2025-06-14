require('scripts/globals/mixins')
require('scripts/globals/utils')

g_mixins = g_mixins or {}

-----------------------------------
-- Drops Resistance credits
-----------------------------------
g_mixins.drop_resistance_credit = function(mob)

    mob:addListener('DEATH', 'RESISTANCE_MOB_DEATH', function(mob, player)
    local modifier = 5 * player:checkDifficulty(mob)
        if player then
            local alliance = player:getAlliance()
            for _, member in pairs(alliance) do
                if mob:isNM() then
                member:addCurrency('resistance_credit', modifier)
                member:printToPlayer(string.format('you obtained %s resistance_credit', modifier))
                end
            end
        end
    end)
end

return g_mixins.drop_resistance_credit
