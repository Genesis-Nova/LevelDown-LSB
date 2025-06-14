-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------
local ARMob =
{
{'Naraka_Bat'},
{'Nirgali'},
{'Nostokulshedra'},
{'Dweomershell'},
{'Merrow_Chantress'},
{'Arrapago_Apkallu'},
{'Lamia_Graverobber'},
{'Phasma'},
{'Lamia_Dartist'},
{'Lamia_Dancer'},
{'Reserve_Draugar'},
{'Jnun'},
{'Nipper'},
{'Lamia_Fatedealer'},
{'Qutrub_drk'},
{'Ashakku'},
{'Purgatory_Bat'},
{'Qiqirn_Treasure_Hunter'},
{'Qiqirn_Trailer'},
{'Heraldic_Imp'},
{'Merrow_Shadowdancer'},
{'Merrow_Icedancer'},
{'Merrow_Kabukidancer'},
{'Bhoot'},
{'Fallen_Volunteer'},
{'Fallen_Imperial_Wizard'},
{'Fallen_Imperial_Trooper'},
{'Lamia_Bellydancer'},
{'Soulflayer'},
{'Lamia_Deathdancer'},
{'Draugar_Servant'},
{'Merrow_Songstress'},
{'Merrow_Bladedancer'},
{'Ice_Elemental'},
{'Merrow_Wavedancer'},
{'Lamia_Idolater_drk'},
{'Lamia_Necromancer'},
{'Lamia_Toxophilite'},
{'Seneschal_Imp'},
{'Merrow_Typhoondancer'},
{'Emperor_Apkallu'},
{'Nix_Songstress'},
{'Dark_Elemental'},
{'Nix_Wavedancer'},
{'Nix_Bladedancer'},
{'Nix_Typhoondancer'},
{'Lamie_Necromancer'},
{'Lamie_Bellydancer'},
{'Lamie_Deathdancer'},
{'Lamie_Toxophilite'},
{'Ephramadian_Shade'},
{'Lamia_Palace_Guard'},
{'Qutrub'},
{'Lamia_Idolater'},
{'Lahama'},
}

local ASMob =
{
{'Deforester'},
{'Mycoskulker'},
{'Slime_Eater'},
{'Treant_Sapling'},
{'Puktrap'},
{'Slime_Mold'},
{'Qiqirn_Enterpriser'},
{'Qiqirn_Lieuter'},
{'Fossorial_Flea'},
{'Phlebotomic_Slug'},
{'Defoliator'},
{'Air_Elemental'},
{'Aydeewa_Diremite'},
{'Mycohopper'},
{'Great_Ameretat'},
{'Qiqirn_Archaeologist'},
{'Qiqirn_Mosstrooper'},
{'Mold_Eater'},
{'Cave_Tiger'},
}

local HMob =
{
{'Qiqirn_Mercenary'},
{'Qiqirn_Diamantaire'},
{'Volcanic_Bats'},
{'Purgatory_Bat'},
{'Troll_Gemologist'},
{'Troll_Stoneworker'},
{'Troll_Lapidarist'},
{'Troll_Smelter'},
{'Troll_Engraver'},
{'Troll_Cameist'},
{'Troll_Ironworker'},
{'Earth_Elemental'},
{'Black_Pudding'},
{'Wamouracampa'},
{'Magmatic_Eruca'},
{'Moblin_Billionaire'},
{'Fire_Elemental'},
{'Friars_Lantern'},
{'Wamoura'},
{'Troll_Artilleryman'},
{'Troll_Combatant'},
{'Troll_Targeteer'},
{'Ebony_Pudding'},
{'Troll_Machinist'},
{'Troll_Scrimer'},
{'Troll_Grenadier'},
{'Troll_Cuirasser'},
{'Antares'},
{'Moblin_Millionaire'},
{'Friars_Lantern'},
}

