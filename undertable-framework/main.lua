local spr_player
local x = 320
local y = 240
local speed = 3
local dir = "left"
local sprites = {}
local mainfont
local fullscr = false

function love.load()
	love.window.setTitle("UNDERTABLE Framework for Love2D")
	love.graphics.setDefaultFilter("nearest", "nearest")

	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	sprites.left = love.graphics.newImage("assets/sprites/player/playerl/playerl0.png")
	sprites.right = love.graphics.newImage("assets/sprites/player/playerr/playerr0.png")
	sprites.up = love.graphics.newImage("assets/sprites/player/playeru/playeru0.png")
	sprites.down = love.graphics.newImage("assets/sprites/player/playerd/playerd0.png")
end

function love.update(dt)
	if love.keyboard.isDown("left") then
		x = x - speed
		dir = "left"
	end

	if love.keyboard.isDown("right") then
		x = x + speed
		dir = "right"
	end

	if love.keyboard.isDown("up") then
		y = y - speed
		dir = "up"
	end

	if love.keyboard.isDown("down") then
		y = y + speed
		dir = "down"
	end

	spr_player = sprites[dir]
end

function love.draw()
	love.graphics.setFont(mainfont)
	love.graphics.print("hello undertale", 0, 0)
	love.graphics.print(dir, 0, 10)
	love.graphics.draw(spr_player, x, y, 0, 2, 2, 0, 0)
end