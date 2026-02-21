intro = {}

local dialogue = require 'src.dialogue'
local input = require 'src.input'
local language = require 'src.language'

dialogue.dialogues = {
	language.introDialogues[1],
	language.introDialogues[2],
	language.introDialogues[3],
	language.introDialogues[4],
	language.introDialogues[5],
	language.introDialogues[6],
	language.introDialogues[7]
}

dialogue.auto = true
dialogue.controlFinish = true

local i = 1
local scale = 2
local locall = false
local alpha = 1
local fade = -1
local alpha = 1

local time_acc = 0

local x = 120
local y = 56
local y_max = 112
local okplzstop = false

local music
local sfx

intro.played = false
intro.complete = false
intro.image = "intro" .. i

local introimg

function intro.load()
	music = love.audio.newSource("assets/sounds/music/mus_intro.ogg", "stream")
	sfx = love.audio.newSource("assets/sounds/sfx/mus_intronoise.ogg", "static")

	sprites.splash = love.graphics.newImage("assets/sprites/splash.png")
	sprites.intro1 = love.graphics.newImage("assets/sprites/intro/intro1.jpg")
	sprites.intro2 = love.graphics.newImage("assets/sprites/intro/intro2.jpg")
	sprites.intro3 = love.graphics.newImage("assets/sprites/intro/intro3.jpg")
	sprites.intro4 = love.graphics.newImage("assets/sprites/intro/intro4.jpg")
	sprites.intro6 = love.graphics.newImage("assets/sprites/intro/intro6.jpg")
	sprites.intro7 = love.graphics.newImage("assets/sprites/intro/intro7.jpg")
	sprites.intro8 = love.graphics.newImage("assets/sprites/intro/intro8.jpg")
	sprites.intro9 = love.graphics.newImage("assets/sprites/intro/intro9.jpg")
	sprites.intro10 = love.graphics.newImage("assets/sprites/intro/intro10.jpg")

	love.audio.play(music)
end

function intro.update(dt)
	dialogue.update(dt)

	time_acc = time_acc + dt

	if time_acc > 6 then
		time_acc = 0
		fade = 0

		dialogue.finished = true
		if i > 7 then
			dialogue.enable = false
    end    
	end

	if intro.complete then
		sprites.intro1 = nil
		sprites.intro2 = nil
		sprites.intro3 = nil
		sprites.intro4 = nil
		sprites.intro6 = nil
		sprites.intro7 = nil
		sprites.intro8 = nil
		sprites.intro9 = nil
		sprites.intro10 = nil
		sprites.introlast = nil
		sprites.splash = nil

		_collectgarbage = true
	end

	if fade == 0 then
		if alpha > 0 then
			alpha = alpha - 0.1
		else
			fade = 1
			i = i + 1
		end
	elseif fade == 1 then
		if alpha < 1 then
			alpha = alpha + 0.1
		else
			fade = -1
    end
	end

	if i ~= 5 and i ~= 11 then
		if i < 12 then
			intro.image = "intro" .. i
		elseif i == 12 then
			intro.image = "introlast"
			if not okplzstop then
				y = -424
				okplzstop = true
			end
		elseif i > 14 then
			intro.image = "splash"
			scale = 1
			love.audio.stop(music)
			x = 0
			y = 0
			if not intro.played then
				love.audio.play(sfx)
				intro.played = true
			end
    end
	end

  introimg = sprites[intro.image]

	if i == 13 or i == 14 then
		if y < y_max then
			y = y + 2
		end
	end
end

function intro.draw()
	if i < 15 then
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.rectangle("fill", 0, 0, 120, 480)
		love.graphics.rectangle("fill", 520, 0, 120, 480)
		love.graphics.rectangle("fill", 0, 0, 640, 56)
		love.graphics.rectangle("fill", 0, 276, 640, 240)
	end

	love.graphics.setColor(255, 255, 255, 1)

	if i < 16 then
		love.graphics.setColor(255, 255, 255, alpha)
		
		if i ~= 5 or i ~= 11 then
			love.graphics.draw(introimg, x, y, 0, scale, scale, 0, 0)
		end
		
		love.graphics.setColor(255, 255, 255, 1)
		love.graphics.print(dialogue.textFinal, 120, 320, 0, 1.2, 1.2)
	end
end

return intro