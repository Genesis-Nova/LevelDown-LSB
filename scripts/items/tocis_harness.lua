-----------------------------------
-- ID: 11866
-- Tocis Harness -- 11866
--  Sphere(aura) haste gear +2
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, itemCheck, param, caster)
  return 0
end

itemObject.onItemEquip  = function(user, item)
user:addStatusEffectEx(xi.effect.HUM, xi.effect.HUM, 10, 3, 0)
end

itemObject.onItemUnequip = function(user, item)
user:delStatusEffect(xi.effect.HUM)
end

return itemObject
