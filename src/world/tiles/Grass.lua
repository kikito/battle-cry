local Tile = require 'src.world.tiles.Tile'

local Grass = class(..., Tile)

function Grass:initialize(x,y,left,top)
  Tile.initialize(self,x,y,left,top,1,1)
end

return Grass
