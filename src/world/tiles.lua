local anim8 = require 'lib.anim8'
local Media = require 'src.media'

local Tile = class('Tile')

local TileWidth, TileHeight = 32, 32

local grid = anim8.newGrid(TileWidth, TileHeight, 1024, 1024)

function Tile:initialize(map,x,y,quadX, quadY)
  self.x, self.y = x,y
  self.left,  self.top    = map:toWorld(x,y)
  self.right, self.bottom = self.left + TileWidth, self.top + TileHeight
  self.image = Media.images.tiles
  self.quad = grid(quadX, quadY)[1]
end

function Tile:isPassableBy(entity)
  return not self.solid
end

function Tile:draw()
  love.graphics.drawq(self.image, self.quad, self.left, self.top)
end

function Tile:getBoundingBox()
  return self.left, self.top, self.right - self.left, self.bottom - self.top
end


local Grass = class('Grass', Tile)

function Grass:initialize(map,x,y)
  Tile.initialize(self, map, x,y, 1,1)
end

local Wall = class('Wall', Tile)

function Wall:initialize(map,x,y)
  Tile.initialize(self,map,x,y, 2,1)
  self.solid = true
  self.opaque = true
end

return {
  Grass = Grass,
  Wall  = Wall
}



