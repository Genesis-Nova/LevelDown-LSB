
local m = Module:new('freeabby')

local zonez =
{
{'Abyssea-Altepa'},
{'Abyssea-Attohwa'},
{'Abyssea-Grauberg'},
{'Abyssea-Konschtat'},
{'Abyssea-La_Theine'},
{'Abyssea-Misareaux'},
{'Abyssea-Tahrongi'},
{'Abyssea-Uleguerand'},
{'Abyssea-Vunkerl'},
}



m:addOverride('xi.zones.Abyssea-Altepa.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(435, 0, 320, 136)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Attohwa.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-134, -20, -182, 108)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Grauberg.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-555, 31, -760, 0)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Konschtat.Zone.onZoneIn', function(player, prevZone)
    local cs = -1
    -- Note: in retail even tractor lands you back at searing ward, will handle later.
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(153, -72, -840, 140)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-La_Theine.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-480.5, -0.5, 794, 62)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Misareaux.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(670, -15, 318, 119)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Tahrongi.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-24, 44, -678, 240)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Uleguerand.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-238, -40, -520.5, 0)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)
m:addOverride('xi.zones.Abyssea-Vunkerl.Zone.onZoneIn', function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-351, -46.750, 699.5, 10)
    end

        player:addStatusEffectEx(xi.effect.VISITANT, xi.effect.VISITANT, 0, 0, 0)

    return cs

end)

return m
