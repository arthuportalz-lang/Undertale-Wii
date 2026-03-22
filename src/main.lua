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

_os = "wii"

state = "intro"

images = {}

_collectgarbage = false

if _os == "wii" then
    rectangleMode = true
else
    rectangleMode = "fill"
end

local intro, player, mainfont, dialogue, input, menu

function love.load()
	if _os == "pc" then
		love.graphics.setDefaultFilter("nearest", "nearest")
	end

	--intro = require 'src.intro'
	dialogue = require 'src.dialogue'
	player = require 'src.player'
	input = require 'src.input'
	menu = require 'src.menu'
	
	mainfont = love.graphics.newFont("assets/fonts/8bitoperator_jve.ttf", 32)

	--intro.load()
	player.load()
end

function love.update(dt)
	if _os == "pc" then
		love.timer.sleep(0.064 - dt)
	end

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
	else
		player.draw()
	end

	input.draw()
end

-- Sorry for my janky code, I'm coding while learning