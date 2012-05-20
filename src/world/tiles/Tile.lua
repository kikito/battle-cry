local anim8 = require 'lib.anim8'
local media = require 'src.media'

local Tile = class(..., nil)

local TileWidth, TileHeight = 32, 32

local grid = anim8.newGrid(TileWidth, TileHeight, 1024, 1024)

function Tile:initialize(x,y,left,top,quadX, quadY)
  self.x, self.y = x,y
  self.left,  self.top    = left, top
  self.right, self.bottom = self.left + TileWidth, self.top + TileHeight
  self.quad = grid(quadX, quadY)[1]
end

function Tile:isPassableBy(body)
  if (body.solid  and self.solid) or
     (body.walker and self.hole) then
    return false
  end
  return true
end

function Tile:draw()
  love.graphics.drawq(media.images.tiles, self.quad, self.left, self.top)
end

function Tile:getBoundingBox()
  return self.left, self.top, self.right - self.left, self.bottom - self.top
end

return Tile