local MMob =
{
{'Mamool_Ja_Mimicker'},
{'Mamool_Ja_Zenist'},
{'Mamool_Ja_Savant'},
{'Mamool_Ja_Sophist'},
{'Mamool_Ja_Bounder'},
{'Mamool_Ja_Strapper'},
{'Mamool_Ja_Spearman'},
{'Mamool_Ja_Frogman'},
{'Mamool_Ja_Lurker'},
{'Mamool_Ja_Philosopher'},
{'Mamool_Ja_Infiltrator'},
{'Mamool_Ja_Blusterer'},
{'Mamool_Ja_Pikeman'},
{'Mamool_Ja_Stabler'},
{'Mamool_Ja_Conservator'},
{'Mamool_Ja_Treasurer'},
{'Hunting_Raptor'},
{'Colibri'},
{'Carriage_Lizard'},
{'Ziz'},
{'Puk'},
{'Mamool_Ja_Diver'},
{'Poroggo'},
{'Air_Elemental'},
{'Battle_Bugard'},
{'Brei'},
{'Qiqirn_Poulterer'},
{'Qiqirn_Goldsmith'},
{'Spinner'},
{'Mamool_Ja_Mimer'},
{'Watch_Wyvern'},
{'Sea_Puk'},
{'Nipper'},
{'Suhur_Mas'},
}



local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
for _, entry in pairs(ASMob) do
ensureTable(string.format("xi.zones.Aydeewa_Subterrane.mobs.%s", entry[1]))
end
for _, entry in pairs(ARMob) do
ensureTable(string.format("xi.zones.Arrapago_Reef.mobs.%s", entry[1]))
end
for _, entry in pairs(HMob) do
ensureTable(string.format("xi.zones.Halvung.mobs.%s", entry[1]))
end
for _, entry in pairs(MMob) do
ensureTable(string.format("xi.zones.Mamook.mobs.%s", entry[1]))
end

local m = Module:new("Alexan_drop")

for _, entry in pairs(ASMob) do
    local mobName     = entry[1]
m:addOverride(string.format('xi.zones.Aydeewa_Subterrane.mobs.%s.onMobDeath', mobName), function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 2)
    npcUtil.giveItem(player, { { xi.item.ALEXANDRITE, rand } })
    local randz = math.random(1,75) 
    if randz == 18 then
    npcUtil.giveItem(player, { { xi.item.COTTON_COIN_PURSE, 1 } })
    end
    local randx = math.random(1,100) 
    if randx == 11 then
    npcUtil.giveItem(player, { { xi.item.LINEN_COIN_PURSE, 1 } })
    end
end)
end

for _, entry in pairs(ARMob) do
    local mobNamea     = entry[1]
m:addOverride(string.format('xi.zones.Arrapago_Reef.mobs.%s.onMobDeath', mobNamea), function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 2)
    npcUtil.giveItem(player, { { xi.item.ALEXANDRITE, rand } })
    local randz = math.random(1,75) 
    if randz == 18 then
    npcUtil.giveItem(player, { { xi.item.COTTON_COIN_PURSE, 1 } })
    end
    local randx = math.random(1,100) 
    if randx == 11 then
    npcUtil.giveItem(player, { { xi.item.LINEN_COIN_PURSE, 1 } })
    end
end)
end

for _, entry in pairs(HMob) do
    local mobNameb     = entry[1]
m:addOverride(string.format('xi.zones.Halvung.mobs.%s.onMobDeath', mobNameb), function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 2)
    npcUtil.giveItem(player, { { xi.item.ALEXANDRITE, rand } })
    local randz = math.random(1,75) 
    if randz == 18 then
    npcUtil.giveItem(player, { { xi.item.COTTON_COIN_PURSE, 1 } })
    end
    local randx = math.random(1,100) 
    if randx == 11 then
    npcUtil.giveItem(player, { { xi.item.LINEN_COIN_PURSE, 1 } })
    end
end)
end

for _, entry in pairs(MMob) do
    local mobNamec    = entry[1]
m:addOverride(string.format('xi.zones.Mamook.mobs.%s.onMobDeath', mobNamec), function(mob, player, optParams)
    super(mob, player, optParams)
    local rand = math.random(1, 2)
    npcUtil.giveItem(player, { { xi.item.ALEXANDRITE, rand } })
    local randz = math.random(1,75) 
    if randz == 18 then
    npcUtil.giveItem(player, { { xi.item.COTTON_COIN_PURSE, 1 } })
    end
    local randx = math.random(1,100) 
    if randx == 11 then
    npcUtil.giveItem(player, { { xi.item.LINEN_COIN_PURSE, 1 } })
    end
end)
end

return m
