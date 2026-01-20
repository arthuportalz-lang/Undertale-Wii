sprites = {}

wii = false

local intro, player, input, mainfont

function love.load()
	intro = require 'src.intro'

	if wii == false then
		love.mouse.setVisible(false)
		love.window.setIcon(love.image.newImageData("icon.png"))
		love.window.setTitle("UNDERTALE for Love2D")
		love.graphics.setDefaultFilter("nearest", "nearest")
		sprites.bg_firstroom = love.graphics.newImage("assets/maps/bg_firstroom.png")
	else 
		sprites.bg_firstroom = love.graphics.newTexture("assets/maps/bg_firstroom.png")
	end
	
	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	intro.load()
end

function love.update(dt)
	if wii == false then
		love.timer.sleep(0.064 - dt)
	end

	intro.update(dt)
end

function love.draw()
	love.graphics.setFont(mainfont)
	
	if intro.complete == false then
		intro.draw()
	else
		love.graphics.draw(sprites.bg_firstroom, 0, 0, 0, 2, 2, 0, 0)
		love.graphics.draw(sprites[player.dir], player.x, player.y, 0, 2, 2, 0, 0)
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end