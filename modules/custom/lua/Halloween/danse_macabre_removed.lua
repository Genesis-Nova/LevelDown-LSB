require("scripts/globals/mobskills")
require("modules/module_utils")
-----------------------------------
local m = Module:new("mobskill_danse_macabre_remove")

-- Skill ID for Danse Macabre
local DANSE_MACABRE_ID = 533

-- Override to prevent Danse Macabre from being selectable in specific city zones
m:addOverride("xi.actions.mobskills.danse_macabre.onMobSkillCheck", function(target, mob, skill)
    local zoneId = mob:getZoneID()

    -- Check if the mob is in one of the specific city zones
    if zoneId == xi.zone.BASTOK_MARKETS or zoneId == xi.zone.SOUTHERN_SAN_DORIA or zoneId == xi.zone.WINDURST_WOODS or zoneId == xi.zone.MOG_GARDEN then
        -- Prevent Danse Macabre from being used in these zones
        if skill:getID() == DANSE_MACABRE_ID then
            return xi.msg.basic.SKILL_MISS
        end
    end

    return 0  -- Allow the skill to proceed in all other zones
end)

-- Override for Danse Macabre skill application
m:addOverride("xi.actions.mobskills.danse_macabre.onMobWeaponSkill", function(target, mob, skill)
    local power = 0

    -- Ensure the skill logic is only applied if it has passed the skill check
    if not target:isPC() then
        skill:setMsg(xi.msg.basic.SKILL_MISS)
        return xi.effect.CHARM_I
    end

    local msg = xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.CHARM_I, power, 3, 60)
    if msg == xi.msg.basic.SKILL_ENFEEB_IS then
        mob:charm(target)  -- Apply charm
    end

    skill:setMsg(msg)
    return xi.effect.CHARM_I
end)

return m
