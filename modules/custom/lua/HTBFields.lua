-- mob name / mob id / zone / npc id / battlefield name / ki id / ki
local info = 
{
{'Ifrit_Prime_HTBF',    17625121, 'Cloister_of_Flames',       17625134, 'trial_by_fire_ii',             2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Shiva_Prime_HTBF',    17608749, 'Cloister_of_Frost',        17608768, 'trial_by_ice_ii',              2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Garuda_Prime_HTBF',   17600548, 'Cloister_of_Gales',        17600561, 'trial_by_wind_ii',             2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Titan_Prime_HTBF',    17633319, 'Cloister_of_Tremors',      17633329, 'trial_by_earth_ii',            2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Leviathan_Prime_HTBF',17641505, 'Cloister_of_Tides',        17641518, 'trial_by_water_ii',            2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Ramuh_Prime_HTBF',    17604645, 'Cloister_of_Storms',       17604660, 'trial_by_lightning_ii',        2619, xi.ki.AVATAR_PHANTOM_GEM};
{'Fenrir_Prime',        17473648, 'Full_Moon_Fountain',       17473678, 'moonlit_path_ii',              2923, xi.ki.MOONLIT_PATH_PHANTOM_GEM};
{'Carbuncle_Prime',     17473666, 'Full_Moon_Fountain',       17473678, 'waking_the_beast_fullmoon_ii', 2924, xi.ki.WAKING_THE_BEAST_PHANTOM_GEM};
{'Diabolos_HTBF',       16818239, 'The_Shrouded_Maw',         16818247, 'waking_dreams_ii',             2925, xi.ki.WAKING_DREAMS_PHANTOM_GEM};
{'Lancelord_Gaheel_Ja', 17051697, 'Jade_Sepulcher',           17051835, 'puppet_in_peril_ii',           2556, xi.ki.PUPPET_IN_PERIL_PHANTOM_GEM};
{'Gessho',              17010752, 'Talacca_Cove',             17010873, 'legacy_of_the_lost_ii',        2557, xi.ki.LEGACY_PHANTOM_GEM};
{'Ouryu',               16904295, 'Monarch_Linn',             16904337, 'savage_ii',                    2545, xi.ki.SAVAGES_PHANTOM_GEM};
{'Shikaree_X',          16810177, 'Boneyard_Gully',           16810206, 'head_wind_ii',                 2595, xi.ki.HEAD_WIND_PHANTOM_GEM};
{'Shikaree_Xs_Rabbit',  16810189, 'Boneyard_Gully',           16810206, 'head_wind_ii',                 2595, xi.ki.HEAD_WIND_PHANTOM_GEM};
{'Shikaree_Y',          16810166, 'Boneyard_Gully',           16810206, 'head_wind_ii',                 2595, xi.ki.HEAD_WIND_PHANTOM_GEM};
{'Shikaree_Z',          16810170, 'Boneyard_Gully',           16810206, 'head_wind_ii',                 2595, xi.ki.HEAD_WIND_PHANTOM_GEM};
{'Shikaree_Zs_Wyvern',  16810143, 'Boneyard_Gully',           16810206, 'head_wind_ii',                 2595, xi.ki.HEAD_WIND_PHANTOM_GEM};
{'Omega',               16908392, 'Sealions_Den',             16908419, 'one_to_be_feared_ii',          2987, xi.ki.FEARED_ONE_PHANTOM_GEM};
{'Ultima',              16908399, 'Sealions_Den',             16908419, 'one_to_be_feared_ii',          2987, xi.ki.FEARED_ONE_PHANTOM_GEM};
{'Tenzen',              16908362, 'Sealions_Den',             16908419, 'warriors_path_ii',             2546, xi.ki.WARRIORS_PATH_PHANTOM_GEM};
{'Promathia',           16924720, 'Empyreal_Paradox',         16924739, 'dawn_ii',                      2988, xi.ki.DAWN_PHANTOM_GEM};
-- {'Shadow_Lord_HTBF_1',  17453263, 'Throne_Room',              17453300, 'shadow_lord_battle_ii',        2468, xi.ki.SHADOW_LORD_PHANTOM_GEM};
-- {'Shadow_Lord_HTBF_2',  17453264, 'Throne_Room',              17453300, 'shadow_lord_battle_ii',        2468, xi.ki.SHADOW_LORD_PHANTOM_GEM};
{'Kamlanaut',           17510577, 'Stellar_Fulcrum',          17510702, 'return_to_delkfutts_tower_ii', 2470, xi.ki.STELLAR_FULCRUM_PHANTOM_GEM};
{'Ark_Angel_HM',        17514689, 'LaLoff_Amphitheater',      17514794, 'ark_angels_hm_ii',             2471, xi.ki.PHANTOM_GEM_OF_APATHY};
{'Ark_Angel_TT',        17514574, 'LaLoff_Amphitheater',      17514794, 'ark_angels_tt_ii',             2474, xi.ki.PHANTOM_GEM_OF_COWARDICE};
{'Ark_Angel_MR',        17514646, 'LaLoff_Amphitheater',      17514794, 'ark_angels_mr_ii',             2473, xi.ki.PHANTOM_GEM_OF_ENVY};
{'Ark_Angels_Tiger',    17514771, 'LaLoff_Amphitheater',      17514794, 'ark_angels_mr_ii',             2473, xi.ki.PHANTOM_GEM_OF_ENVY};
{'Ark_Angel_EV',        17514573, 'LaLoff_Amphitheater',      17514794, 'ark_angels_ev_ii',             2472, xi.ki.PHANTOM_GEM_OF_ARROGANCE};
{'Ark_Angel_GK',        17514735, 'LaLoff_Amphitheater',      17514794, 'ark_angels_gk_ii',             2475, xi.ki.PHANTOM_GEM_OF_RAGE};
{'Ark_Angels_Wyvern',   17514576, 'LaLoff_Amphitheater',      17514794, 'ark_angels_gk_ii',             2475, xi.ki.PHANTOM_GEM_OF_RAGE};
{'Ark_Angel_HM',        17514633, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angel_TT',        17514630, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angel_MR',        17514570, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angels_Tiger',    17514601, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angel_EV',        17514781, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angel_GK',        17514631, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ark_Angels_Wyvern',   17514784, 'LaLoff_Amphitheater',      17514794, 'divine_might_ii',              2476, xi.ki.P_PERPETRATOR_PHANTOM_GEM,};
{'Ealdnarche',          17518682, 'The_Celestial_Nexus',      17514794, 'celestial_nexus_ii',           2469, xi.ki.CELESTIAL_NEXUS_PHANTOM_GEM};
{'Ealdnarche_2',        17518612, 'The_Celestial_Nexus',      17514794, 'celestial_nexus_ii',           2469, xi.ki.CELESTIAL_NEXUS_PHANTOM_GEM};
{'Exoplates',           17518666, 'The_Celestial_Nexus',      17514794, 'celestial_nexus_ii',           2469, xi.ki.CELESTIAL_NEXUS_PHANTOM_GEM};
{'Imp_Bandsman',        17010695, 'Talacca_Cove',             17010873, 'call_to_arms',                 807,  xi.ki.CONFIDENTIAL_IMPERIAL_ORDER};
{'Angler_Orobon',       17010713, 'Talacca_Cove',             17010873, 'compliments_to_the_chef',      808,  xi.ki.SECRET_IMPERIAL_ORDER};
{'Watch_Wamoura',       17039361, 'Navukgo_Execution_Chamber',17039426, 'tough_nut_to_crack',           807,  xi.ki.CONFIDENTIAL_IMPERIAL_ORDER};
{'Two-faced_Flan',      17039367, 'Navukgo_Execution_Chamber',17039426, 'happy_caster',                 808,  xi.ki.SECRET_IMPERIAL_ORDER};
{'Mocking_Colibri',     17051649, 'Jade_Sepulcher',           17051835, 'making_a_mockery',             807,  xi.ki.CONFIDENTIAL_IMPERIAL_ORDER};
{'Phantom_Puk',         17051655, 'Jade_Sepulcher',           17051835, 'shadows_of_the_mind',          808,  xi.ki.SECRET_IMPERIAL_ORDER};

}

--------------------------------------------------------------------------------------------
--*** add loot to sql, fix npc modules
--------------------------------------------------------------------------------------------

--- Puts the NM's / npc / abilities in the zones without having a file in zones/mobs
local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
for _, entry in pairs(info) do
ensureTable(string.format("xi.zones.%s.mobs.%s", entry[3], entry[1]))
ensureTable(string.format("xi.zones.%s.bcnms.%s", entry[3], entry[5]))
end
ensureTable('xi.zones.Empyreal_Paradox.npcs.Transcendental_Radiance')
ensureTable('xi.scripts.battlefields.Throne_Room.shadow_lord_battle_ii')
ensureTable('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk')
ensureTable('xi.actions.mobskills.boreas_mantle')
ensureTable('xi.actions.mobskills.bugle_call')
ensureTable('xi.actions.mobskills.bowels_of_agony')
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
require("scripts/globals/mobskills")
-----------------------------------

local m = Module:new("HTBFields")

m:addOverride('xi.battlefield.id', function()
    super()
xi.battlefield.id =
{
        TRIAL_BY_FIRE_II                                =  548,
        TRIAL_BY_WIND_II                                =  421,
        TRIAL_BY_WATER_II                               =  612,
        TRIAL_BY_EARTH_II                               =  581,
        TRIAL_BY_ICE_II                                 =  485,
        TRIAL_BY_LIGHTNING_II                           =  453,       
        SHADOW_LORD_BATTLE_II                           =  166,
        RETURN_TO_DELKFUTTS_TOWER_II                    =  263,
        CELESTIAL_NEXUS_II                              =  321,
        DIVINE_MIGHT_II                                 =  299,
        SAVAGE_II                                       =  968,
        HEAD_WIND_II                                    =  680,
        ONE_TO_BE_FEARED_II                             =  995,
        WARRIORS_PATH_II                                =  994,
        DAWN_II                                         = 1059,
        PUPPET_IN_PERIL_II                              = 1157,
        LEGACY_OF_THE_LOST_II                           = 1093,                         
        MOONLIT_PATH_II                                 =  228,
        WAKING_DREAMS_II                                =  707,
        WAKING_THE_BEAST_FULLMOON_II                    =  229,
        ARK_ANGELS_HM_II                                =  294,
        ARK_ANGELS_TT_II                                =  295,
        ARK_ANGELS_MR_II                                =  296,
        ARK_ANGELS_EV_II                                =  297,
        ARK_ANGELS_GK_II                                =  298,
}
end)


for _, entry in pairs(info) do

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onBattlefieldInitialise', entry[3], entry[5]), function(battlefield)
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onBattlefieldTick',entry[3], entry[5]), function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onBattlefieldRegister',entry[3], entry[5]), function(player, battlefield)
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onBattlefieldEnter',entry[3], entry[5]),  function(player, battlefield)
        player:delKeyItem(entry[7])
        player:messageSpecial(6394, entry[6])
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onBattlefieldLeave',entry[3], entry[5]), function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar('[cs]bit'))
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onEventUpdate',entry[3], entry[5]), function(player, csid, option, npc)
end)

