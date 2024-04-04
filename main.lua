function love.load()
	Object = require "lib/classic"
	mapWidth = 800
	sti = require 'lib/sti/sti'
	map = sti("assets/desert.lua")
	require "player"
	player = Player()
	music = love.audio.newSource('assets/the-long-life-that-we-desire-the-short-life-that-we-will-settle-for.ogg',
		'stream')
	music:setLooping(true)
	music:play()
	love.graphics.setNewFont(36)
	title = "Endless Desert"
	timer = 0
	isTitleScreen = true
end

function love.update(dt)
	titleTimer(dt)
	map:update(dt)
	player:update(dt)
end

function love.draw()
	

	local scale = 8
	local screen_width = love.graphics.getWidth() / scale
	local screen_height = love.graphics.getHeight() / scale

	local camera = map.layers["Sprites"].player
	local cx = math.floor(player.x - screen_width / 2)
	local cy = math.floor(player.y - screen_height / 2)
	map:draw(-cx, -cy, scale)
	player:draw()
	mapLoop()
	displayTitle()
end

function displayTitle()
	if isTitleScreen then
		love.graphics.print(title, 400, 400)
		print(title)
	end
end

function titleTimer(dt)
	timer = timer + 1 * dt
	if timer >= 3 then
		isTitleScreen = false
	end
end

function mapLoop()
	if player.x < 100 then
		player.x = mapWidth - 100
	elseif player.x > mapWidth - 100 then
		player.x = 100
	end
	if player.y > mapWidth -100 then
		player.y = 100
	elseif player.y < 100 then
		player.y = mapWidth - 100
	end
end