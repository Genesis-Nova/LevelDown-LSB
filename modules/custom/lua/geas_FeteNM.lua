local mobnames =
{
    ['Escha_RuAun'] =
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

    ['Escha_ZiTah'] =
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

    ['Reisenjima'] =
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


local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end

for zoneName, mobs in pairs(mobnames) do
    for _, mobEntry in ipairs(mobs) do
        ensureTable(string.format("xi.zones.%s.mobs.%s", zoneName, mobEntry[1]))
    end
end

-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
require("scripts/globals/mobs")
-----------------------------------

local m = Module:new("geas_FeteNM")
    for zoneName, mobs in pairs(mobnames) do
        for _, mobEntry in ipairs(mobs) do
            m:addOverride(string.format("xi.zones.%s.mobs.%s.onMobSpawn", zoneName, mobEntry[1]), function(mob)
                mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)

                if mob:getMainLvl() > 119 and mob:getMainLvl() <= 125 then
                    mob:addMod(xi.mod.ATT, 1400)
                    mob:addMod(xi.mod.DEF, 250)
                    mob:addMod(xi.mod.ACC, 700)
                    mob:addMod(xi.mod.EVA, 200)
                    mob:addMod(xi.mod.MATT, 100)
                    mob:addMod(xi.mod.MDEF, 250)
                    mob:addMod(xi.mod.MACC, 700)
                    mob:addMod(xi.mod.MEVA, 200)
                    mob:addMod(xi.mod.HASTE_MAGIC, 15)
                    mob:addMod(xi.mod.REGEN, 25)
                    mob:addMod(xi.mod.REFRESH, 25)
                elseif mob:getMainLvl() > 125 and mob:getMainLvl() <= 135 then
                    mob:addMod(xi.mod.ATT, 1500)
                    mob:addMod(xi.mod.DEF, 350)
                    mob:addMod(xi.mod.ACC, 800)
                    mob:addMod(xi.mod.EVA, 300)
                    mob:addMod(xi.mod.MATT, 200)
                    mob:addMod(xi.mod.MDEF, 350)
                    mob:addMod(xi.mod.MACC, 800)
                    mob:addMod(xi.mod.MEVA, 300)
                    mob:addMod(xi.mod.HASTE_MAGIC, 25)
                    mob:addMod(xi.mod.REGEN, 35)
                    mob:addMod(xi.mod.REFRESH, 35)
                elseif mob:getMainLvl() > 135 and mob:getMainLvl() <= 150 then
                    mob:addMod(xi.mod.ATT, 1600)
                    mob:addMod(xi.mod.DEF, 450)
                    mob:addMod(xi.mod.ACC, 900)
                    mob:addMod(xi.mod.EVA, 400)
                    mob:addMod(xi.mod.MATT, 300)
                    mob:addMod(xi.mod.MDEF, 450)
                    mob:addMod(xi.mod.MACC, 900)
                    mob:addMod(xi.mod.MEVA, 400)
                    mob:addMod(xi.mod.HASTE_MAGIC, 35)
                    mob:addMod(xi.mod.REGEN, 45)
                    mob:addMod(xi.mod.REFRESH, 45)
                end
            end)
        end
    end
return m