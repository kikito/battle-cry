local tiles = require('src.world.tiles')

local Map = class('Map')

local tileWidth, tileHeight = 32, 32

local floor = math.floor

function Map:initialize(width, height)
  self.width = width
  self.height = height
  self.tiles = {}
  for x=1,width do
    self.tiles[x]={}
    for y=1,height do
      if x==1 or y==1 or x==width or y==height then
        self.tiles[x][y] = tiles.Wall:new(self,x,y)
      else
        self.tiles[x][y] = tiles.Grass:new(self,x,y)
      end
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

function Map:toMap(wx, wy)
  return floor(wx/tileWidth)+1, floor(wy/tileHeight)+1
end

function Map:getContainingTile(wx, wy)
  local x,y = self:toMap(wx,wy)
  return self.tiles[x][y]
end

-- ul, ur, dl, dr
function Map:getContainingTiles(wx,wy,w,h)
  return self:getContainingTile(wx,   wy),
         self:getContainingTile(wx+w, wy),
         self:getContainingTile(wx,   wy+h),
         self:getContainingTile(wx+w, wy+h)
end






return Map
