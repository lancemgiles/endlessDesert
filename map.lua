Map = Object:extend()

function Map:new()
	sti = require 'lib/sti/sti'
	map = sti("assets/desert.lua")

	local layer = map:addCustomLayer("Sprites", 3)
	local playerLayer
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			playerLayer = object
			break
		end
	end

end