-----------------------------------
-- Mega Holy
-- Family: Avatar (Alexander)
-- Description: Deals Light damage to targets in an area of effect.
-- Notes: Accompanied by text:
-- 'Open thine eyes...
-- My radiance...shall guide thee...'
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill, action)
    local params = {}

    params.baseDamage     = mob:getMainLvl() * 2
    params.fTP            = { 9, 9, 9 } -- TODO: Capture fTPs
    params.element        = xi.element.LIGHT
    params.attackType     = xi.attackType.MAGICAL
    params.damageType     = xi.damageType.LIGHT
    params.shadowBehavior = xi.mobskills.shadowBehavior.WIPE_SHADOWS

    --print("Mega Holy Debug: Caster: " .. mob:getName() .. " Target: " .. target:getName())
    --print("Mega Holy Debug: Base Damage: " .. params.baseDamage)

    local info = xi.mobskills.mobMagicalMove(mob, target, skill, action, params)

    --print("Mega Holy Debug: Calculated Damage: " .. info.damage)

    if xi.mobskills.processDamage(mob, target, skill, action, info) then
        target:takeDamage(info.damage, mob, info.attackType, info.damageType)
    else
        --print("Mega Holy Debug: processDamage returned false")
    end

    return info.damage
end

return mobskillObject