m:addOverride(string.format('xi.zones.%s.bcnms.%s.onEventFinish',entry[3], entry[5]), function(player, csid, option, npc)
end)
end


for _, entry in pairs(info) do
m:addOverride(string.format('xi.zones.%s.mobs.%s.onMobSpawn', entry[3], entry[1]), function(mob)
end)

m:addOverride(string.format('xi.zones.%s.mobs.%s.onMobFight', entry[3], entry[1]), function(mob, target)
end)

m:addOverride(string.format('xi.zones.%s.mobs.%s.onMobDeath', entry[3], entry[1]), function(mob, player, battlefield)
end)
end

-------------------------------------------------------------------------
-----------Purchase Secret / Confidential Imperial Order-----------------
-------------------------------------------------------------------------
m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onTrigger', function(player, npc)
    local amount = player:getCurrency('imperial_standing')
          player:startEvent(160, amount)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onEventFinish', function(player, csid, option, npc)
    if csid == 160 and option == 1 then
        if player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) then
                    player:messageBasic(759, s , xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) -- Already have Key Item
                    return
        elseif player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) ~= true then
                    npcUtil.giveKeyItem(player, xi.ki.CONFIDENTIAL_IMPERIAL_ORDER)
                    player:delCurrency('imperial_standing', 2000)
        end
    end
        if csid == 160 and option == 2 then
        if player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) then
                    player:messageBasic(759, s , xi.ki.SECRET_IMPERIAL_ORDER) -- Already have Key Item
                    return
        elseif player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) ~= true then
                    npcUtil.giveKeyItem(player, xi.ki.SECRET_IMPERIAL_ORDER)
                    player:delCurrency('imperial_standing', 3000)
        end
    end
