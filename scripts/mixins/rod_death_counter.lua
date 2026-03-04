require('scripts/globals/mixins')

g_mixins = g_mixins or {}

local geaFeteNM =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { 'Bia' },
        { 'Ruea' },
        { 'Ma' },
        { 'Khon' },
        { 'Met' },
        { 'Khun' },
        { 'Wasserspeier' },
        { 'Emputa' },
        { 'Peirithoos' },
        { 'Asida' },
        { 'Tenodera' },
        { 'Sava_Savanovic' },
        { 'Palila' },
        { 'Hanbi' },
        { 'Yilan' },
        { 'Amymone' },
        { 'Naphula' },
        { 'Kammavaca' },
        { 'Pakecet' },
        { 'Duke_Vepar' },
        { 'Virava' },
        { 'Byakko' },
        { 'Genbu' },
        { 'Seiryu' },
        { 'Suzaku' },
        { 'Kirin' },
        { 'Ark_Angel_HM' },
        { 'Ark_Angel_TT' },
        { 'Ark_Angel_MR' },
        { 'Ark_Angel_EV' },
        { 'Ark_Angel_GK' },
        { 'Warder_of_Courage' },
    },

    [xi.zone.ESCHA_ZITAH] =
    {
        { 'Wepwawet' },
        { 'Lustful_Lydia' },
        { 'Aglaophotis' },
        { 'Tangata_Manu' },
        { 'Vidala' },
        { 'Gestalt' },
        { 'Angrboda' },
        { 'Cunnast' },
        { 'Revetaur' },
        { 'Ferrodon' },
        { 'Gulltop' },
        { 'Vyala' },
        { 'Blazewing' },
        { 'Bucca' },
        { 'Puca' },
        { 'Alpluachra' },
        { 'Pazuzu' },
        { 'Wrathare'},
        { 'Ionos' },
        { 'Sensual_Sandy' },
        { 'Nosoi' },
        { 'Brittlis' },
        { 'Kamohoalii' },
        { 'Umdhlebi' },
        { 'Fleetstalker' },
        { 'Shockmaw' },
        { 'Urmahlullu' },
    },

    [xi.zone.REISENJIMA] =
    {

        { 'Crom_Dubh' },
        { 'Golden_Kist' },
        { 'Mauve-wristed_Gomberry' },
        { 'Dazzling_Dolores' },
        { 'Taelmoth_the_Diremaw' },
        { 'Belphegor' },
        { 'Kabandha' },
        { 'Selkit' },
        { 'Sang_Buaya' },
        { 'Sabotender_Royal' },
        { 'Zduhac' },
        { 'Oryx' },
        { 'Strophadia' },
        { 'Gajasimha' },
        { 'Ironside' },
        { 'Sarsaok' },
        { 'Old_Shuck' },
        { 'Bashmu' },
        { 'Maju' },
        { 'Yakshi' },
        { 'Neak' },
        { 'Teles' },
        { 'Zerde' },
        { 'Vinipata' },
        { 'Schah' },
        { 'Albumen' },
        { 'Onychophora' },
        { 'Erinys' },
    }
}

local domainInvasionNM =
{
    [xi.zone.ESCHA_RUAUN] =
    {
        { 'Naga_Raja' },
        { 'Mireu' },
    },

    [xi.zone.ESCHA_ZITAH] =
    {
        { 'Azi_Dahaka' },
        { 'Mireu' },
    },

    [xi.zone.REISENJIMA] =
    {
        { 'Quetzalcoatl' },
        { 'Mireu' },
    }
}

