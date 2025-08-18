-----------------------------------
-- Will supply a percentage chance to spawn Supreme monsters from gods
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('Supremes')
---------------------------------------------------------------------------
-----------Behemoth
---------------------------------------------------------------------------
m:addOverride('xi.zones.Behemoths_Dominion.mobs.Behemoth.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 25 and
        spawnSupreme then

        local alliance = player:getAlliance() -- not capturing trusts in this situation, they are not getting confrontation.
        local party = player:getPartyWithTrusts()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

        local zoneOrInstanceObj = player:getZone()
        local instance = player:getInstance()

        if instance then
            zoneOrInstanceObj = instance
        end

        local zone = GetZone(xi.zone.BEHEMOTHS_DOMINION)
        local mob = zoneOrInstanceObj:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = 'Supreme Behemoth',
            look = '0000320b00000000000000000000000000000000', -- behemoth 17297440 & 17297441
            x = -267.4501,
            y = -19.6128,
            z = 64.5873,
            rotation = 29,
            groupId = 63,
            groupZoneId = 288,
            ---------------------------------------------------------------------------
            -----------onMobSpawn
            ---------------------------------------------------------------------------
            onMobSpawn = function(mob)
                mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
                mob:setMobLevel(130)
                mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
                mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
                mob:addMod(xi.mod.MP, 9500)
                mob:addMod(xi.mod.STR, 400) 
                mob:addMod(xi.mod.VIT, 400) 
                mob:addMod(xi.mod.INT, 400) 
                mob:addMod(xi.mod.MND, 400) 
                mob:addMod(xi.mod.CHR, 400) 
                mob:addMod(xi.mod.AGI, 400) 
                mob:addMod(xi.mod.DEX, 400) 
                mob:addMod(xi.mod.DEF, 400) 
                mob:addMod(xi.mod.RATT, 475) 
                mob:addMod(xi.mod.ACC, 750) 
                mob:addMod(xi.mod.ATT, 550) 
                mob:addMod(xi.mod.MATT, 250)
                mob:addMod(xi.mod.MACC, 750) 
                mob:addMod(xi.mod.MEVA, 500) 
                mob:addMod(xi.mod.MDEF, 500)
                mob:setMod(xi.mod.EVA, 400)
                mob:setMod(xi.mod.EARTH_SDT, 128)
                mob:setMod(xi.mod.DARK_SDT, 250)
                mob:setMod(xi.mod.LIGHT_SDT, 200)
                mob:setMod(xi.mod.ICE_SDT, 200)
                mob:setMod(xi.mod.FIRE_SDT, 200)
                mob:setMod(xi.mod.WATER_SDT, 200)
                mob:setMod(xi.mod.THUNDER_SDT, 200)
                mob:setMod(xi.mod.WIND_SDT, 200)
                mob:setMod(xi.mod.SILENCERES, 100) 
                mob:setMod(xi.mod.STUNRES, 100) 
                mob:setMod(xi.mod.BINDRES, 100) 
                mob:setMod(xi.mod.GRAVITYRES, 100) 
                mob:setMod(xi.mod.SLEEPRES, 100) 
                mob:setMod(xi.mod.POISONRES, 100) 
                mob:setMod(xi.mod.PARALYZERES, 100) 
                mob:setMod(xi.mod.LULLABYRES, 0) 
                mob:setMod(xi.mod.FASTCAST, 75) 
                mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 100, 0, 0)
                mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
                mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.ENFIRE_II, 100, 0, 0)
                mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                mob:setMobMod(xi.mobMod.SKILL_LIST, 51)
                mob:setMP(mob:getMaxMP())
                mob:setLocalVar('Adds', 1)

                mob:addListener('TAKE_DAMAGE', 'BEHEMOTH_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                    local accumulatedPhisical = mob:getLocalVar('physical')
                    local accumulatedMagical  = mob:getLocalVar('magical')
                        if attackType == xi.attackType.PHYSICAL or
                            attackType == xi.attackType.RANGED then
                            accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
                            mob:setLocalVar('physical', damage)
                        else
                            accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
                            mob:setLocalVar('magical', damage)
                        end
               end)

               local procjobs =
                    {
                        [xi.job.WAR] = 'ws',
                        [xi.job.MNK] = 'ja',
                        [xi.job.WHM] = 'ma',
                        [xi.job.BLM] = 'ma',
                        [xi.job.RDM] = 'ma',
                        [xi.job.THF] = 'ja',
                        [xi.job.PLD] = 'ws',
                        [xi.job.DRK] = 'ws',
                        [xi.job.BST] = 'ja',
                        [xi.job.BRD] = 'ma',
                        [xi.job.RNG] = 'ja',
                        [xi.job.SAM] = 'ws',
                        [xi.job.NIN] = 'ja',
                        [xi.job.DRG] = 'ws',
                        [xi.job.SMN] = 'ma',
                        [xi.job.DNC] = 'ja',
                        [xi.job.SCH] = 'ma',
                        [xi.job.RUN] = 'ws',
                        [xi.job.GEO] = 'ma',
                        [xi.job.COR] = 'ja',
                        [xi.job.BLU] = 'ma',
                        [xi.job.PUP] = 'ws',
                    }

               mob:addListener('MAGIC_TAKE', 'BEHEMOTH_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
                     if procjobs[caster:getMainJob()] == 'ma' and
                         math.random(0, 99) < 10 and
                         target:getLocalVar('supreme_procm') == 0 then
                         target:weaknessTrigger(2) -- Red proc
                         target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         target:setLocalVar('supreme_procm', 1)
                     end
               end)

               mob:addListener('WEAPONSKILL_TAKE', 'BEHEMOTH_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
               if math.random(0, 99) < 10 then
                     if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                         target:weaknessTrigger(0) -- Blue proc
                         target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         target:setLocalVar('supreme_procw', 1)
                     end
               end
               end)

               mob:addListener('ABILITY_TAKE', 'BEHEMOTH_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
                     if procjobs[user:getMainJob()] == 'ja' and
                         math.random(0, 99) < 10 and
                         mob:getLocalVar('supreme_proca') == 0 then
                         mob:weaknessTrigger(3) -- White proc
                         mob:delStatusEffect(xi.effect.BLAZE_SPIKES)
                         mob:delStatusEffect(xi.effect.REGEN)
                         mob:delStatusEffect(xi.effect.REGAIN)
                         mob:delStatusEffect(xi.effect.ENFIRE_II)
                         mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         mob:setLocalVar('supreme_proca', 1)
                     end
               end)

               local elements =
               {
                   { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
                   { xi.mod.SLASH_SDT,  xi.day.EARTHSDAY     },
                   { xi.mod.PIERCE_SDT, xi.day.WATERSDAY     },
                   { xi.mod.IMPACT_SDT, xi.day.WINDSDAY      },
                   { xi.mod.HTH_SDT,    xi.day.ICEDAY        },
                   { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
                   { xi.mod.PIERCE_SDT, xi.day.LIGHTSDAY     },
                   { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
               }
        
               local dayOfWeek = VanadielDayOfTheWeek()
                   for k, v in pairs(elements) do
                       if dayOfWeek == v[2] then
                           mob:setMod(v[1], 1000)
                       end
                   end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
            target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                if player:isPC() and ability:getID() == 22 then
                    mob:useMobAbility(694)
                end
            end)

            if mob:getHPP() <= 90 and
                mob:getLocalVar('Comet') == 0 then
                mob:castSpell(219)
                mob:setLocalVar('Comet', 1)
            end

            if mob:getHPP() <= 75 and
                mob:getLocalVar('Comet') == 1 then
                mob:castSpell(218)
                mob:setLocalVar('Comet', 2)
            end

            if mob:getHPP() <= 25 and
                mob:getLocalVar('Comet') == 2 then
                mob:castSpell(219)
                mob:setLocalVar('Comet', 3)
            end

            if mob:getHPP() <= 50 and
                mob:getLocalVar('Adds') == 1 then

                local behID = zones[xi.zone.BEHEMOTHS_DOMINION] -- need to apply mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                    GetMobByID(behID.mob.BEHEMOTH):spawn()
                    GetMobByID(behID.mob.BEHEMOTH):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                    GetMobByID(behID.mob.BEHEMOTH):updateClaim(target)
                    GetMobByID(behID.mob.KING_BEHEMOTH):spawn()
                    GetMobByID(behID.mob.KING_BEHEMOTH):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                    GetMobByID(behID.mob.KING_BEHEMOTH):updateClaim(target)
                    mob:setLocalVar('Adds', 2)
                    mob:setLocalVar('AddsTimer', os.time())
            end

            local behID = zones[xi.zone.BEHEMOTHS_DOMINION] -- removes immortal after behmoth and king behemoth are killed
                if mob:getLocalVar('AddsTimer') < os.time() and
                    mob:getLocalVar('Adds') == 2 and
                    not GetMobByID(behID.mob.BEHEMOTH):isSpawned() and
                    not GetMobByID(behID.mob.KING_BEHEMOTH):isSpawned() then
                    mob:setLocalVar('Adds', 4)
                end

            if mob:getLocalVar('Adds') == 2 then
                mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
                mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
                mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
            end

            if mob:getLocalVar('Adds') == 4 then
                mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
                mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
                mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
            end

            if mob:getHPP() <= 10 and
                mob:getLocalVar('supreme_procw') == 0 and
                mob:getLocalVar('Benidiction') == 0 then
                mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
                mob:setLocalVar('Benidiction', 1) -- set so he wont use again
            end

            if mob:getHPP() <= 5 and
                mob:getLocalVar('HundoFist') == 0 then
                mob:useMobAbility(690) -- uses Hundred fist
                mob:setLocalVar('HundoFist', 1) -- set so he wont use again
            end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
            if spell:getID() == 218 or 219 then
                spell:setAoE(xi.magic.aoe.RADIAL)
                spell:setFlag(xi.magic.spellFlag.HIT_ALL)
                spell:setRadius(20)
                spell:setAnimation(280)
                spell:setMPCost(1)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')

            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
               (caster:isPC() or caster:isPet() or caster:isTrust()) then
               target:setHP(curhp + absorb) -- absorb spells
               caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
            end

            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
                target:useMobAbility(695) -- use blood weapon on dia
            end

            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
                target:useMobAbility(710) -- use charm on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 0, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(-267.4501, -19.6128, 64.5873, 29)
    mob:setDropID(4119)
    mob:setSpellList(0)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end
end)

---------------------------------------------------------------------------
-----------King Behemoth
---------------------------------------------------------------------------

m:addOverride('xi.zones.Behemoths_Dominion.mobs.King_Behemoth.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 45 and
        spawnSupreme then

        local alliance = player:getAlliance()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

        local zoneOrInstanceObj = player:getZone()
        local instance = player:getInstance()

        if instance then
            zoneOrInstanceObj = instance
        end

        local zone = GetZone(xi.zone.BEHEMOTHS_DOMINION)
        local mob = zoneOrInstanceObj:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = 'Supreme Behemoth',
            look = '0000320b00000000000000000000000000000000', -- behemoth 17297440 & 17297441
            x = -267.4501,
            y = -19.6128,
            z = 64.5873,
            rotation = 29,
            groupId = 63,
            groupZoneId = 288,
            ---------------------------------------------------------------------------
            -----------onMobSpawn
            ---------------------------------------------------------------------------
            onMobSpawn = function(mob)
                mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
                mob:setMobLevel(130)
                mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
                mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
                mob:addMod(xi.mod.MP, 9500)
                mob:addMod(xi.mod.STR, 400) 
                mob:addMod(xi.mod.VIT, 400) 
                mob:addMod(xi.mod.INT, 400) 
                mob:addMod(xi.mod.MND, 400) 
                mob:addMod(xi.mod.CHR, 400) 
                mob:addMod(xi.mod.AGI, 400) 
                mob:addMod(xi.mod.DEX, 400) 
                mob:addMod(xi.mod.DEF, 400) 
                mob:addMod(xi.mod.RATT, 475) 
                mob:addMod(xi.mod.ACC, 750) 
                mob:addMod(xi.mod.ATT, 550) 
                mob:addMod(xi.mod.MATT, 250)
                mob:addMod(xi.mod.MACC, 750) 
                mob:addMod(xi.mod.MEVA, 500) 
                mob:addMod(xi.mod.MDEF, 500)
                mob:setMod(xi.mod.EVA, 400)
                mob:setMod(xi.mod.EARTH_SDT, 128)
                mob:setMod(xi.mod.DARK_SDT, 250)
                mob:setMod(xi.mod.LIGHT_SDT, 200)
                mob:setMod(xi.mod.ICE_SDT, 200)
                mob:setMod(xi.mod.FIRE_SDT, 200)
                mob:setMod(xi.mod.WATER_SDT, 200)
                mob:setMod(xi.mod.THUNDER_SDT, 200)
                mob:setMod(xi.mod.WIND_SDT, 200)
                mob:setMod(xi.mod.SILENCERES, 100) 
                mob:setMod(xi.mod.STUNRES, 100) 
                mob:setMod(xi.mod.BINDRES, 100) 
                mob:setMod(xi.mod.GRAVITYRES, 100) 
                mob:setMod(xi.mod.SLEEPRES, 100) 
                mob:setMod(xi.mod.POISONRES, 100) 
                mob:setMod(xi.mod.PARALYZERES, 100) 
                mob:setMod(xi.mod.LULLABYRES, 0) 
                mob:setMod(xi.mod.FASTCAST, 75) 
                mob:addStatusEffect(xi.effect.BLAZE_SPIKES, 100, 0, 0)
                mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
                mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.ENFIRE_II, 100, 0, 0)
                mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                mob:setMobMod(xi.mobMod.SKILL_LIST, 51)
                mob:setMP(mob:getMaxMP())
                mob:setLocalVar('Adds', 1)

                mob:addListener('TAKE_DAMAGE', 'BEHEMOTH_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                    local accumulatedPhisical = mob:getLocalVar('physical')
                    local accumulatedMagical  = mob:getLocalVar('magical')
                        if attackType == xi.attackType.PHYSICAL or
                            attackType == xi.attackType.RANGED then
                            accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
                            mob:setLocalVar('physical', damage)
                        else
                            accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
                            mob:setLocalVar('magical', damage)
                        end
                end)

               local procjobs =
                    {
                        [xi.job.WAR] = 'ws',
                        [xi.job.MNK] = 'ja',
                        [xi.job.WHM] = 'ma',
                        [xi.job.BLM] = 'ma',
                        [xi.job.RDM] = 'ma',
                        [xi.job.THF] = 'ja',
                        [xi.job.PLD] = 'ws',
                        [xi.job.DRK] = 'ws',
                        [xi.job.BST] = 'ja',
                        [xi.job.BRD] = 'ma',
                        [xi.job.RNG] = 'ja',
                        [xi.job.SAM] = 'ws',
                        [xi.job.NIN] = 'ja',
                        [xi.job.DRG] = 'ws',
                        [xi.job.SMN] = 'ma',
                        [xi.job.DNC] = 'ja',
                        [xi.job.SCH] = 'ma',
                        [xi.job.RUN] = 'ws',
                        [xi.job.GEO] = 'ma',
                        [xi.job.COR] = 'ja',
                        [xi.job.BLU] = 'ma',
                        [xi.job.PUP] = 'ws',
                    }

               mob:addListener('MAGIC_TAKE', 'BEHEMOTH_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
                     if procjobs[caster:getMainJob()] == 'ma' and
                         math.random(0, 99) < 10 and
                         target:getLocalVar('supreme_procm') == 0 then
                         target:weaknessTrigger(2) -- Red proc
                         target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         target:setLocalVar('supreme_procm', 1)
                     end
               end)

               mob:addListener('WEAPONSKILL_TAKE', 'BEHEMOTH_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
               if math.random(0, 99) < 10 then
                     if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                         target:weaknessTrigger(0) -- Blue proc
                         target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         target:setLocalVar('supreme_procw', 1)
                     end
               end
               end)

               mob:addListener('ABILITY_TAKE', 'BEHEMOTH_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
                     if procjobs[user:getMainJob()] == 'ja' and
                         math.random(0, 99) < 10 and
                         mob:getLocalVar('supreme_proca') == 0 then
                         mob:weaknessTrigger(3) -- White proc
                         mob:delStatusEffect(xi.effect.BLAZE_SPIKES)
                         mob:delStatusEffect(xi.effect.REGEN)
                         mob:delStatusEffect(xi.effect.REGAIN)
                         mob:delStatusEffect(xi.effect.ENFIRE_II)
                         mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                         mob:setLocalVar('supreme_proca', 1)
                     end
               end)

               local elements =
               {
                   { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
                   { xi.mod.SLASH_SDT,  xi.day.EARTHSDAY     },
                   { xi.mod.PIERCE_SDT, xi.day.WATERSDAY     },
                   { xi.mod.IMPACT_SDT, xi.day.WINDSDAY      },
                   { xi.mod.HTH_SDT,    xi.day.ICEDAY        },
                   { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
                   { xi.mod.PIERCE_SDT, xi.day.LIGHTSDAY     },
                   { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
               }
        
               local dayOfWeek = VanadielDayOfTheWeek()
                   for k, v in pairs(elements) do
                       if dayOfWeek == v[2] then
                           mob:setMod(v[1], 1000)
                       end
                   end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
            target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                if player:isPC() and ability:getID() == 22 then
                    mob:useMobAbility(694)
                end
            end)

            if mob:getHPP() <= 90 and
                mob:getLocalVar('Comet') == 0 then
                mob:castSpell(219)
                mob:setLocalVar('Comet', 1)
            end

            if mob:getHPP() <= 75 and
                mob:getLocalVar('Comet') == 1 then
                mob:castSpell(218)
                mob:setLocalVar('Comet', 2)
            end

            if mob:getHPP() <= 25 and
                mob:getLocalVar('Comet') == 2 then
                mob:castSpell(219)
                mob:setLocalVar('Comet', 3)
            end

            if mob:getHPP() <= 50 and
                mob:getLocalVar('Adds') == 1 then

                local behID = zones[xi.zone.BEHEMOTHS_DOMINION]
                    GetMobByID(behID.mob.BEHEMOTH):spawn()
                    GetMobByID(behID.mob.BEHEMOTH):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                    GetMobByID(behID.mob.BEHEMOTH):updateClaim(target)
                    GetMobByID(behID.mob.KING_BEHEMOTH):spawn()
                    GetMobByID(behID.mob.KING_BEHEMOTH):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                    GetMobByID(behID.mob.KING_BEHEMOTH):updateClaim(target)
                    mob:setLocalVar('Adds', 2)
                    mob:setLocalVar('AddsTimer', os.time())
            end

            local behID = zones[xi.zone.BEHEMOTHS_DOMINION] -- removes immortal after behmoth and king behemoth are killed
                if mob:getLocalVar('AddsTimer') < os.time() and
                    mob:getLocalVar('Adds') == 2 and
                    not GetMobByID(behID.mob.BEHEMOTH):isSpawned() and
                    not GetMobByID(behID.mob.KING_BEHEMOTH):isSpawned() then
                    mob:setLocalVar('Adds', 4)
                end

            if mob:getLocalVar('Adds') == 2 then
                mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
                mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
                mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
            end

            if mob:getLocalVar('Adds') == 4 then
                mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
                mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
                mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
            end

            if mob:getHPP() <= 10 and
                mob:getLocalVar('supreme_procw') == 0 and
                mob:getLocalVar('Benidiction') == 0 then
                mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
                mob:setLocalVar('Benidiction', 1) -- set so he wont use again
            end

            if mob:getHPP() <= 5 and
                mob:getLocalVar('HundoFist') == 0 then
                mob:useMobAbility(690) -- uses Hundred fist
                mob:setLocalVar('HundoFist', 1) -- set so he wont use again
            end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
            if spell:getID() == 218 or 219 then
                spell:setAoE(xi.magic.aoe.RADIAL)
                spell:setFlag(xi.magic.spellFlag.HIT_ALL)
                spell:setRadius(20)
                spell:setAnimation(280)
                spell:setMPCost(1)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')

            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
               (caster:isPC() or caster:isPet() or caster:isTrust()) then
               target:setHP(curhp + absorb) -- absorb spells
               caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
            end

            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
                target:useMobAbility(695) -- use blood weapon on dia
            end

            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
                target:useMobAbility(710) -- use charm on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 0, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(-267.4501, -19.6128, 64.5873, 29)
    mob:setDropID(4119)
    mob:setSpellList(0)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end    
end)

---------------------------------------------------------------------------
-----------Fafnir
---------------------------------------------------------------------------
m:addOverride('xi.zones.Dragons_Aery.mobs.Fafnir.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 25 and
        spawnSupreme then

        local alliance = player:getAlliance()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

        local zoneOrInstanceObj = player:getZone()
        local instance = player:getInstance()

        if instance then
            zoneOrInstanceObj = instance
        end
    local zone = GetZone(xi.zone.DRAGONS_AERY)
    local mob = zoneOrInstanceObj:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = 'Supreme Dragon',
        look = '0000630200000000000000000000000000000000', -- faf dragon 17408018 & 17408019
        x = 89.9643,
        y = 6.7294,
        z = 41.3521,
        rotation = 127,
        groupId = 4,
        groupZoneId = 222,
        ---------------------------------------------------------------------------
        -----------onMobSpawn
        ---------------------------------------------------------------------------
        onMobSpawn = function(mob)
        mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
        mob:setMobLevel(130)
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
        mob:addMod(xi.mod.MP, 9500)
        mob:addMod(xi.mod.STR, 400) 
        mob:addMod(xi.mod.VIT, 400) 
        mob:addMod(xi.mod.INT, 400) 
        mob:addMod(xi.mod.MND, 400) 
        mob:addMod(xi.mod.CHR, 400) 
        mob:addMod(xi.mod.AGI, 400) 
        mob:addMod(xi.mod.DEX, 400) 
        mob:addMod(xi.mod.DEF, 400) 
        mob:addMod(xi.mod.RATT, 475) 
        mob:addMod(xi.mod.ACC, 750) 
        mob:addMod(xi.mod.ATT, 550) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 750) 
        mob:addMod(xi.mod.MEVA, 500) 
        mob:addMod(xi.mod.MDEF, 500)
        mob:setMod(xi.mod.EVA, 400)
        mob:setMod(xi.mod.EARTH_SDT, 128)
        mob:setMod(xi.mod.DARK_SDT, 250)
        mob:setMod(xi.mod.LIGHT_SDT, 200)
        mob:setMod(xi.mod.ICE_SDT, 200)
        mob:setMod(xi.mod.FIRE_SDT, 200)
        mob:setMod(xi.mod.WATER_SDT, 200)
        mob:setMod(xi.mod.THUNDER_SDT, 200)
        mob:setMod(xi.mod.WIND_SDT, 200)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 100) 
        mob:setMod(xi.mod.GRAVITYRES, 100) 
        mob:setMod(xi.mod.SLEEPRES, 100) 
        mob:setMod(xi.mod.POISONRES, 100) 
        mob:setMod(xi.mod.PARALYZERES, 100) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 75) 
        mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
        mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 263)
        mob:setMP(mob:getMaxMP())
        mob:setLocalVar('Adds', 1)

       mob:addListener('TAKE_DAMAGE', 'FAFNIRS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
         local accumulatedPhisical = mob:getLocalVar('physical')
         local accumulatedMagical  = mob:getLocalVar('magical')
            if attackType == xi.attackType.PHYSICAL or
               attackType == xi.attackType.RANGED then
               accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
               mob:setLocalVar('physical', damage)
            else
               accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
               mob:setLocalVar('magical', damage)
            end
       end)
           local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
        [xi.job.DNC] = 'ja',
        [xi.job.SCH] = 'ma',
        [xi.job.RUN] = 'ws',
        [xi.job.GEO] = 'ma',
        [xi.job.COR] = 'ja',
        [xi.job.BLU] = 'ma',
        [xi.job.PUP] = 'ws',
    }
       mob:addListener('MAGIC_TAKE', 'FAFNIRS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
             if procjobs[caster:getMainJob()] == 'ma' and
                math.random(0, 99) < 10 and
                target:getLocalVar('supreme_procm') == 0 then
                target:weaknessTrigger(2) -- Red proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procm', 1)
             end
       end)
       mob:addListener('WEAPONSKILL_TAKE', 'FAFNIRS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
       if math.random(0, 99) < 10 then
             if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                target:weaknessTrigger(0) -- Blue proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procw', 1)
             end
       end
       end)
       mob:addListener('ABILITY_TAKE', 'FAFNIRS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
             if procjobs[user:getMainJob()] == 'ja' and
                math.random(0, 99) < 10 and
                mob:getLocalVar('supreme_proca') == 0 then
                mob:weaknessTrigger(3) -- White proc
                mob:delStatusEffect(xi.effect.SHOCK_SPIKES)
                mob:delStatusEffect(xi.effect.REGEN)
                mob:delStatusEffect(xi.effect.REGAIN)
                mob:delStatusEffect(xi.effect.ENTHUNDER_II)
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('supreme_proca', 1)
             end
       end)
        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.DARKSDAY      },
            { xi.mod.SLASH_SDT,  xi.day.LIGHTSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.LIGHTNINGSDAY },
            { xi.mod.IMPACT_SDT, xi.day.ICEDAY        },
            { xi.mod.HTH_SDT,    xi.day.WINDSDAY      },
            { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.EARTHSDAY     },
            { xi.mod.IMPACT_SDT, xi.day.FIRESDAY      },
        }
        
        
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 1000)
                    end
                end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
                    target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                        if player:isPC() and ability:getID() == 17 then -- hundred fist
                           mob:useMobAbility(692) -- chain spell
                        end
                    end)
        if mob:getHPP() <= 90 and
           mob:getLocalVar('ATerror') == 0 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 1)
        end
        if mob:getHPP() <= 75 and
           mob:getLocalVar('ATerror') == 1 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 2)
        end
        if mob:getHPP() <= 25 and
           mob:getLocalVar('ATerror') == 2 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 3)
        end
        if mob:getHPP() <= 50 and
           mob:getLocalVar('Adds') == 1 then
           local daerID = zones[xi.zone.DRAGONS_AERY]
               GetMobByID(behID.mob.FAFNIR):spawn()
               GetMobByID(behID.mob.FAFNIR):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.FAFNIR):updateClaim(target)
               GetMobByID(behID.mob.NIDHOGG):spawn()
               GetMobByID(behID.mob.NIDHOGG):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.NIDHOGG):updateClaim(target)
           mob:setLocalVar('Adds', 2)
           mob:setLocalVar('AddsTimer', os.time())
        end
           local daerID = zones[xi.zone.DRAGONS_AERY] -- removes immortal after faf and nid are killed
        if mob:getLocalVar('AddsTimer') < os.time() and
           mob:getLocalVar('Adds') == 2 and
           not GetMobByID(daerID.mob.FAFNIR):isSpawned() and
           not GetMobByID(daerID.mob.NIDHOGG):isSpawned() then
           mob:setLocalVar('Adds', 4)
        end
        if mob:getLocalVar('Adds') == 2 then
           mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
           mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
           mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
        end
        if mob:getLocalVar('Adds') == 4 then
           mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
           mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
           mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        end
        if mob:getHPP() <= 10 and
           mob:getLocalVar('supreme_procw') == 0 and
           mob:getLocalVar('Mightystrike') == 0 then
           mob:useMobAbility(688) -- uses benidiction if magic proc isnt completed
           mob:setLocalVar('Mightystrike', 1) -- set so he wont use again
        end
        if mob:getHPP() <= 5 and
           mob:getLocalVar('invincible') == 0 then
           mob:useMobAbility(694) -- uses invincible
           mob:setLocalVar('invincible', 1) -- set so he wont use again
        end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
        if spell:getID() == 367 or 252 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
        --spell:setAnimation(280)
        spell:setMPCost(1)
        end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')
            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                 (caster:isPC() or caster:isPet() or caster:isTrust()) then
                 target:setHP(curhp + absorb) -- absorb spells
                 caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
              end
            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
               target:useMobAbility(695) -- use blood weapon on dia
            end
            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
               target:useMobAbility(690) -- use hundred fist on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 1, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(89.9643, 6.7294, 41.3521, 127)
    mob:setDropID(4120)
    mob:setSpellList(292)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end 
