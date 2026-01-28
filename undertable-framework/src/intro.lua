intro = {}

local dialogue = require 'src.dialogue'
local input = require 'src.input'

dialogue.dialogues = {
	"L o n g   a g o,   t w o   r a c e s\nr u l e d   o v e r   E a r t h:\nH U M A N S   a n d   M O N S T E R S.",
	"O n e   d a y,   w a r   b r o k e\no u t   b e t w e e n   t h e   t w o\nr a c e s.",
	"A f t e r   a   l o n g   b a t t l e,\nt h e   h u m a n s   w e r e\nv i c t o r i o u s.",
	"T h e y   s e a l e d   t h e   m o n s t e r s\nu n d e r g r o u n d   w i t h   a   m a g i c\ns p e l l.",
	"M a n y   y e a r s   l a t e r. .",
	"                      M T.  E B O T T\n                           2 0 1 X",
	"L e g e n d s   s a y   t h a t   t h o s e\nw h o   c l i m b   t h e   m o u n t a i n\nn e v e r   r e t u r n.",
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

	if _os == "wii" then
		sprites.splash = love.graphics.newTexture("assets/sprites/splash.png")
		sprites.intro1 = love.graphics.newTexture("assets/sprites/intro/intro1.jpg")
		sprites.intro2 = love.graphics.newTexture("assets/sprites/intro/intro2.jpg")
		sprites.intro3 = love.graphics.newTexture("assets/sprites/intro/intro3.jpg")
		sprites.intro4 = love.graphics.newTexture("assets/sprites/intro/intro4.jpg")
		sprites.intro6 = love.graphics.newTexture("assets/sprites/intro/intro6.jpg")
		sprites.intro7 = love.graphics.newTexture("assets/sprites/intro/intro7.jpg")
		sprites.intro8 = love.graphics.newTexture("assets/sprites/intro/intro8.jpg")
		sprites.intro9 = love.graphics.newTexture("assets/sprites/intro/intro9.jpg")
		sprites.intro10 = love.graphics.newTexture("assets/sprites/intro/intro10.jpg")
	elseif _os == "nx" then
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
	end

	love.audio.play(music)
end


function intro.update(dt)
	if input.Z then
		i = 15
		dialogue.enable = false
	end

	dialogue.update()

	dialogue.i = i

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
		love.graphics.print(dialogue.textFinal, 120, 320, 0, 2, 2.3)
	end
end

return intro