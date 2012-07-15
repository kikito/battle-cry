local Each = require 'lib.each'
local bump = require 'lib.bump'

local Body = class(..., nil):include(Each)

function Body:initialize(map, mx, my, width, height)
  self.senses = {}
  self.x, self.y = map:toWorldCentered(mx, my)
  self.z = 1

  self.width = width
  self.height = height
  self.halfWidth = width*0.5
  self.halfHeight = height*0.5

  self.solid  = true
  self.walker = true

  self.map = map
  self.class:add(self)
  bump.add(self)
end

function Body:destroy()
  bump.remove(self)
  self.class:remove(self)
end

function Body:getBBox()
  return self.x - self.halfWidth, self.y - self.halfHeight, self.width, self.height
end

function Body:getCenter()
  return self:getPosition()
end

function Body:getPosition()
  return self.x, self.y
end

function Body:update(wishes, dt)
  self:sense()
end

function Body:sense()
  self.senses.x = self.x
  self.senses.y = self.y
  self.senses.sight = {}
  Body:each('getPerceivedBy', self)
end

function Body:shouldCollide(other)
  return (self.solid and other.solid) or (self.walker and other.hole)
end

function Body:collision(other, dx, dy)
end

function Body:endCollision()
end

function Body:getPerceivedBy(perceiver)
  --[[
  local x0,y0 = self.map:toGrid(perceiver.x, perceiver.y)
  local x1,y1 = self.map:toGrid(self.x, self.y)

  if self.map:los(x0,y0,x1,y1) then
    perceiver.senses.sight[self] = {x=self.x, y=self.y}
  end
  ]]
end


return Body
