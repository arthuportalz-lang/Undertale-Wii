local player = {}
player.stop_input = false
player.x = 320
player.y = 240
player.dir = "right"
local speed, input, spr_player

function player.load()
	speed = 6
	input = require 'src.input'

	sprites.left = love.graphics.newTexture("assets/sprites/player/playerl/playerl0.jpg")
	sprites.right = love.graphics.newTexture("assets/sprites/player/playerr/playerr0.jpg")
	sprites.up = love.graphics.newTexture("assets/sprites/player/playeru/playeru0.jpg")
	sprites.down = love.graphics.newTexture("assets/sprites/player/playerd/playerd0.jpg")
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

	if player.stop_input then
		speed = 0
	else
		speed = 4
	end

	spr_player = sprites[player.dir]
end

return player