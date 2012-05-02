local anim8 = require 'lib.anim8'
local Media = require 'src.media'

local Tile = class('Tile')

local TileWidth, TileHeight = 32, 32

local grid = anim8.newGrid(TileWidth, TileHeight, 1024, 1024)

function Tile:initialize(map,x,y,quadX, quadY)
  self.x, self.y = x,y
  self.wx, self.wy = map:toWorld(x,y)
  self.image = Media.images.tiles
  self.quad = grid(quadX, quadY)[1]
end

function Tile:isPassableBy(entity)
  return not self.solid
end

function Tile:draw()
  love.graphics.drawq(self.image, self.quad, self.wx, self.wy)
end


function Tile:worldLeft()
  return self.wx
end

function Tile:worldRight()
  return self.wx + TileWidth
end

function Tile:worldTop()
  return self.wy
end

function Tile:worldBottom()
  return self.wy + TileHeight
end



local Grass = class('Grass', Tile)

function Grass:initialize(map,x,y)
  Tile.initialize(self, map, x,y, 1,1)
end

local Wall = class('Wall', Tile)

function Wall:initialize(map,x,y)
  Tile.initialize(self,map,x,y, 2,1)
  self.solid = true
end

return {
  Grass = Grass,
  Wall  = Wall
}