end)

---------------------------------------------------------------------------
-----------Nidhogg
---------------------------------------------------------------------------

m:addOverride('xi.zones.Dragons_Aery.mobs.Nidhogg.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 45 and
        spawnSupreme then

        local alliance = player:getAlliance()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

        local zoneOrInstanceObj = player:getZone()
        local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local zone = GetZone(xi.zone.DRAGONS_AERY)
    local mob = zoneOrInstanceObj:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = 'Supreme Dragon',
        look = '0000630200000000000000000000000000000000', -- faf dragon 17408018 & 17408019
        x = 89.9643,
        y = 6.7294,
        z = 41.3521,
        rotation = 127,
        groupId = 4,
        groupZoneId = 222,
        ---------------------------------------------------------------------------
        -----------onMobSpawn
        ---------------------------------------------------------------------------
        onMobSpawn = function(mob)
        mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
        mob:setMobLevel(130)
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
        mob:addMod(xi.mod.MP, 9500)
        mob:addMod(xi.mod.STR, 400) 
        mob:addMod(xi.mod.VIT, 400) 
        mob:addMod(xi.mod.INT, 400) 
        mob:addMod(xi.mod.MND, 400) 
        mob:addMod(xi.mod.CHR, 400) 
        mob:addMod(xi.mod.AGI, 400) 
        mob:addMod(xi.mod.DEX, 400) 
        mob:addMod(xi.mod.DEF, 400) 
        mob:addMod(xi.mod.RATT, 475) 
        mob:addMod(xi.mod.ACC, 750) 
        mob:addMod(xi.mod.ATT, 550) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 750) 
        mob:addMod(xi.mod.MEVA, 500) 
        mob:addMod(xi.mod.MDEF, 500)
        mob:setMod(xi.mod.EVA, 400)
        mob:setMod(xi.mod.EARTH_SDT, 128)
        mob:setMod(xi.mod.DARK_SDT, 250)
        mob:setMod(xi.mod.LIGHT_SDT, 200)
        mob:setMod(xi.mod.ICE_SDT, 200)
        mob:setMod(xi.mod.FIRE_SDT, 200)
        mob:setMod(xi.mod.WATER_SDT, 200)
        mob:setMod(xi.mod.THUNDER_SDT, 200)
        mob:setMod(xi.mod.WIND_SDT, 200)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 100) 
        mob:setMod(xi.mod.GRAVITYRES, 100) 
        mob:setMod(xi.mod.SLEEPRES, 100) 
        mob:setMod(xi.mod.POISONRES, 100) 
        mob:setMod(xi.mod.PARALYZERES, 100) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 75) 
        mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
        mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 263)
        mob:setMP(mob:getMaxMP())
        mob:setLocalVar('Adds', 1)

       mob:addListener('TAKE_DAMAGE', 'FAFNIRS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
         local accumulatedPhisical = mob:getLocalVar('physical')
         local accumulatedMagical  = mob:getLocalVar('magical')
            if attackType == xi.attackType.PHYSICAL or
               attackType == xi.attackType.RANGED then
               accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
               mob:setLocalVar('physical', damage)
            else
               accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
               mob:setLocalVar('magical', damage)
            end
       end)
           local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
        [xi.job.DNC] = 'ja',
        [xi.job.SCH] = 'ma',
        [xi.job.RUN] = 'ws',
        [xi.job.GEO] = 'ma',
        [xi.job.COR] = 'ja',
        [xi.job.BLU] = 'ma',
        [xi.job.PUP] = 'ws',
    }
       mob:addListener('MAGIC_TAKE', 'FAFNIRS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
             if procjobs[caster:getMainJob()] == 'ma' and
                math.random(0, 99) < 10 and
                target:getLocalVar('supreme_procm') == 0 then
                target:weaknessTrigger(2) -- Red proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procm', 1)
             end
       end)
       mob:addListener('WEAPONSKILL_TAKE', 'FAFNIRS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
       if math.random(0, 99) < 10 then
             if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                target:weaknessTrigger(0) -- Blue proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procw', 1)
             end
       end
       end)
       mob:addListener('ABILITY_TAKE', 'FAFNIRS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
             if procjobs[user:getMainJob()] == 'ja' and
                math.random(0, 99) < 10 and
                mob:getLocalVar('supreme_proca') == 0 then
                mob:weaknessTrigger(3) -- White proc
                mob:delStatusEffect(xi.effect.SHOCK_SPIKES)
                mob:delStatusEffect(xi.effect.REGEN)
                mob:delStatusEffect(xi.effect.REGAIN)
                mob:delStatusEffect(xi.effect.ENTHUNDER_II)
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('supreme_proca', 1)
             end
       end)
        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.DARKSDAY      },
            { xi.mod.SLASH_SDT,  xi.day.LIGHTSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.LIGHTNINGSDAY },
            { xi.mod.IMPACT_SDT, xi.day.ICEDAY        },
            { xi.mod.HTH_SDT,    xi.day.WINDSDAY      },
            { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.EARTHSDAY     },
            { xi.mod.IMPACT_SDT, xi.day.FIRESDAY      },
        }
        
        
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 1000)
                    end
                end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
                    target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                        if player:isPC() and ability:getID() == 17 then -- hundred fist
                           mob:useMobAbility(692) -- chain spell
                        end
                    end)
        if mob:getHPP() <= 90 and
           mob:getLocalVar('ATerror') == 0 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 1)
        end
        if mob:getHPP() <= 75 and
           mob:getLocalVar('ATerror') == 1 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 2)
        end
        if mob:getHPP() <= 25 and
           mob:getLocalVar('ATerror') == 2 then
           mob:useMobAbility(957)
           mob:setLocalVar('ATerror', 3)
        end
        if mob:getHPP() <= 50 and
           mob:getLocalVar('Adds') == 1 then
           local daerID = zones[xi.zone.DRAGONS_AERY]
               GetMobByID(behID.mob.FAFNIR):spawn()
               GetMobByID(behID.mob.FAFNIR):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.FAFNIR):updateClaim(target)
               GetMobByID(behID.mob.NIDHOGG):spawn()
               GetMobByID(behID.mob.NIDHOGG):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.NIDHOGG):updateClaim(target)
           mob:setLocalVar('Adds', 2)
           mob:setLocalVar('AddsTimer', os.time())
        end
           local daerID = zones[xi.zone.DRAGONS_AERY] -- removes immortal after faf and nid are killed
        if mob:getLocalVar('AddsTimer') < os.time() and
           mob:getLocalVar('Adds') == 2 and
           not GetMobByID(daerID.mob.FAFNIR):isSpawned() and
           not GetMobByID(daerID.mob.NIDHOGG):isSpawned() then
           mob:setLocalVar('Adds', 4)
        end
        if mob:getLocalVar('Adds') == 2 then
           mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
           mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
           mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
        end
        if mob:getLocalVar('Adds') == 4 then
           mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
           mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
           mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        end
        if mob:getHPP() <= 10 and
           mob:getLocalVar('supreme_procw') == 0 and
           mob:getLocalVar('Mightystrike') == 0 then
           mob:useMobAbility(688) -- uses benidiction if magic proc isnt completed
           mob:setLocalVar('Mightystrike', 1) -- set so he wont use again
        end
        if mob:getHPP() <= 5 and
           mob:getLocalVar('invincible') == 0 then
           mob:useMobAbility(694) -- uses invincible
           mob:setLocalVar('invincible', 1) -- set so he wont use again
        end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
        if spell:getID() == 367 or 252 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
        --spell:setAnimation(280)
        spell:setMPCost(1)
        end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')
            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                 (caster:isPC() or caster:isPet() or caster:isTrust()) then
                 target:setHP(curhp + absorb) -- absorb spells
                 caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
              end
            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
               target:useMobAbility(695) -- use blood weapon on dia
            end
            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
               target:useMobAbility(690) -- use hundred fist on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 1, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(89.9643, 6.7294, 41.3521, 127)
    mob:setDropID(4120) 
    mob:setSpellList(292)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end  
