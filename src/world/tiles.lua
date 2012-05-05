local anim8 = require 'lib.anim8'
local Media = require 'src.media'

local Tile = class('Tile')

local TileWidth, TileHeight = 32, 32

local grid = anim8.newGrid(TileWidth, TileHeight, 1024, 1024)

function Tile:initialize(x,y,left,top,quadX, quadY)
  self.x, self.y = x,y
  self.left,  self.top    = left, top
  self.right, self.bottom = self.left + TileWidth, self.top + TileHeight
  self.image = Media.images.tiles
  self.quad = grid(quadX, quadY)[1]
end

function Tile:isPassableBy(body)
  return not(self.solid or self.hole)
end

function Tile:draw()
  love.graphics.drawq(self.image, self.quad, self.left, self.top)
end

function Tile:getBoundingBox()
  return self.left, self.top, self.right - self.left, self.bottom - self.top
end


local Grass = class('Grass', Tile)

function Grass:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,1,1)
end

local Wall = class('Wall', Tile)

function Wall:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,2,1)
  self.solid = true
  self.opaque = true
end

local Hole = class('Hole', Tile)

function Hole:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,3,1)
  self.hole = true
end

local Glass = class('Glass', Tile)

function Glass:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,4,1)
  self.solid = true
end

return {
  Grass = Grass,
  Wall  = Wall,
  Hole  = Hole,
  Glass = Glass
}



