-----------------------------------
-- func: getstats
-- desc: prints stats of cursor target into chatlog, for debugging.
require('scripts/globals/paragon')
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

-- function onTrigger(player, extendedMode)
commandObj.onTrigger = function(player)
    -- invert xi.job table
    local jobNameByNum = {}
    for k, v in pairs(xi.job) do
        jobNameByNum[v] = k
    end
    local modNameByNum = {}
      for k, v in pairs(xi.mod) do
          modNameByNum[v] = k
      end
local function getModa(target)
    local paragonModa  = 0
        local number = tostring(target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end
                paragonModa = result[5]..result[6]
        end
return paragonModa
end
local function getModb(target)
    local paragonModb  = 0
        local number = tostring(target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end
               paragonModb = result[5]..result[6]
        end
return paragonModb
end
local function getModc(target)
    local paragonModc  = 0
        local number = tostring(target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end
                paragonModc = result[5]..result[6]
        end
return paragonModc
end
local function getModd(target)
    local paragonModd  = 0
        local number = tostring(target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end
                paragonModd = result[5]..result[6]
        end
return paragonModd
end
local function getMode(target)
    local paragonMode  = 0
        local number = tostring(target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]))
        if tonumber(number) > 0 then
          local result = {}
            for i = 1, #number, 1 do
	            table.insert(result, tonumber(number:sub(i, i)))
            end
                paragonMode = result[5]..result[6]
        end
return paragonMode
end
    local target = player:getCursorTarget()
    if target == nil then
        player:printToPlayer('Target something first.')
        return
    end

    local targetType = target:getObjType()

    if targetType == xi.objType.NPC then
        player:printToPlayer('Target something other than an NPC..They don\'t have stats!')
        return
    end

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('%s -- Statistics --------------------------------------------------------------------', target:getName()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('MainJob: %s LV: %i / SubJob: %s LV: %i ', jobNameByNum[target:getMainJob()], target:getMainLvl(), jobNameByNum[target:getSubJob()], target:getSubLvl()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('HP: %i/%i  MP: %i/%i', target:getHP(), target:getMaxHP(), target:getMP(), target:getMaxMP()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('STR: [%i] DEX: [%i] VIT: [%i] AGI: [%i] MND: [%i] INT: [%i] CHR: [%i]', target:getStat(xi.mod.STR), target:getStat(xi.mod.DEX), target:getStat(xi.mod.VIT), target:getStat(xi.mod.AGI), target:getStat(xi.mod.MND), target:getStat(xi.mod.INT), target:getStat(xi.mod.CHR)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('ATT: [%i] ACC: [%i] R.ATT: [%i] R.ACC: [%i]', target:getStat(xi.mod.ATT), target:getMod(xi.mod.ACC), target:getMod(xi.mod.RATT), target:getMod(xi.mod.RACC)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('DEF: [%i] Magic DEF: [%i] EVA: [%i] Magic EAV: [%i]', target:getStat(xi.mod.DEF), target:getMod(xi.mod.MDEF), target:getStat(xi.mod.EVA), target:getMod(xi.mod.MEVA)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Dmg Taken: [%i%%] Magic DT: [%i%%] Magic DT II: [%i%%] Phy DT: [%i%%] Phy DT II: [%i%%]', target:getMod(xi.mod.DMG) * .01, target:getMod(xi.mod.DMGMAGIC) * .01, target:getMod(xi.mod.DMGMAGIC_II) * .01, target:getMod(xi.mod.DMGPHYS) * .01, target:getMod(xi.mod.DMGPHYS_II) * .01), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Magic ACC: [%i] Magic ATT: [%i] Magic Burst: [%i%%] Magic Att Bonus: [%i]', target:getMod(xi.mod.MACC), target:getMod(xi.mod.MATT), target:getMod(xi.mod.MAGIC_BURST_BONUS_CAPPED), target:getMod(xi.mod.MAGIC_DAMAGE)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Haste Ability: [%i%%] Haste Magic: [%i%%] Haste Gear: [%i%%] Fast Cast: [%i%%]', target:getMod(xi.mod.HASTE_ABILITY) * .01, target:getMod(xi.mod.HASTE_MAGIC) * .01, target:getMod(xi.mod.HASTE_GEAR) * .01, target:getMod(xi.mod.FASTCAST)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Subtle Blow: [%i%%] Subtle Blow II: [%i%%] Store TP: [%i] Dual Wield: [%i]', target:getMod(xi.mod.SUBTLE_BLOW) * .01, target:getMod(xi.mod.SUBTLE_BLOW_II) * .01, target:getMod(xi.mod.STORETP), target:getMod(xi.mod.DUAL_WIELD)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Refresh / Tick: [%i] Regen / Tick: [%i] Regain / Tick: [%i]', target:getMod(xi.mod.REFRESH), target:getMod(xi.mod.REGEN), target:getMod(xi.mod.REGAIN)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Quick Magic: [%i%%] Cure Potency: [%i%%] Cure Ptency II: [%i%%]', target:getMod(xi.mod.QUICK_MAGIC) * .01, target:getMod(xi.mod.CURE_POTENCY) * .01, target:getMod(xi.mod.CURE_POTENCY_II) * .01), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Crit Hit Rate: [%i%%]', target:getMod(xi.mod.CRITHITRATE)), xi.msg.channel.SYSTEM_3)


player:printToPlayer(string.format('Your enmity against %s is ... CE = %u ... VE = %u', target:getName(), target:getCE(player), target:getVE(player)), xi.msg.channel.SYSTEM_3)


player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('%s -- Resistances --------------------------------------------------------------------', target:getName()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Fire Resist: [%i] Water Resist: [%i] Wind Resist: [%i] Earth Resist: [%i]', target:getMod(xi.mod.FIRE_RES_RANK), target:getMod(xi.mod.WATER_RES_RANK), target:getMod(xi.mod.WIND_RES_RANK), target:getMod(xi.mod.EARTH_RES_RANK)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Ice Resist: [%i] Thunder Resist: [%i] Dark Resist: [%i] Light Resist: [%i]', target:getMod(xi.mod.ICE_RES_RANK), target:getMod(xi.mod.THUNDER_RES_RANK), target:getMod(xi.mod.DARK_RES_RANK), target:getMod(xi.mod.LIGHT_RES_RANK)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Sleep Res: [%i] Poison Res: [%i] Paralyze Res: [%i] Blind Res: [%i] Silence Res: [%i]', target:getMod(xi.mod.SLEEPRES), target:getMod(xi.mod.POISONRES), target:getMod(xi.mod.PARALYZERES), target:getMod(xi.mod.BLINDRES), target:getMod(xi.mod.SILENCERES)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Virus Res: [%i] Petrify Res: [%i] Bind Res: [%i] Curse Res: [%i] Gravity Res: [%i]', target:getMod(xi.mod.VIRUSRES), target:getMod(xi.mod.PETRIFYRES), target:getMod(xi.mod.BINDRES), target:getMod(xi.mod.CURSERES), target:getMod(xi.mod.GRAVITYRES)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Slow Res: [%i] Stun Res: [%i] Charm Res: [%i] Amnesia Res: [%i] Lullaby Res: [%i]', target:getMod(xi.mod.SLOWRES), target:getMod(xi.mod.STUNRES), target:getMod(xi.mod.CHARMRES), target:getMod(xi.mod.AMNESIARES), target:getMod(xi.mod.LULLABYRES)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Death Resist: [%i] Resist All: [%i]', target:getMod(xi.mod.DEATHRES), target:getMod(xi.mod.STATUSRES)), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('%s -- Treasure Hunter --------------------------------------------------------------------', target:getName()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

    if targetType == xi.objType.PC then
        player:printToPlayer(string.format('%s\'s base Treasure Hunter with current equipment: %i', target:getName(), target:getMod(xi.mod.TREASURE_HUNTER)), xi.msg.channel.SYSTEM_3)
    elseif targetType == xi.objType.PET then
        -- not needed yet, but we don't want to run MOB so just die in empty conditionals
    elseif targetType == xi.objType.TRUST then
        player:printToPlayer(string.format('%s\'s base Treasure Hunter with current equipment: %i', target:getName(), target:getMod(xi.mod.TREASURE_HUNTER)), xi.msg.channel.SYSTEM_3)
        -- see above
    elseif targetType == xi.objType.FELLOW then
        -- see above
    elseif targetType == xi.objType.MOB then
        player:printToPlayer(string.format('Mob\'s current Treasure Hunter Tier: %i', target:getTHlevel()), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('Battletime: %i seconds. Check you rage timer!!!', target:getBattleTime()), xi.msg.channel.SYSTEM_3)
        -- Todo: check if raged and/or how long mobs ragetimer is.
    end

if target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]) > 0 and
   target:getCharVar('[ParagonMod]Active') == 1 then

player:printToPlayer(string.format('-------------------------------------------------------------------------------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('%s -- Paragon Applied Mods ----------------------------------------------------------------', target:getName()), xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('------These mods listed below are already applied in the stats above-----------------------'),  xi.msg.channel.SYSTEM_3)

player:printToPlayer(string.format('Tier 1 - Applied Mod %s Power + %s',modNameByNum[tonumber(getModa(target)-10)],5),  xi.msg.channel.SYSTEM_3)

if target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]) > 0 then
player:printToPlayer(string.format('Tier 2 - Applied Mod %s Power + %s',modNameByNum[tonumber(getModb(target)-10)],5),  xi.msg.channel.SYSTEM_3)
end
if target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]) > 0 then
player:printToPlayer(string.format('Tier 3 - Applied Mod %s Power + %s',modNameByNum[tonumber(getModc(target)-10)],5),  xi.msg.channel.SYSTEM_3)
end
if target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]) > 0 then
player:printToPlayer(string.format('Tier 4 - Applied Mod %s Power + %s',modNameByNum[tonumber(getModd(target)-10)],5),  xi.msg.channel.SYSTEM_3)
end
if target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]) > 0 then
player:printToPlayer(string.format('Tier 5 - Applied Mod %s Power + %s',modNameByNum[tonumber(getMode(target)-10)],5),  xi.msg.channel.SYSTEM_3)
end
end

--player:printToPlayer(string.format('Attack Per: [%i]', target:getMod(xi.mod.FOOD_ATTP)), xi.msg.channel.SYSTEM_3)



--[[
    player:printToPlayer(string.format('Food Accuracy%% bonus: %i ', target:getMod(xi.mod.FOOD_ACCP)), xi.msg.channel.SYSTEM_3)

    -- player:printToPlayer(string.format('Total Subtle Blow: %i ', target:getMod(xi.mod.SUBTLE_BLOW)), xi.msg.channel.SYSTEM_3)
    -- player:printToPlayer(string.format('Total Store TP: %i ', target:getMod(xi.mod.STORETP)), xi.msg.channel.SYSTEM_3)

    target:getMod(xi.mod.FOOD_HPP)                      
    target:getMod(xi.mod.FOOD_MPP)                       
    target:getMod(xi.mod.FOOD_ATTP)                      
    target:getMod(xi.mod.FOOD_DEFP)                      
    target:getMod(xi.mod.FOOD_ACCP)                      
    target:getMod(xi.mod.FOOD_RATTP)                    
    target:getMod(xi.mod.FOOD_RACCP)                     
    target:getMod(xi.mod.FOOD_MACCP)                    





]]--
end
return commandObj
