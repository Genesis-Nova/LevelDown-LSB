local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end
    ensureTable('xi.zones.Escha_ZiTah.npcs.Affi')

require("modules/module_utils")
require("scripts/globals/npc_util")
local ID = zones[xi.zone.ESCHA_ZITAH]

local m = Module:new("Affi_NPC")
local EZtrade =
{
[ 1] = { trade = {{1629, 2}}, tier = 1},
[ 2] = { trade = {13091},     tier = 1},
[ 3] = { trade = {{654,  2}}, tier = 1},
[ 4] = { trade = {{4398, 6}}, tier = 1},
[ 5] = { trade = {16564},     tier = 1},
[ 6] = { trade = {{745,  2}}, tier = 1},
[ 7] = { trade = {16581},     tier = 1},
[ 8] = { trade = {{717,  3}}, tier = 1},
[ 9] = { trade = {{829,  2}}, tier = 1},
[10] = { trade = {{9057, 5}}, tier = 2},
[11] = { trade = {{9060, 5}}, tier = 3},
[12] = { trade = {{4061, 5}}, tier = 4},
[13] = { trade = {{4060, 5}}, tier = 5},
[14] = { trade = {{4059, 5}}, tier = 6},
[15] = { trade = {9077, 9076},tier = 7},
[16] = { trade = {9078, 9076},tier = 8},
[17] = { trade = {9078, 9077},tier = 9},
[18] = { trade = {9078, 9077, 9076}, tier = 10},
}

local tone =
{
[15] = {keyitem = 2895, option =  256, tier = 1},
[16] = {keyitem = 2896, option =  512, tier = 1},
[17] = {keyitem = 2897, option =  768, tier = 1},
[18] = {keyitem = 2898, option = 1024, tier = 1},
[19] = {keyitem = 2899, option = 1280, tier = 1},
[20] = {keyitem = 2900, option = 1536, tier = 1},
[21] = {keyitem = 2901, option = 1792, tier = 1},
[22] = {keyitem = 2902, option = 2048, tier = 1},
[23] = {keyitem = 2903, option = 2304, tier = 1},
[24] = {keyitem = 2904, option = 2560, tier = 1},
[25] = {keyitem = 2905, option = 2816, tier = 1},
[26] = {keyitem = 2906, option = 3072, tier = 1},
[27] = {keyitem = 2911, option =  256, tier = 2},
[28] = {keyitem = 2915, option =  768, tier = 2},
[29] = {keyitem = 2913, option =  512, tier = 2},
[30] = {keyitem = 2912, option =  256, tier = 3},
[31] = {keyitem = 2914, option =  512, tier = 3},
[32] = {keyitem = 2916, option =  768, tier = 3},
[33] = {keyitem = 2917, option = 1024, tier = 4},
[34] = {keyitem = 2918, option = 1024, tier = 5},
[35] = {keyitem = 2919, option = 1024, tier = 6},
[36] = {keyitem = 2907, option = 1024, tier = 7},
[37] = {keyitem = 2908, option = 1024, tier = 8},
[38] = {keyitem = 2909, option = 1024, tier = 9},
[39] = {keyitem = 2910, option = 1024, tier = 10},
}

m:addOverride("xi.zones.Escha_ZiTah.npcs.Affi.onTrade", function(player, npc, trade)
        local tradedCombo = 0
        if tradedCombo == 0 then
            for k, v in pairs(EZtrade) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    tradedtier = v.tier
                    break
                end
            end
        end
        if tradedCombo >= 1 and tradedCombo <= 9 then
        player:startEvent(9702)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 10 then
        player:startEvent(9703, 0, -16)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 11 then
        player:startEvent(9704, 0, -16)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 12 then
        player:startEvent(9704, 0, -18, 0, 0, 2917)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 13 then
        player:startEvent(9704, 0, -18, 0, 0, 2918)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 14 then
        player:startEvent(9704, 0, -18, 0, 0, 2919)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 15 then
        player:startEvent(9704, 0, -18, 0, 0, 2907)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 16 then
        player:startEvent(9704, 0, -18, 0, 0, 2908)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 17 then
        player:startEvent(9704, 0, -18, 0, 0, 2909)
		player:setCharVar("Affi", tradedtier)
        elseif tradedCombo == 18 then
        player:startEvent(9704, 0, -18, 0, 0, 2910)
		player:setCharVar("Affi", tradedtier)
        end
end)

m:addOverride("xi.zones.Escha_ZiTah.npcs.Affi.onTrigger", function(player, npc)
local currency = player:getCurrency('escha_silt')
player:startEvent(9701, 2096160, currency, 117440958, 33554431, 0, 0, 0, 33554431)
end)

m:addOverride("xi.zones.Escha_ZiTah.npcs.Affi.onEventUpdate", function(player, csid, option, npc)
	--player:printToPlayer(string.format('update %s',option))
end)

m:addOverride("xi.zones.Escha_ZiTah.npcs.Affi.onEventFinish", function(player, csid, option, npc)
	--player:printToPlayer(string.format('finish %s',option))
    local tradedtier = player:getCharVar("Affi")
        local rewardki = 0
        if rewardki == 0 then
            for _, entry in pairs(tone) do
                if tradedtier == entry.tier and option == entry.option then
                    rewardki = entry.keyitem
                    break
                end
            end
        end
        if player:hasKeyItem(rewardki) then
                   player:printToPlayer('It appears you are you already have this keyitem!. ', 0, 'Affi')
           return
        elseif not player:hasKeyItem(rewardki) then
            if option ~= 1073741824 then
                       player:tradeComplete()
                       npcUtil.giveKeyItem(player, rewardki)
		               player:setCharVar("Affi", 0)
            else
            		   player:setCharVar("Affi", 0)
            end
        end
                if option == 1073741824 then
                   player:printToPlayer('Before you leave, There are 4 additional HELM Notorious Monsters!. ', 0, 'Affi') 
                   player:printToPlayer('If you wish to summon them, please trade me the items below for the key item!. ', 0, 'Affi') 
                   player:printToPlayer('To summon Alpluachra, i will require 1 Ashweed, 1 Gravewood Log!. ', 0, 'Affi') 
                   player:printToPlayer('To summon Blazewing, i will require 1 Duskcrawler, 1 Gravewood Log!. ', 0, 'Affi')
                   player:printToPlayer('To summon Pazuzu, i will require 1 Ashweed, 1 Duskcrawler!. ', 0, 'Affi')
                   player:printToPlayer('To summon Wrathare, i will require 1 Ashweed, 1 Duskcrawler, 1 Gravewood!. ', 0, 'Affi')
                end

end)

return m