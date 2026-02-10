-----------------------------------
-- Additional Effects (Item-based)
-----------------------------------
require('scripts/globals/teleports')
require('scripts/globals/magic')

xi = xi or {}
xi.additionalEffect = xi.additionalEffect or {}
xi.additionalEffect.procFunctions = xi.additionalEffect.procFunctions or {}

-----------------------------------
-- Stat Bonus Helper
-----------------------------------
xi.additionalEffect.dStatBonus = function(attacker, defender, dStat, damage)
    local statTable =
    {
        [xi.mod.MND] = { cStat = xi.mod.MND, softcap = 40 },
        [xi.mod.INT] = { cStat = xi.mod.INT, softcap = 20 },
    }

    local row = statTable[dStat]
    if not row then
        return damage
    end

    local bonus
    if dStat >= xi.mod.STR and dStat <= xi.mod.CHR then
        bonus = attacker:getStat(dStat) - defender:getStat(row.cStat)
    else
        bonus = attacker:getMod(dStat) - defender:getMod(row.cStat)
    end

    if bonus and bonus > 0 then
        if row.softcap > 0 and bonus > row.softcap then
            bonus = bonus + (bonus - row.softcap) / 2
        end
        damage = damage + bonus
    end

    return damage
end

-----------------------------------
-- Magical additional damage
-----------------------------------
xi.additionalEffect.calcDamage = function(attacker, element, defender, damage)
    local params = { bonusmab = 0, includemab = false }

    damage = addBonusesAbility(attacker, element, defender, damage, params)
    damage = math.floor(damage * applyResistanceAddEffect(attacker, defender, element, 0))
    damage = math.floor(damage * xi.spells.damage.calculateAbsorption(defender, element, true))
    damage = math.floor(damage * xi.spells.damage.calculateNullification(defender, element, true, false))
    damage = finalMagicNonSpellAdjustments(attacker, defender, element, damage)

    return damage
end

xi.additionalEffect.calcPhysDamage = function(attacker, defender, item, params)
    params.isPhysical = params.isPhysical or false
    params.isRanged   = params.isRanged or false
    params.isBreath   = params.isBreath or false
    params.damageType = params.damageType or xi.damageType.NONE
    params.damage     = math.floor(params.damage) or 0

    if params.damage == 0 then
        return 0
    end

    -- Check nullification
    if math.random(1, 100) <= defender:getMod(xi.mod.NULL_DAMAGE) then
        return 0
    end

    if
        params.isPhysical and
        math.random(1, 100) <= defender:getMod(xi.mod.NULL_PHYSICAL_DAMAGE)
    then
        return 0
    end

    if
        params.isRanged and
        math.random(1, 100) <= defender:getMod(xi.mod.NULL_RANGED_DAMAGE)
    then
        return 0
    end

    if
        params.isBREATH and
        math.random(1, 100) <= defender:getMod(xi.mod.NULL_BREATH_DAMAGE)
    then
        return 0
    end

    -- Check absorbs
    -- Absorb: All damage.
    if math.random(1, 100) <= defender:getMod(xi.mod.ABSORB_DMG_CHANCE) then
        return params.damage * -1
    end

    -- Absorb: ranged or phys
    if
        (params.isPhysical or params.isRanged) and
        math.random(1, 100) <= defender:getMod(xi.mod.PHYS_ABSORB)
    then
        return params.damage * -1
    end

    params.damage = params.damage * xi.combat.damage.calculateDamageAdjustment(defender, params.isPhysical, false, params.isRanged, params.isBreath)

    -- multiplicative
    switch (params.damageType) : caseof
    {
        [xi.damageType.PIERCING] = function()
            params.damage = params.damage * (1 + defender:getMod(xi.mod.PIERCE_SDT) / 10000)
        end,

        [xi.damageType.SLASHING] = function()
            params.damage = params.damage * (1 + defender:getMod(xi.mod.SLASH_SDT) / 10000)
        end,

        [xi.damageType.BLUNT] = function() -- aka IMPACT
            params.damage = params.damage * (1 + defender:getMod(xi.mod.IMPACT_SDT) / 10000)
        end,

        [xi.damageType.HTH] = function()
            params.damage = params.damage * (1 + defender:getMod(xi.mod.HTH_SDT) / 10000)
        end,
    }

    params.damage = math.floor(params.damage)

    params.damage = utils.handlePhalanx(defender, params.damage)
    params.damage = utils.handleStoneskin(defender, params.damage)

    return params.damage
