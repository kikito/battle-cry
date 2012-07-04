local Tile = require 'src.world.tiles.Tile'
local Stone = require 'src.world.tiles.Stone'

local Wall = class(..., Tile)

function Wall:initialize(x,y)
  Tile.initialize(self,x,y,1,2)
  self.z = 1
  self.solid = true
  self.opaque = true
  Stone:new(x,y)
end

return Wall
