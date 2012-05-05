local Player   = require 'src.beings.player'
local Follower = require 'src.beings.follower'
local Being    = require 'src.beings.being'
local Map      = require 'src.world.map'

local Game = require 'src.game.game'
local Play = Game:addState('Play')

local bresenham = require 'lib.bresenham'


function Play:enteredState()
  self.map      = Map:new(20,10)
  self.player   = Player:new(self.map, 100, 100)
  self.follower = Follower:new(self.map, self.player.body, 500,250)
end

function Play:exitedState()
  self.player = nil
  self.map = nil
  self.follower = nil
  Being:destroyAll()
end

function Play:draw()
  self.map:draw()
  Being:drawAll()
end

function Play:update(dt)
  Being:updateAll(dt)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
