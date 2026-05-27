local input = {}

local wiimote, wiimotePressed

input.left = false
input.right = false
input.up = false
input.down = false

input.Z = false
input.X = false
input.C = false

input.noInput = false

if debug == false then wiimote = love.wiimote.getWiimotes()[1] end

function input.update(dt)
	if debug then
		input.left = love.keyboard.isDown("left")
		input.right = love.keyboard.isDown("right")
		input.up = love.keyboard.isDown("up")
		input.down = love.keyboard.isDown("down")

		if not input.left and not input.right and not input.up and not input.down then
			input.noInput = true
		else
			input.noInput = false
		end
	end
end

return input