end)

-------------------------------------------------------------------------
-----------One to be Feared----------------------------------------------
-------------------------------------------------------------------------

m:addOverride('xi.zones.Sealions_Den.bcnms.one_to_be_feared_ii.onBattlefieldInitialise', function(battlefield)
battlefield:setLocalVar('phaseChange', 1) -- Prevent battlefield from being completed until we want to.
end)

m:addOverride('xi.zones.Sealions_Den.mobs.Omega.onMobDeath', function(mob, player, battlefield)
local battlefield = player:getBattlefield()
battlefield:setLocalVar('UltimaSpawn',os.time())
end)

m:addOverride('xi.zones.Sealions_Den.bcnms.one_to_be_feared_ii.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
    if GetMobByID(16908392):isSpawned() ~= true then
            if battlefield:getLocalVar('UltimaSpawn') +120  == os.time() then -- 2 minutes from Omega death to Ultima Spawn
                SpawnMob(16908399)
            end
    end
end)

m:addOverride('xi.zones.Sealions_Den.mobs.Ultima.onMobDeath', function(mob, player, battlefield)
local battlefield = player:getBattlefield()
battlefield:setLocalVar('phaseChange', 0) --- finish battlefield
battlefield:setLocalVar('UltimaSpawn', 0)
end)
-------------------------------------------------------------------------
-----------DAWN_II-------------------------------------------------------
-------------------------------------------------------------------------


