local Game = {}

local FpsService = require("src/services/fps-service")
local GameStateService = require("src/services/game-state-service")

local FpsModel = require("src/models/fps")
local GameStateEnum = require("src/enum/game-state-enum")
local KeyCodeEnum = require("src/enum/key-code-enum")
local SpritesFactory = require("src/factories/sprites-factory")
local SpritesService = require("src/services/sprites-service")

Game.fps = FpsModel:default()

Game.load = false

Game.balle = {
    sprite = SpritesFactory:createSpriteBalle(),
    position = {x = 0, y = 100},
    vitesse = 500,
    direction = {x = 1, y = 1}
}

function Game:update(dt) 
    Game.balle = updateSpritePosition(Game.balle)
    Game.balle = updateBallRotation(Game.balle, dt)
    Game.balle = balleRebonditContreFenetre(Game.balle, dt)

    goToMenuStateWhenEscapePressed()
    Game.fps = FpsService:update(dt, Game.fps)

    Game.load = true
end

function Game:draw()
    if Game.load then 
        SpritesService:draw(Game.balle.sprite)
    end
    FpsService:draw_fps(Game.fps)
end

function goToMenuStateWhenEscapePressed() 
    if love.keyboard.isDown(KeyCodeEnum.Escape) then
        GameStateService:setGameState(GameStateEnum.Menu)
    end
end


function updateSpritePosition(balle)
    balle.sprite.position = balle.position
    return balle
end

function updateBallRotation(balle, dt)
    local angle = balle.sprite.angle + dt
    balle.sprite.angle = angle
    return balle
end

function balleRebonditContreFenetre(balle, dt)
    local x, y = balle.position.x, balle.position.y
    local vitesse = balle.vitesse
    
    if x < 0 then 
        balle.direction.x = 1
    end
    if x > love.graphics.getWidth() then 
        balle.direction.x = -1
    end
    if y < 0 then 
        balle.direction.y = 1
    end
    if y > love.graphics.getHeight() then 
        balle.direction.y = -1
    end

    x = x + balle.direction.x * vitesse * dt
    y = y + balle.direction.y * vitesse * dt

    balle.position = {x = x, y = y}
    return balle
end

return Game
