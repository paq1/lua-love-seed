local FontFactory = {}
FontFactory.font_size_comic_path = 38.
FontFactory.font_comic_path = "assets/fonts/dpcomic.ttf"

FontFactory.comic_font = nil

function FontFactory:getFontMenu()
    if FontFactory.comic_font == nil then
        FontFactory.comic_font = love.graphics.newFont(FontFactory.font_comic_path, FontFactory.font_size_comic_path)
    end
    return FontFactory.comic_font
    
end

function FontFactory:getFontSizeMenu()
    return FontFactory.font_size_comic_path
end

return FontFactory