end)

---------------------------------------------------------------------------
-----------Adamantoise
---------------------------------------------------------------------------

m:addOverride('xi.zones.Valley_of_Sorrows.mobs.Adamantoise.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 25 and
        spawnSupreme then

        local alliance = player:getAlliance()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

        local zoneOrInstanceObj = player:getZone()
        local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local zone = GetZone(xi.zone.VALLEY_OF_SORROWS)
    local mob = zoneOrInstanceObj:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = 'Supreme Aspid',
        look = '0000480900000000000000000000000000000000', -- aspid turntle 17301538 & 17301537
        x = 6.4430,
        y = 0.6940,
        z = 21.6073,
        rotation = 84,
        groupId = 4,
        groupZoneId = 222,
        ---------------------------------------------------------------------------
        -----------onMobSpawn
        ---------------------------------------------------------------------------
        onMobSpawn = function(mob)
        mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
        mob:setMobLevel(130)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
        mob:addMod(xi.mod.MP, 9500)
        mob:addMod(xi.mod.STR, 400) 
        mob:addMod(xi.mod.VIT, 400) 
        mob:addMod(xi.mod.INT, 400) 
        mob:addMod(xi.mod.MND, 400) 
        mob:addMod(xi.mod.CHR, 400) 
        mob:addMod(xi.mod.AGI, 400) 
        mob:addMod(xi.mod.DEX, 400) 
        mob:addMod(xi.mod.DEF, 400) 
        mob:addMod(xi.mod.RATT, 475) 
        mob:addMod(xi.mod.ACC, 750) 
        mob:addMod(xi.mod.ATT, 550) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 750) 
        mob:addMod(xi.mod.MEVA, 500) 
        mob:addMod(xi.mod.MDEF, 500)
        mob:setMod(xi.mod.EVA, 400)
        mob:setMod(xi.mod.EARTH_SDT, 128)
        mob:setMod(xi.mod.DARK_SDT, 250)
        mob:setMod(xi.mod.LIGHT_SDT, 200)
        mob:setMod(xi.mod.ICE_SDT, 200)
        mob:setMod(xi.mod.FIRE_SDT, 200)
        mob:setMod(xi.mod.WATER_SDT, 200)
        mob:setMod(xi.mod.THUNDER_SDT, 200)
        mob:setMod(xi.mod.WIND_SDT, 200)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 100) 
        mob:setMod(xi.mod.GRAVITYRES, 100) 
        mob:setMod(xi.mod.SLEEPRES, 100) 
        mob:setMod(xi.mod.POISONRES, 100) 
        mob:setMod(xi.mod.PARALYZERES, 100) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 75) 
        mob:addStatusEffect(xi.effect.ICE_SPIKES, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
        mob:addStatusEffect(xi.effect.ENBLIZZARD_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 2)
        mob:setMP(mob:getMaxMP())
        mob:setLocalVar('Adds', 1)

       mob:addListener('TAKE_DAMAGE', 'ASPIDS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
         local accumulatedPhisical = mob:getLocalVar('physical')
         local accumulatedMagical  = mob:getLocalVar('magical')
            if attackType == xi.attackType.PHYSICAL or
               attackType == xi.attackType.RANGED then
               accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
               mob:setLocalVar('physical', damage)
            else
               accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
               mob:setLocalVar('magical', damage)
            end
       end)
           local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
        [xi.job.DNC] = 'ja',
        [xi.job.SCH] = 'ma',
        [xi.job.RUN] = 'ws',
        [xi.job.GEO] = 'ma',
        [xi.job.COR] = 'ja',
        [xi.job.BLU] = 'ma',
        [xi.job.PUP] = 'ws',
    }
       mob:addListener('MAGIC_TAKE', 'ASPIDS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
             if procjobs[caster:getMainJob()] == 'ma' and
                math.random(0, 99) < 10 and
                target:getLocalVar('supreme_procm') == 0 then
                target:weaknessTrigger(2) -- Red proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procm', 1)
             end
       end)
       mob:addListener('WEAPONSKILL_TAKE', 'ASPIDS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
       if math.random(0, 99) < 10 then
             if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                target:weaknessTrigger(0) -- Blue proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procw', 1)
             end
       end
       end)
       mob:addListener('ABILITY_TAKE', 'ASPIDS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
             if procjobs[user:getMainJob()] == 'ja' and
                math.random(0, 99) < 10 and
                mob:getLocalVar('supreme_proca') == 0 then
                mob:weaknessTrigger(3) -- White proc
                mob:delStatusEffect(xi.effect.ICE_SPIKES)
                mob:delStatusEffect(xi.effect.REGEN)
                mob:delStatusEffect(xi.effect.REGAIN)
                mob:delStatusEffect(xi.effect.ENBLIZZARD_II)
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('supreme_proca', 1)
             end
       end)
        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
            { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.ICEDAY        },
            { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
            { xi.mod.HTH_SDT,    xi.day.LIGHTSDAY     },
            { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
            { xi.mod.PIERCE_SDT, xi.day.WINDSDAY      },
            { xi.mod.IMPACT_SDT, xi.day.EARTHSDAY     },
        }
        
        
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 1000)
                    end
                end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
                    target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                        if player:isPC() and ability:getID() == 20 then -- chainspell
                          mob:useMobAbility(694) -- Invinvible
                        end
                    end)
        if mob:getHPP() <= 90 and
           mob:getLocalVar('Ebreath') == 0 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 1)
        end
        if mob:getHPP() <= 75 and
           mob:getLocalVar('Ebreath') == 1 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 2)
        end
        if mob:getHPP() <= 25 and
           mob:getLocalVar('Ebreath') == 2 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 3)
        end
        if mob:getHPP() <= 50 and
           mob:getLocalVar('Adds') == 1 then
           local vosID = zones[xi.zone.VALLEY_OF_SORROWS]
               GetMobByID(behID.mob.ADAMANTOISE):spawn()
               GetMobByID(behID.mob.ADAMANTOISE):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.ADAMANTOISE):updateClaim(target)
               GetMobByID(behID.mob.ASPIDOCHELONE):spawn()
               GetMobByID(behID.mob.ASPIDOCHELONE):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.ASPIDOCHELONE):updateClaim(target)
           mob:setLocalVar('Adds', 2)
           mob:setLocalVar('AddsTimer', os.time())
        end
           local vosID = zones[xi.zone.VALLEY_OF_SORROWS] -- removes immortal after adman and aspid are killed
        if mob:getLocalVar('AddsTimer') < os.time() and
           mob:getLocalVar('Adds') == 2 and
           not GetMobByID(vosID.mob.ADAMANTOISE):isSpawned() and
           not GetMobByID(vosID.mob.ASPIDOCHELONE):isSpawned() then
           mob:setLocalVar('Adds', 4)
        end
        if mob:getLocalVar('Adds') == 2 then
           mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
           mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
           mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
        end
        if mob:getLocalVar('Adds') == 4 then
           mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
           mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
           mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        end
        if mob:getHPP() <= 10 and
           mob:getLocalVar('supreme_procw') == 0 and
           mob:getLocalVar('Benidiction') == 0 then
           mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
           mob:setLocalVar('Benidiction', 1) -- set so he wont use again
        end
        if mob:getHPP() <= 5 and
           mob:getLocalVar('invincible') == 0 then
           mob:useMobAbility(694) -- uses invincible
           mob:setLocalVar('invincible', 1) -- set so he wont use again
        end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
        if spell:getID() == 173 or 214 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
        spell:setMPCost(1)
        end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')
            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                 (caster:isPC() or caster:isPet() or caster:isTrust()) then
                 target:setHP(curhp + absorb) -- absorb spells
                 caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
              end
            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
               target:useMobAbility(695) -- use blood weapon on dia
            end
            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
               target:useMobAbility(690) -- use hundred fist on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 2, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(6.4430, 0.6940, 21.6073, 84)
    mob:setDropID(4121)
    mob:setSpellList(256)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end    
