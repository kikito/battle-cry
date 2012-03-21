local Map = class('Map')

function Map:initialize(width, height, tileWidth, tileHeight)
  self.width = width
  self.height = height
  self.tileWidth = tileWidth
  self.tileHeight = tileHeight
  self.tiles = {}
end

function Map:draw(minx, miny, width, height)
  local tile, worldx, worldy
  for x=minx, minx+width do
    for y=miny, miny+height do
      tile = self.tiles[x][y]
      worlx, worldy = self:getWorldCoordinates(x,y)
      tile:draw(worldx, worldy)
    end
  end
end

function Map:toWorldCoordinates(x,y)
  return x*self.tileWidth, y*self.tileHeight
end

function Map:toCenteredWorldCoordinates(x,y)
  return (x+0.5)*self.tileWidth, (y+0.5)*self.tileHeight
end
