local Game = {}

local FpsService = require("src/services/fps-service")
local GameStateService = require("src/services/game-state-service")

local FpsModel = require("src/models/fps")
local GameStateEnum = require("src/enum/game-state-enum")
local KeyCodeEnum = require("src/enum/key-code-enum")

Game.fps = FpsModel:default()

function Game:update(dt) 
    go_to_menu_state_when_escape_pressed()
    Game.fps = FpsService:update(dt, Game.fps)
end

function Game:draw() 
    FpsService:draw_fps(Game.fps)
end

function go_to_menu_state_when_escape_pressed() 
    if love.keyboard.isDown(KeyCodeEnum.Escape) then
        GameStateService:setGameState(GameStateEnum.Menu)
    end
end

return Game
