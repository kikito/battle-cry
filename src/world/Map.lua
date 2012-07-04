local bresenham = require 'lib.bresenham'
local bump      = require 'lib.bump'

local tiles = require_tree 'src.world.tiles'
local Tile  = tiles.Tile

local str = [[
###############################################################
#      #      v               vvvvv       vvvvv       vvvvv   #
#      #      v              vvvvvvv     vvvvvvv     vvvvvvv  #
#      $      v              vvvvvvv     vvvvvvv     vvvvvvv  #
#      #      v               vvvvv       vvvvv       vvvvv   #
#      $      vvvvvvvvv             vvvvv       vvvvv         #
#      #                #          vvvvvvv     vvvvvvv        #
#      #                           vvvvvvv     vvvvvvv        #
#      #                            vvvvv       vvvvv         #
#              ##########                                     #
#              #........#              vvvvvvvvvvv            #
#              #........#             vvvvvvvvvvvvv           #
#              $........             vvvv    vvvvvvv          #
#          v   $........             vvv      vvvvvv          #
#          v   $........             vvv      ######          #
#          v   #........#            vvv  $$                  #
#          v   #####    #            vvv  $$                  #
#          v            #            vvv      ######          #
###### ##################            vvv      vvvvvv          #
#                                    vvvv    vvvvvvv          #
#                                     vvvvvvvvvvvvv           #
#                                      vvvvvvvvvvv            #
#                                                             #
#                                                             #
#                      .............................          #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
#       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                 #
#       $                                   $                 #
#       $                                   $                 #
#       $              vvvvv                $                 #
#       $             vvvvvvv               $                 #
#       $              vvvvv                $                 #
#       $                                   $                 #
#       $                                   $                 #
#       $                                   $                 #
#       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                 #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
###############################################################
]]

local legend = {
  [' '] = tiles.Grass,
  ['#'] = tiles.BrickWall,
  ['v'] = tiles.Hole,
  ['$'] = tiles.GlassWall,
  ['.'] = tiles.Dirt
}

local Map = class(..., Grid)

function Map:initialize()
  local width = #(str:match("[^\n]+"))
  local _, height = str:gsub("\n", "")

  local x,y,cell = 1,1
  for row in str:gmatch("[^\n]+") do
    assert(#row == width, ("row %d has length %d instead of %d"):format(y, #row, width))
    x = 1
    for character in row:gmatch(".") do
      tile = legend[character]:new(x,y)
      x    = x + 1
    end
    y = y + 1
  end
  self.width = width
  self.height = height
end

function Map:toWorldCentered(mx, my)
  return Tile.TILEW * (mx - 0.5), Tile.TILEH * (my - 0.5)
end

function Map:getBoundary()
  return 0, 0, self.width*Tile.TILEW, self.height*Tile.TILEH
end
return Map
