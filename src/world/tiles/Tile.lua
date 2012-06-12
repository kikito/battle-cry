local anim8 = require 'lib.anim8'
local Each  = require 'lib.each'

local media = require 'src.media'

local Tile = class(..., nil):include(Each)

Tile.static.TILEW = 16
Tile.static.TILEH = 16

local grid = anim8.newGrid(Tile.TILEW, Tile.TILEH*3, 1024, 1024)

local function _toGrid(self)
  return (self.x-1)*Tile.TILEW, (self.y-1)*Tile.TILEH
end

function Tile:initialize(x, y, quadX, quadY)
  self.quad = grid(quadX, quadY)[1]
  self.x, self.y = x, y
end

function Tile:isPassableBy(body)
  if (body.solid  and self.solid) or
     (body.walker and self.hole)  then
    return false
  end
  return true
end

function Tile:draw()
  love.graphics.drawq(media.images.tiles, self.quad, _toGrid(self))
end



return Tile
