local Tile = require 'src.world.tiles.Tile'

local Hole = class(..., Tile)

function Hole:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,3,1)
  self.hole = true
end

return Hole
