local zonez =
{
{'Zeruhn_Mines'},
{'Yuhtunga_Jungle'},
{'Yhoator_Jungle'},
{'Xarcabard'},
{'West_Sarutabaruta'},
{'West_Ronfaure'},
{'Western_Altepa_Desert'},
{'VeLugannon_Palace'},
{'Valley_of_Sorrows'},
{'Valkurm_Dunes'},
{'Upper_Delkfutts_Tower'},
{'Toraimarai_Canal'},
{'The_Shrine_of_RuAvitau'},
{'The_Sanctuary_of_ZiTah'},
{'The_Eldieme_Necropolis'},
{'The_Boyahda_Tree'},
{'Temple_of_Uggalepih'},
{'Tahrongi_Canyon'},
{'South_Gustaberg'},
{'Sea_Serpent_Grotto'},
{'Sauromugue_Champaign'},
{'RuAun_Gardens'},
{'RoMaeve'},
{'Rolanberry_Fields'},
{'Ranguemont_Pass'},
{'Quicksand_Caves'},
{'Qufim_Island'},
{'Pashhow_Marshlands'},
{'Outer_Horutoto_Ruins'},
{'Ordelles_Caves'},
{'North_Gustaberg'},
{'Middle_Delkfutts_Tower'},
{'Meriphataud_Mountains'},
{'Maze_of_Shakhrami'},
{'Lower_Delkfutts_Tower'},
{'La_Theine_Plateau'},
{'Labyrinth_of_Onzozo'},
{'Kuftal_Tunnel'},
{'Korroloka_Tunnel'},
{'Konschtat_Highlands'},
{'King_Ranperres_Tomb'},
{'Jugner_Forest'},
{'Inner_Horutoto_Ruins'},
{'Ifrits_Cauldron'},
{'Gustav_Tunnel'},
{'Gusgen_Mines'},
{'Garlaige_Citadel'},
{'FeiYin'},
{'East_Sarutabaruta'},
{'East_Ronfaure'},
{'Eastern_Altepa_Desert'},
{'Den_of_Rancor'},
{'Dangruf_Wadi'},
{'Crawlers_Nest'},
{'Cape_Teriggan'},
{'Buburimu_Peninsula'},
{'Bostaunieux_Oubliette'},
{'Behemoths_Dominion'},
{'Beaucedine_Glacier'},
{'Batallia_Downs'},
}


-----------------------------------
require("modules/module_utils")
-----------------------------------
local m = Module:new("open_caskets")
for _, entry in pairs(zonez) do
m:addOverride(string.format('xi.zones.%s.npcs.Treasure_Casket.onTrigger', entry[1]), function(player, npc)
    xi.caskets.onTrigger(player, npc)
    if npc:getLocalVar('[caskets]LOCKED') == 1 then
        player:printToPlayer(string.format('The answer to your question is %s', npc:getLocalVar('[caskets]CORRECT_NUM')))
    end
end)
end

return m
