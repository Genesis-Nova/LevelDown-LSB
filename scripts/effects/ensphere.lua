-----------------------------------
-- xi.effect.ENSPHERE
-----------------------------------
local effectObject = {}

local auraBonuses = 
{
    -- Aura Mod, Mod Power, item
    {xi.mod.CRITHITRATE,     3, xi.item.MEXTLI_HARNESS}, -- Mextli Harness 11855
    {xi.mod.CRITHITRATE,     4, xi.item.ENFORCERS_HARNESS}, -- Enforcers Harness 26962
    {xi.mod.MATT,            5, xi.item.ANHUR_ROBE}, -- Anhur Robe 11856
    {xi.mod.MATT,           10, xi.item.GYVE_DOUBLET}, -- Gyve Doublet 25708
    {xi.mod.MATT,           10, xi.item.ZENDIK_ROBE}, -- Zendik Robe 25728
    {xi.mod.STORETP,         6, xi.item.FAZHELUO_RADIANT_MAIL}, -- Fazheluo Radiant Mail 11857
    {xi.mod.HASTE_GEAR,    200, xi.item.TOCIS_HARNESS}, -- Tocis Harness -- 11866
    {xi.mod.FASTCAST,        5, xi.item.HEKAS_KALASIRIS}, -- Hekas Kalasiris -- 11867
    {xi.mod.DOUBLE_ATTACK,   3, xi.item.MEKIRA_MEIKOGAI}, -- Mekira Meikogai -- 11868
    {xi.mod.DOUBLE_ATTACK,   4, xi.item.KUBIRA_MEIKOGAI}, -- Kubira Meikogai -- 26959
    {xi.mod.RERAISE_I,       1, xi.item.ANNOINTED_KALASIRIS}, -- Annointed Kalasiris -- 26960
    {xi.mod.REGAIN,          5, xi.item.MAKORA_MEIKOGAI}, -- Makora Meikogai -- 26961
    {xi.mod.REFRESH,         1, xi.item.MEKOSUCHINAE_HARNESS}, -- Mekosuchinae Harness -- 27856
}

-- get member with armor 
local function getAuraLdr(player)
    local party = player:getParty()
    local auraLdr  = 0
        for _, member in ipairs(party) do
            if member:hasStatusEffect(xi.effect.HUM) then
               auraLdr = member
            end
        end
    return auraLdr
end

local function getAuraTableAdd(target, effect)
            local bodyAura = 0
            local power = 0
            local party = target:getParty()
            local leaders = {}
                for _, member in ipairs(party) do
                    if member:hasStatusEffect(xi.effect.HUM) then
                    table.insert(leaders, {name = member})
                    end
                end
            local auraTable = {}
                for _, aleader in ipairs(leaders) do 
                    for k, v in ipairs(auraBonuses) do
                        if aleader.name:getEquipID(xi.slot.BODY) == v[3] then
                          -- target:printToPlayer(string.format('%s', aleader.name))
                           table.insert(auraTable, {bodyAura = v[1], power = v[2]})
                        end
                    end
                end
            for _, addAuras in ipairs(auraTable) do
             --   target:printToPlayer(string.format('%s %s',addAuras.bodyAura,addAuras.power ))
                target:addMod(addAuras.bodyAura, addAuras.power)
                target:setCharVar('[BodyAura]', 1)
            end
end

local function getAuraTableRemove(target, effect)
            local bodyAura = 0
            local power = 0
            local party = target:getParty()
            local leaders = {}
                for _, member in ipairs(party) do
                    if member:hasStatusEffect(xi.effect.HUM) then
                    table.insert(leaders, {name = member})
                    end
                end
            local auraTable = {}
                for _, aleader in ipairs(leaders) do 
                    for k, v in ipairs(auraBonuses) do
                        if aleader.name:getEquipID(xi.slot.BODY) == v[3] then
                          -- target:printToPlayer(string.format('%s', aleader.name))
                           table.insert(auraTable, {bodyAura = v[1], power = v[2]})
                        end
                    end
                end
            for _, addAuras in ipairs(auraTable) do
             --   target:printToPlayer(string.format('%s %s',addAuras.bodyAura,addAuras.power ))
                target:delMod(addAuras.bodyAura, addAuras.power)
                target:setCharVar('[BodyAura]', 1)
            end
end

effectObject.onEffectGain = function(target, effect)
    if target:getCharVar('[BodyAura]') == 0 then
       getAuraTableAdd(target)
    end
end

effectObject.onEffectTick = function(target, effect)
if target:getCharVar('[BodyAura]') == 1 then
return
end
end

effectObject.onEffectLose = function(target, effect)
       getAuraTableRemove(target)
end

return effectObject