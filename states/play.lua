
local Player = require 'beings.player'
local Being  = require 'beings.being'
local Map    = require 'geometry.map'

local Game = require 'game'
local Play = Game:addState('Play')


function Play:enteredState()
  self.cell = {x=0,y=0}
  self.player = Player:new(100, 100)
  self.map =    Map:new(20,10)
end

function Play:exitedState()
  self.player = nil
  self.map = nil
  Being:destroyAll()
end

function Play:draw()
  self.map:draw()
  local x,y = self.map:toWorld(self.cell.x, self.cell.y)
  love.graphics.rectangle('line', x, y, 32, 32)
  Being:drawAll()
end

function Play:update(dt)
  Being:updateAll(dt)
  local px, py = self.player.body:getPosition()
  self.cell.x, self.cell.y = self.map:getContainingCell(self.player.body:getFeetPosition())
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
