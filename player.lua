Player = Object:extend()

function Player:new()
	local layer = map:addCustomLayer("Sprites", 3)
	local spawn
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			spawn = object
			break
		end
	end
	self.x = spawn.x
	print(self.x)
	self.y = spawn.y

	self.spriteSheet = love.graphics.newImage("assets/sandmanSheet.png")
	self.width = self.spriteSheet:getWidth()
	self.height = self.spriteSheet:getHeight()
	self.frames = {}
	self.frame_width = 16
	self.frame_height = 16
	for i=0, 3 do
		table.insert(self.frames, love.graphics.newQuad(i * self.frame_width, 0,
			self.frame_width, self.frame_height, self.width, self.height))
	end
	self.currentFrame = 1
	self.sprite = self.frames[self.currentFrame]
end

function Player:update(dt)
	-- sprite sheet: down 1, up 2, left 3, right 4
	speed = 96 * dt
		if love.keyboard.isDown("w", "up") then
			self.y = self.y - speed
			self.currentFrame = 2
		elseif love.keyboard.isDown("s", "down") then
			self.y = self.y + speed
			self.currentFrame = 1
		end
		if love.keyboard.isDown("a", "left") then
			self.x = self.x - speed
			self.currentFrame = 4
		elseif love.keyboard.isDown("d", "right") then
			self.x = self.x + speed
			self.currentFrame = 3
		end
end

function Player:draw()
	local scale = 4
	love.graphics.draw(self.spriteSheet, self.frames[self.currentFrame],
			self.x,
			self.y,
			0,
			scale,
			scale
		)
end