end)

---------------------------------------------------------------------------
-----------Aspidochelone
---------------------------------------------------------------------------

m:addOverride('xi.zones.Valley_of_Sorrows.mobs.Aspidochelone.onMobDeath', function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 100)
    local zone = mob:getZone()
    local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
    local spawnSupreme = true

    for _, mob in pairs(filteredEntities) do
        if mob:isAlive() then
            spawnSupreme = false
        end
    end

    if rand <= 45 and
        spawnSupreme then

        local alliance = player:getAlliance()
        local killerClaim = optParams.isKiller
        local partyAllianceCheck = 0

        if player:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = player:getAlliance()
        else
            partyAllianceCheck = player:getPartyWithTrusts()
        end

        for _, member in pairs(partyAllianceCheck) do
            if killerClaim then
                member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
            end
        end

      local zoneOrInstanceObj = player:getZone()
      local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end
    local zone = GetZone(xi.zone.VALLEY_OF_SORROWS)
    local mob = zoneOrInstanceObj:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = 'Supreme Aspid',
        look = '0000480900000000000000000000000000000000', -- aspid turntle 17301538 & 17301537
        x = 6.4430,
        y = 0.6940,
        z = 21.6073,
        rotation = 84,
        groupId = 4,
        groupZoneId = 222,
        ---------------------------------------------------------------------------
        -----------onMobSpawn
        ---------------------------------------------------------------------------
        onMobSpawn = function(mob)
        mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
        mob:setMobLevel(130)
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
        mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
        mob:addMod(xi.mod.MP, 9500)
        mob:addMod(xi.mod.STR, 400) 
        mob:addMod(xi.mod.VIT, 400) 
        mob:addMod(xi.mod.INT, 400) 
        mob:addMod(xi.mod.MND, 400) 
        mob:addMod(xi.mod.CHR, 400) 
        mob:addMod(xi.mod.AGI, 400) 
        mob:addMod(xi.mod.DEX, 400) 
        mob:addMod(xi.mod.DEF, 400) 
        mob:addMod(xi.mod.RATT, 475) 
        mob:addMod(xi.mod.ACC, 750) 
        mob:addMod(xi.mod.ATT, 550) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 750) 
        mob:addMod(xi.mod.MEVA, 500) 
        mob:addMod(xi.mod.MDEF, 500)
        mob:setMod(xi.mod.EVA, 400)
        mob:setMod(xi.mod.EARTH_SDT, 128)
        mob:setMod(xi.mod.DARK_SDT, 250)
        mob:setMod(xi.mod.LIGHT_SDT, 200)
        mob:setMod(xi.mod.ICE_SDT, 200)
        mob:setMod(xi.mod.FIRE_SDT, 200)
        mob:setMod(xi.mod.WATER_SDT, 200)
        mob:setMod(xi.mod.THUNDER_SDT, 200)
        mob:setMod(xi.mod.WIND_SDT, 200)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 100) 
        mob:setMod(xi.mod.GRAVITYRES, 100) 
        mob:setMod(xi.mod.SLEEPRES, 100) 
        mob:setMod(xi.mod.POISONRES, 100) 
        mob:setMod(xi.mod.PARALYZERES, 100) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 75) 
        mob:addStatusEffect(xi.effect.ICE_SPIKES, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
        mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
        mob:addStatusEffect(xi.effect.ENBLIZZARD_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.PHALANX, 35, 0, 180)
        mob:addStatusEffect(xi.effect.STONESKIN, 350, 0, 300)
        mob:addStatusEffect(xi.effect.PROTECT, 175, 0, 1800)
        mob:addStatusEffect(xi.effect.SHELL, 24, 0, 1800)
        mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 2)
        mob:setMP(mob:getMaxMP())
        mob:setLocalVar('Adds', 1)

       mob:addListener('TAKE_DAMAGE', 'ASPIDS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
         local accumulatedPhisical = mob:getLocalVar('physical')
         local accumulatedMagical  = mob:getLocalVar('magical')
            if attackType == xi.attackType.PHYSICAL or
               attackType == xi.attackType.RANGED then
               accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
               mob:setLocalVar('physical', damage)
            else
               accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
               mob:setLocalVar('magical', damage)
            end
       end)
           local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
        [xi.job.DNC] = 'ja',
        [xi.job.SCH] = 'ma',
        [xi.job.RUN] = 'ws',
        [xi.job.GEO] = 'ma',
        [xi.job.COR] = 'ja',
        [xi.job.BLU] = 'ma',
        [xi.job.PUP] = 'ws',
    }
       mob:addListener('MAGIC_TAKE', 'ASPIDS_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
             if procjobs[caster:getMainJob()] == 'ma' and
                math.random(0, 99) < 10 and
                target:getLocalVar('supreme_procm') == 0 then
                target:weaknessTrigger(2) -- Red proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procm', 1)
             end
       end)
       mob:addListener('WEAPONSKILL_TAKE', 'ASPIDS_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
       if math.random(0, 99) < 10 then
             if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                target:weaknessTrigger(0) -- Blue proc
                target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                target:setLocalVar('supreme_procw', 1)
             end
       end
       end)
       mob:addListener('ABILITY_TAKE', 'ASPIDS_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
             if procjobs[user:getMainJob()] == 'ja' and
                math.random(0, 99) < 10 and
                mob:getLocalVar('supreme_proca') == 0 then
                mob:weaknessTrigger(3) -- White proc
                mob:delStatusEffect(xi.effect.ICE_SPIKES)
                mob:delStatusEffect(xi.effect.REGEN)
                mob:delStatusEffect(xi.effect.REGAIN)
                mob:delStatusEffect(xi.effect.ENBLIZZARD_II)
                mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                mob:setLocalVar('supreme_proca', 1)
             end
       end)
        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
            { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.ICEDAY        },
            { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
            { xi.mod.HTH_SDT,    xi.day.LIGHTSDAY     },
            { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
            { xi.mod.PIERCE_SDT, xi.day.WINDSDAY      },
            { xi.mod.IMPACT_SDT, xi.day.EARTHSDAY     },
        }
        
        
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 1000)
                    end
                end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------
        onMobFight = function(mob, target)
                    target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                        if player:isPC() and ability:getID() == 20 then -- chainspell
                          mob:useMobAbility(694) -- Invinvible
                        end
                    end)
        if mob:getHPP() <= 90 and
           mob:getLocalVar('Ebreath') == 0 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 1)
        end
        if mob:getHPP() <= 75 and
           mob:getLocalVar('Ebreath') == 1 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 2)
        end
        if mob:getHPP() <= 25 and
           mob:getLocalVar('Ebreath') == 2 then
           mob:useMobAbility(808)
           mob:setLocalVar('Ebreath', 3)
        end
        if mob:getHPP() <= 50 and
           mob:getLocalVar('Adds') == 1 then
           local vosID = zones[xi.zone.VALLEY_OF_SORROWS]
               GetMobByID(behID.mob.ADAMANTOISE):spawn()
               GetMobByID(behID.mob.ADAMANTOISE):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.ADAMANTOISE):updateClaim(target)
               GetMobByID(behID.mob.ASPIDOCHELONE):spawn()
               GetMobByID(behID.mob.ASPIDOCHELONE):addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
               GetMobByID(behID.mob.ASPIDOCHELONE):updateClaim(target)
           mob:setLocalVar('Adds', 2)
           mob:setLocalVar('AddsTimer', os.time())
        end
           local vosID = zones[xi.zone.VALLEY_OF_SORROWS] -- removes immortal after adman and aspid are killed
        if mob:getLocalVar('AddsTimer') < os.time() and
           mob:getLocalVar('Adds') == 2 and
           not GetMobByID(vosID.mob.ADAMANTOISE):isSpawned() and
           not GetMobByID(vosID.mob.ASPIDOCHELONE):isSpawned() then
           mob:setLocalVar('Adds', 4)
        end
        if mob:getLocalVar('Adds') == 2 then
           mob:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
           mob:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
           mob:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
        end
        if mob:getLocalVar('Adds') == 4 then
           mob:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
           mob:delStatusEffect(xi.effect.ARROW_SHIELD)   
           mob:delStatusEffect(xi.effect.MAGIC_SHIELD)
        end
        if mob:getHPP() <= 10 and
           mob:getLocalVar('supreme_procw') == 0 and
           mob:getLocalVar('Benidiction') == 0 then
           mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
           mob:setLocalVar('Benidiction', 1) -- set so he wont use again
        end
        if mob:getHPP() <= 5 and
           mob:getLocalVar('invincible') == 0 then
           mob:useMobAbility(694) -- uses invincible
           mob:setLocalVar('invincible', 1) -- set so he wont use again
        end
        end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
        if spell:getID() == 173 or 214 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        spell:setFlag(xi.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
        spell:setMPCost(1)
        end
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
            local dayOfWeek = VanadielDayOfTheWeek()
            local spellElement = spell:getElement()
            local curhp = target:getHP()
            local absorb = target:getLocalVar('magical')
            if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                 (caster:isPC() or caster:isPet() or caster:isTrust()) then
                 target:setHP(curhp + absorb) -- absorb spells
                 caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
              end
            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
               target:useMobAbility(695) -- use blood weapon on dia
            end
            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
               target:useMobAbility(690) -- use hundred fist on sleep - this does not proc against lullaby
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
            local alliance = player:getAlliance()
            local partyAllianceCheck = 0

            if player:checkSoloPartyAlliance() == 2 then
                partyAllianceCheck = player:getAlliance()
            else
                partyAllianceCheck = player:getPartyWithTrusts()
            end

            for _, member in pairs(partyAllianceCheck) do
                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 2, true))
                member:delStatusEffect(xi.effect.CONFRONTATION)
            end
        end,
        ---------------------------------------------------------------------------
        -----------onMobDespawn
        ---------------------------------------------------------------------------
        onMobDespawn = function(mob, playerArg, optParams)

        end,
        releaseIdOnDisappear = true,
        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
            require('scripts/mixins/draw_in'),
        },
        specialSpawnAnimation = true,
    })
    -- Use the mob object as you normally would
    mob:setSpawn(6.4430, 0.6940, 21.6073, 84)
    mob:setDropID(4121) 
    mob:setSpellList(256)
    mob:spawn()
    mob:updateEnmity(player)
    mob:updateClaim(player)
 end 
