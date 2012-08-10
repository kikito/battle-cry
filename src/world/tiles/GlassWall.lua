local Wall  = require 'src.world.tiles.Wall'
local Grass = require 'src.world.tiles.Grass'

local GlassWall = class(..., Wall)

GlassWall.static.FloorClass = Grass

function GlassWall:initialize(x,y)
  Wall.initialize(self,x,y,2,2)
  self.solid = true
end

return GlassWall
