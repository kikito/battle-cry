local Wall  = require 'src.world.tiles.Wall'
local Stone = require 'src.world.tiles.Stone'

local BrickWall = class(..., Wall)

BrickWall.static.FloorClass = Stone

function BrickWall:initialize(x,y)
  Wall.initialize(self,x,y,1,2)
  self.solid = true
  self.opaque = true
end

return BrickWall
