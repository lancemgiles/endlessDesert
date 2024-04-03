Player = Object:extend()

function Player:new()
	self.spriteSheet = love.graphics.newImage("assets/sandmanSheet")
	self.width = spriteSheet:getWidth()
	self.height = spriteSheet:getHeight()
	self.frames = {}
	self.frame_width = 16
	self.frame_height = 16
	for i=0, 3 do
		table.insert(self.frames, love.graphics.newQuad(i * self.frame_width, 0,
			self.frame_width, self.frame_height, self.width, self.height))
	end
	currentFrame = 1

end

-- sprite sheet: down 1, up 2, left 3, right 4

function Player:update(dt)
	if love.keyboard.isDown("") then
	end
end

