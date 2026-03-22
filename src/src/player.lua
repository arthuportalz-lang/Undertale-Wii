local player = {}
player.stop_input = false
player.x = -24
player.y = 184
player.offX = -24
player.offY = 184
player.dir = "down"
player.frame = 0

local speed, input, spr_player

local cameraOffsetX = 0
local cameraOffsetY = -184

local hFrame = 0
local vFrame = 0
local frame = 0
local time_acc = 0

function player.load()
	speed = 6
	input = require 'src.input'

	if _os == "wii" then
		--left
		images.playerl0 = love.graphics.newTexture("assets/images/player/playerl/playerl0.png")
		images.playerl1 = love.graphics.newTexture("assets/images/player/playerl/playerl1.png")
		--right
		images.playerr0 = love.graphics.newTexture("assets/images/player/playerr/playerr0.png")
		images.playerr1 = love.graphics.newTexture("assets/images/player/playerr/playerr1.png")
		--up
		images.playeru0 = love.graphics.newTexture("assets/images/player/playeru/playeru0.png")
		images.playeru1 = love.graphics.newTexture("assets/images/player/playeru/playeru1.png")
		images.playeru2 = love.graphics.newTexture("assets/images/player/playeru/playeru2.png")
		images.playeru3 = love.graphics.newTexture("assets/images/player/playeru/playeru3.png")
		-- down
		images.playerd0 = love.graphics.newTexture("assets/images/player/playerd/playerd0.png")
		images.playerd1 = love.graphics.newTexture("assets/images/player/playerd/playerd1.png")
		images.playerd2 = love.graphics.newTexture("assets/images/player/playerd/playerd2.png")
		images.playerd3 = love.graphics.newTexture("assets/images/player/playerd/playerd3.png")
		
		images.firstroom = love.graphics.newTexture("assets/maps/ruins/room_area1.png")
	else
		--left
		images.playerl0 = love.graphics.newImage("assets/images/player/playerl/playerl0.png")
		images.playerl1 = love.graphics.newImage("assets/images/player/playerl/playerl1.png")
		--right
		images.playerr0 = love.graphics.newImage("assets/images/player/playerr/playerr0.png")
		images.playerr1 = love.graphics.newImage("assets/images/player/playerr/playerr1.png")
		--up
		images.playeru0 = love.graphics.newImage("assets/images/player/playeru/playeru0.png")
		images.playeru1 = love.graphics.newImage("assets/images/player/playeru/playeru1.png")
		images.playeru2 = love.graphics.newImage("assets/images/player/playeru/playeru2.png")
		images.playeru3 = love.graphics.newImage("assets/images/player/playeru/playeru3.png")
		-- down
		images.playerd0 = love.graphics.newImage("assets/images/player/playerd/playerd0.png")
		images.playerd1 = love.graphics.newImage("assets/images/player/playerd/playerd1.png")
		images.playerd2 = love.graphics.newImage("assets/images/player/playerd/playerd2.png")
		images.playerd3 = love.graphics.newImage("assets/images/player/playerd/playerd3.png")

		images.firstroom = love.graphics.newImage("assets/maps/ruins/room_area1.png")
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

	if player.stop_input then
		speed = 0
	else
		speed = 4
	end
	
	if player.x > -4 and player.x < 720 then
		cameraOffsetX = player.x - player.x - player.x
		player.offX = 310
	else
		player.offX = player.x + 310
	end

	if player.x > 720 then
		player.offX = player.x - 412
	end
	
	cameraOffsetY = player.y - player.y - player.y

	time_acc = time_acc + dt

	if input.no_input == false then
		if time_acc > 0.2 then
			if player.dir == "left" or player.dir == "right" then
				hFrame = hFrame + 1
				if hFrame > 1 then
					hFrame = 0
				end

				frame = hFrame
			end

			if player.dir == "up" or player.dir == "down" then
				vFrame = vFrame + 1
				if vFrame > 3 then
					vFrame = 0
				end

				frame = vFrame
			end

			time_acc = 0
		end
	else
		hFrame = 0
		vFrame = 0
		frame = 0
	end
	
	spr_player = images["player" .. player.dir:sub(1, 1) .. frame]

	if spr_player == nil then
		spr_player = images["player" .. player.dir:sub(1, 1) .. 0]
	end
end

function player.draw()
	love.graphics.draw(images.firstroom, cameraOffsetX, -50, 0, 2, 2)
	
	love.graphics.draw(spr_player, player.offX, player.y, 0, 2, 2)
end

return player