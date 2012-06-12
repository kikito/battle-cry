local Tile = require 'src.world.tiles.Tile'

local Dirt = class(..., Tile)

function Dirt:initialize(x,y)
  Tile.initialize(self,x,y,3,1)
  self.solid = true
end

return Dirt
