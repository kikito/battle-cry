

-- This game state simulates loading the resources of a game
-- It doesn't really load any images - it just uses cron.lua to pass some time
-- cron.lua is updated on the main.lua file; it could be also updated inside Loading:update here.

local Game = require 'game'

local Loading = Game:addState('Loading')

local percent = 0

function Loading:enteredState()

  self:log('Entered Loading')

  local counterId = cron.every(0.5, function()
    percent = percent + 10
  end)

  cron.after(5, function()
    cron.cancel(counterId)
    self:gotoState('MainMenu')
  end)

end

function Loading:draw()
  love.graphics.print("Loading ... " .. percent .. "%", 350, 280)
end

return Loading
