local Grass = require('world.tiles.grass')

local Map = class('Map')

local tileWidth, tileHeight = 32, 32

function Map:initialize(width, height)
  self.width = width
  self.height = height
  self.tiles = {}
  for x=1,width do
    self.tiles[x]={}
    for y=1,height do
      self.tiles[x][y] = Grass:new(self:toWorld(x,y))
    end
  end
end

function Map:draw(minx, miny, width, height)
  minx, miny = minx or 1, miny or 1
  width, height = width or self.width, height or self.height

  for x=minx, minx+width-1 do
    for y=miny, miny+height-1 do
      self.tiles[x][y]:draw()
    end
  end
end

function Map:toWorld(x,y)
  return (x-1)*tileWidth, (y-1)*tileHeight
end

local floor = math.floor
function Map:getContainingCell(wx, wy)
  return floor(wx/tileWidth)+1, floor(wy/tileHeight)+1
end

return Map
