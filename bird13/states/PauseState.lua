--[[
    PauseState Class
    
    Author: Lucas Vidal
    lucascezerevidal@outlook.com

    The PauseState is the pausing screen of the game. It should
    display "Press Enter to get back to the game".
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    -- Pause music
    sounds['music']:pause()
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        sounds['music']:play()
        gStateMachine:change('play', self.playState)
    end
end

function PauseState:enter(playState)
    self.playState = playState
end

function PauseState:render()
    for k, pair in pairs(self.playState.pipePairs) do
        pair:render()
    end
    self.playState.bird:render()

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')
    love.graphics.print('Score: ' .. tostring(self.playState.score), 8, 8)

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to get back to the game', 0, 100, VIRTUAL_WIDTH, 'center')
end