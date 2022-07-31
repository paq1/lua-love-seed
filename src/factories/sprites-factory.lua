local SpritesFactory = {}

local SpriteModel = require("src/models/sprite-model")

function SpritesFactory.createSpriteBalle()
    local image = love.graphics.newImage("assets/sprites/balle.png")
    return SpriteModel:new(image)
end

return SpritesFactory