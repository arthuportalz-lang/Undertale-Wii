menu = {}

local offsetX = 0
local offsetY = 40

local _yellow = 0
local _yellow1 = 1

local ui_placeX = 0
local ui_placeX_max = 1
local ui_placeY = 0
local ui_placeY_max = 1

local menu_state = "splash"

local input = require 'src.input'
local inputCooldown = 1
local inputCooldownMax = 1

local letterCoordinatesX = {
    140,
    200,
    260,
    320,
    380,
    440,
    500
}

local lineCoordinatesY = {
    50,
    80,
    110,
    140
}

function menu.load()
    if _os == "wii" then
		images.splash = love.graphics.newTexture("assets/images/splash.png")
	else
		images.splash = love.graphics.newImage("assets/images/splash.png")
	end
end

function menu.update(dt)
    if inputCooldown > 0 then
        _yellow  = ui_placeY
        _yellow1 = 1 - ui_placeY

        if input.up then
            if ui_placeY > 0 then
                ui_placeY = ui_placeY - 1
            end
        end

        if input.down then
            if ui_placeY < ui_placeY_max then
                ui_placeY = ui_placeY + 1
            end
        end

        if input.Z then
            if menu_state == "splash" then
                menu_state = "main"
            elseif menu_state == "main" then
                if ui_placeY == 0 then
                    menu_state = "name"
                elseif ui_placeY == 1 then
                    menu_state = "settings"
                end
            end 

            inputCooldown = 0
        end
    end
end

function menu.draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle(rectangleMode, 640, 480, 0, 0)

    if menu_state == "splash" then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(images.splash, 0, 0, 0, 1, 1, 0, 0)
        love.graphics.setColor(191, 191, 191, 255)
        love.graphics.print("[Press 1 or b (Classic)]", 210, 380, 0, 0.75, 0.75, 0, 0)
    elseif menu_state == "main" then
        love.graphics.setColor(0.75, 0.75, 0.75, 1)
        love.graphics.print("--- Intruction ---", 140+offsetX, 0+offsetY)
        love.graphics.print("[1 or b (Classic)] - Confirm", 140+offsetX, 50+offsetY)
        love.graphics.print("[2 or a (Classic)] - Cancel", 140+offsetX, 85+offsetY)
        love.graphics.print("[A or x (Classic)] - Menu (In-game)", 140+offsetX, 120+offsetY)
        love.graphics.print("[HOME] - Quit", 140+offsetX, 190+offsetY)
        love.graphics.print("When HP is 0, you lose.", 140+offsetX, 225+offsetY)
        love.graphics.setColor(1, 1, _yellow, 1)
        love.graphics.print("Begin Game", 140+offsetX, 300+offsetY)
        love.graphics.setColor(1, 1, _yellow1, 1)
        love.graphics.print("Settings", 140+offsetX, 340+offsetY)
    elseif menu_state == "name" then
        offsetX = 0
        offsetY = 90
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print("Name the fallen human.", 180, 50)
        love.graphics.print("A", letterCoordinatesX[1]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("B", letterCoordinatesX[2]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("C", letterCoordinatesX[3]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("D", letterCoordinatesX[4]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("E", letterCoordinatesX[5]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("F", letterCoordinatesX[6]+offsetX, lineCoordinatesY[1]+offsetY)
        love.graphics.print("G", letterCoordinatesX[7]+offsetX, lineCoordinatesY[1]+offsetY)

        love.graphics.print("H", letterCoordinatesX[1]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("I", letterCoordinatesX[2]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("J", letterCoordinatesX[3]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("K", letterCoordinatesX[4]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("L", letterCoordinatesX[5]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("M", letterCoordinatesX[6]+offsetX, lineCoordinatesY[2]+offsetY)
        love.graphics.print("N", letterCoordinatesX[7]+offsetX, lineCoordinatesY[2]+offsetY)

        love.graphics.print("O", letterCoordinatesX[1]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("P", letterCoordinatesX[2]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("Q", letterCoordinatesX[3]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("R", letterCoordinatesX[4]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("S", letterCoordinatesX[5]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("T", letterCoordinatesX[6]+offsetX, lineCoordinatesY[3]+offsetY)
        love.graphics.print("U", letterCoordinatesX[7]+offsetX, lineCoordinatesY[3]+offsetY)

        love.graphics.print("V", letterCoordinatesX[1]+offsetX, lineCoordinatesY[4]+offsetY)
        love.graphics.print("W", letterCoordinatesX[2]+offsetX, lineCoordinatesY[4]+offsetY)
        love.graphics.print("X", letterCoordinatesX[3]+offsetX, lineCoordinatesY[4]+offsetY)
        love.graphics.print("Y", letterCoordinatesX[4]+offsetX, lineCoordinatesY[4]+offsetY)
        love.graphics.print("Z", letterCoordinatesX[5]+offsetX, lineCoordinatesY[4]+offsetY)

        love.graphics.print("a", 140+offsetX, 50+offsetY)
        love.graphics.print("b", 140+offsetX, 50+offsetY)
        love.graphics.print("c", 140+offsetX, 50+offsetY)
        love.graphics.print("d", 140+offsetX, 50+offsetY)
        love.graphics.print("e", 140+offsetX, 50+offsetY)
        love.graphics.print("fF", 140+offsetX, 50+offsetY)
        love.graphics.print("g", 140+offsetX, 50+offsetY)
        love.graphics.print("h", 140+offsetX, 50+offsetY)
        love.graphics.print("i", 140+offsetX, 50+offsetY)
        love.graphics.print("j", 140+offsetX, 50+offsetY)
        love.graphics.print("k", 140+offsetX, 50+offsetY)
        love.graphics.print("l", 140+offsetX, 50+offsetY)
        love.graphics.print("m", 140+offsetX, 50+offsetY)
        love.graphics.print("n", 140+offsetX, 50+offsetY)
        love.graphics.print("o", 140+offsetX, 50+offsetY)
        love.graphics.print("p", 140+offsetX, 50+offsetY)
        love.graphics.print("q", 140+offsetX, 50+offsetY)
        love.graphics.print("r", 140+offsetX, 50+offsetY)
        love.graphics.print("s", 140+offsetX, 50+offsetY)
        love.graphics.print("t", 140+offsetX, 50+offsetY)
        love.graphics.print("u", 140+offsetX, 50+offsetY)
        love.graphics.print("v", 140+offsetX, 50+offsetY)
        love.graphics.print("w", 140+offsetX, 50+offsetY)
        love.graphics.print("x", 140+offsetX, 50+offsetY)
        love.graphics.print("y", 140+offsetX, 50+offsetY)
        love.graphics.print("z", 140+offsetX, 50+offsetY)
        
    end
    
    love.graphics.setColor(255, 255, 255, 255)
    if _os ~= "wii" then
        love.graphics.print(ui_placeY, 0, 0, 0, 1, 1, 0, 0)
        love.graphics.print(menu_state, 0, 20, 0, 1, 1, 0, 0)
    end
end

return menu