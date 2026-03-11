-----------------------------------
-- Trust: Adelheid
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('star_sibyl')

local trustToReplaceName = 'star_sibyl'


m:addOverride(string.format('xi.actions.spells.trust.%s.onMobSpawn', trustToReplaceName), function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)
    local mlvl = mob:getMainLvl()
    local boost_Amount
    local tick_amount
    if mlvl == 99 then
        tick_amount = 19
        boost_Amount = 19
    elseif mlvl < 99 then
        tick_amount = 13
        boost_Amount = 13
    elseif mlvl <= 87 then
        tick_amount = 11
        boost_Amount = 11
    elseif mlvl <= 73 then
        tick_amount = 9
        boost_Amount = 9
    elseif mlvl <= 51 then
        tick_amount = 5
        boost_Amount = 5
    else
        tick_amount = 1
        boost_Amount = 1
    end

    mob:addStatusEffect(xi.effect.COLURE_ACTIVE, { power = 6, origin = mob, tick = 3, subType = xi.effect.GEO_MAGIC_ATK_BOOST, subPower = tick_amount, tier = xi.auraTarget.ALLIES, flag = xi.effectFlag.AURA })
    mob:addStatusEffect(xi.effect.GEO_MAGIC_ACC_BOOST, { power = 6, origin = mob, tick = 3, subType = xi.effect.GEO_MAGIC_ACC_BOOST, subPower = boost_Amount, tier = xi.auraTarget.ALLIES, flag = xi.effectFlag.AURA })
	
end)

return m