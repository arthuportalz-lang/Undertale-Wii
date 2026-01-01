local player = {}
player.stop_input = false
player.x = 320
player.y = 240
player.dir = "left"
local speed = 4
local gamera = 'libs.gamera'
local input = require 'src.input'
local spr_player

function player.load()
	if wii == true then
		sprites.left = love.graphics.newTexture("assets/sprites/player/playerl/playerl0.png")
		sprites.right = love.graphics.newTexture("assets/sprites/player/playerr/playerr0.png")
		sprites.up = love.graphics.newTexture("assets/sprites/player/playeru/playeru0.png")
		sprites.down = love.graphics.newTexture("assets/sprites/player/playerd/playerd0.png")
	else
		sprites.left = love.graphics.newImage("assets/sprites/player/playerl/playerl0.png")
		sprites.right = love.graphics.newImage("assets/sprites/player/playerr/playerr0.png")
		sprites.up = love.graphics.newImage("assets/sprites/player/playeru/playeru0.png")
		sprites.down = love.graphics.newImage("assets/sprites/player/playerd/playerd0.png")
	end
end

function player.update(dt)
    if input.left then
		player.x = player.x - speed
		player.dir = "left"
	end

	if input.right then
		player.x = player.x + speed
		player.dir = "right"
	end

	if input.up then
		player.y = player.y - speed
		player.dir = "up"
	end

	if input.down then
		player.y = player.y + speed
		player.dir = "down"
    end

	if player.stop_input == true then
		speed = 0
		player.dir = "left"
	else
		speed = 4
	end

	spr_player = sprites[player.dir]
end

function player.draw()
	love.graphics.draw(spr_player, player.x, player.y, 0, 2, 2, 0, 0)
end

return player