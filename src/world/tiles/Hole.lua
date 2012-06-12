local Tile = require 'src.world.tiles.Tile'

local Hole = class(..., Tile)

function Hole:initialize(x,y)
  Tile.initialize(self,x,y,5,1)
  self.hole = true
end

return Hole
