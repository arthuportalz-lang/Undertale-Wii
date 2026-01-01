intro = {}

local i = 0
local scale = 2

local mus_play = true
local music = love.audio.newSource("assets/sounds/music/mus_intro.flac", "stream")
local sfx = love.audio.newSource("assets/sounds/sfx/mus_intronoise.ogg", "stream")
local looped = false
local played = false

local input = require 'src.input'

intro.complete = true
intro.image = "intro" .. i

local introimg
local frame
local text = ""

function intro.load()
	if wii == true then
		sprites.splash = love.graphics.newTexture("assets/sprites/splash.png")
		sprites.intro0 = love.graphics.newTexture("assets/sprites/intro/intro0.png")
		sprites.intro1 = love.graphics.newTexture("assets/sprites/intro/intro1.png")
		sprites.intro2 = love.graphics.newTexture("assets/sprites/intro/intro2.png")
		sprites.intro3 = love.graphics.newTexture("assets/sprites/intro/intro3.png")
		sprites.intro4 = love.graphics.newTexture("assets/sprites/intro/intro4.png")
		sprites.intro5 = love.graphics.newTexture("assets/sprites/intro/intro5.png")
		sprites.intro6 = love.graphics.newTexture("assets/sprites/intro/intro6.png")
		sprites.intro7 = love.graphics.newTexture("assets/sprites/intro/intro7.png")
		sprites.intro8 = love.graphics.newTexture("assets/sprites/intro/intro8.png")
		sprites.intro9 = love.graphics.newTexture("assets/sprites/intro/intro9.png")
		sprites.intro10 = love.graphics.newTexture("assets/sprites/intro/intro10.png")
		sprites.introlast = love.graphics.newTexture("assets/sprites/intro/introlast.png")
		sprites.introframe = love.graphics.newTexture("assets/sprites/intro/introframe.png")
	else
		sprites.splash = love.graphics.newImage("assets/sprites/splash.png")
		sprites.intro0 = love.graphics.newImage("assets/sprites/intro/intro0.png")
		sprites.intro1 = love.graphics.newImage("assets/sprites/intro/intro1.png")
		sprites.intro2 = love.graphics.newImage("assets/sprites/intro/intro2.png")
		sprites.intro3 = love.graphics.newImage("assets/sprites/intro/intro3.png")
		sprites.intro4 = love.graphics.newImage("assets/sprites/intro/intro4.png")
		sprites.intro5 = love.graphics.newImage("assets/sprites/intro/intro5.png")
		sprites.intro6 = love.graphics.newImage("assets/sprites/intro/intro6.png")
		sprites.intro7 = love.graphics.newImage("assets/sprites/intro/intro7.png")
		sprites.intro8 = love.graphics.newImage("assets/sprites/intro/intro8.png")
		sprites.intro9 = love.graphics.newImage("assets/sprites/intro/intro9.png")
		sprites.intro10 = love.graphics.newImage("assets/sprites/intro/intro10.png")
		sprites.introlast = love.graphics.newImage("assets/sprites/intro/introlast.png")
		sprites.introframe = love.graphics.newImage("assets/sprites/intro/introframe.png")
	end

	
end

if mus_play == true then
	love.audio.play(music)
end

function intro.update(dt)
	if i < 11 then
		intro.image = "intro" .. i
	else 
		if i == 11 then
			intro.image = "introlast"
		elseif i > 11 then
			intro.image = "splash"
			scale = 1
		end
	end

	if intro.image == "splash" then
		love.audio.stop(music)
		if played == false then
			love.audio.play(sfx)
			played = true
		end
	end
	
    introimg = sprites[intro.image]

	if input.Z then
		intro.complete = true
	end

	if i == 0 then
		text = "L o n g  a g o,  t w o  r a c e s\nr u l e d  o v e r  E a r t h:\nH U M A N S  a n d  M O N S T E R S."
	elseif i == 1 then
		text = "O n e  d a y,  w a r  b r o k e \no u t  b e t w e e n  t h e  t w o\nr a c e s."
	elseif i == 2 then
		text = "A f t e r  a  l o n g  b a t t l e,\nt h e  h u m a n s  w e r e \nv i c t o r i o u s."
	elseif i == 3 then
		text = "T h e y  s e a l e d  t h e  m o n s t e r s\nu n d e r g r o u n d  w i t h  a  m a g i c \ns p e l l."
	elseif i == 4 then
		text = "M a n y  y e a r s  l a t e r. ."
	elseif i == 5 then
		text = "                     M T.  E B O T T\n                           2 0 1 X"
	elseif i == 6 then
		text = "L e g e n d s  s a y  t h a t  t h o s e\nw h o  c l i m b  t h e  m o u n t a i n\nn e v e r  r e t u r n."
	elseif i == 7 then
		text = ""
	end
end

Timer.every(6, function()
	i = i + 1
end)

function intro.draw()
	love.graphics.draw(introimg, 0, 0, 0, scale, scale, 0, 0)
	--love.graphics.draw(frame, 0, 0, 0, scale, scale, 0, 0)
	love.graphics.print(text, 120, 320, 0, 2, 2.3)
end

return intro