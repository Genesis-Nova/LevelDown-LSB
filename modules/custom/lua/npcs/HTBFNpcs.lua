--- Puts the planar rifts in the zones without having a file in zones/npcs
local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local table = _G;
    for _, part in ipairs(parts) do
        table[part] = table[part] or {}
        table = table[part]
    end
end


ensureTable('xi.zones.Port_Windurst.npcs.Mimble-Pimble')
ensureTable('xi.zones.Port_Bastok.npcs.Raving_Opossum')
ensureTable('xi.zones.Northern_San_dOria.npcs.Trisvain')

-----------------------------------
local ID = zones[xi.zone.PORT_WINDURST]
require("modules/module_utils")
-----------------------------------

local m = Module:new("HTBFNpcs")
local kiShop = {}

kiShop = {
  --------------------------------------------------------------------------
  --Page 1
  [     2]  = { keyitem = 2468, merit = 10}, --xi.ki.SHADOW_LORD_PHANTOM_GEM,        --id# 2468 index# 1
  [   258]  = { keyitem = 2470, merit = 10}, --xi.ki.STELLAR_FULCRUM_PHANTOM_GEM,    --id# 2470 index# 2
  [   514]  = { keyitem = 2469, merit = 10}, --xi.ki.CELESTIAL_NEXUS_PHANTOM_GEM,    --id# 2469 index# 4
  [   770]  = { keyitem = 2471, merit = 15}, --xi.ki.PHANTOM_GEM_OF_APATHY,          --id# 2471 index# 8
  [  1026]  = { keyitem = 2472, merit = 15}, --xi.ki.PHANTOM_GEM_OF_ARROGANCE,       --id# 2472 index# 16
  [  1282]  = { keyitem = 2473, merit = 15}, --xi.ki.PHANTOM_GEM_OF_ENVY,            --id# 2473 index# 32
  [  1538]  = { keyitem = 2474, merit = 15}, --xi.ki.PHANTOM_GEM_OF_COWARDICE,       --id# 2474 index# 64
  [  1794]  = { keyitem = 2475, merit = 15}, --xi.ki.PHANTOM_GEM_OF_RAGE,            --id# 2475 index# 128
  [  2050]  = { keyitem = 2476, merit = 20}, --xi.ki.P_PERPETRATOR_PHANTOM_GEM,      --id# 2476 index# 256
  [  2306]  = { keyitem = 2545, merit = 10}, --xi.ki.SAVAGES_PHANTOM_GEM,            --id# 2545 index# 512              
  [  2562]  = { keyitem = 2546, merit = 10}, --xi.ki.WARRIORS_PATH_PHANTOM_GEM,      --id# 2546 index# 1024
  [  2818]  = { keyitem = 2556, merit = 10}, --xi.ki.PUPPET_IN_PERIL_PHANTOM_GEM,    --id# 2556 index# 2048          
  [  3074]  = { keyitem = 2557, merit = 10}, --xi.ki.LEGACY_PHANTOM_GEM,             --id# 2557 index# 4096
  [  3330]  = { keyitem = 2595, merit = 10}, --xi.ki.HEAD_WIND_PHANTOM_GEM,          --id# 2595 index# 8192
  [  3586]  = { keyitem = 2619, merit = 10}, --xi.ki.AVATAR_PHANTOM_GEM,             --id# 2619 index# 16384
  [  3842]  = { keyitem = 2923, merit = 10}, --xi.ki.MOONLIT_PATH_PHANTOM_GEM,       --id# 2923 index# 32768
  -------------------------------------------------------------------------
  -- page 2
  [  4098]  = { keyitem = 2924, merit = 10}, --xi.ki.WAKING_THE_BEAST_PHANTOM_GEM,   --id# 2924 index# 65536          
  [  4354]  = { keyitem = 2925, merit = 10}, --xi.ki.WAKING_DREAMS_PHANTOM_GEM,      --id# 2925 index# 131072
  [  4610]  = { keyitem = 2987, merit = 10}, --xi.ki.FEARED_ONE_PHANTOM_GEM,         --id# 2987 index# 262144                  
  [  4866]  = { keyitem = 2988, merit = 10}, --xi.ki.DAWN_PHANTOM_GEM,               --id# 2988 index# 524288
  [  5122]  = { keyitem = 3185, merit = 10}, --xi.ki.STYGIAN_PACT_PHANTOM_GEM,       --id# 3185 index# 1048576               
  [  5378]  = { keyitem = 3186, merit = 10}, --xi.ki.CHAMPION_PHANTOM_GEM,           --id# 3186 index# 2097152                    
  [  5634]  = { keyitem = 3187, merit = 10}, --xi.ki.DIVINE_PHANTOM_GEM,             --id# 3187 index# 4194304                     
  [  5890]  = { keyitem = 3188, merit = 10}, --xi.ki.MAIDEN_PHANTOM_GEM,             --id# 3188 index# 8388608
  [  6146]  = { keyitem = 3261, merit = 30}, --xi.ki.WYRM_GOD_PHANTOM_GEM,           --id# 3261 index# 16777216
}

