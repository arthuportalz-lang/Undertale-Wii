sprites = {}

local mainfont

wii = true

local mus_play = false
local music = love.audio.newSource("assets/sounds/music/mus_intro.flac", "stream")
local looped = false

Timer = require 'libs.timer'

local intro = require 'src.intro'
local player = require 'src.player'
local dialogue = require 'src.dialogue'
local input = require 'src.input'

function love.load()
	if wii == false then
		love.mouse.setVisible(false)
		love.window.setIcon(love.image.newImageData("icon.png"))
		love.window.setTitle("UNDERTABLE Framework for Love2D")
		love.graphics.setDefaultFilter("nearest", "nearest")
		sprites.bg_firstroom = love.graphics.newImage("assets/maps/bg_firstroom.png")
	else 
		sprites.bg_firstroom = love.graphics.newTexture("assets/maps/bg_firstroom.png")
	end
	
	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	player.load()
	intro.load()
end

function love.update(dt)
	intro.update(dt)
	player.update(dt)
	dialogue.update(dt)
	input.update(dt)
	Timer.update(dt)

	player.stop_input = not intro.complete

	if not music:isPlaying() and mus_play == true then
		love.audio.play(music)
	end
end

function love.draw()
	love.graphics.setFont(mainfont)
	love.graphics.draw(sprites.bg_firstroom, 0, 0, 0, 2, 2, 0, 0)
	
	player.draw()
	intro.draw()
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end