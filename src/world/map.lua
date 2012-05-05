local bresenham = require 'lib.bresenham'

local tiles = require('src.world.tiles')

local tileWidth, tileHeight = 32, 32

local floor = math.floor

local str = [[
#########################
#      v                #
#      v                #
#      v                #
#      v                #
#      v                #
#      v                #
#      v                #
#      v                #
#      v       ##########
#      v       #        #
#      v       #        #
#      v       $        #
#      v   v   $        #
#      v   v   $        #
#      v   v   #        #
#          v   #####    #
#          v            #
#########################
]]

local legend = {
  [' '] = tiles.Grass,
  ['#'] = tiles.Wall,
  ['v'] = tiles.Hole,
  ['$'] = tiles.Glass
}

local Map = class('Map')

function Map:initialize()
  self.width = #(str:match("[^\n]+"))
  self.tiles = {}

  for x = 1,self.width,1 do self.tiles[x] = {} end

  local x,y,left,top = 1,1
  for row in str:gmatch("[^\n]+") do
    assert(#row == self.width, "invalid row: {" .. row .. "}")
    x = 1
    for character in row:gmatch(".") do
      left, top = self:toWorld(x,y)
      self.tiles[x][y] = legend[character]:new(x,y,left,top)
      x = x + 1
    end
    y=y+1
  end
  self.height = y - 1
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

function Map:los(x0,y0, x1,y1)
  return bresenham.los(x0,y0,x1,y1, function(x,y)
    return not self.tiles[x][y].opaque
  end)
end





return Map
