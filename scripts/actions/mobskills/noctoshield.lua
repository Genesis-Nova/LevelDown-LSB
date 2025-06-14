-----------------------------------
-- noctoshield
-- adds phalanx to mob
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.PHALANX, 50, 0, 180))

    return xi.effect.PHALANX
end

return mobskillObject