m:addOverride("xi.zones.Port_Windurst.npcs.Mimble-Pimble.onTrigger", function(player, npc)

    -- get player count merit points
      local gmc = player:getMeritCount()
      if gmc < 10 -- and agreq7 == true
     then
     -- player:startEvent(892, 1, 16384, gmc, 0) --show no KI's if merits are below 9

    player:startEvent(895, 1, 0, gmc, 0) --show no KI's if merits are below 9

    elseif gmc >= 10 then
    player:startEvent(895, 2, 33554431, gmc, 0) -- show all KI's'
    end
end)

m:addOverride("xi.zones.Port_Windurst.npcs.Mimble-Pimble.onEventUpdate", function(player, csid, option, npc)
    local gmc = player:getMeritCount()

      if option == 259 then -- Next page
        player:updateEvent(0, 33554431, 0, 0, 0, 0, 0, 0) -- show all KI's'

          elseif option == 3 then -- Previouse page - recalculate options
        player:updateEvent(2, 33554431, gmc, 0, 0, 0, 0, 0) -- need to adjust when we get the other options available
       
    end
end)

m:addOverride("xi.zones.Port_Windurst.npcs.Mimble-Pimble.onEventFinish", function(player, csid, option, npc)
        if kiShop[option] then
         local purchase = kiShop[option]
         local gmc = player:getMeritCount() -- get players current merit count
         local smc = gmc - purchase.merit -- subtract purchase merit        
            if
                    player:hasKeyItem(purchase.keyitem)
                then
                    player:messageBasic(759, s , purchase.keyitem) -- Already have Key Item
                    return
            elseif
                    player:getMeritCount() >= purchase.merit and
                    npcUtil.giveKeyItem(player, purchase.keyitem)
                then
                    player:setMerits(smc)

            end
        end
end)
m:addOverride("xi.zones.Port_Bastok.npcs.Raving_Opossum.onTrigger", function(player, npc)

    -- get player count merit points
      local gmc = player:getMeritCount()
      if gmc < 10 -- and agreq7 == true
     then
     -- player:startEvent(892, 1, 16384, gmc, 0) --show no KI's if merits are below 9

    player:startEvent(429, 1, 0, gmc, 0) --show no KI's if merits are below 9

    elseif gmc >= 10 then
    player:startEvent(429, 2, 33554431, gmc, 0) -- show all KI's'
    end
end)

m:addOverride("xi.zones.Port_Bastok.npcs.Raving_Opossum.onEventUpdate", function(player, csid, option, npc)
    local gmc = player:getMeritCount()

      if option == 259 then -- Next page
        player:updateEvent(0, 33554431, 0, 0, 0, 0, 0, 0) -- show all KI's'

          elseif option == 3 then -- Previouse page - recalculate options
        player:updateEvent(2, 33554431, gmc, 0, 0, 0, 0, 0) -- need to adjust when we get the other options available
       
    end
end)

