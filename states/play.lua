
local Player = require 'entities.player'
local Entity = require 'entities.entity'

local Game = require 'game'
local Play = Game:addState('Play')

function Play:enteredState()
  Player:new(100, 100)
end

function Play:exitedState()
  Entity:destroyAll()
end

function Play:draw()
  Entity:drawAll()
end

function Play:update(dt)
  Entity:updateAll(dt)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
