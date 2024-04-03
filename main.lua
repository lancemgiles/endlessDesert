local sti = require 'sti/sti'

function love.load()
	windowSize = love.window.setMode(800, 800)
	map = sti("assets/desert.lua")
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	map:draw()
end