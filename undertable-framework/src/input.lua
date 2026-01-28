local input = {}

local wiimote, pressed

input.left = false
input.right = false
input.up = false
input.down = false
input.Z = false
input.X = false
input.C = false

input.joysticks = love.joystick.getJoysticks()
input.joystick = input.joysticks[1]

function input.update(dt)
	if _os == "wii" then
		wiimote = love.wiimote.getWiimote(1)
		input.left = wiimote:isDown("left")
		input.right = wiimote:isDown("right")
		input.up = wiimote:isDown("up")
		input.down = wiimote:isDown("down")

		if not pressed and wiimote:isDown("1") then
			input.Z = true
		elseif not wiimote:isDown("1") then
			input.Z = false
		end

		if not pressed and wiimote:isDown("2") then
			input.X = true
		elseif not wiimote:isDown("2") then
			input.X = false
		end

		if not pressed and wiimote:isDown("a") then
			input.C = true
		elseif not wiimote:isDown("a") then
			input.C = false
		end
	elseif _os == "nx" then
		function love.gamepadpressed(joystick, button)
			joystick = input.joystick

			if button == "dpleft" then
				input.left = true
			else
				input.left = false
			end

			if button == "a" then
				input.Z = true
			else
				input.Z = false
			end
		end
	end
end

return input