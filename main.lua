local sti = require 'sti/sti'

function love.load()
	map = sti("assets/desert.lua")
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	map:draw()
end