-----------------------------------
-- ID: 25708
-- Gyve Doublet 25708
--  Sphere(aura) magic attack bonus +10
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
