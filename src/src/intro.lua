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
local fade = -1
local _alpha = 1
local alpha = 1

local time_acc = 0

local x = 120
local y = 56
local y_max = 56
local okplzstop = false

intro.image = "intro" .. i

local introimg

function intro.load()
	images.intro1 = love.graphics.newTexture("assets/images/intro/intro1.jpg")
	images.intro2 = love.graphics.newTexture("assets/images/intro/intro2.jpg")
	images.intro3 = love.graphics.newTexture("assets/images/intro/intro3.jpg")
	images.intro4 = love.graphics.newTexture("assets/images/intro/intro4.jpg")
	images.intro6 = love.graphics.newTexture("assets/images/intro/intro6.jpg")
	images.intro7 = love.graphics.newTexture("assets/images/intro/intro7.jpg")
	images.intro8 = love.graphics.newTexture("assets/images/intro/intro8.jpg")
	images.intro9 = love.graphics.newTexture("assets/images/intro/intro9.jpg")
	images.intro10 = love.graphics.newTexture("assets/images/intro/intro10.jpg")
	images.introlast = love.graphics.newTexture("assets/images/intro/introlast.jpg")
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

	if state ~= "intro" then
		images.intro1 = nil
		images.intro2 = nil
		images.intro3 = nil
		images.intro4 = nil
		images.intro6 = nil
		images.intro7 = nil
		images.intro8 = nil
		images.intro9 = nil
		images.intro10 = nil
		images.introlast = nil

		_collectgarbage = true
	end

	if fade == 0 then
		if _alpha > 0 then
			_alpha = _alpha - 0.1 
		else
			fade = 1
			i = i + 1
		end
	elseif fade == 1 then
		if _alpha < 1 then
			_alpha = _alpha + 0.1
		else
			fade = -1
    	end
	end

	if i >= 11 and i <= 13 then
		alpha = 1
	else 
		alpha = _alpha
	end

	if i ~= 5 then
		if i < 11 then
			intro.image = "intro" .. i
		elseif i > 10 then
			intro.image = "introlast"
			if not okplzstop then
				y = -424
				okplzstop = true
			end
		end
	else
		intro.image = "onepixel"
	end

	if i > 14 then
		state = "menu"
	end

	introimg = images[intro.image]

	if i == 12 or i == 13 then
		if y < y_max then
			y = y + 2
		end
	end
end

function intro.draw()
	if i < 15 then
		love.graphics.setColor(1, 1, 1, alpha)
		
		love.graphics.draw(introimg, x, y, 0, 2, 2, 0, 0)

		love.graphics.setColor(0, 0, 0, 1)

		love.graphics.rectangle(rectangleMode, 0, 0, 120, 480)
		love.graphics.rectangle(rectangleMode, 520, 0, 120, 480)
		love.graphics.rectangle(rectangleMode, 0, 0, 640, 56)
		love.graphics.rectangle(rectangleMode, 0, 276, 640, 240)
	end

	love.graphics.setColor(1, 1, 1, 1)

	love.graphics.print(dialogue.textFinal, 120, 320, 0, 1, 1, 0, 0)
end

return intro