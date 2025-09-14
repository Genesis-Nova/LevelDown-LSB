--Upgrade system overview:

--Gradually Increasing: Cursna bonus & Healing Skill bonus
--Refresh Bonus: +1 at 15, +2 at 30
--Unlock Protectra/Shellra at 40

--At max rank Cursna should have ~50% Doom removal rate
--At base, it is ~30%

----------------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
----------------------------------------

local m = Module:new("CoffinCursnaNPC")
local itemz =
{
    [1] = { trade = {{21084, 1}}, reward = 8, var = '[NPC]_Queller' }, -- Queller Rod - Yilan - Escha Ru'Aun - 21084
    [2] = { trade = {{26326, 1}}, reward = 8, var = '[NPC]_Channeler' }, -- Channeler's Stone - Crom Dubh - Reisenjima - 26326
    [3] = { trade = {{21076, 1}}, reward = 6, var = '[NPC]_Septoptic' }, -- Septoptic +1 - Shedu UNM - 21076
    [4] = { trade = {{26981, 1}}, reward = 5, var = '[NPC]_PietyMitts' }, -- Piety Mitts +1 - Reforged Relic +1 - 26981
    [5] = { trade = {{27333, 1}}, reward = 5, var = '[NPC]_PietyDuckbills' }, -- Piety Duckbills +1 - Relic +1 - 27333
    [6] = { trade = {{27407, 1}}, reward = 5, var = '[NPC]_Hygieia' }, -- Hygieia Clogs (NQ) - Camahueto UNM - 27407
    [7] = { trade = {{27554, 1}}, reward = 4, var = '[NPC]_Purity' }, -- Purity Ring - Brittlis - Escha Zi'Tah - 27554
    [8] = { trade = {{27463, 1}}, reward = 4, var = '[NPC]_Vanya' }, -- Vanya Clogs - Gulltop - Escha Zi'Tah - 27463
    [9] = { trade = {{10791, 1}}, reward = 2, var = '[NPC]_HaomaRing' }, -- Haoma's Ring - Crafted Alchemy 99 - 10791
    [10] = { trade = {{10393, 1}}, reward = 2, var = '[NPC]_Debilis' }, -- Debilis Medallion - Crafted Alchemy 106, Goldsmithing 25 - 10393
    [11] = { trade = {{28335, 1}}, reward = 1, var = '[NPC]_Gendewitha' }, -- Gendewitha Galoshes - VWNM Yatagarasu & Brekekekex - 28335
}

