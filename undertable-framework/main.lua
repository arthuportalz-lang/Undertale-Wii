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

if newImage == nil then
	newImage = newTexture
end

_os = "nx"

sprites = {}

_collectgarbage = false

-- I'll test LÖVE Potion on Switch while I can't use LÖVEPower (very limited at the moment but WiiLÖVE is unstable)
-- The cool part is that LÖVE Potion supports 3DS, Wii U and, well, the Switch

local intro, player, mainfont, dialogue

intro = require 'src.intro'
dialogue = require 'src.dialogue'

function love.load()
	if _os == "nx" then
		love.graphics.setDefaultFilter("nearest", "nearest")
	end

	intro = require 'src.intro'
	dialogue = require 'src.dialogue'
	
	-- I guess I'll start to do these comments in the code, so...
	-- I changed the fonts from TrueType Fonts to PNG fonts (I saw online that it may be a big deal for the Wii's performance)
	mainfont = love.graphics.newImageFont("assets/fonts/mainfont_en.png", " gyjqpw%#m&Mw$Q*\\/xIohNc4xBG36Ant7Cefv51JTK0RHaO9PUl28izsb@?DVYFESLudrkZ+>}{<_~=-])[(!^'';,:.|'", 6)

	intro.load()
	dialogue.load()
end

function love.update(dt)
	if _os == "nx" then
		love.timer.sleep(0.064 - dt)
	end
	
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