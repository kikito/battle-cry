local Tile  = require 'src.world.tiles.Tile'
local Grass = require 'src.world.tiles.Grass'

local GlassWall = class(..., Tile)

function GlassWall:initialize(x,y)
  Tile.initialize(self,x,y,2,2)
  self.z = 1
  self.solid = true
  Grass:new(x,y)
end

return GlassWall
