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
-- Status Attack Helper
-----------------------------------
xi.additionalEffect.statusAttack = function(effectId, target)
    return 0
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

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.DEBUFF] = function(actor, target, item, params)
    -- Early return: No actor or target.
    if
        not actor or
        not target
    then
        return 0, 0, 0
    end

    -- Validate parameters.
    local effectId      = utils.defaultIfNil(params.addStatus, 0)
    local subEffect     = utils.defaultIfNil(params.subEffect, 0)
    local actionElement = params.element > 0 and params.element or xi.data.statusEffect.getAssociatedElement(effectId, xi.element.NONE)

    -- Early return: No effect to apply.
    if effectId == 0 then
        return 0, 0, 0
    end

    -- Early return: Target is immune to the effect.
    if xi.data.statusEffect.isTargetImmune(target, effectId, actionElement) then
        return 0, 0, 0
    end

    -- Early return: Trait nullifies effect.
    if xi.data.statusEffect.isTargetResistant(actor, target, effectId) then
        return 0, 0, 0
    end

    -- Early return: Incompatible effect in place.
    if xi.data.statusEffect.isEffectNullified(target, effectId, 0) then
        return 0, 0, 0
    end

    -- Early return: Regular resist rate.
    local resistRate = xi.combat.magicHitRate.calculateResistRate(actor, target, 0, 0, xi.skillRank.A, actionElement, xi.mod.INT, effectId, 0)
    if resistRate < 0.5 then
        return 0, 0, 0
    end

    -- Apply status effect.
    local power    = params.power
    local tick     = xi.additionalEffect.statusAttack(effectId, target)
    local duration = math.floor(params.duration * resistRate)

    target:addStatusEffect(effectId, { power = power, duration = duration, origin = actor, tick = tick })

    return subEffect, xi.msg.basic.ADD_EFFECT_STATUS_2, effectId
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.HP_HEAL] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0
    -- Its not a drain and works vs undead. https://www.bg-wiki.com/bg/Dominion_Mace
    local hitPoints = params.damage -- Note: not actually damage, if you wanted damage see HP_DRAIN instead
    -- Unknown what modifies the HP, using power directly for now
    msgID = xi.msg.basic.ADD_EFFECT_HP_HEAL
    attacker:addHP(hitPoints)
    msgParam = hitPoints

    return subEffect, msgID, msgParam
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.MP_HEAL] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    local magicPoints = params.damage
    -- Unknown what modifies this, using power directly for now
    msgID = xi.msg.basic.ADD_EFFECT_MP_HEAL
    attacker:addMP(magicPoints)
    msgParam = magicPoints

    return subEffect, msgID, msgParam
end

-- TODO: add resistance check for params.element
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.HP_DRAIN] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    -- Hardcoded for now
    params.element = xi.element.DARK
    local damage = xi.additionalEffect.calcDamage(attacker, params.element, defender, params.damage)

    -- Undead cannot be drained
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

-- TODO: add resistance check for params.element
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.DISPEL] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    local dispel = defender:dispelStatusEffect()

    if dispel == xi.effect.NONE then
        return 0, 0, 0
    else
        msgID = xi.msg.basic.ADD_EFFECT_DISPEL
        msgParam = dispel
    end

    return subEffect, msgID, msgParam
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.ABSORB_STATUS] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    -- Ripping off Aura Steal here
    local resist = applyResistanceAddEffect(attacker, defender, params.element, 0)
    if resist > 0.0625 then
        local stolen = attacker:stealStatusEffect(defender)
        msgID        = xi.msg.basic.STEAL_EFFECT
        msgParam     = stolen
    end

    return subEffect, msgID, msgParam
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.SELF_BUFF] =  function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    if params.addStatus == xi.effect.BLINK then -- BLINK http://www.ffxiah.com/item/18830/gusterion
        -- Does not stack with or replace other shadows
        if
            attacker:hasStatusEffect(xi.effect.BLINK) or
            attacker:hasStatusEffect(xi.effect.COPY_IMAGE)
        then
            return 0, 0, 0
        else
            attacker:addStatusEffect(xi.effect.BLINK, { power = params.power, duration = params.duration, origin = attacker })
            msgID    = xi.msg.basic.ADD_EFFECT_SELFBUFF
            msgParam = xi.effect.BLINK
        end
    elseif params.addStatus == xi.effect.HASTE then
        attacker:addStatusEffect(xi.effect.HASTE, { power = params.power, duration = params.duration, origin = attacker })
        -- Todo: verify power/duration/tier/overwrite etc
        msgID    = xi.msg.basic.ADD_EFFECT_SELFBUFF
        msgParam = xi.effect.HASTE
    else
        print('scripts/globals/additional_effects.lua : unhandled additional effect selfbuff! Effect ID: ' .. params.addStatus)
    end

    return subEffect, msgID, msgParam
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.DEATH] = function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    if
        defender:isNM() or
        defender:isUndead() or
        -- Todo: DeathRes has no place in the resistance functions so far..
        math.random(1, 100) > defender:getMod(xi.mod.DEATHRES) -- We are checking for a fail, not a success.
    then
        return 0, 0, 0 -- NMs immune or roll failed so return out
    else
        msgID = xi.msg.basic.ADD_EFFECT_STATUS
        msgParam = xi.effect.KO
        defender:setHP(0)
    end

    return subEffect, msgID, msgParam
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.HPMP_DRAIN] = function(attacker, defender, item, params)
    local drainRoll = math.random(1, 2) -- This is wrong and needs retail verification. Current theory is that it rolls one after another until one doesn't resist or they all resist.

    local drainFuncs =
    {
        [1] = xi.additionalEffect.procType.HP_DRAIN,
        [2] = xi.additionalEffect.procType.MP_DRAIN
    }

    return xi.additionalEffect.procFunctions[drainFuncs[drainRoll]](attacker, defender, item, params)
