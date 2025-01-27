--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

local GOLD_MEDAL_IMAGE = love.graphics.newImage('gold_medal.png')
local SILVER_MEDAL_IMAGE = love.graphics.newImage('silver_medal.png')
local BRONZE_MEDAL_IMAGE = love.graphics.newImage('bronze_medal.png')

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    ScoreState:renderMedal(self.score)
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end

function ScoreState:renderMedal(score)
    if score >= 15 then
        love.graphics.draw(GOLD_MEDAL_IMAGE, VIRTUAL_WIDTH / 2 - 16, 115)
    elseif score >= 10 then
        love.graphics.draw(SILVER_MEDAL_IMAGE, VIRTUAL_WIDTH / 2 - 16, 115)
    else
        love.graphics.draw(BRONZE_MEDAL_IMAGE, VIRTUAL_WIDTH / 2 - 16, 115)
    end
end