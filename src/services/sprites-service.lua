local SpritesService = {}

function SpritesService:draw(sprite, centerOrigin, color)
    color = color or {
        r = 1,
        g = 1,
        b = 1
    }
    centerOrigin = centerOrigin or true
    local ox, oy = 0, 0
    if centerOrigin then
        ox, oy = getCenterPositionImage(sprite.img)
    end

    local x = sprite.position.x
    local y = sprite.position.y

    love.graphics.setColor(color.r, color.g, color.b)

    love.graphics.draw(
        sprite.img, 
        x,
        y,
        sprite.angle,
        sprite.scale.w,
        sprite.scale.h,
        ox,
        oy
    )
end

function getCenterPositionImage(img)
    local width, height = img:getDimensions()
    ox = width / 2
    oy = height / 2
    return ox, oy
end

return SpritesService