end

xi.additionalEffect.procFunctions[xi.additionalEffect.procType.HPMPTP_DRAIN] = function(attacker, defender, item, params)
    local drainRoll = math.random(1, 3) -- This is wrong and needs retail verification. Current theory is that it rolls one after another until one doesn't resist or they all resist.

    local drainFuncs =
    {
        [1] = xi.additionalEffect.procType.HP_DRAIN,
        [2] = xi.additionalEffect.procType.MP_DRAIN,
        [3] = xi.additionalEffect.procType.TP_DRAIN
    }

    return xi.additionalEffect.procFunctions[drainFuncs[drainRoll]](attacker, defender, item, params)
end

-- Script only for now
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.PHYS_DAMAGE] = function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0

    local damage = xi.additionalEffect.calcPhysDamage(attacker, defender, item, params)
    msgID  = xi.msg.basic.ADD_EFFECT_DMG

    if damage < 0 then
        msgID = xi.msg.basic.ADD_EFFECT_HEAL

        damage = damage * -1

        defender:addHP(damage)
    else
        defender:delHP(damage)
    end

    msgParam = damage

    return subEffect, msgID, msgParam
end

-- NM-specific additional effects configuration table
-- Options: requiredItem, specialAction, customSubEffect, customMsgID, customMsgParam
-- Add new entries here: ['NM_Name'] = { requiredItem = xi.item.ITEM_ID, specialAction = function() }
xi.additionalEffect.nmSpecificConfigs = {
    ['Brigandish_Blade'] = {
        requiredItem = xi.item.BUCCANEERS_KNIFE,
        specialAction = function(defender)
            -- If Brigandish Blade has damage immunity (at 1% HP), remove it
            if defender:getMod(xi.mod.UDMGPHYS) == -10000 then
                -- Remove all damage immunities
                defender:setMod(xi.mod.UDMGPHYS, 0)
                defender:setMod(xi.mod.UDMGRANGE, 0)
                defender:setMod(xi.mod.UDMGMAGIC, 0)
                defender:setMod(xi.mod.UDMGBREATH, 0)

                defender:setLocalVar('killable', 1)
                defender:setUnkillable(false)
            end
        end,
    },
    ['Seiryu'] = {
        requiredItem = xi.item.ZEPHYR,
        specialAction = function(defender)
            defender:setMobMod(xi.mobMod.ADD_EFFECT, 0)
        end,
    },
    ['Genbu'] = {
        requiredItem = xi.item.ANTARCTIC_WIND,
        specialAction = function(defender)
            defender:setMobMod(xi.mobMod.ADD_EFFECT, 0)
        end,
    },
    ['Suzaku'] = {
        requiredItem = xi.item.ARCTIC_WIND,
        specialAction = function(defender)
            defender:setMobMod(xi.mobMod.ADD_EFFECT, 0)
        end,
    },
    ['Byakko'] = {
        requiredItem = xi.item.EAST_WIND,
        specialAction = function(defender)
            defender:setMobMod(xi.mobMod.ADD_EFFECT, 0)
        end,
    },
}

-- NM_SPECIFIC additional effect trigger
xi.additionalEffect.procFunctions[xi.additionalEffect.procType.NM_SPECIFIC] = function(attacker, defender, item, params)
    local subEffect = params.subEffect
    local msgID     = 0
    local msgParam  = 0
    local defenderName = defender:getName()

    local config = xi.additionalEffect.nmSpecificConfigs[defenderName]
    if
        config and
        (config.requiredItem == item:getID() or
        config.requiredItem == xi.item.NONE)
    then
        -- Calculate damage
        local damage = xi.additionalEffect.calcDamage(attacker, params.element, defender, params.damage)
        msgID = xi.msg.basic.ADD_EFFECT_DMG
        msgParam = damage

        -- Execute special action if configured
        if config.specialAction then
            config.specialAction(defender)
        end

        subEffect = config.customSubEffect or subEffect
        msgID = config.customMsgID or msgID
        msgParam = config.customMsgParam or msgParam
    else
        if defender and item then
            defender:setLocalVar('aeFromItemId', item:getID())
        end

        return 0, 0, 0
    end

    return subEffect, msgID, msgParam
end

-- paralyze on hit, fire damage on hit, etc.
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