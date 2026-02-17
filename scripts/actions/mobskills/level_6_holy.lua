-----------------------------------
-- Level 6 Holy (ID: 2457)
-- Dice Roll: 6
-- Description: Deals Light damage to targets in an area of effect.
-- Mechanic: Hits if target Max HP is divisible by 6.
-- Notes: If Divine Favor is active, damage is lethal.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local divisor = 6
    local targets = {}

    if target:isPC() then
        targets = target:getParty() or { target }
    elseif target:isPet() or target:isTrust() then
        local master = target:getMaster()
        if master and master:isPC() then
            targets = master:getParty() or { master }
        else
            targets = { target }
        end
    else
        targets = { target }
    end

    local divineFavor = false
    if mob:getLocalVar("DivineFavor") == 1 then
        divineFavor = true
        mob:setLocalVar("DivineFavor", 0)
    end

    for _, member in ipairs(targets) do
        if member:getZoneID() == mob:getZoneID() and member:checkDistance(mob) <= 20 and not member:isDead() then
            local maxHP = member:getMaxHP()
            print("Level 6 Holy: Target " .. member:getName() .. " MaxHP: " .. maxHP)

            if maxHP % divisor == 0 then
                local dmg = math.random(1000, 2000)
                if divineFavor then dmg = 30000 end

                print("Level 6 Holy: Base Damage for " .. member:getName() .. ": " .. dmg)
                dmg = xi.mobskills.mobMagicalMove(mob, member, skill, dmg, xi.element.LIGHT, 1, xi.mobskills.magicalTpBonus.NO_EFFECT)
                print("Level 6 Holy: After mobMagicalMove: " .. dmg)
                dmg = xi.mobskills.mobFinalAdjustments(dmg, mob, skill, member, xi.attackType.MAGICAL, xi.damageType.LIGHT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)
                print("Level 6 Holy: After mobFinalAdjustments: " .. dmg)

                member:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.LIGHT)
            else
                print("Level 6 Holy: Missed " .. member:getName() .. " (HP not divisible by 6)")
            end
        end
    end

    return 0
end

return mobskillObject