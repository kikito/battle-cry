local Body       = require('src.beings.bodies.body')

local MobileBody = class('MobileBody', Body)

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

local diagonalCoefficient = math.sin(1)

function MobileBody:initialize(x,y)
  Body.initialize(self, x,y)
end

function MobileBody:getVelocity()
  return self.vx, self.vy
end

function MobileBody:prepareMove(wishes)
  local dx, dy = 0,0
  for dir,delta in pairs(deltasByDirection) do
    if wishes[dir] then
      dx = dx + delta[1]
      dy = dy + delta[2]
      self.facing = dir
    end
  end
  local coefficient = (dx * dy == 0) and 1 or diagonalCoefficient
  self.vx = self.speed * dx * coefficient
  self.vy = self.speed * dy * coefficient
end

function MobileBody:move(dt)
  local x, y = self:getPosition()
  local vx, vy = self:getVelocity()
  self:setPosition(x + vx*dt, y + vy*dt)
end

function MobileBody:isMoving()
  local vx, vy = self:getVelocity()
  return vx ~= 0 or vy ~= 0
end


return MobileBody
