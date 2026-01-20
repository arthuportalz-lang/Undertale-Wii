sprites = {}

local intro, player, input, dialogue, mainfont
local _INTRO = false

function love.load()
	intro = require 'src.intro'

	dialogue = require 'src.dialogue'
	
	sprites.bg_firstroom = love.graphics.newTexture("assets/maps/bg_firstroom.png")
	
	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	intro.load()
end

function love.update(dt)
	intro.update(dt)

	if intro.complete == true and _INTRO == false then
		collectgarbage("collect")
		_INTRO = true
	end
end

function love.draw()
	love.graphics.setFont(mainfont)

	if intro.complete == false then
		intro.draw()
	else
		love.graphics.draw(sprites.bg_firstroom, 0, 0, 0, 2, 2, 0, 0)
		love.graphics.draw(sprites[player.dir], player.x, player.y, 0, 2, 2, 0, 0)
	end

	dialogue.draw()
end