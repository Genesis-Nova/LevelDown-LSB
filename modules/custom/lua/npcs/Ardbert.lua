--------------------------------
require('modules/module_utils')
--------------------------------

local m = Module:new('Ardbert')

m:addOverride('xi.zones.Port_Jeuno.Zone.onInitialize',function(zone)
    super(zone)
local stock =
{
    12088,100000, -- Ravager's Calligae, 100k
    12089,100000, -- Tantra Gaiters, 100k
    12090,100000, -- Orison Duckbills, 100k
    12091,100000, -- Goetia Sabots, 100k
    12092,100000, -- Estoqueur's Houseaux, 100k
    12093,100000, -- Raider's Poulaines, 100k
    12094,100000, -- Creed Sabatons, 100k
    12095,100000, -- Bale Sollerets, 100k
    12096,100000, -- Ferine Ocreae, 100k
    12097,100000, -- Aoidos Cothurnes, 100k
    12098,100000, -- Sylvan Bottillons, 100k
    12099,100000, -- Unkai Sune-ate, 100k
    12100,100000, -- Iga Kyahan, 100k
    12101,100000, -- Lancer's Schynbalds, 100k
    12102,100000, -- Caller's Pigaches, 100k
    12103,100000, -- Mavi Basmak, 100k
    12104,100000, -- Navarch's Bottes, 100k
    12105,100000, -- Cirque Scarpe, 100k
    12106,100000, -- Charis Toeshoes, 100k
    12107,100000, -- Savant's Loafers
}

    local Ardbert = zone:insertDynamicEntity({
        objType  = xi.objType.NPC,
        name     = 'Ardbert',
        look     = '0x0100020100100421c930b9400251006000700000',
        x        = -50.0133,
        y        = 0.000,
        z        = -10.1693,
        rotation = 90,
        widescan = 1,

        onTrigger = function(player, npc)
            npc:facePlayer(player,true)
            player:printToPlayer('Here for all your footware needs!',0,'Ardbert')
            xi.shop.general(player,stock)
        end,
    })
    utils.unused(Ardbert)
end)

return m