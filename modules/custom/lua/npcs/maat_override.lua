require('modules/module_utils')

local m = Module:new('maat_override')

m:addOverride('xi.server.onServerStart', function()
    super()

    xi.module.modifyInteractionEntry('scripts/quests/jeuno/LB05_1_Shattering_Stars', function(quest)
        quest.sections[1].check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
                and player:getMainJob() <= 15
                and player:getMainLvl() >= 66
        end

        local ruludeSection = quest.sections[2][xi.zone.RULUDE_GARDENS]
        if ruludeSection and ruludeSection.onEventFinish and ruludeSection.onEventFinish[93] then
            local origFinish = ruludeSection.onEventFinish[93]
            ruludeSection.onEventFinish[93] = function(player, csid, option, npc)
                if quest:complete(player) then
                    -- do nothing
                end
            end
        end
    end)
end)

return m
