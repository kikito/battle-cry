local Tile = require 'src.world.tiles.Tile'

local Wall = class(..., Tile)

function Wall:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,2,1)
  self.solid = true
  self.opaque = true
end

return Wall