m:addOverride('xi.zones.Empyreal_Paradox.npcs.Transcendental_Radiance.onTrade', function(player, npc, trade)
    xi.bcn.onTrade(player, npc, trade)
end)

m:addOverride('xi.zones.Empyreal_Paradox.npcs.Transcendental_Radiance.onTrigger', function(player, npc)
    xi.bcnm.onTrigger(player, npc)
end)

m:addOverride('xi.zones.Empyreal_Paradox.npcs.Transcendental_Radiance.onEventUpdate', function(player, csid, option, npc)
    xi.bcnm.onEventUpdate(player, csid, option, npc)
end)

m:addOverride('xi.zones.Empyreal_Paradox.npcs.Transcendental_Radiance.onEventFinish', function(player, csid, option, npc)
    xi.bcnm.onEventFinish(player, csid, option, npc)
end)

-------------------------------------------------------------------------
-----------SHADOW_LORD_BATTLE_II----------------------------------------- 
-------------------------------------------------------------------------
--[[
m:addOverride('xi.zones.Throne_Room.npcs._4l1.onTrade', function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end)

m:addOverride('xi.zones.Throne_Room.npcs._4l1.onTrigger', function(player, npc)
    xi.bcnm.onTrigger(player, npc)
end)

m:addOverride('xi.zones.Throne_Room.npcs._4l1.onEventUpdate', function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, npc)
end)

m:addOverride('xi.zones.Throne_Room.npcs._4l1.onEventFinish', function(player, csid, option, npc)
    xi.bcnm.onEventFinish(player, csid, option, npc)
end)

m:addOverride('xi.actions.mobskills.bowels_of_agony.onMobSkillCheck', function(target, mob, skill)
return 0
end)

m:addOverride('xi.actions.mobskills.bowels_of_agony.onMobWeaponSkill', function(target, mob, skill)
    local dmgmod = 1
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg(), xi.element.DARK, dmgmod, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK,xi.mobskills.shadowBehavior.WIPE_SHADOWS)
        target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.DARK)
    return dmg
