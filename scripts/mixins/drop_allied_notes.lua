require('scripts/globals/mixins')
require('scripts/globals/utils')

g_mixins = g_mixins or {}

-----------------------------------
-- Drops Allied notes
-----------------------------------
g_mixins.drop_allied_notes = function(mob)

    mob:addListener('DEATH', 'ALLIED_MOB_DEATH', function(mob, player)
    local modifier = 12 * player:checkDifficulty(mob)
        if player then
            local alliance = player:getAlliance()
            for _, member in pairs(alliance) do
                if member:hasStatusEffect(xi.effect.SIGIL) then
                member:addCurrency('allied_notes', modifier)
                member:printToPlayer(string.format('you obtained %s allied notes', modifier))
                end
            end
        end
    end)
end

return g_mixins.drop_allied_notes
