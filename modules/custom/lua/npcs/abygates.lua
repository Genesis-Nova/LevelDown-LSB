-----------------------------------
-- Area: Abyssea-Misareaux
-- Shared NPC: Dilapidated_Gate (1–4)
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")

local m = Module:new("abygates")

local gateDestinations = {
    { zone = 'Abyssea-Misareaux', npc = 'Dilapidated_Gate_1', event = 255},
    { zone = 'Abyssea-Misareaux', npc = 'Dilapidated_Gate_2', event = 256},
    { zone = 'Abyssea-Misareaux', npc = 'Dilapidated_Gate_3', event = 257},
    { zone = 'Abyssea-Misareaux', npc = 'Dilapidated_Gate_4', event = 258},
}

local ensureTable = function(str)
    local parts = utils.splitStr(str, '.')
    local tbl = _G
    for _, part in ipairs(parts) do
        tbl[part] = tbl[part] or {}
        tbl = tbl[part]
    end
    return tbl
end

for _, entry in ipairs(gateDestinations) do
    ensureTable(string.format("xi.zones.%s.npcs.%s", entry.zone, entry.npc))

    m:addOverride(string.format("xi.zones.%s.npcs.%s.onTrigger", entry.zone, entry.npc), function(player, npc)
        player:startEvent(entry.event)
    end)
end

return m