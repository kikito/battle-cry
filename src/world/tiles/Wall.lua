local Tile = require 'src.world.tiles.Tile'
local Dirt = require 'src.world.tiles.Dirt'

local Wall = class(..., Tile)

Wall.static.FloorClass = Dirt

function Wall:initialize(x,y)
  Tile.initialize(self,x,y,1,2)
  self.z = 1
  self.class.FloorClass:new(x,y)
end

return Wall
