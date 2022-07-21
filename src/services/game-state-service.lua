local GameStateService = {}
local GameStateEnum = require("src/enum/game-state-enum")

GameStateService.current_state = GameStateEnum.Menu

function GameStateService:isMenu()
    return GameStateService:getGameState() == GameStateEnum.Menu
end

function GameStateService:isGame()
    return GameStateService:getGameState() == GameStateEnum.Game
end

function GameStateService:setGameState(state) 
    GameStateService.current_state = state
end

function GameStateService:getGameState() 
    return GameStateService.current_state
end

return GameStateService