m:addOverride('xi.zones.Lufaise_Meadows.Zone.onInitialize', function(zone)
    super(zone)

    local Ferreouscoffin = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Ferreous Coffin',
        look = 3048,
        x = 199.7077,
        y = -22.6495,
        z = 347.8383,
        rotation = 175,
        widescan = 1,

        onTrade = function(player, npc, trade)
            local item = trade:getItem(0)
            local retItem = item:getName(tostring())
            local Coffinvalue = player:getCharVar('coffinrankup')

            if Coffinvalue == 50 then
                player:printToPlayer('There is nothing more I can offer, my abilities have been perfected....', 0, npc:getPacketName())
            else
                local tradedCombo = 0
                for k, v in pairs(itemz) do
                    if npcUtil.tradeHasExactly(trade, v.trade) then
                        tradedCombo = k
                        if player:getCharVar(v.var) == 1 then
                            player:printToPlayer('You have already traded me this item, come back when you have something', 0, npc:getPacketName())
                            player:printToPlayer('new to offer me....', 0, npc:getPacketName())
                        else
                            player:confirmTrade()
                            -- Lock coffinrankup to max 50
                            local newValue = math.min(Coffinvalue + v.reward, 50)
                            player:setCharVar('coffinrankup', newValue)
                            player:setCharVar(v.var, 1)
                            player:printToPlayer(string.format('Thank you for the %s, My current power is %s.', retItem, newValue), 0, npc:getPacketName())
                        end
                        break
                    end
                end
                if tradedCombo == 0 then
                    player:printToPlayer('Do you think I am blind or dim, I do not want or need this.', 0, npc:getPacketName())
                end
            end
        end,

        onTrigger = function(player, npc)
            local Queller = player:getCharVar('[NPC]_Queller') == 0 and 'Queller Rod,' or ''
            local Channeler = player:getCharVar('[NPC]_Channeler') == 0 and 'Channeler\'s Stone,' or ''
            local Septoptic = player:getCharVar('[NPC]_Septoptic') == 0 and 'Septoptic +1,' or ''
            local PietyMitts = player:getCharVar('[NPC]_PietyMitts') == 0 and 'Piety Mitts +1,' or ''
            local PietyDuckbills = player:getCharVar('[NPC]_PietyDuckbills') == 0 and 'Piety Duckbills +1,' or ''
            local Hygieia = player:getCharVar('[NPC]_Hygieia') == 0 and 'Hygieia Clogs,' or ''
            local Purity = player:getCharVar('[NPC]_Purity') == 0 and 'Purity Ring,' or ''
            local Vanya = player:getCharVar('[NPC]_Vanya') == 0 and 'Vanya Clogs,' or ''
            local HaomaRing = player:getCharVar('[NPC]_HaomaRing') == 0 and 'Haoma\'s Ring,' or ''
            local Debilis = player:getCharVar('[NPC]_Debilis') == 0 and 'Debilis Medallion,' or ''
            local Gendewitha = player:getCharVar('[NPC]_Gendewitha') == 0 and 'Gendewitha Galoshes,' or ''

            local Coffinvalue = player:getCharVar('coffinrankup')

            if Coffinvalue <= 0 then
                player:printToPlayer('One day, I dream of becoming a beacon of light on the battlefield!', 0, npc:getPacketName())
                player:printToPlayer('To keep you safe, I must grow stronger and wiser in the arts of divine magic.', 0, npc:getPacketName())
                player:printToPlayer('If you can find me better gear, I will do my best to keep death at bay!', 0, npc:getPacketName())
                player:printToPlayer('I will accept the following sacred tools to deepen my white magic prowess:', 0, npc:getPacketName())
                player:printToPlayer('Queller Rod, Channeler\'s Stone, Septoptic +1, Piety Mitts +1, Piety Duckbills +1,', 0, npc:getPacketName())
                player:printToPlayer('Hygieia Clogs, Purity Ring, Vanya Clogs, Haoma\'s Ring, Debilis Medallion, Gendewitha Galoshes.', 0, npc:getPacketName())
            elseif Coffinvalue <= 49 then
                player:printToPlayer(string.format('My divine light grows stronger... My current power level is %s.', Coffinvalue), 0, npc:getPacketName())
                player:printToPlayer('I can now resist the pull of Death for longer, and my magical energies recover faster.', 0, npc:getPacketName())
                player:printToPlayer('But I can grow further! Bring me more of the following to unlock my full potential:', 0, npc:getPacketName())
                player:printToPlayer(string.format('%s %s %s %s %s %s %s %s %s %s %s', Queller, Channeler, Septoptic, PietyMitts, PietyDuckbills, Hygieia, Purity, Vanya, HaomaRing, Debilis, Gendewitha), 0, npc:getPacketName())
            elseif Coffinvalue == 50 then
                player:printToPlayer(string.format('Thank you, friend. I have become a true White Mage guardian. My current power is %s.', Coffinvalue), 0, npc:getPacketName())
                player:printToPlayer('I can now purge even the deepest Doom and maintain my magical strength with ease.', 0, npc:getPacketName())
                player:printToPlayer('With your help, I stand ready to protect us from the brink of death.', 0, npc:getPacketName())
            end
        end,
    })

    utils.unused(Ferreouscoffin)
end)

return m