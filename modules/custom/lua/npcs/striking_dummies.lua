-----------------------------------
-- Stationary Striking dummies.
-----------------------------------
require('modules/module_utils')
require('scripts/zones/Rala_Waterways/Zone')
-----------------------------------
local m = Module:new('striking_dummies')

m:addOverride('xi.zones.Rala_Waterways.Zone.onInitialize', function(zone)
    super(zone)
    local mob1 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummya',
        look = 431,
        x = 359,
        y = -12.5101,
        z = -414.0013,
        rotation = 192,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob1)
            mob1:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob1:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob1:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob1:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob1:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob1:setBehaviour(bit.bor(mob1:getBehaviour(), xi.behavior.NO_TURN))
            mob1:setUnkillable(true)
            mob1:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob1:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob1:setMagicCastingEnabled(false)
            mob1:setHP(mob1:getMaxHP())
            mob1:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob1, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob1:addMod(xi.mod.UDMGPHYS, -10000)
             mob1:addMod(xi.mod.UDMGBREATH, -10000)
             mob1:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob1:disengage()
               mob1:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob1:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob1)
            if not target:isEngaged() then
               mob1:disengage()
               mob1:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob1)
            mob1:setPos(359, -12.5101, -414.0013, 192)
             mob1:delMod(xi.mod.UDMGPHYS, -10000)
             mob1:delMod(xi.mod.UDMGBREATH, -10000)
             mob1:delMod(xi.mod.UDMGMAGIC, -10000)
            mob1:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob1, target)
        end,
    })
    local mob2 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummyb',
        look = 431,
        x = 361,
        y = -12.5101,
        z = -414.0013,
        rotation = 192,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob2)
            mob2:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob2:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob2:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob2:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob2:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob2:setBehaviour(bit.bor(mob2:getBehaviour(), xi.behavior.NO_TURN))
            mob2:setUnkillable(true)
            mob2:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob2:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob2:setMagicCastingEnabled(false)
            mob2:setHP(mob2:getMaxHP())
            mob2:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob2, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob2:addMod(xi.mod.UDMGPHYS, -10000)
             mob2:addMod(xi.mod.UDMGBREATH, -10000)
             mob2:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob2:disengage()
               mob2:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob2:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob2)
            if not target:isEngaged() then
               mob2:disengage()
               mob2:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob2)
            mob2:setPos(361, -12.5101, -414.0013, 192)
             mob2:delMod(xi.mod.UDMGPHYS, -10000)
             mob2:delMod(xi.mod.UDMGBREATH, -10000)
             mob2:delMod(xi.mod.UDMGMAGIC, -10000)
            mob2:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob2, target)
        end,
    })
    local mob3 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummyc',
        look = 431,
        x = 357,
        y = -12.5101,
        z = -414.0013,
        rotation = 192,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob3)
            mob3:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob3:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob3:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob3:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob3:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob3:setBehaviour(bit.bor(mob3:getBehaviour(), xi.behavior.NO_TURN))
            mob3:setUnkillable(true)
            mob3:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob3:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob3:setMagicCastingEnabled(false)
            mob3:setHP(mob3:getMaxHP())
            mob3:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob3, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob3:addMod(xi.mod.UDMGPHYS, -10000)
             mob3:addMod(xi.mod.UDMGBREATH, -10000)
             mob3:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob3:disengage()
               mob3:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob3:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob3)
            if not target:isEngaged() then
               mob3:disengage()
               mob3:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob3)
            mob3:setPos(357, -12.5101, -414.0013, 192)
             mob3:delMod(xi.mod.UDMGPHYS, -10000)
             mob3:delMod(xi.mod.UDMGBREATH, -10000)
             mob3:delMod(xi.mod.UDMGMAGIC, -10000)
            mob3:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob3, target)
        end,
    })
    local mob4 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummyd',
        look = 431,
        x = 359,
        y = -12.5101,
        z = -386.4066,
        rotation = 64,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob4)
            mob4:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob4:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob4:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob4:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob4:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob4:setBehaviour(bit.bor(mob4:getBehaviour(), xi.behavior.NO_TURN))
            mob4:setUnkillable(true)
            mob4:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob4:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob4:setMagicCastingEnabled(false)
            mob4:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob4, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob4:addMod(xi.mod.UDMGPHYS, -10000)
             mob4:addMod(xi.mod.UDMGBREATH, -10000)
             mob4:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob4:disengage()
               mob4:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob4:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob4)
            if not target:isEngaged() then
               mob4:disengage()
               mob4:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob4)
            mob4:setPos(359, -12.5101, -386.4066, 64)
             mob4:delMod(xi.mod.UDMGPHYS, -10000)
             mob4:delMod(xi.mod.UDMGBREATH, -10000)
             mob4:delMod(xi.mod.UDMGMAGIC, -10000)
            mob4:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob4, target)
        end,
    })
    local mob5 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummye',
        look = 431,
        x = 361,
        y = -12.5101,
        z = -386.4066,
        rotation = 64,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob5)
            mob5:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob5:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob5:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob5:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob5:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob5:setBehaviour(bit.bor(mob5:getBehaviour(), xi.behavior.NO_TURN))
            mob5:setUnkillable(true)
            mob5:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob5:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob5:setMagicCastingEnabled(false)
            mob5:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob5, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob5:addMod(xi.mod.UDMGPHYS, -10000)
             mob5:addMod(xi.mod.UDMGBREATH, -10000)
             mob5:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob5:disengage()
               mob5:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob5:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob5)
            if not target:isEngaged() then
               mob5:disengage()
               mob5:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob5)
            mob5:setPos(361, -12.5101, -386.4066, 64)
             mob5:delMod(xi.mod.UDMGPHYS, -10000)
             mob5:delMod(xi.mod.UDMGBREATH, -10000)
             mob5:delMod(xi.mod.UDMGMAGIC, -10000)
            mob5:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob5, target)
        end,
    })
    local mob6 = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = 'Striking Dummyf',
        look = 431,
        x = 357,
        y = -12.5101,
        z = -386.4066,
        rotation = 64,
        widescan = 1,
        groupId = 44,
        groupZoneId = 146,

        onMobSpawn = function(mob6)
            mob6:addStatusEffect(xi.effect.STUN, 1, 0, 0)
            mob6:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob6:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob6:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob6:setMobMod(xi.mobMod.NO_LINK, 1)
            --mob6:setBehaviour(bit.bor(mob6:getBehaviour(), xi.behavior.NO_TURN))
            mob6:setUnkillable(true)
            mob6:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob6:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob6:setMagicCastingEnabled(false)
            mob6:setAutoAttackEnabled(false)
        end,

        onMobEngage = function(mob6, target)
        local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
         for i = 1, #RoEAactive do
          if target:hasEminenceRecord(RoEAactive[i]) == true then
             mob6:addMod(xi.mod.UDMGPHYS, -10000)
             mob6:addMod(xi.mod.UDMGBREATH, -10000)
             mob6:addMod(xi.mod.UDMGMAGIC, -10000)
               target:disengage()
               mob6:disengage()
               mob6:resetEnmity(target)
             target:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys')
             return
          end
         end
            mob6:addListener('COMBAT_TICK', 'DUMMY_DISENGAGED', function(mob6)
            if not target:isEngaged() then
               mob6:disengage()
               mob6:resetEnmity(target)
            end
            end)
        end,

        onMobDisengage = function(mob6)
            mob6:setPos(357, -12.5101, -386.4066, 64)
             mob6:delMod(xi.mod.UDMGPHYS, -10000)
             mob6:delMod(xi.mod.UDMGBREATH, -10000)
             mob6:delMod(xi.mod.UDMGMAGIC, -10000)
            mob6:removeListener('DUMMY_DISENGAGED')
        end,

        onMobFight = function(mob6, target)
        end,
    })

    mob1:setSpawn(mob1:getXPos(), mob1:getYPos(), mob1:getZPos(), mob1:getRotPos())
    mob2:setSpawn(mob2:getXPos(), mob2:getYPos(), mob2:getZPos(), mob2:getRotPos())
    mob3:setSpawn(mob3:getXPos(), mob3:getYPos(), mob3:getZPos(), mob3:getRotPos())
    mob4:setSpawn(mob4:getXPos(), mob4:getYPos(), mob4:getZPos(), mob4:getRotPos())
    mob5:setSpawn(mob5:getXPos(), mob5:getYPos(), mob5:getZPos(), mob5:getRotPos())
    mob6:setSpawn(mob6:getXPos(), mob6:getYPos(), mob6:getZPos(), mob6:getRotPos())
    mob1:spawn()
    mob2:spawn()
    mob3:spawn()
    mob4:spawn()
    mob5:spawn()
    mob6:spawn()
    utils.unused(mob1)
    utils.unused(mob2)
    utils.unused(mob3)
    utils.unused(mob4)
    utils.unused(mob5)
    utils.unused(mob6)
end)

return m