end)

m:addOverride('xi.scripts.battlefields.Throne_Room.shadow_lord_battle_ii.onBattlefieldInitialise', function(battlefield)
battlefield:setLocalVar('phaseChange', 1)
end)

m:addOverride('xi.scripts.battlefields.Throne_Room.shadow_lord_battle_ii.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobInitialize', function(mob)
if mob:getID() == 17453263 then
mob:setMobLevel(125) --- not setting level
end
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobSpawn', function(mob)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobEngaged', function(mob, target)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobFight', function(mob, target)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobDeath', function(mob, player, battlefield)
if mob:getID() == 17453263 then

local slmob = mob:getID()
if not GetMobByID(slmob):isSpawned() then
SpawnMob(17453264) --- not spawning mob
end
end
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_1.onMobDespawn', function(mob, player, battlefield)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobInitialize', function(mob)
mob:setMobLevel(150) --- not setting level
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobSpawn', function(mob)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobEngaged', function(mob, target)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobFight', function(mob, target)
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobDeath', function(mob, player, battlefield)
if mob:getID() == 17453264 then
local slmobtwo = mob:getID()
if not GetMobByID(slmobtwo):isSpawned() then
local battlefield = player:getBattlefield()
battlefield:setLocalVar('phaseChange', 0)
end
end
end)

m:addOverride('xi.zones.Throne_Room.mobs.Shadow_Lord_HTBF_2.onMobDespawn', function(mob, player, battlefield)
end)
]]--
-------------------------------------------------------------------------
------------CELESTIAL NEXUS II-------------------------------------------
-------------------------------------------------------------------------


