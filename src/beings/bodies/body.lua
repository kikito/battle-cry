local Apply = require 'lib.apply'

local Body = class('Body'):include(Apply)

function Body:initialize(map, x,y)
  self.senses = {}
  self.map = map
  self:setPosition(x,y)
  self.class:addInstance(self)
end

function Body:destroy()
  self.class:removeInstance(self)
end

function Body:setPosition(x,y)
  self.x, self.y = x, y
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
  Body:applyMethod('getPerceivedBy', self)
end

function Body:getPerceivedBy(perceiver)
  perceiver.senses.sight[self] = {x=self.x, y=self.y}
end


return Body
