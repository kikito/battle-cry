local Tile = require 'src.world.tiles.Tile'

local Stone = class(..., Tile)

function Stone:initialize(x,y)
  Tile.initialize(self,x,y,4,1)
  self.solid = true
end

return Glass