m:addOverride('xi.zones.The_Celestial_Nexus.bcnms.celestial_nexus_ii.onBattlefieldInitialise', function(battlefield)
battlefield:setLocalVar('phaseChange', 1) -- Prevent battlefield from being completed until we want to.
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Ealdnarche.onMobInitialize', function(mob)
    local ealdnarche = GetMobByID(17518682)
    --50% fast cast, no standback
    ealdnarche:addMod(xi.mod.UFASTCAST, 50)
    ealdnarche:setMobMod(xi.mobMod.HP_STANDBACK, -1)
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Ealdnarche.onMobSpawn', function(mob)
    local ealdnarche = GetMobByID(17518682)
    ealdnarche:setAutoAttackEnabled(false)
    ealdnarche:setMobMod(xi.mobMod.GA_CHANCE, 25)
    ealdnarche:addStatusEffectEx(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    ealdnarche:addStatusEffectEx(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)   
    ealdnarche:addStatusEffectEx(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Ealdnarche.onMobEngaged', function(mob, target)
    local ealdnarche = GetMobByID(17518682)
    ealdnarche:addStatusEffectEx(xi.effect.SILENCE, 0, 1, 0, 5)
    GetMobByID(mob:getID() -16):updateEnmity(target)  --- assignes hate to exoplates if targeted
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Ealdnarche.onMobDeath', function(mob, player, battlefield)
local battlefield = player:getBattlefield()
battlefield:setLocalVar('Ealdnarche',os.time())
end)

m:addOverride('xi.zones.The_Celestial_Nexus.bcnms.celestial_nexus_ii.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
    if GetMobByID(17518682):isSpawned() ~= true then
            if battlefield:getLocalVar('Ealdnarche') +120  == os.time() then -- 2 minutes from Omega death to Ultima Spawn
                SpawnMob(17518612)
            end
    end
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Ealdnarche_2.onMobDeath', function(mob, player, battlefield)
local battlefield = player:getBattlefield()
battlefield:setLocalVar('phaseChange', 0) --- finish battlefield
battlefield:setLocalVar('Ealdnarche', 0)
end)


m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Exoplates.onMobInitialize', function(mob)
local exoplates =  GetMobByID(17518666)
    exoplates:addMod(xi.mod.REGAIN, 50)
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Exoplates.onMobSpawn', function(mob)
local exoplates =  GetMobByID(17518666)
    exoplates:setAnimationSub(0)
    exoplates:setAutoAttackEnabled(false)
    exoplates:setUnkillable(true)
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Exoplates.onMobEngaged', function(mob, target)
    GetMobByID(mob:getID() +16):updateEnmity(target) -- assignes hate to ealdnarche is targed
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Exoplates.onMobFight', function(mob, target)
local exoplates =  GetMobByID(17518666)
    local shifts = exoplates:getLocalVar('shifts')
    local shiftTime = exoplates:getLocalVar('shiftTime')

    if exoplates:getAnimationSub() == 0 and shifts == 0 and exoplates:getHPP() <= 67 then
        exoplates:useMobAbility(993)
        exoplates:setLocalVar('shifts', shifts + 1)
        exoplates:setLocalVar('shiftTime', exoplates:getBattleTime() + 5)
    elseif exoplates:getAnimationSub() == 1 and shifts <= 1 and exoplates:getHPP() <= 33 then
        exoplates:useMobAbility(997)
        exoplates:setLocalVar('shifts', shifts + 1)
        exoplates:setLocalVar('shiftTime', exoplates:getBattleTime() + 5)
    elseif exoplates:getAnimationSub() == 2 and shifts <= 2 and exoplates:getHPP() <= 2 then
        exoplates:useMobAbility(1001)
        exoplates:setLocalVar('shifts', shifts + 1)
        exoplates:setLocalVar('shiftTime', exoplates:getBattleTime() + 5)
    elseif
        exoplates:getHPP() <= 67 and
        exoplates:getAnimationSub() == 0 and
        exoplates:getBattleTime() >= shiftTime
    then
        exoplates:setAnimationSub(1)
    elseif
        exoplates:getHPP() <= 33 and
        exoplates:getAnimationSub() == 1 and
        exoplates:getBattleTime() >= shiftTime
    then
        exoplates:setAnimationSub(2)
    end
end)

m:addOverride('xi.zones.The_Celestial_Nexus.mobs.Exoplates.onMobDeath', function(mob, player, optParams)
    local ealdnarche = GetMobByID(17518682)
    ealdnarche:delStatusEffect(xi.effect.PHYSICAL_SHIELD, 0, 1, 0, 0)
    ealdnarche:delStatusEffect(xi.effect.ARROW_SHIELD, 0, 1, 0, 0)
    ealdnarche:delStatusEffect(xi.effect.MAGIC_SHIELD, 0, 1, 0, 0)
end)
-------------------------------------------------------------------------
------------CALL TO ARMS-------------------------------------------------
-------------------------------------------------------------------------
m:addOverride('xi.actions.mobskills.bugle_call.onMobSkillCheck', function(target, mob, skill)
return 0
end)


m:addOverride('xi.actions.mobskills.bugle_call.onMobWeaponSkill', function(target, mob, skill)
    if
        mob:getID() == 17010695 or
        mob:getID() == 17010701 or
        mob:getID() == 17010707
    then
        local leaderimp   = mob:getID()
        local mobPos = {x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos(), rot = mob:getRotPos()}
        local impaddone = GetMobByID(leaderimp + 1)
        local impaddtwo = GetMobByID(leaderimp + 2)
        local impaddthree = GetMobByID(leaderimp + 3)
        local impaddfour = GetMobByID(leaderimp + 4)
                       if not GetMobByID(leaderimp + 1):isSpawned() then
                              SpawnMob(mob:getID() + 1):updateEnmity(target)
                              impaddone:setPos(mobPos.x + math.random(-6, 6), mobPos.y + math.random(-3, 3), mobPos.z, mobPos.rot)
                        elseif not GetMobByID(leaderimp + 2):isSpawned() and GetMobByID(leaderimp + 1):isSpawned() then
                              SpawnMob(mob:getID() + 2):updateEnmity(target)
                              impaddtwo:setPos(mobPos.x + math.random(-6, 6), mobPos.y + math.random(-3, 3), mobPos.z, mobPos.rot)
                        elseif not GetMobByID(leaderimp + 3):isSpawned() and GetMobByID(leaderimp + 1):isSpawned() and GetMobByID(leaderimp + 2):isSpawned() then
                              SpawnMob(mob:getID() + 3):updateEnmity(target)
                              impaddthree:setPos(mobPos.x + math.random(-6, 6), mobPos.y + math.random(-3, 3), mobPos.z, mobPos.rot)
                        elseif not GetMobByID(leaderimp + 4):isSpawned() and GetMobByID(leaderimp + 1):isSpawned() and GetMobByID(leaderimp + 2):isSpawned() and GetMobByID(leaderimp + 3):isSpawned() then
                              SpawnMob(mob:getID() + 4):updateEnmity(target)
                              impaddfour:setPos(mobPos.x + math.random(-6, 6), mobPos.y + math.random(-3, 3), mobPos.z, mobPos.rot)
                       end 
    end
    local power    = 1
    local duration = 60
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.BIO, power, 0, duration))
    return xi.effect.BIO

