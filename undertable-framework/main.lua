local spr_player
local x = 320
local y = 240
local speed = 6
local dir = "left"
local sprites = {}
local mainfont
local fullscr = false
local tick = require("tick")
local gamera = require("gamera")
local cam = gamera.new(0,0,2000,2000)

function love.load()
	cam:setWindow(0,0,640,480)
	love.window.setTitle("UNDERTABLE Framework for Love2D")
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.sound.newSoundData("assets/sounds/music/mus_lancer.wav")

	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	sprites.left = love.graphics.newImage("assets/sprites/player/playerl/playerl0.png")
	sprites.right = love.graphics.newImage("assets/sprites/player/playerr/playerr0.png")
	sprites.up = love.graphics.newImage("assets/sprites/player/playeru/playeru0.png")
	sprites.down = love.graphics.newImage("assets/sprites/player/playerd/playerd0.png")
end

function love.update(dt)
	cam:setPosition(x, y)
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