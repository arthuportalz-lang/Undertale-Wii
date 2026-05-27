--_________________________________________________________________________________________________________________________________
--_________________________________________________________________________________________________________________________________
--
--░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--░  ░░░░  ░░   ░░░  ░░       ░░░        ░░       ░░░        ░░░      ░░░  ░░░░░░░░        ░░░░░░░░░░  ░░░░  ░░        ░░        ░░
--▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒  ▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒
--▓  ▓▓▓▓  ▓▓  ▓  ▓  ▓▓  ▓▓▓▓  ▓▓      ▓▓▓▓       ▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓▓      ▓▓▓▓▓▓▓▓▓▓        ▓▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓
--█  ████  ██  ██    ██  ████  ██  ████████  ███  ██████  █████        ██  ████████  █████████████   ██   █████  ████████  ████████
--██      ███  ███   ██       ███        ██  ████  █████  █████  ████  ██        ██        ██████  ████  ██        ██        ██████
--█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████                                                                                                                         
--_________________________________________________________________________________________________________________________________
--_________________________________________________________________________________________________________________________________

-- Still Alive..!

debug = true

state = "intro"

images = {}

newGraphics = nil

_collectgarbage = false

if debug == false then
    rectangleMode = true
else
    rectangleMode = "fill"
end

if debug == false then
    love.graphics.newGraphics = love.graphics.newTexture 
else
    love.graphics.newGraphics = love.graphics.newImage 
end

local intro, player, mainfont, dialogue, input, menu, secret

function love.load()
	if debug then
		love.graphics.setDefaultFilter("nearest", "nearest", 1)
	end

	intro = require 'src.intro'
	dialogue = require 'src.dialogue'
	player = require 'src.player'
	input = require 'src.input'
	menu = require 'src.menu'
	secret = require 'src.secret'
	
	mainfont = love.graphics.newFont("assets/fonts/8bitoperator_jve.ttf", 32)

	intro.load()
	player.load()
	secret.load()
end

function love.update(dt)
	-- little experiment with garbage collection
	if _collectgarbage then
		collectgarbage("collect")
		_collectgarbage = false
	end

	if state == "intro" then
		intro.update(dt)
	elseif state == "menu" then
		menu.update(dt)
	else
		player.update(dt)
	end

	input.update(dt)
end

function love.draw()
	love.graphics.setFont(mainfont)

	if state == "intro" then
		intro.draw()
	elseif state == "menu" then
		menu.draw()
	elseif state == "secret" then
		secret.draw()
	else
		player.draw()
	end

	--input.draw()
end

-- Sorry for my janky code, I'm coding while learning