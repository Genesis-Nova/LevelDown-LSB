-----------------------------------
--  Flank Opening
--  Description: Aoe High Damage/knockback & gains Defense Down Aura
--  Type: Physical
--  Range: aoe
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 2
    local dmgmod = 1.1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
        target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
        mob:addStatusEffectEx(xi.effect.DEFENSE_DOWN, xi.effect.DEFENSE_DOWN, 10, 3, 30, 0, 0, xi.auraTarget.ENEMIES, xi.effectFlag.AURA)
    return dmg
end

return mobskillObject