end)

m:addOverride('xi.zones.Talacca_Cove.bcnms.call_to_arms.onBattlefieldInitialise', function(battlefield)
end)

m:addOverride('xi.zones.Talacca_Cove.mobs.Imp_Bandsman.onMobInitialize', function(mob)
end)

m:addOverride('xi.zones.Talacca_Cove.mobs.Imp_Bandsman.onMobSpawn', function(mob)
    if
        mob:getID() == 17010695 or
        mob:getID() == 17010701 or
        mob:getID() == 17010707
    then
            local leaderimp   = mob:getID()
            GetMobByID(leaderimp):setLocalVar('ImpEng', 1) --- set here so it is only sets once and not ontick or every engagement
    end
end)

m:addOverride('xi.zones.Talacca_Cove.mobs.Imp_Bandsman.onMobEngaged', function(mob, target)
end)

m:addOverride('xi.zones.Talacca_Cove.mobs.Imp_Bandsman.onMobFight', function(mob, target)
    if
        mob:getID() == 17010695 or
        mob:getID() == 17010701 or
        mob:getID() == 17010707
    then
            local leaderimp   = mob:getID()
        if GetMobByID(leaderimp):getLocalVar('ImpEng') == 1 then --- set initial timer to spawn puks then never use 1 again for this variable so this statement will fail
           GetMobByID(leaderimp):setLocalVar('ImpTimer', os.time() + 60)
           GetMobByID(leaderimp):setLocalVar('ImpEng', 3)
        end
           if os.time() >= GetMobByID(leaderimp):getLocalVar('ImpTimer') then -- after initial 60 seconds change variable to 2 to run usemobability
                           GetMobByID(leaderimp):setLocalVar('ImpEng', 2)
           end
                if GetMobByID(leaderimp):getLocalVar('ImpEng') == 2 then
                   GetMobByID(leaderimp):useMobAbility(1712)
                   GetMobByID(leaderimp):setLocalVar('ImpEng', 3)
                   GetMobByID(leaderimp):setLocalVar('ImpTimer', os.time() + math.random(40, 60))
                end
    end
end)

