secret = {}

local sprite

function secret.load()
    sprite = love.graphics.newTexture("assets/images/AprilFools1XResolution.png")
end

function secret.draw()
    love.graphics.draw(sprite, 0, 0, 0, 2, 2, 0, 0)
end

return secret