local Tile = require 'src.world.tiles.Tile'

local Dirt = class(..., Tile)

function Dirt:initialize(x,y)
  Tile.initialize(self,x,y,3,1)
end

return Dirt
