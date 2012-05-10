local Player   = require 'src.beings.player'
local Follower = require 'src.beings.follower'
local Ptero    = require 'src.beings.ptero'
local Being    = require 'src.beings.being'
local Map      = require 'src.world.map'

local Game = require 'src.game.game'
local Play = Game:addState('Play')

local bresenham = require 'lib.bresenham'

local map

function Play:enteredState()
  map            = Map:new()
  local player   = Player:new(map, 100, 100)
  Follower:new(map, player.body, 580,450)
  Ptero:new(map, player.body, 600, 200)
end

function Play:exitedState()
  map = nil
  Being:destroyAll()
end

function Play:draw()
  map:draw()
  Being:drawAll()
end

function Play:update(dt)
  Being:updateAll(dt)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
