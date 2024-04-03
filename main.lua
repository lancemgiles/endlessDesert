local sti = require 'lib/sti/sti'

function love.load()
	Object = require "lib/classic"
	windowSize = love.window.setMode(800, 800)

	-- require "player"
	-- player = Player()
	map = sti("assets/desert.lua")
	local layer = map:addCustomLayer("Sprites", 3)
	local player
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			player = object
			break
		end
	end

	local sprite = love.graphics.newImage('assets/test.png')
	layer.player = {
		sprite = sprite,
		x = player.x,
		y = player.y,
		ox = sprite:getWidth()/2,
		oy = sprite:getHeight()/1.35
	}

	layer.update = function(self, dt)
		local speed = 96 * dt
		if love.keyboard.isDown("w", "up") then
			self.player.y = self.player.y - speed
		end
		if love.keyboard.isDown("s", "down") then
			self.player.y = self.player.y + speed
		end
		if love.keyboard.isDown("a", "left") then
			self.player.x = self.player.x - speed
		end
		if love.keyboard.isDown("d", "right") then
			self.player.x = self.player.x + speed
		end
	end

	layer.draw = function(self)
		love.graphics.draw(
			self.player.sprite,
			math.floor(self.player.x),
			math.floor(self.player.y),
			0,
			1,
			1,
			self.player.ox,
			self.player.oy
		)
		love.graphics.setPointSize(5)
		love.graphics.points(math.floor(self.player.x), math.floor(player.y))
	end
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	local scale = 2
	local screen_width = love.graphics.getWidth() / scale
	local screen_height = love.graphics.getHeight() / scale
	map:draw(scale)
end