g_mixins.rod_death_counter = function(mob)
    local function checkNMType(mob)
        local zone = mob:getZoneID()
        local table = domainInvasionNM[zone]
        local domainInvNM = false

        if not table then
            return false
        end

        for i = 1, #table do
            if mob:getName() == table[i][1] then
                domainInvNM = true
            end
        end

        return domainInvNM
    end

    local function setDIVar(mob, killer)
        local zone = killer:getZoneID()
        local table = domainInvasionNM[zone]

        if not table then
            return
        end

        for i = 1, #table do
            if mob:getName() == table[i][1] then
                killer:setCharVar('[RoD]Kill_Count_'..mob:getName(), killer:getCharVar('[RoD]Kill_Count_'..mob:getName()) +1)
            end
        end
    end

    local function setGeaFeteNMBit(mob, killer)
        local zone = killer:getZoneID()
        local table = geaFeteNM[zone]

        if not table then
            return
        end

        for i = 1, #table do
            if mob:getName() == table[i][1] then
                killer:setCharVar('[RoD]GeaFetesDefeated'..killer:getZoneID(), utils.mask.setBit(killer:getCharVar('[RoD]GeaFetesDefeated'..killer:getZoneID()), i -1, true))
            end
        end
    end

    local function spawnEmblazonedReliquary(mob, killer) -- ***** need to set a variable to not allow player to spawn the same type of chest
        local zone = mob:getZone()
        local emblazonedReliquary = zone:queryEntitiesByName('Emblazoned_Reliquary')

        local randomChest = {
            { 75, 965 }, -- Blue
            { 20, 966 }, -- Brown
            { 5, 969 }  -- Gold
        }

        if not emblazonedReliquary or #emblazonedReliquary == 0 then
            return
        end

        local totalWeight = 0
        for _, entry in ipairs(randomChest) do
            totalWeight = totalWeight + entry[1]
        end

        local roll = math.random(1, totalWeight)
        local selectedModelId = 965 -- default fallback (blue)
        local cumulative = 0

        for _, entry in ipairs(randomChest) do
            cumulative = cumulative + entry[1]
            if roll <= cumulative then
                selectedModelId = entry[2]
                break
            end
        end

        local partyAllianceCheck = {}

        if killer:checkSoloPartyAlliance() == 2 then
            partyAllianceCheck = killer:getAlliance()
        else
            partyAllianceCheck = killer:getPartyWithTrusts()
        end

        -- Check if anyone in the party/alliance already has this chest color spawned
        for _, member in pairs(partyAllianceCheck) do
            if member and member:isPC() then
                if member:getLocalVar('SpawnChestModelID'..selectedModelId) == 1 then
                    return
                end
            end
        end

        local mobPos = mob:getPos()

        for _, chest in pairs(emblazonedReliquary) do
            if chest and chest:getStatus() == xi.status.DISAPPEAR then
                -- Update variables for all members
                for _, member in pairs(partyAllianceCheck) do
                    if member and member:isPC() then
                        member:setLocalVar('SpawnedChest', member:getLocalVar('SpawnedChest') + 1)
                        member:setLocalVar('SpawnChestModelID'..selectedModelId, 1)
                    end
                end

                chest:setPos(mobPos.x, mobPos.y, mobPos.z, mobPos.rot)
                chest:setStatus(xi.status.NORMAL)
                chest:setModelId(selectedModelId)
                chest:setLocalVar('SpawnStatus', 1)
                chest:setLocalVar('SpawnTime', GetSystemTime())
                chest:setLocalVar('PartyLeader', killer:getLeaderID())

                chest:timer(180000, function(chestArg)
                    if chestArg:getStatus() == xi.status.NORMAL then
                        xi.emblazonedReliquary.removeChest(killer, chestArg)
                    end
                end)

                return
            end
        end
    end

    local function canSpawnEmblazonedReliquary(mob, killer)
        local chestCount = killer:getLocalVar('SpawnedChest')
        local spawnChance = 5 -- percent

        if chestCount ~= nil and
            chestCount >= 3 then
                return false
        end

        if math.random(1, 5) <= spawnChance then
            return true
        end

        return false
    end

    -- NOTE: retail does not break kill counts out between zones, all kills are recorded and presented in all 3 zone Register of Deed NPC's'
    mob:addListener('DEATH', 'DEATH_FUNCTIONS', function(mob, killer)
        if killer then
            if not mob:isNM() then
                killer:setCharVar('[RoD]Mob_Counter', killer:getCharVar('[RoD]Mob_Counter') +1 )
            elseif mob:isNM() then
                if checkNMType(mob) == false then
                    killer:setCharVar('[RoD]NM_Counter', killer:getCharVar('[RoD]NM_Counter') +1 )
                    setGeaFeteNMBit(mob, killer)
                else
                    setDIVar(mob, killer)
                end
            end
            --[[
            local chestSpawnCheck = canSpawnEmblazonedReliquary(mob, killer)

            if chestSpawnCheck then
                spawnEmblazonedReliquary(mob, killer)
            end
            ]]--
        end
    end)
end

return g_mixins.rod_death_counter