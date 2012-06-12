local Tile = require 'src.world.tiles.Tile'

local Grass = class(..., Tile)

function Grass:initialize(x,y)
  Tile.initialize(self,x,y,1,1)
end

return Grass
