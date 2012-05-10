local Apply = require 'lib.apply'

local Body = class('Body'):include(Apply)

function Body:initialize(map, x,y)
  self.senses = {}
  self.map = map
  self.x, self.y = x,y
  self.solid  = true
  self.walker = true
  self.class:addInstance(self)
end

function Body:destroy()
  self.class:removeInstance(self)
end

function Body:getPosition()
  return self.x, self.y
end

function Body:getContainingTile()
  return self.map:getContainingTile(self.x, self.y)
end

function Body:update(wishes, dt)
  self:sense()
end

function Body:sense()
  self.senses.x = self.x
  self.senses.y = self.y
  self.senses.sight = {}
  Body:applyMethod('getPerceivedBy', self)
end

function Body:getPerceivedBy(perceiver)
  local x0,y0 = self.map:toMap(perceiver.x, perceiver.y)
  local x1,y1 = self.map:toMap(self.x, self.y)

  if self.map:los(x0,y0,x1,y1) then
    perceiver.senses.sight[self] = {x=self.x, y=self.y}
  end
end


return Body
