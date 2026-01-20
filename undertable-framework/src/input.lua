local input = {}

local wiimote, wiimotePressed, pointer

input.left = false
input.right = false
input.up = false
input.down = false
input.Z = false
input.X = false
input.C = false

wiimote = love.wiimote.getWiimotes()[1]

function input.update(dt)
    if not wiimotePressed and wiimote:isDown("WPAD_BUTTON_LEFT") then
		wiimotePressed = true
	elseif not wiimote:isDown("WPAD_BUTTON_LEFT") then
		wiimotePressed = false
	end
end

return input