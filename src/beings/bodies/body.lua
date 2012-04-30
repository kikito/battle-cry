local Body = class('Body')

function Body:initialize(x,y)
  self.senses = {}
  self:setPosition(x,y)
end

function Body:setPosition(x,y)
  self.x, self.y = x, y
end

function Body:getPosition()
  return self.x, self.y
end

function Body:update(wishes, dt)
  self.senses.x = self.x
  self.senses.y = self.y
end

function Body:destroy()
end

return Body
