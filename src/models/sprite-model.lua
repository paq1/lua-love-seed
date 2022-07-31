local SpriteModel = {}

function SpriteModel:new(image, x, y, angle, scaleW, scaleH)

    x = x or 0
    y = y or 0
    angle = angle or 0
    scaleW = scaleW or 1
    scaleH = scaleH or scaleW

    return {
        img = image,
        position = {x = x, y = y},
        angle = angle,
        scale = { w = scaleW, h = scaleH }
    }
end

return SpriteModel