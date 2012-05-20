local Tile = require 'src.world.tiles.Tile'

local Glass = class(..., Tile)

function Glass:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,4,1)
  self.solid = true
end

return Glass
