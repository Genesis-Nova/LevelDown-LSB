----------------------------------
-- func: testnpc
-- desc: Summon a npc to test model
-- note:
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = ''
}


commandObj.onTrigger = function(player)
    local zoneOrInstanceObj = player:getZone()

    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end


    --[[ Decor
    00004701 - nothing
    00007005 - tree
    00006D05 - egg decoration
    00000605 - floating decoration
    0000E004 - tree
    00000E05 - bomb stand - windy ************************
    00000D05 - bomb stand sandy **********************
    00000F05 - Blue pumpkin table ****************
    0000F602 - umbrella
    0000D702 -- tree
    0000D802 -- tree
    00001605 - green pumpkin table ******************
    00001405 - red pumpkin table *****************
    00003400 - two trees
    01001E0282117020173017401750006000700000
    00002E01 - mandy
    0000D403 - paper on ground
    0x0000340000000000000000000000000000000000 -- two trees
    00004E01 -- baby dahlma
    0000BE05 -- AA taru hovering
    0000F702 -- blanlet with wall
    0000F802 -- shadow lord
    00008209 -- baby xion
    00000C08 - haloween blob **************************
    ]]--
  --[[
  name
  0xf4 glowing flowers


  3600 - 3650
  3188 = book == C74 == 74 0C
  3150+4 = glowing egg
  3150+21 = glowing orc
  268436452 = glowing portal
  268436496 - big decor
  268436758 = green pumpkin decor
  268436756 = red pumpkin decor
  268436751 = blue pumpkin decor
  268436980 chest decor
  268436979 bed decor
  268437247 = bomb on ground
  268437350 +22 to +37 - auras
  268437799 chair
  268437786 big crate
  268437850+40 & 41 - baby xion
  268437900+49 & 48 & 47 - shinning portals
  268438100 + 35 evil hades
  268438100 + 50 white hades
  268438200 +34 hut
  268438200 +35 baracade
  268438200 +36 stump
  2784 boat
  2785 wall
  2786 chair
  2787 raft
  2793, 2794 fruit basket
  268438250 + 12 big red plant
  268438250+ 22 bed
  268438250+31 red eye
  268438250+39 purple eye
  268438350+31 baby turtle
  268438350-268438450 - lots of babys
  0x0000000B00000000000000000000000000000000 - royal bed
  0000060900000000000000000000000000000000 - sandy flag with torches
  0000070900000000000000000000000000000000 - bastok flag with torches
  0000080900000000000000000000000000000000 - windy flag with torches
  0000090900000000000000000000000000000000 - beastmen flag with torches
  ]]--

     --     for i = 1, 100 do -- at 3600



    local npc = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = '3400', --..i,
        look = 2785, -- + i,
                
        --      0x0000000B00000000000000000000000000000000
        x = player:getXPos(), -- + i + 5,
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),

        onTrade = function(player, npc, trade)

        end,
        onTrigger = function(player, npc)

        end,
        releaseIdOnDisappear = true,
    })
    utils.unused(npc)
end
 -- end
return commandObj


--[[
                00 00 16 09
                00 00 00 0B 
                05 00 03 02 00000000000000000000000000000000
        look = '01 00 05 03 77 10 67 20 68 30 66 40 68 50 00 60 00 70 00 00',
                 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                              
        Index/Type  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                   
                       |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                             
                    hair  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                            
                       race  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                              
                          head  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                               
                             head  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                          
                                Body  |  |  |  |  |  |  |  |  |  |  |  |  |                                           
                                   body  |  |  |  |  |  |  |  |  |  |  |  |                                                 
                                     hands  |  |  |  |  |  |  |  |  |  |  |                                             
                                        hands  |  |  |  |  |  |  |  |  |  |
                                            legs  |  |  |  |  |  |  |  |  |
                                               legs  |  |  |  |  |  |  |  |                                       
                                                  feet  |  |  |  |  |  |  |                              
                                                     feet  |  |  |  |  |  |                            
                                                      weapon  |  |  |  |  |                          
                                                                 |  |  |  |                        
                                                                    |  |  |                   
                                                                       |  |               
                                                                          |              
                                                                                      
                                                                                      
]]--