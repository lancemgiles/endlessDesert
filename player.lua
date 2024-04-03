Player = Object:extend()

function Player:new()
	self.sprite = love.graphics.newImage('assets/test.png')
	local layer = map:addCustomLayer("Sprites", 3)
	local spawn
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			spawn = object
			print(object.x)
			break
		end
	end
	self.x = spawn.x
	print(self.x)
	self.y = spawn.y
	-- self.ox = self.sprite:getWidth()/2
	-- self.oy = self.sprite:getHeight()/1.35
	-- self.spriteSheet = love.graphics.newImage("assets/sandmanSheet")
	-- self.width = spriteSheet:getWidth()
	-- self.height = spriteSheet:getHeight()
	-- self.frames = {}
	-- self.frame_width = 16
	-- self.frame_height = 16
	-- for i=0, 3 do
	-- 	table.insert(self.frames, love.graphics.newQuad(i * self.frame_width, 0,
	-- 		self.frame_width, self.frame_height, self.width, self.height))
	-- end
	-- currentFrame = 1
	
	


end

-- sprite sheet: down 1, up 2, left 3, right 4

function Player:update(dt)
	speed = 96 * dt
		if love.keyboard.isDown("w", "up") then
			self.y = self.y - speed
		end
		if love.keyboard.isDown("s", "down") then
			self.y = self.y + speed
		end
		if love.keyboard.isDown("a", "left") then
			self.x = self.x - speed
		end
		if love.keyboard.isDown("d", "right") then
			self.x = self.x + speed
		end
end

function Player:draw()
	love.graphics.draw(self.sprite,
			self.x,
			self.y
			-- 0,
			-- 1,
			-- 1,
			-- self.ox,
			-- self.oy
		)
end

