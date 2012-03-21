local Tile = require 'geometry.tile'

local Grass = class('Grass', Tile)

function Grass:initialize(x,y)
  Tile.initialize(self, 1,1, x,y)
end

return Grass
