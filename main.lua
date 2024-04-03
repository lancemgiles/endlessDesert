function love.load()
	Object = require "lib/classic"
	windowSize = love.window.setMode(800, 800)
	sti = require 'lib/sti/sti'
	map = sti("assets/desert.lua")
	require "player"
	player = Player()
end

function love.update(dt)
	map:update(dt)
	player:update(dt)
end

function love.draw()
	local scale = 8
	local screen_width = love.graphics.getWidth() / scale
	local screen_height = love.graphics.getHeight() / scale
	map:draw(0, 0, scale)
	player:draw()
end