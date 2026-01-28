--______________________________________________________________________________________________________________________________
--______________________________________________________________________________________________________________________________
--
--░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--░  ░░░░  ░░   ░░░  ░░       ░░░        ░░       ░░░        ░░░      ░░░  ░░░░░░░░        ░░░░░░░  ░░░░  ░░        ░░        ░░
--▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒  ▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒
--▓  ▓▓▓▓  ▓▓  ▓  ▓  ▓▓  ▓▓▓▓  ▓▓      ▓▓▓▓       ▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓▓      ▓▓▓▓▓▓▓        ▓▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓
--█  ████  ██  ██    ██  ████  ██  ████████  ███  ██████  █████        ██  ████████  ██████████   ██   █████  ████████  ████████
--██      ███  ███   ██       ███        ██  ████  █████  █████  ████  ██        ██        ███  ████  ██        ██        ██████
--██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████                                                                                                                         
--______________________________________________________________________________________________________________________________
--______________________________________________________________________________________________________________________________

_os = "nx"

sprites = {}

_collectgarbage = false

-- I'll test LÖVE Potion on Switch while I can't use LÖVEPower (very limited at the moment but WiiLÖVE is unstable)
-- The cool part is that LÖVE Potion supports 3DS, Wii U and, well, the Switch

local state = "intro"

local intro, player, input, mainfont, dialogue

function love.load()
	if _os == "nx" then
		love.graphics.setDefaultFilter("nearest", "nearest")
	end

	input = require 'src.input'
	intro = require 'src.intro'
	dialogue = require 'src.dialogue'
	
	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	intro.load()
	dialogue.load()
end

function love.update(dt)
	input.update(dt)
	
	if not intro.complete then
		intro.update(dt)
	end

	if _collectgarbage then
		collectgarbage("collect")
		_collectgarbage = false
	end
end

function love.draw()
	love.graphics.setFont(mainfont)

	if not intro.complete then
		intro.draw()
	end
end