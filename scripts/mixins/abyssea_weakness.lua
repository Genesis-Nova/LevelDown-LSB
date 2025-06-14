-- Abyssea procs mixin
-- Customization:

require('scripts/globals/mixins')
require('scripts/globals/abyssea')

g_mixins = g_mixins or {}

g_mixins.abyssea_weakness = function(mob)
    if mob:isNM() then
    --[[
        mob:addListener('SPAWN', 'ABYSSEA_WEAKNESS_SPAWN', function(mobArg)
            mobArg:setLocalVar('[CanProc]', 1)
            mobArg:setLocalVar('[RedWeakness]', xi.abyssea.getNewRedWeakness(mobArg))
            mobArg:setLocalVar('[AbysseaRedProc]', 0)
            mobArg:setLocalVar('[BlueWeakness]', xi.abyssea.getNewBlueWeakness(mobArg))
            mobArg:setLocalVar('[AbysseaBlueProc]', 0)
        end)

        mob:addListener('ENGAGE', 'ABYSSEA_WEAKNESS_ENGAGE', function(mobArg, target)
            mobArg:setLocalVar('[YellowWeakness]', xi.abyssea.getNewYellowWeakness(mobArg))
            mobArg:setLocalVar('[AbysseaYellowProc]', 0)
        end)
        ]]--
        mob:addListener('ATTACKED', 'ATTACKED_ABYSSEA_CHECK_CLAIM', function(mobArg, player, action)
            local claimed = mobArg:getLocalVar('[ClaimedBy]')
            if claimed == 0 then
                mobArg:setLocalVar('[ClaimedBy]', player:getID())
            end
        end)
        --[[
        mob:addListener('MAGIC_TAKE', 'ABYSSEA_MAGIC_PROC_CHECK', function(target, caster, spell)
            if target:canChangeState() then
              if target:getLocalVar('[AbysseaYellowProc]') == 0 then
                if spell:getID() > 0 then -- == target:getLocalVar('[YellowWeakness]') then
                    xi.abyssea.procMonster(target, caster, xi.abyssea.triggerType.YELLOW)
                end
              end
            end
        end)

        mob:addListener('WEAPONSKILL_TAKE', 'ABYSSEA_WS_PROC_CHECK', function(target, user, wsid)
            if target:canChangeState() then
               if user:isPC() then
                  if target:getLocalVar('[AbysseaRedProc]') == 0 and
                     target:getLocalVar('[AbysseaBlueProc]') == 0 then
                    if wsid > 0 then
                       xi.abyssea.procMonster(target, user, xi.abyssea.triggerType.RED)
                        target:timer(600, function(targetArg)
                            xi.abyssea.procMonster(targetArg, user, xi.abyssea.triggerType.BLUE)
                        end)
                    end
                  end
               end
            end
        end)
        ]]--
        mob:addListener('DEATH', 'ABYSSEA_DEATH_NM_KI_DROPCHECK', function(mobArg, player)
            if player ~= nil then
                xi.abyssea.giveNMDrops(mobArg, player, zones[player:getZoneID()])
            end
        end)
    end
end

return g_mixins.abyssea_weakness
