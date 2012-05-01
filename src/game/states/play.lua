local Player   = require 'src.beings.player'
local Follower = require 'src.beings.follower'
local Being    = require 'src.beings.being'
local Map      = require 'src.world.map'

local Game = require 'src.game.game'
local Play = Game:addState('Play')


function Play:enteredState()
  self.cell = {x=0,y=0}
  self.player   = Player:new(100, 100)
  self.follower = Follower:new(self.player.body, 500,200)
  self.map =    Map:new(20,10)
end

function Play:exitedState()
  self.player = nil
  self.map = nil
  self.follower = nil
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
  self.cell.x, self.cell.y = self.map:getContainingCell(self.player.body:getPosition())
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
