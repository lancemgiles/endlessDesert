local sti = require 'lib/sti/sti'

function love.load()
	Object = require "lib/classic"
	windowSize = love.window.setMode(800, 800)

	require "player"
	player = Player()
	map = sti("assets/desert.lua")
	local layer = map:addCustomLayer("Sprites", 3)
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	map:draw()
end