m:addOverride('xi.zones.Talacca_Cove.mobs.Imp_Bandsman.onMobDeath', function(mob, player, battlefield)
end)

m:addOverride('xi.zones.Talacca_Cove.bcnms.call_to_arms.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end)
-------------------------------------------------------------------------
------------SHADOWS OF THE MIND------------------------------------------ 17010873
-------------------------------------------------------------------------
m:addOverride('xi.actions.mobskills.boreas_mantle.onMobSkillCheck', function(target, mob, skill)
return 0
end)

m:addOverride('xi.actions.mobskills.boreas_mantle.onMobWeaponSkill', function(target, mob, skill)
    if
        mob:getID() == 17051655 or
        mob:getID() == 17051661 or
        mob:getID() == 17051667
    then
        local mobID   = mob:getID()
        local targPos = {x = target:getXPos(), y = target:getYPos(), z = target:getZPos(), rot = target:getRotPos()}
                for i = 1, 4 do
                       if not GetMobByID(mobID + i):isSpawned() then
                              SpawnMob(mob:getID() + i):updateEnmity(target)

                              local mirrorImage = GetMobByID(mobID + i)

                                 mirrorImage:setPos(targPos.x + math.random(1, 6), targPos.y + math.random(1, 6), targPos.z, targPos.rot)
                                 mirrorImage:setHP(mob:getHP())
                                 mirrorImage:addStatusEffect(xi.effect.BLINK, 5, 0, 30)
                                 -- Wait 30 seconds and despawn adds
                                 mirrorImage:timer(30000, function(mob)
                                 DespawnMob(mob:getID())
                                 end)
                       end
                end      
    end
    local base = math.random(4, 10)
    local typeEffect = xi.effect.BLINK
    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, base, 0, 180))
    return typeEffect
end)

m:addOverride('xi.zones.Jade_Sepulcher.bcnms.shadows_of_the_mind.onBattlefieldInitialise', function(battlefield)
end)

m:addOverride('xi.zones.Jade_Sepulcher.bcnms.shadows_of_the_mind.onBattlefieldTick', function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobInitialize', function(mob)
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobSpawn', function(mob)
    if
        mob:getID() == 17051655 or
        mob:getID() == 17051661 or
        mob:getID() == 17051667
    then
        local leaderpuk   = mob:getID()
        GetMobByID(leaderpuk):setLocalVar('PukAdds', 1)
        GetMobByID(leaderpuk):setLocalVar('LdrEng', 1) --- set here so it is only sets once and not ontick or every engagement
    end
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobEngaged', function(mob, target)
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobFight', function(mob, target)
    if
        mob:getID() == 17051655 or
        mob:getID() == 17051661 or
        mob:getID() == 17051667
    then
        local leaderpuk   = mob:getID()
        if GetMobByID(leaderpuk):getLocalVar('LdrEng') == 1 then --- set initial timer to spawn puks then never use 1 again for this variable so this statement will fail
           GetMobByID(leaderpuk):setLocalVar('PukTimer', os.time() + 60)
           GetMobByID(leaderpuk):setLocalVar('LdrEng', 3)
        end
           if os.time() >= GetMobByID(leaderpuk):getLocalVar('PukTimer') then -- after initial 90 seconds change variable to 2 to run usemobability
                           GetMobByID(leaderpuk):setLocalVar('LdrEng', 2)
           end
                if GetMobByID(leaderpuk):getLocalVar('LdrEng') == 2 then
                   GetMobByID(leaderpuk):useMobAbility(1980)
                   GetMobByID(leaderpuk):setLocalVar('LdrEng', 3)
                   GetMobByID(leaderpuk):setLocalVar('PukTimer', os.time() + 60)
                end
    end
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobDeath', function(mob, player, battlefield)
end)

m:addOverride('xi.zones.Jade_Sepulcher.mobs.Phantom_Puk.onMobDespawn', function(mob, player, battlefield)
end)

return m

