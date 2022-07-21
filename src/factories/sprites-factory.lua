local SpritesFactory = {}

SpritesFactory.balle = nil

function SpritesFactory.getBalle()
    if SpritesFactory.balle == nil then
        SpritesFactory.balle = love.graphics.newImage("assets/sprites/balle.png")
    end
    return SpritesFactory.balle
end

return SpritesFactory