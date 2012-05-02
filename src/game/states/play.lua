local Player   = require 'src.beings.player'
local Follower = require 'src.beings.follower'
local Being    = require 'src.beings.being'
local Map      = require 'src.world.map'

local Game = require 'src.game.game'
local Play = Game:addState('Play')


function Play:enteredState()
  self.map      = Map:new(20,10)
  self.player   = Player:new(self.map, 100, 100)
  self.follower = Follower:new(self.map, self.player.body, 500,200)
end

function Play:exitedState()
  self.player = nil
  self.map = nil
  self.follower = nil
  Being:destroyAll()
end

local function drawTile(tile, body)
  if tile:isPassableBy(body) then
    love.graphics.setColor(255,255,255)
  else
    love.graphics.setColor(255,0,0)
  end
  love.graphics.rectangle('line', tile.wx, tile.wy, 32,32)
end

function Play:draw()
  love.graphics.setColor(255,255,255)
  self.map:draw()
  love.graphics.rectangle('line', self.player.body:getBoundingBox())

  local ul,ur,dl,dr = self.map:getContainingTiles(self.player.body:getBoundingBox())
  drawTile(ul)
  drawTile(ur)
  drawTile(dl)
  drawTile(dr)

  love.graphics.print(("%d %d %d %d"):format(self.player.body:getBoundingBox()), 40, 500)

  Being:drawAll()

  local x,y = self.player.body:getPosition()
end

function Play:update(dt)
  Being:updateAll(dt)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
