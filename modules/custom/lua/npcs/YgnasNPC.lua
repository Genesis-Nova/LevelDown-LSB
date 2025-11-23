----------------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
----------------------------------------

local m = Module:new("YgnasNPC")


m:addOverride('xi.zones.Yorcia_Weald.Zone.onInitialize', function(zone)
    -- Call the zone's original function for onInitialize
    super(zone)

    local Ygnas = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = 'Lord Cabbage',
        look = '00002e0c00000000000000000000000000000000',
        x = -474.5724,
        y =  0.4221,
        z = -85.4789,
        rotation = 26,
        widescan = 1,
        onTrade = function(player, npc, trade)

        end,

        onTrigger = function(player, npc)
            if player:getCharVar('cabbageOrder') == 1 then
                local zone = player:getZone()
                local mob  =  zone:insertDynamicEntity({
                    objtype  =  xi.objType.MOB,
                    name  =  'Ygnas',
                    look  =  '00002e0c00000000000000000000000000000000',
                    x  =  -504,
                    y  =  1.0,
                    z  =  -59,
                    rotation  =  49,
                    widescan  =  1,
                    groupId  =  11506,
                    groupZoneId  =  299,

                    onMobSpawn  =  function(mob,   player,   optParams)
                        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
                        mob:setMobMod(xi.mobMod.ROAM_DISTANCE,   10)
                        mob:setMobMod(xi.mobMod.CHECK_AS_NM,   1)
                        mob:setSpellList(214)
                        mob:setMobMod(xi.mobMod.SKILL_LIST, 1113)
                        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                        mob:addMod(xi.mod.MAIN_DMG_RATING, 25)
                        mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
                        mob:addMod(xi.mod.DIVINE, 100)
                        mob:addMod(xi.mod.STR, 100)
                        mob:addMod(xi.mod.MND, 400)
                        mob:addMod(xi.mod.ACC, 750)
                        mob:addMod(xi.mod.ATT, 550)
                        mob:addMod(xi.mod.MATT, 125)
                        mob:addMod(xi.mod.MACC, 750)
                        mob:setMod(xi.mod.SILENCERES, 100)
                        mob:setMod(xi.mod.STUNRES, 100)
                        mob:setMod(xi.mod.BINDRES, 100)
                        mob:setMod(xi.mod.GRAVITYRES, 100)
                        mob:setMod(xi.mod.SLEEPRES, 100)
                        mob:setMod(xi.mod.POISONRES, 100)
                        mob:setMod(xi.mod.PARALYZERES, 100)
                        mob:setMod(xi.mod.LULLABYRES, 100)
                        mob:setMod(xi.mod.FASTCAST, 75)
                    end,

                    onMobFight  =  function(mob, target)
                        if mob:getHPP() < 50 then
                            mob:setDelay(1500)
                        else
                            mob:setDelay(3000)
                        end
                    end,

                    onMobDeath  =  function(mob,   player,   optParams)
                        local ID = zones[xi.zone.YORCIA_WEALD]
                        player:addSpell(xi.magic.spell.YGNAS, { silentLog = true })
                        player:printToPlayer('Fine I will join you!',0,'Ygnas')
                    end,
                    specialSpawnAnimation  =  false,
                    releaseIdOnDisappear = true,

                })
                mob:setSpawn(-504, 1, -59, 49, xi.zone.YORCIA_WEALD)
                mob:setDropID(0) -- loot id
                mob:spawn()
                player:printToPlayer('Ygnas is up ahead, get ready to choke on salad!!',0,'Lord Cabbage')
                player:setCharVar('cabbageOrder', 0)
            else
                player:printToPlayer('Who are you? Get away before I turn you into chopped salad!',0,'Lord Cabbage')
            end
        end,
    })
    utils.unused(YgnasNPC)
end)

    -- Deific Gambol
    xi.module.ensureTable("xi.actions.mobskills.deific_gambol")
        m:addOverride("xi.actions.mobskills.deific_gambol.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.deific_gambol.onMobWeaponSkill", function(target, mob, skill)
            local numhits = 1
            local accmod = 2
            local dmgmod = 4.5
            local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
            local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
            target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)

            return dmg
        end)

    -- Sacred Caper
    xi.module.ensureTable("xi.actions.mobskills.Sacred Caper")
        m:addOverride("xi.actions.mobskills.Sacred Caper.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.Sacred Caper.onMobWeaponSkill", function(target, mob, skill)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.RASP, 1, 0, 60)
            xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, 1, 0, 15)
            local damage = target:getMaxHP() / 2
            target:takeDamage(damage, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
            return damage
        end)
    -- phototrophic_blessing
    xi.module.ensureTable("xi.actions.mobskills.phototrophic_blessing")
        m:addOverride("xi.actions.mobskills.phototrophic_blessing.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.phototrophic_blessing.onMobWeaponSkill", function(target, mob, skill)
            local tpFactor = utils.clamp(3 * (skill:getTP() - 1000) / 1000, 0, 6)
            local power    = 5 + tpFactor

            xi.mobskills.mobBuffMove(mob, xi.effect.REGEN, power, 3, 300)
            xi.mobskills.mobBuffMove(mob, xi.effect.DEFENSE_BOOST, 50, 0, 60)
            xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_DEF_BOOST, 50, 0, 60)
            -- Ygnas will heal slightly
            return xi.mobskills.mobHealMove(target, math.random(20000, 75000))
        end)
    -- phototrophic_wrath
    xi.module.ensureTable("xi.actions.mobskills.phototrophic_wrath")
        m:addOverride("xi.actions.mobskills.phototrophic_wrath.onMobSkillCheck", function(target, mob, skill)

            return 0
        end)
        m:addOverride("xi.actions.mobskills.phototrophic_wrath.onMobWeaponSkill", function(target, mob, skill)
            xi.mobskills.mobBuffMove(mob, xi.effect.ATTACK_BOOST, 50, 0, 60)
            xi.mobskills.mobBuffMove(mob, xi.effect.MAGIC_ATK_BOOST, 50, 0, 60)
            skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.HASTE, 3000, 0, 60))
            return xi.effect.HASTE
        end)

return m