end

xi.additionalEffect.procType =
{
    DAMAGE           = 1,
    DEBUFF           = 2,
    HP_HEAL          = 3,
    MP_HEAL          = 4,
    HP_DRAIN         = 5,
    MP_DRAIN         = 6,
    TP_DRAIN         = 7,
    HPMP_DRAIN       = 8,
    HPMPTP_DRAIN     = 9,
    DISPEL           = 10,
    ABSORB_STATUS    = 11,
    SELF_BUFF        = 12,
    DEATH            = 13,
    NM_SPECIFIC      = 14,
    PHYS_DAMAGE      = 15,
    DMG_TO_MP_DRAIN  = 16,
}

-----------------------------------
-- Damage → MP Drain (10%~20%)
-----------------------------------
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.DMG_TO_MP_DRAIN] =
function(attacker, defender, item, params)
    local damageDealt = params.baseAttackDamage or 0
    if damageDealt <= 0 then
        return 0, 0, 0
    end

    local percent = math.random(10, 20) / 100
    local drain   = math.floor(damageDealt * percent)

    drain = math.min(drain, defender:getHP())
    if drain <= 0 then
        return 0, 0, 0
    end

    attacker:addMP(drain)

    return params.subEffect, xi.msg.basic.ADD_EFFECT_MP_DRAIN, drain
end

-----------------------------------
-- Standard HP Drain
-----------------------------------
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.HP_DRAIN] =
function(attacker, defender, item, params)
    if defender:isUndead() then
        return 0, 0, 0
    end

    params.element = xi.element.DARK
    local dmg = xi.additionalEffect.calcDamage(attacker, params.element, defender, params.damage)
    dmg = math.min(dmg, defender:getHP())

    attacker:addHP(dmg)
    return params.subEffect, xi.msg.basic.ADD_EFFECT_HP_DRAIN, dmg
end

-----------------------------------
-- Standard MP Drain
-----------------------------------
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.MP_DRAIN] =
function(attacker, defender, item, params)
    if defender:isUndead() then
        return 0, 0, 0
    end

    params.element = xi.element.DARK
    local dmg = xi.additionalEffect.calcDamage(attacker, params.element, defender, params.damage)
    dmg = math.min(dmg, defender:getMP())

    defender:addMP(-dmg)
    attacker:addMP(dmg)

    return params.subEffect, xi.msg.basic.ADD_EFFECT_MP_DRAIN, dmg
end

-----------------------------------
-- Attack Entry Point
-----------------------------------
xi.additionalEffect.attack = function(attacker, defender, baseAttackDamage, item)
    local params =
    {
        dStat     = item:getMod(xi.mod.ITEM_ADDEFFECT_DSTAT),
        addType   = item:getMod(xi.mod.ITEM_ADDEFFECT_TYPE),
        subEffect = item:getMod(xi.mod.ITEM_SUBEFFECT),
        damage    = item:getMod(xi.mod.ITEM_ADDEFFECT_DMG),
        chance    = item:getMod(xi.mod.ITEM_ADDEFFECT_CHANCE),
        element   = item:getMod(xi.mod.ITEM_ADDEFFECT_ELEMENT),
        addStatus = item:getMod(xi.mod.ITEM_ADDEFFECT_STATUS),
        power     = item:getMod(xi.mod.ITEM_ADDEFFECT_POWER),
        duration  = item:getMod(xi.mod.ITEM_ADDEFFECT_DURATION),
        baseAttackDamage = baseAttackDamage,
    }

    if item:getReqLvl() > attacker:getMainLvl() then
        return 0, 0, 0
    end

    if math.random(1, 100) > params.chance then
        return 0, 0, 0
    end

    if params.dStat > 0 then
        params.damage = xi.additionalEffect.dStatBonus(attacker, defender, params.dStat, params.damage)
    end

    local proc = xi.additionalEffect.procFunctions[params.addType]
    if proc then
        return proc(attacker, defender, item, params)
    end

    return 0, 0, 0
end