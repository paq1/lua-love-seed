local GameStateHandler = {}

local GameStateService = require("src/services/game-state-service")
local Menu = require("src/game-state/menu/menu")
local Game = require("src/game-state/game/game")

function GameStateHandler:update(dt)
    if GameStateService:isGame() then
        Game:update(dt)
    elseif GameStateService:isMenu() then
        -- todo press space to play
        Menu:update(dt)
    end
end

function GameStateHandler:draw()
    if GameStateService:isGame() then
        Game:draw()
    elseif GameStateService:isMenu() then
        Menu:draw()
    end
end


return GameStateHandler