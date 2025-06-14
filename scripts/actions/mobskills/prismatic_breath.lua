-----------------------------------
--  Prismatic Breath
--
--  Description: AoE (conal) damage & Inhibit TP (Store TP reduction)
--  
--
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.INHIBIT_TP, 50, 0, 60)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, skill, 0.15, 3, xi.element.EARTH, 500)
    local dmg = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.EARTH, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.EARTH, { breakBind = false })

    return dmg
end

return mobskillObject
