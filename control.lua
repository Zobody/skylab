

script.on_event(defines.events.on_rocket_launched, function(event)
	if (global.spacejunk == nil) then
		global.spacejunk = {}
	end

	local rocket_inv = event.rocket.get_inventory(defines.inventory.rocket).get_contents()

	for item, count in pairs(rocket_inv) do
		if (global.spacejunk[item] ~= nil) then
			global.spacejunk[item] = count + global.spacejunk[item]
		else
			global.spacejunk[item] = count
		end
	end

	debug(global.spacejunk)
end
)

function debug(message)
	if settings.global["sky-lab-debug-setting"] then -- todo: fix this, as it currently seemingly ignores the settings
		for k, v in pairs(game.players) do
			game.players[k].print(tostring(message))
		end
		if type(message) == "table" then
			for k, v in pairs(message) do
				debug(tostring(k) .. " : " .. tostring(v))
			end
		end
	end
end