
local Player = require 'entities.player'
local Entity = require 'entities.entity'
local Map    = require 'geometry.map'

local Game = require 'game'
local Play = Game:addState('Play')


function Play:enteredState()
  self.player = Player:new(100, 100)
  self.map =    Map:new(20,10)
end

function Play:exitedState()
  self.player = nil
  self.map = nil
  Entity:destroyAll()
end

function Play:draw()
  self.map:draw()
  Entity:drawAll()
end

function Play:update(dt)
  Entity:updateAll(dt)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