end)
--[[

local menu  = {}
local page1 = {}


local delaySendMenu = function(player)
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

menu =
{
    title = 'Spawn Supreme?',
    options = {},
}

page1 =
{
        {
        'Yes',
         function(player)
                local rand = math.random(1, 100)
                local zone = mob:getZone()
                local filteredEntities = zone:queryEntitiesByName('DE_Supreme.*')
                local spawnSupreme = true

                for _, mob in pairs(filteredEntities) do
                    if mob:isAlive() then
                        spawnSupreme = false
                    end
                end

                if rand <= 25 and
                    spawnSupreme then

                    local alliance = player:getAlliance()
                    local killerClaim = optParams.isKiller
                    local partyAllianceCheck = 0

                    if player:checkSoloPartyAlliance() == 2 then
                        partyAllianceCheck = player:getAlliance()
                    else
                        partyAllianceCheck = player:getPartyWithTrusts()
                    end

                    for _, member in pairs(partyAllianceCheck) do
                        if killerClaim then
                            print(member)
                            member:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                            member:getStatusEffect(xi.effect.CONFRONTATION):delEffectFlag(xi.effectFlag.DEATH)
                        end
                    end

                    local zoneOrInstanceObj = player:getZone()
                    local instance = player:getInstance()

                    if instance then
                        zoneOrInstanceObj = instance
                    end

                    local zone = GetZone(xi.zone.xi.zone.MISAREAUX_COAST)
                    local mob = zoneOrInstanceObj:insertDynamicEntity({

                        objtype = xi.objType.MOB,
                        name = 'Supreme Bahamut',
                        look = '0x00004b0e00000000000000000000000000000000',
                        x = -160.0604,
                        y = -15.6770,
                        z = 632.2044,
                        rotation = 23,
                        groupId = 4, -- NEED TO FIX
                        groupZoneId = 222, -- NEED TO FIX
                        ---------------------------------------------------------------------------
                        -----------onMobSpawn
                        ---------------------------------------------------------------------------
                        onMobSpawn = function(mob)
                            mob:setLocalVar('[rage]timer', 900) -- 3600 = 60 minutes
                            mob:setMobLevel(140)
                            mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
                            mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
                            mob:addMod(xi.mod.MP, 9500)
                            mob:addMod(xi.mod.STR, 400) 
                            mob:addMod(xi.mod.VIT, 400) 
                            mob:addMod(xi.mod.INT, 400) 
                            mob:addMod(xi.mod.MND, 400) 
                            mob:addMod(xi.mod.CHR, 400) 
                            mob:addMod(xi.mod.AGI, 400) 
                            mob:addMod(xi.mod.DEX, 400) 
                            mob:addMod(xi.mod.DEF, 400) 
                            mob:addMod(xi.mod.RATT, 475) 
                            mob:addMod(xi.mod.ACC, 750) 
                            mob:addMod(xi.mod.ATT, 550) 
                            mob:addMod(xi.mod.MATT, 250)
                            mob:addMod(xi.mod.MACC, 750) 
                            mob:addMod(xi.mod.MEVA, 500) 
                            mob:addMod(xi.mod.MDEF, 500)
                            mob:setMod(xi.mod.EVA, 400)
                            mob:setMod(xi.mod.EARTH_SDT, 128)
                            mob:setMod(xi.mod.DARK_SDT, 250)
                            mob:setMod(xi.mod.LIGHT_SDT, 200)
                            mob:setMod(xi.mod.ICE_SDT, 200)
                            mob:setMod(xi.mod.FIRE_SDT, 200)
                            mob:setMod(xi.mod.WATER_SDT, 200)
                            mob:setMod(xi.mod.THUNDER_SDT, 200)
                            mob:setMod(xi.mod.WIND_SDT, 200)
                            mob:setMod(xi.mod.SILENCERES, 100) 
                            mob:setMod(xi.mod.STUNRES, 10) 
                            mob:setMod(xi.mod.BINDRES, 100) 
                            mob:setMod(xi.mod.GRAVITYRES, 100) 
                            mob:setMod(xi.mod.SLEEPRES, 100) 
                            mob:setMod(xi.mod.POISONRES, 100) 
                            mob:setMod(xi.mod.PARALYZERES, 100) 
                            mob:setMod(xi.mod.LULLABYRES, 0) 
                            mob:setMod(xi.mod.FASTCAST, 75) 
                            mob:addStatusEffect(xi.effect.DREAD_SPIKES, 100, 0, 0)
                            mob:addStatusEffect(xi.effect.REGEN, 350, 3, 0)
                            mob:addStatusEffect(xi.effect.REGAIN, 50, 3, 0)
                            mob:addStatusEffect(xi.effect.ENTHUNDER_II, 100, 0, 0)
                            mob:addStatusEffect(xi.effect.CONFRONTATION,1,0,0)
                            mob:setMobMod(xi.mobMod.SKILL_LIST, 2)
                            mob:setMP(mob:getMaxMP())

                            mob:addListener('TAKE_DAMAGE', 'ASPIDS_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                                local accumulatedPhisical = mob:getLocalVar('physical')
                                local accumulatedMagical  = mob:getLocalVar('magical')
                                    if attackType == xi.attackType.PHYSICAL or
                                       attackType == xi.attackType.RANGED then
                                       accumulatedPhisical = accumulatedPhisical + damage -- sets how much damage over all
                                       mob:setLocalVar('physical', damage)
                                    else
                                       accumulatedMagical = accumulatedMagical + damage -- sets how much damage over all
                                       mob:setLocalVar('magical', damage)
                                    end
                            end)

                            local procjobs =
                            {
                                [xi.job.WAR] = 'ws',
                                [xi.job.MNK] = 'ja',
                                [xi.job.WHM] = 'ma',
                                [xi.job.BLM] = 'ma',
                                [xi.job.RDM] = 'ma',
                                [xi.job.THF] = 'ja',
                                [xi.job.PLD] = 'ws',
                                [xi.job.DRK] = 'ws',
                                [xi.job.BST] = 'ja',
                                [xi.job.BRD] = 'ma',
                                [xi.job.RNG] = 'ja',
                                [xi.job.SAM] = 'ws',
                                [xi.job.NIN] = 'ja',
                                [xi.job.DRG] = 'ws',
                                [xi.job.SMN] = 'ma',
                                [xi.job.DNC] = 'ja',
                                [xi.job.SCH] = 'ma',
                                [xi.job.RUN] = 'ws',
                                [xi.job.GEO] = 'ma',
                                [xi.job.COR] = 'ja',
                                [xi.job.BLU] = 'ma',
                                [xi.job.PUP] = 'ws',
                            }
                            mob:addListener('MAGIC_TAKE', 'BAHAMUT_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming 
                                if procjobs[caster:getMainJob()] == 'ma' and
                                    math.random(0, 99) < 10 and
                                    target:getLocalVar('supreme_procm') == 0 then
                                    target:weaknessTrigger(2) -- Red proc
                                    target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                                    target:setLocalVar('supreme_procm', 1)
                                end
                            end)

                            mob:addListener('WEAPONSKILL_TAKE', 'BAHAMUT_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
                                if math.random(0, 99) < 10 then
                                    if target:getLocalVar('supreme_procw') == 0 and user:isPC() or user:isTrust() and procjobs[user:getMainJob()] == 'ws' then
                                        target:weaknessTrigger(0) -- Blue proc
                                        target:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                                        target:setLocalVar('supreme_procw', 1)
                                    end
                                end
                            end)

                            mob:addListener('ABILITY_TAKE', 'BAHAMUT_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
                                if procjobs[user:getMainJob()] == 'ja' and
                                    math.random(0, 99) < 10 and
                                    mob:getLocalVar('supreme_proca') == 0 then
                                    mob:weaknessTrigger(3) -- White proc
                                    mob:delStatusEffect(xi.effect.DREAD_SPIKES)
                                    mob:delStatusEffect(xi.effect.REGEN)
                                    mob:delStatusEffect(xi.effect.REGAIN)
                                    mob:delStatusEffect(xi.effect.ENTHUNDER_II)
                                    mob:addStatusEffect(xi.effect.TERROR, 0, 0, 15)
                                    mob:setLocalVar('supreme_proca', 1)
                                end
                            end)

                            local elements =
                            {
                                { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
                                { xi.mod.SLASH_SDT,  xi.day.WATERSDAY     },
                                { xi.mod.PIERCE_SDT, xi.day.ICEDAY        },
                                { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
                                { xi.mod.HTH_SDT,    xi.day.LIGHTSDAY     },
                                { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
                                { xi.mod.PIERCE_SDT, xi.day.WINDSDAY      },
                                { xi.mod.IMPACT_SDT, xi.day.EARTHSDAY     },
                            }
        
        
                            local dayOfWeek = VanadielDayOfTheWeek()
                                for k, v in pairs(elements) do
                                    if dayOfWeek == v[2] then
                                        mob:setMod(v[1], 1000)
                                    end
                                end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobFight
                        ---------------------------------------------------------------------------
                        onMobFight = function(mob, target)
                            target:addListener('ABILITY_USE',  'PLAYER_ABILITY', function(player, target, ability, action)
                                if player:isPC() and ability:getID() == 20 then -- chainspell
                                    mob:useMobAbility(694) -- Invinvible
                                end
                            end)
                            if mob:getHPP() <= 90 and
                               mob:getLocalVar('Ebreath') == 0 then
                               mob:useMobAbility(808)
                               mob:setLocalVar('Ebreath', 1)
                            end
                            if mob:getHPP() <= 75 and
                               mob:getLocalVar('Ebreath') == 1 then
                               mob:useMobAbility(808)
                               mob:setLocalVar('Ebreath', 2)
                            end
                            if mob:getHPP() <= 25 and
                               mob:getLocalVar('Ebreath') == 2 then
                               mob:useMobAbility(808)
                               mob:setLocalVar('Ebreath', 3)
                            end
                            if mob:getHPP() <= 50 and
                            end
                            if mob:getHPP() <= 10 and
                               mob:getLocalVar('supreme_procw') == 0 and
                               mob:getLocalVar('Benidiction') == 0 then
                               mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
                               mob:setLocalVar('Benidiction', 1) -- set so he wont use again
                            end
                            if mob:getHPP() <= 5 and
                               mob:getLocalVar('invincible') == 0 then
                               mob:useMobAbility(694) -- uses invincible
                               mob:setLocalVar('invincible', 1) -- set so he wont use again
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onSpellPrecast
                        ---------------------------------------------------------------------------
                        onSpellPrecast = function(mob, spell)
                            if spell:getID() == 173 or 214 then
                                spell:setAoE(xi.magic.aoe.RADIAL)
                                spell:setFlag(xi.magic.spellFlag.HIT_ALL)
                                spell:setRadius(20)
                                spell:setMPCost(1)
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMagicHit
                        ---------------------------------------------------------------------------
                        onMagicHit = function(caster, target, spell)
                            local dayOfWeek = VanadielDayOfTheWeek()
                            local spellElement = spell:getElement()
                            local curhp = target:getHP()
                            local absorb = target:getLocalVar('magical')
                              if spellElement == xi.combat.element.getDayElement(dayOfWeek) and
                                 (caster:isPC() or caster:isPet() or caster:isTrust()) then
                                 target:setHP(curhp + absorb) -- absorb spells
                                 caster:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
                              end
                            if spell:getID() == 23 or spell:getID() == 24 or spell:getID() == 25 then
                               target:useMobAbility(695) -- use blood weapon on dia
                            end
                            if spell:getID() == 253 or spell:getID() == 273 or spell:getID() == 274 or spell:getID() == 259 and target:getLocalVar('supreme_procm') ~= 1  then
                               target:useMobAbility(690) -- use hundred fist on sleep - this does not proc against lullaby
                            end
                            if spell:getID() == 79 or spell:getID() == 80 or then
                                target:setMP(target:getMaxMP())
                                target:useMobAbility(691) -- Manafont when using paralyze
                                target:timer(100, function(targetArg)
                                    target:useMobAbility(692) -- ChainSpell when using paralyze
                                end)
                            end
                                
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobDeath
                        ---------------------------------------------------------------------------
                        onMobDeath = function(mob, playerArg, optParams)
                            local alliance = player:getAlliance()
                            local partyAllianceCheck = 0

                            if player:checkSoloPartyAlliance() == 2 then
                                partyAllianceCheck = player:getAlliance()
                            else
                                partyAllianceCheck = player:getPartyWithTrusts()
                            end

                            for _, member in pairs(partyAllianceCheck) do
                                member:setCharVar('Supremes', utils.mask.setBit(member:getCharVar('Supremes'), 2, true))
                                member:delStatusEffect(xi.effect.CONFRONTATION)
                            end
                        end,
                        ---------------------------------------------------------------------------
                        -----------onMobDespawn
                        ---------------------------------------------------------------------------
                        onMobDespawn = function(mob, playerArg, optParams)

                        end,

                        releaseIdOnDisappear = true,
                        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
                        mixins =
                        {
                            require('scripts/mixins/rage'),
                            require('scripts/mixins/job_special'),
                            require('scripts/mixins/draw_in'),
                        },
                        specialSpawnAnimation = true,
                     })
                        -- Use the mob object as you normally would
                        mob:setSpawn(-160.0604, -15.6770, 632.2044, 23)
                        mob:setDropID(4122)
                        mob:setSpellList(256)-- ****NEED TO FIX
                        mob:spawn()
                        mob:updateEnmity(player)
                        mob:updateClaim(player)
                end    
         end
    },
        {
        'No',
         function(player)
            return
         end
    },
}

m:addOverride('xi.zones.Misareaux_Coast.Zone.onInitialize',function(zone)
    super(zone)
    local qmBah = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = '???',
        look = '0x0000340000000000000000000000000000000000',
        x         = -160.0604,
        y         = -15.6770,
        z         = 632.2044,
        rotation = 123,
        widescan = 1,
        onTrade = function(player, npc, trade)
            
        end,

        onTrigger = function(player, npc)
            local killCount = player:getCharVar('Supremes')

            if killCount ~= 7 then
                player:printToPlayer('An aura of irrepressible might threatens to overwhelm you...', xi.msg.channel.NS_SAY)
            else
                player:timer(250, function(playerArg)
                menu.options = page1
                delaySendMenu(playerArg)
                end)
            end
        end,
    })
end)


Spawnpoint Mis Coast -160.0604 -15.6770 632.2044 rotation 23
Chaos model look = 0x00004b0e00000000000000000000000000000000
target:setAnimationSub(1) & 2 for sheilds
m:addOverride('xi.zones.Misareaux_Coast.Zone.onInitialize',function(zone)
    super(zone)

end)
]]--


return m


