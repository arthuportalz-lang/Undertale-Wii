local input = {}

local wiimote, wiimotePressed

input.left = false
input.right = false
input.up = false
input.down = false
input.X = false
input.C = false
input.no_input = false

wiimote = love.wiimote.getWiimotes()[1]

function input.update(dt)
	if not wiimotePressed and wiimote:isDown("1") then
		wiimotePressed = true
		input.Z = true
	elseif not wiimote:isDown("1") then
		wiimotePressed = false
		input.Z = false
	end

	if not wiimotePressed and wiimote:isDown("2") then
		wiimotePressed = true
		input.X = true
	elseif not wiimote:isDown("2") then
		wiimotePressed = false
		input.X = false
	end

	if not wiimotePressed and wiimote:isDown("a") then
		wiimotePressed = true
		input.C = true
	elseif not wiimote:isDown("a") then
		wiimotePressed = false
		input.C = false
	end

	input.left = wiimote:isDown("left")
	input.right = wiimote:isDown("right")
	input.up = wiimote:isDown("up")
	input.down = wiimote:isDown("down")
end

return input
