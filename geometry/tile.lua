local anim8 = require 'lib.anim8'
local Game  = require 'game'

local Tile = class('Tile')

local grid = anim8.newGrid(32, 32, 1024, 1024)

function Tile:initialize(quadX, quadY, x,y)
  self.image = Game.media.images.tiles
  self.quad = grid(quadX, quadY)[1]
  self.x = x
  self.y = y
end

function Tile:draw()
  love.graphics.drawq(self.image, self.quad, self.x, self.y)
end

return Tile
