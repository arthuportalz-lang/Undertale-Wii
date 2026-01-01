local input = {}

input.left = false
input.right = false
input.up = false
input.down = false
input.Z = false
input.X = false
input.C = false

function input.update(dt)
    if wii == false then
        input.left = love.keyboard.isDown("left")
        input.right = love.keyboard.isDown("right")
        input.up = love.keyboard.isDown("up")
        input.down = love.keyboard.isDown("down")
        input.Z = false
        input.X = false
        input.C = false

        function love.keypressed(key)
            if key == "z" then
                input.Z = true
            end

            if key == "x" then
                input.X = true
            end

            if key == "c" then
                input.C = true
            end
        end
    end
end

return input