m:addOverride("xi.zones.Port_Bastok.npcs.Raving_Opossum.onEventFinish", function(player, csid, option, npc)
        if kiShop[option] then
         local purchase = kiShop[option]
         local gmc = player:getMeritCount() -- get players current merit count
         local smc = gmc - purchase.merit -- subtract purchase merit        
            if
                    player:hasKeyItem(purchase.keyitem)
                then
                    player:messageBasic(759, s , purchase.keyitem) -- Already have Key Item
                    return
            elseif
                    player:getMeritCount() >= purchase.merit and
                    npcUtil.giveKeyItem(player, purchase.keyitem)
                then
                    player:setMerits(smc)

            end
        end
end)
m:addOverride("xi.zones.Northern_San_dOria.npcs.Trisvain.onTrigger", function(player, npc)

    -- get player count merit points
      local gmc = player:getMeritCount()
      if gmc < 10 -- and agreq7 == true
     then
     -- player:startEvent(892, 1, 16384, gmc, 0) --show no KI's if merits are below 9

    player:startEvent(892, 1, 0, gmc, 0) --show no KI's if merits are below 9

    elseif gmc >= 10 then
    player:startEvent(892, 2, 33554431, gmc, 0) -- show all KI's'
    end
end)

m:addOverride("xi.zones.Northern_San_dOria.npcs.Trisvain.onEventUpdate", function(player, csid, option, npc)
    local gmc = player:getMeritCount()

      if option == 259 then -- Next page
        player:updateEvent(0, 33554431, 0, 0, 0, 0, 0, 0) -- show all KI's'

          elseif option == 3 then -- Previouse page - recalculate options
        player:updateEvent(2, 33554431, gmc, 0, 0, 0, 0, 0) -- need to adjust when we get the other options available
       
    end
end)

m:addOverride("xi.zones.Northern_San_dOria.npcs.Trisvain.onEventFinish", function(player, csid, option, npc)
        if kiShop[option] then
         local purchase = kiShop[option]
         local gmc = player:getMeritCount() -- get players current merit count
         local smc = gmc - purchase.merit -- subtract purchase merit        
            if
                    player:hasKeyItem(purchase.keyitem)
                then
                    player:messageBasic(759, s , purchase.keyitem) -- Already have Key Item
                    return
            elseif
                    player:getMeritCount() >= purchase.merit and
                    npcUtil.giveKeyItem(player, purchase.keyitem)
                then
                    player:setMerits(smc)

            end
        end
end)
m:addOverride("xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onTrade", function(player, npc, trade)
end)
m:addOverride("xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onTrigger", function(player, npc)
local amountis = player:getCurrency('imperial_standing')
if player:hasKeyItem(xi.ki.SECRET_IMPERIAL_ORDER) == true and
   player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) == true then
   player:startEvent(163)
   else
        player:startEvent(160, amountis)
   end
end)
m:addOverride("xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onEventUpdate", function(player, csid, option, npc)
end)
m:addOverride("xi.zones.Aht_Urhgan_Whitegate.npcs.Shajaf.onEventFinish", function(player, csid, option, npc)
if csid == 160 and option == 1 and
player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) == true then
player:messageBasic(759, s , xi.ki.CONFIDENTIAL_IMPERIAL_ORDER)
elseif  csid == 160 and option == 1 and
player:hasKeyItem(xi.ki.CONFIDENTIAL_IMPERIAL_ORDER) == false then
                    npcUtil.giveKeyItem(player, xi.ki.CONFIDENTIAL_IMPERIAL_ORDER)
                    player:delCurrency('imperial_standing', 2000)
return
end

if csid == 160 and option == 2 and
player:hasKeyItem(xi.ki.SECRET_IMPERIAL_ORDER) == true then
player:messageBasic(759, s , xi.ki.SECRET_IMPERIAL_ORDER)
elseif  csid == 160 and option == 2 and
player:hasKeyItem(xi.ki.SECRET_IMPERIAL_ORDER) == false then
                    npcUtil.giveKeyItem(player, xi.ki.SECRET_IMPERIAL_ORDER)
                    player:delCurrency('imperial_standing', 3000)
return
end

end)


return m
