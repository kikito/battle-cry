local bresenham = require 'lib.bresenham'

local tiles = require_tree 'src.world.tiles'

local TILEW, TILEH = tiles.Tile.TILEW, tiles.Tile.TILEH

local floor = math.floor

local str = [[
#######################################
#      #      v        vvvvvvv        #
#      #      v              v        #
#      $      v              v        #
#      #      v              v        #
#      $      vvvvvvvvv               #
#      #                #             #
#      #                #             #
#      #                              #
#              ##########             #
#              #        #             #
#              #        #             #
#              $        #             #
#          v   $                      #
#          v   $        #    vvvvv    #
#          v   #        #    v        #
#          v   #####    #    vvvvv    #
#          v            #        v    #
###### ##################    vvvvv    #
#                                     #
#                                     #
#            ###$$$###                #
#            #       #                #
#######################################
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

function Map:draw(wl, wt, ww, wh)
  local l, t = self:toMap(wl, wt)
  local r, b = self:toMap(wl + ww, wt + wh)

  for x = l, r do
    for y = t, b do
      self.tiles[x][y]:draw()
    end
  end
end

function Map:toWorld(x,y)
  return (x-1) * TILEW, (y-1) * TILEH
end

function Map:toMap(wx, wy)
  return floor(wx / TILEW) + 1, floor(wy / TILEH) + 1
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

function Map:getBoundary()
  local w, h = self:toWorld(self.width + 1, self.height + 1)
  w = w - 1
  h = h - 1
  return 0,0,w,h
end

return Map
