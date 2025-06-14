-----------------------------------
-- AF Reward
-----------------------------------
require('modules/module_utils')

-----------------------------------
local m = Module:new('craft_rank_reward')

local rankrewardal =
{
    [1] = {reward = 17764, var = 0}, -- TRAINEE_SWORD
    [3] = {reward = 15825, var = 3}, -- ALCHEMISTS_RING
    [5] = {reward = 17058, var = 5}, -- Caduceus
    [7] = {reward = 14398, var = 7}, -- Alchemists Apron
    [9] = {reward = xi.ki.WAY_OF_THE_ALCHEMIST, var = 9}, -- WAY_OF_THE_ALCHEMIST
}
local rankrewardbc =
{
    [1] = {reward = 15008, var = 0}, -- TRAINEE_GLOVES
    [3] = {reward = 15824, var = 3}, -- BONECRAFTERS_RING
    [5] = {reward = 13947, var = 5}, -- Protective Spectacles
    [7] = {reward = 14397, var = 7}, -- Boneworkers Apron
    [9] = {reward = xi.ki.WAY_OF_THE_BONEWORKER, var = 9}, -- WAY_OF_THE_BONEWORKER
}
local rankrewardcc =
{
    [1] = {reward = 18763, var = 0}, -- TRAINEE_SCISSORS
    [3] = {reward = 15822, var = 3}, -- TAILORS_RING
    [5] = {reward = 13946, var = 5}, -- Magnifying Spectacles
    [7] = {reward = 14395, var = 7}, -- Weavers Apron
    [9] = {reward = xi.ki.WAY_OF_THE_WEAVER, var = 9}, -- WAY_OF_THE_WEAVER
}
local rankrewardco =
{
    [1] = {reward = 19101, var = 0}, -- TRAINEE_KNIFE
    [3] = {reward = 15826, var = 3}, -- CHEFS_RING
    [5] = {reward = 13948, var = 5}, -- Chefs Hat
    [7] = {reward = 14399, var = 7}, -- Culinarians Apron
    [9] = {reward = xi.ki.WAY_OF_THE_CULINARIAN, var = 9}, -- WAY_OF_THE_CULINARIAN
}
local rankrewardgs =
{
    [1] = {reward = 19274, var = 0}, -- TRAINEE_BURIN
    [3] = {reward = 15821, var = 3}, -- GOLDSMITHS_RING
    [5] = {reward = 13945, var = 5}, -- Shaded Spectacles
    [7] = {reward = 14394, var = 7}, -- Goldsmiths Apron
    [9] = {reward = xi.ki.WAY_OF_THE_GOLDSMITH, var = 9}, -- WAY_OF_THE_GOLDSMITH 
}
local rankrewardlc =
{
    [1] = {reward = 19110, var = 0}, -- TRAINEES_NEEDLE
    [3] = {reward = 15823, var = 3}, -- TANNERS_RING
    [5] = {reward = 14832, var = 5}, -- Tanners Gloves
    [7] = {reward = 14396, var = 7}, -- Tanners Apron
    [9] = {reward = xi.ki.WAY_OF_THE_TANNER, var = 9}, -- WAY_OF_THE_TANNER
}
local rankrewardsm =
{
    [1] = {reward = 18855, var = 0}, -- TRAINEE_HAMMER
    [3] = {reward = 15820, var = 3}, -- SMITHS_RING
    [5] = {reward = 14831, var = 5}, -- Smithys Mitts
    [7] = {reward = 14393, var = 7}, -- Blacksmiths Apron
    [9] = {reward = xi.ki.WAY_OF_THE_BLACKSMITH, var = 9}, -- WAY_OF_THE_BLACKSMITH
}
local rankrewardww =
{
    [1] = {reward = 18502, var = 0}, -- TRAINEE_AXE
    [3] = {reward = 15819, var = 3}, -- CARPENTERS_RING
    [5] = {reward = 14830, var = 5}, -- Carpenters Gloves
    [7] = {reward = 14392, var = 7}, -- Carpenters Apron
    [9] = {reward = xi.ki.WAY_OF_THE_CARPENTER, var = 9}, -- WAY_OF_THE_CARPENTER  
}
local rankrewardfs =
{
    [1] = {reward = 11499, var = 0}, -- TRAINEES_SPECTACLES
    [3] = {reward = 15554, var = 3}, -- Pelican Ring
    [5] = {reward = 14195, var = 5}, -- Waders
    [7] = {reward = 25608, var = 7}, -- Tlahtlamah Glasses
    [9] = {reward = xi.ki.ANGLERS_ALMANAC, var = 9}, -- ANGLERS_ALMANAC 
}
-- woodworking
m:addOverride('xi.zones.Northern_San_dOria.npcs.Cheupirudaux.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(49)
    local rewVar   = player:getCharVar('CraftWWReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardww) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftWWReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftWWReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- alchemy
m:addOverride('xi.zones.Bastok_Mines.npcs.Abd-al-Raziq.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(55)
    local rewVar   = player:getCharVar('CraftALReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardal) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftALReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftALReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- bonecrafting
m:addOverride('xi.zones.Windurst_Woods.npcs.Peshi_Yohnts.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(54)
    local rewVar   = player:getCharVar('CraftBCReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardbc) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftBCReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftBCReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- clothcrafting
m:addOverride('xi.zones.Windurst_Woods.npcs.Ponono.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(52)
    local rewVar   = player:getCharVar('CraftCCReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardcc) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftCCReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftCCReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- cooking
m:addOverride('xi.zones.Windurst_Waters.npcs.Piketo-Puketo.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(56)
    local rewVar   = player:getCharVar('CraftCOReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardco) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftCOReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftCOReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- goldsmithing
m:addOverride('xi.zones.Bastok_Markets.npcs.Reinberta.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(51)
    local rewVar   = player:getCharVar('CraftGSReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardgs) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftGSReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftGSReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- smithing
m:addOverride('xi.zones.Metalworks.npcs.Ghemp.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(50)
    local rewVar   = player:getCharVar('CraftSMReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardsm) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftSMReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftSMReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- smithing 
m:addOverride('xi.zones.Northern_San_dOria.npcs.Mevreauche.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(50)
    local rewVar   = player:getCharVar('CraftSMReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardsm) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftSMReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftSMReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- leathercrafting
m:addOverride('xi.zones.Southern_San_dOria.npcs.Faulpie.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(53)
    local rewVar   = player:getCharVar('CraftLCReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardlc) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftLCReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftLCReward', newRankz + 2)
                   end
                end
            end 
         end
end)
-- fishing 
m:addOverride('xi.zones.Port_Windurst.npcs.Thubu_Parohren.onTrade', function(player, npc, trade)
super(player, npc, trade)
    local newRankz = player:getSkillRank(48)
    local rewVar   = player:getCharVar('CraftFSReward')
    local reward   = 0
         if reward == 0 then
            for k, v in pairs(rankrewardfs) do
                if newRankz == k and v.var == rewVar then
                   reward = k
                   if reward == k and k ~= 9 then 
                      npcUtil.giveItem(player, v.reward)
                      player:setCharVar('CraftFSReward', newRankz + 2)
                   elseif newRankz == 9 then
                      npcUtil.giveKeyItem(player, v.reward)
                      player:setCharVar('CraftFSReward', newRankz + 2)
                   end
                end
            end 
         end
end)

return m
