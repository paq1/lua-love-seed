local Menu = {}
local FontFactory = require("src/factories/font-factory")
local MusicFactory = require("src/factories/music-factory")
local GameStateService = require("src/services/game-state-service")
local GameStateEnum = require("src/enum/game-state-enum")
local KeyCodeEnum = require("src/enum/key-code-enum")

function Menu:update(dt) 
    playMusic()
    goToGameWhenSpacePressed()
end

function Menu:draw() 
    printPressedSpaceToPlayOnWindow()
end

function playMusic()
    MusicFactory:playMusicMenu()
end

function goToGameWhenSpacePressed() 
    if love.keyboard.isDown(KeyCodeEnum.Space) then
        GameStateService:setGameState(GameStateEnum.Game)
        MusicFactory:stopMusicMenu()
    end
end

function printPressedSpaceToPlayOnWindow()
    local text = "press space to play"
    local font = FontFactory:getFontMenu()
    local font_size = FontFactory:getFontSizeMenu()

    local pos = {
        x = love.graphics.getWidth() / 2. - ((#text / 2.) * (font_size / 2.5)),
        y = love.graphics.getHeight() / 2. - font_size / 2.
    }

    love.graphics.setColor(1, 0, 0)
    love.graphics.setFont(font)
    love.graphics.print(text, pos.x, pos.y)
end

return Menu