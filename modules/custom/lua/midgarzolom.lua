-----------------------------------
--Midgar Zolom
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Valkurm_Dunes/Zone")
-----------------------------------
local m = Module:new("midgarZolom")
local ID = zones[xi.zone.VALKURM_DUNES]

local Zolom =
{
    {'Midgar Zolom', 63, 288, '0000eb0700000000000000000000000000000000', xi.zone.VALKURM_DUNES, -559, 0, -152, 0, 'Valkurm_Dunes'},
}

for _, entry in pairs(Zolom) do

    m:addOverride(string.format('xi.zones.%s.Zone.onInitialize', entry[10]), function(zone)
        super(zone)

        local namez = entry[1]
        local mob = zone:insertDynamicEntity({
            objtype = xi.objType.MOB,
            name = namez,
            look = entry[4],
            x = entry[6],
            y = entry[7],
            z = entry[8],
            rotation = entry[9],
            widescan = 1,
            groupId = entry[2],
            respawn = 60,
            spawnType = 0,
            groupZoneId = entry[3],
            minLevel = 130,
            maxLevel = 130,
            ---------------------------------------------------------------------------
            -----------onMobSpawn
            ---------------------------------------------------------------------------
            onMobSpawn = function(mob)
                mob:setBaseSpeed(100)
                mob:setMobLevel(130)
                mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mob:addMod(xi.mod.MAIN_DMG_RATING, 150)
                mob:setAggressive(false)
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
                mob:addStatusEffect(xi.effect.BLAZE_SPIKES, { power = 100, duration = 0, origin = mob})
                mob:addStatusEffect(xi.effect.REGEN, { power = 35, duration = 0, origin = mob, tick = 3 })
                mob:addStatusEffect(xi.effect.REGAIN, { power = 50, duration = 0, origin = mob})
                mob:addStatusEffect(xi.effect.ENFIRE_II, { power = 100, duration = 0, origin = mob})
                mob:setMobMod(xi.mobMod.SKILL_LIST, 0)
                mob:setMP(mob:getMaxMP())

                mob:addListener('TAKE_DAMAGE', 'ZOLOM_TAKE_DAMAGE', function(mob, damage, attacker, attackType, damageType)
                    local accumulatedPhisical = mob:getLocalVar('physical')
                    local accumulatedMagical  = mob:getLocalVar('magical')
                    if
                        attackType == xi.attackType.PHYSICAL or
                        attackType == xi.attackType.RANGED
                    then
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

                mob:addListener('MAGIC_TAKE', 'ZOLOM_MAGIC_TAKE', function(target, caster, spell) -- prevents from charming
                    if
                        procjobs[caster:getMainJob()] == 'ma' and
                        math.random(0, 99) < 10 and
                        target:getLocalVar('supreme_procm') == 0
                    then
                        target:weaknessTrigger(2) -- Red proc
                        target:addStatusEffect(xi.effect.TERROR, { power = 0, tick = 0, duration = 15 })
                        target:setLocalVar('supreme_procm', 1)
                    end
                end)

                mob:addListener('WEAPONSKILL_TAKE', 'ZOLOM_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
                    if math.random(0, 99) < 10 then
                        if
                            target:getLocalVar('supreme_procw') == 0 and
                            user:isPC() or user:isTrust() and
                            procjobs[user:getMainJob()] == 'ws'
                        then
                            target:weaknessTrigger(0) -- Blue proc
                            target:addStatusEffect(xi.effect.TERROR, { power = 0, tick = 0, duration = 15 })
                            target:setLocalVar('supreme_procw', 1)
                        end
                    end
                end)

                mob:addListener('ABILITY_TAKE', 'ZOLOM_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
                    if
                        procjobs[user:getMainJob()] == 'ja' and
                        math.random(0, 99) < 10 and
                        mob:getLocalVar('supreme_proca') == 0
                    then
                        mob:weaknessTrigger(3) -- White proc
                        mob:delStatusEffect(xi.effect.BLAZE_SPIKES)
                        mob:delStatusEffect(xi.effect.REGEN)
                        mob:delStatusEffect(xi.effect.REGAIN)
                        mob:delStatusEffect(xi.effect.ENFIRE_II)
                        mob:addStatusEffect(xi.effect.TERROR, { power = 0, tick = 0, duration = 15 })
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
                    { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGDAY  },
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

                local skillz = {2187, 2188, 2189}
                if
                    os.time() > mob:getLocalVar('WS_Cooldown') and
                    mob:getTP() >= 1000
                then
                    if mob:actionQueueEmpty() == true then
                        mob:useMobAbility(skillz[math.random(1, 3)])
                        mob:setLocalVar('WS_Cooldown', os.time() + 30)
                    end
                end

                if
                    mob:getHPP() <= 90 and
                    mob:getLocalVar('Stoneja') == 0
                then
                    mob:castSpell(499)
                    mob:setLocalVar('Stoneja', 1)
                end

                if
                    mob:getHPP() <= 75 and
                    mob:getLocalVar('Stoneja') == 1
                then
                    mob:castSpell(499)
                    mob:setLocalVar('Stoneja', 2)
                end

                if
                    mob:getHPP() <= 25 and
                    mob:getLocalVar('Stoneja') == 2
                then
                    mob:castSpell(499)
                    mob:setLocalVar('Stoneja', 3)
                end


                if
                    mob:getHPP() <= 10 and
                    mob:getLocalVar('supreme_procw') == 0 and
                    mob:getLocalVar('Benidiction') == 0
                then
                    mob:useMobAbility(689) -- uses benidiction if magic proc isnt completed
                    mob:setLocalVar('Benidiction', 1) -- set so he wont use again
                end

                if
                    mob:getHPP() <= 5 and
                    mob:getLocalVar('HundoFist') == 0
                then
                    mob:useMobAbility(690) -- uses Hundred fist
                    mob:setLocalVar('HundoFist', 1) -- set so he wont use again
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

                if
                    spellElement == xi.data.element.getDayElement(dayOfWeek) and
                    (caster:isPC() or
                    caster:isPet() or
                    caster:isTrust())
                then
                    target:setHP(curhp + absorb) -- absorb spells
                    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, absorb)
                end

                if
                    spell:getID() == 23 or
                    spell:getID() == 24 or
                    spell:getID() == 25
                then
                    target:useMobAbility(695) -- use blood weapon on dia
                end

                if
                    spell:getID() == 253 or
                    spell:getID() == 273 or
                    spell:getID() == 274 or
                    spell:getID() == 259 and
                    target:getLocalVar('supreme_procm') ~= 1
                then
                    target:useMobAbility(710) -- use charm on sleep - this does not proc against lullaby
                end
            end,

            ---------------------------------------------------------------------------
            -----------onMobDeath
            ---------------------------------------------------------------------------
            onMobDeath = function(mob, player, optParams)
                mob:setWeather(xi.weather.SUNSHINE)
                mob:timer(3600000, function(mob)
                    mob:spawn()
                end)
            end,
            ---------------------------------------------------------------------------
            -----------onMobDespawn
            ---------------------------------------------------------------------------
            onMobDespawn = function(mob)

            end,
            ---------------------------------------------------------------------------
            -----------onMobRoam
            ---------------------------------------------------------------------------
            onMobRoam = function(mob)

                local weather = mob:getWeather()

                if weather ~= xi.weather.DUST_STORM then
                    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
                    mob:setPos(entry[6], entry[7], entry[8], entry[9])
                    mob:setLocalVar('Stoneja', 0)
                    mob:setLocalVar('HundoFist', 0)
                    mob:setLocalVar('Benidiction', 0) -- set so he wont use again
                end

                if weather == xi.weather.DUST_STORM then
                    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
                    local players = zone:getPlayers()

                    for _, player in pairs(players) do
                        if
                            player:getMainLvl() >= 99 and
                            not player:hasStatusEffect(xi.effect.CONFRONTATION) and
                            not player:hasStatusEffect(xi.effect.MOUNTED)
                        then
                            mob:addEnmity(player, 1, 1)
                        else
                            mob:resetEnmity(player)
                        end
                    end
                end
            end,

            onAdditionalEffect = function(mob, target, damage)
                return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PETRIFY, { chance = 100 })
            end,

            -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
            mixins =
            {
                require('scripts/mixins/job_special'),
            },
            specialSpawnAnimation = true,

        })
        -- Use the mob object as you normally would
        mob:setSpawn(entry[6], entry[7], entry[8], entry[9], entry[5])
        mob:spawn()
        mob:setDropID(4218)
    end)
end

return m
