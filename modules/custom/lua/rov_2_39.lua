local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
ensureTable("xi.zones.Empyreal_Paradox.mobs.Iroha")
ensureTable("xi.zones.Empyreal_Paradox.mobs.Disjoined_One")
ensureTable("xi.zones.Empyreal_Paradox.bcnms.both_paths_taken")
-----------------------------------
require("modules/module_utils")
-----------------------------------

local m = Module:new("rov_2_39")



m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldInitialise', function(battlefield)
end)


m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end)

m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldRegister', function(player, battlefield)
end)

m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldEnter', function(player, battlefield)
end)

m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldDestroy', function(battlefield)
end)

m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onBattlefieldLeave', function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
       player:startEvent(11)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
       player:startEvent(32002)
    end
end)

m:addOverride('xi.zones.Empyreal_Paradox.bcnms.both_paths_taken.onEventFinish', function(player, csid, option, npc)
    if csid == 11 then
        player:setPos(419.962,19.104,-143.420,191,xi.zone.LA_THEINE_PLATEAU)
    end
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Iroha.onMobInitialize', function(mob)
    mob:addMod(xi.mod.REGAIN, 50)
    mob:setUnkillable(true)
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Iroha.onMobRoam', function(mob)
    mob:addEnmity(GetMobByID(16924685), 0, 1)
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Iroha.onMobFight', function(mob, target)
    local heal = mob:getMaxHP()
            if mob:hasStatusEffect(xi.effect.SEKKANOKI) and mob:getTP() >= 2000 then
               mob:useMobAbility(3734)
                    mob:timer(6, function(mob)
                    mob:useMobAbility(3735)
                    end)
            end
             if mob:getHP() == 10 and mob:getLocalVar('IrohaRaise') == 0 then
                 xi.trust.message(mob,2)
                 mob:entityAnimationPacket("pop1")
                 mob:setHP(heal)
                 mob:setLocalVar('IrohaRaise', 1)
                 mob:setUnkillable(false)
             end
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Iroha.onMobDeath', function(mob, player, optParams)
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Disjoined_One.onMobInitialize', function(mob)
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Disjoined_One.onMobFight', function(mob, target)
end)

m:addOverride('xi.zones.Empyreal_Paradox.mobs.Disjoined_One.onMobDeath', function(mob, player, optParams)
end)

return m
