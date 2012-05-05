local Apply = require 'lib.apply'

local Body = class('Body'):include(Apply)

function Body:initialize(map, x,y)
  self.senses = {}
  self.map = map
  self.x, self.y = x,y
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
  local myTile, hisTile = self:getContainingTile(), perceiver:getContainingTile()
  if self.map:los(hisTile.x, hisTile.y, myTile.x, myTile.y) then
    perceiver.senses.sight[self] = {x=self.x, y=self.y}
  end
end


return Body
