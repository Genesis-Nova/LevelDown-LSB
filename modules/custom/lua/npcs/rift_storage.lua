-----------------------------------
-- Bentglasstube
-----------------------------------
require("modules/module_utils")
require("scripts/globals/npc_util")
-----------------------------------
local m = Module:new("rift_storage")

m:addOverride("xi.zones.Port_Jeuno.Zone.onInitialize", function(zone)
    super(zone)

local itemList = {
	{ name = "Riftborn Boulder",  var = "VaultRift",     id = 4061, stack = 99 },
	{ name = "Pluton",            var = "VaultPluton",   id = 4059, stack = 99 },
	{ name = "Beitetsu",          var = "VaultBeitetsu", id = 4060, stack = 99 },
	{ name = "Heavy Metal Plate", var = "VaultHMP",      id = 3509, stack = 99 },
	{ name = "Riftcinder",        var = "VaultCinder",   id = 3499, stack = 12 },
	{ name = "Riftdross",         var = "VaultDross",    id = 3498, stack = 12 },
}

local itemsPerPage = 3

local function delaySendMenu(player, makeMenu)
	player:timer(50, function(p)
		p:customMenu(makeMenu())
	end)
end

local function tradeHasAnyItem(trade)
	for slot = 0, 8 do
		local id = trade:getItemId(slot)
		if id ~= 0 and id ~= 65535 then
			return true
		end
	end
	return false
end

local function tradeHasOnlyAllowedItems(trade, allowedIds)
	for slot = 0, 8 do
		local id = trade:getItemId(slot)
		if id ~= 0 then
			local ok = false
			for _, allowed in ipairs(allowedIds) do
				if id == allowed then
					ok = true
					break
				end
			end
			if not ok then
				return false
			end
		end
	end
	return true
end

local function showListPage(player, page)
	page = page or 1
	local startIndex = (page - 1) * itemsPerPage + 1
	local endIndex   = math.min(startIndex + itemsPerPage - 1, #itemList)

	local opts = {}
	for i = startIndex, endIndex do
		local e = itemList[i]
		local stored = player:getCharVar(e.var)
		table.insert(opts, { string.format("%s - %d", e.name, stored), function() end })
	end

	if page > 1 then
		table.insert(opts, {
			"Previous Page",
			function(p) delaySendMenu(p, function() return { title = "Rift Storage", options = showListPage(p, page - 1) } end) end
		})
	end
	if endIndex < #itemList then
		table.insert(opts, {
			"Next Page",
			function(p) delaySendMenu(p, function() return { title = "Rift Storage", options = showListPage(p, page + 1) } end) end
		})
	end



	table.insert(opts, {
		"Close",
		function(p)
			
		end
	})
	return opts
end

local function onTalk(player)
	player:customMenu({
		title = "Rift Storage",
		options = showListPage(player, 1)
	})
end

local function openWithdrawMenu(player, gil)
	local hasAny = false
	for _, e in ipairs(itemList) do
		if player:getCharVar(e.var) > 0 then
			hasAny = true
			break
		end
	end
	if not hasAny then
		player:printToPlayer("You do not have anything stored.", 0, "Bentglasstube")
		return
	end

	local function pageMenu(page)
		page = page or 1
		local startIndex = (page - 1) * itemsPerPage + 1
		local endIndex   = math.min(startIndex + itemsPerPage - 1, #itemList)

		local opts = {}

		for i = startIndex, endIndex do
			local e = itemList[i]
			local stored = player:getCharVar(e.var)
			table.insert(opts, {
				string.format("%s - %d", e.name, stored),
				function(p)
					if stored <= 0 then
						p:printToPlayer("You do not have any of that stored.", 0, "Bentglasstube")
						return
					end

					local amt = math.min(gil, stored)
					local leftover = gil - amt

					local needed = math.ceil(amt / e.stack)
					if p:getFreeSlotsCount() < needed then
						p:printToPlayer("You do not have enough inventory space.", 0, "Bentglasstube")
						return
					end

					if npcUtil.giveItem(p, { { e.id, amt } }) then
						p:setCharVar(e.var, stored - amt)
						if leftover > 0 then
							p:addGil(leftover)
							p:printToPlayer(string.format("Returned %d gil.", leftover), 0, "Bentglasstube")
						end
						p:printToPlayer(string.format("Withdrew %d %s. Remaining: %d.", amt, e.name, p:getCharVar(e.var)), 0, "Bentglasstube")
						p:tradeComplete()
					end
				end
			})
		end

		if page > 1 then
			table.insert(opts, {
				"Previous Page",
				function(p) delaySendMenu(p, function() return pageMenu(page - 1) end) end
			})
		end
		if endIndex < #itemList then
			table.insert(opts, {
				"Next Page",
				function(p) delaySendMenu(p, function() return pageMenu(page + 1) end) end
			})
		end

		table.insert(opts, {
			"Cancel",
			function(p) end
		})

		return { title = string.format("Withdraw (%d gil)", gil), options = opts }
	end

	player:customMenu(pageMenu(1))
end

local allowedIds = {}
for _, e in ipairs(itemList) do
	table.insert(allowedIds, e.id)
end

zone:insertDynamicEntity({
	objtype    = xi.objType.NPC,
	name       = "Bentglasstube",
	look       = '010000085911EB20EB30EB40EB50006000700000',
	x          = -178,
	y          =  11,
	z          =  87,
	rotation   =  37,
	widescan = 1,

	onTrade = function(player, npc, trade)
		local gil   = trade:getGil()
		local hasIt = tradeHasAnyItem(trade)

				if gil > 0 and not hasIt then
			openWithdrawMenu(player, gil)
			return
		end

				if gil > 0 and hasIt then
			player:printToPlayer("Trade gil to withdraw, or trade items to store. Not both.", 0, "Bentglasstube")
			return
		end

		if hasIt then
			if not tradeHasOnlyAllowedItems(trade, allowedIds) then
				player:printToPlayer("Trade only: Riftborn, Pluton, Beitetsu, Heavy Metal Plate, Riftcinder, or Riftdross.", 0, "Bentglasstube")
				return
			end

			local storedSomething = false
			local giveBack = {}

			for _, e in ipairs(itemList) do
				local count = trade:getItemQty(e.id)
				if count > 0 then
					local cur   = player:getCharVar(e.var)
					local space = 65535 - cur

					if space <= 0 then
						table.insert(giveBack, { e.id, count })
						player:printToPlayer(string.format("%s storage is full (65,535).", e.name), 0, "Bentglasstube")
					else
						local toStore  = math.min(space, count)
						local overflow = count - toStore

						player:setCharVar(e.var, cur + toStore)
						player:printToPlayer(string.format("%s stored: %d (total %d)", e.name, toStore, cur + toStore), 0, "Bentglasstube")
						storedSomething = true

						if overflow > 0 then
							table.insert(giveBack, { e.id, overflow })
						end
					end
				end
			end

			if storedSomething or #giveBack > 0 then
				player:tradeComplete()
				for _, entry in ipairs(giveBack) do
					npcUtil.giveItem(player, { entry })
				end
			else
				player:printToPlayer("Trade me Rift mats or gil to withdraw.", 0, "Bentglasstube")
			end

			return
		end

		player:printToPlayer("Trade gil to withdraw, or trade items to store.", 0, "Bentglasstube")
	end,

	onTrigger = function(player, npc)
		delaySendMenu(player, function() return { title = "Rift Storage", options = showListPage(player, 1) } end)
	end,
})
end)

return m
