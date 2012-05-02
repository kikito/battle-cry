local Body       = require('src.beings.bodies.body')

local MobileBody = class('MobileBody', Body)

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

local diagonalCoefficient = math.sin(1)

function MobileBody:initialize(map,x,y)
  Body.initialize(self,map,x,y)
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
  self.vx, self.vy = self.speed * dx, self.speed * dy
  if dx ~= 0 and dy ~= 0 then
    self.vx, self.vy = self.vx * diagonalCoefficient, self.vy * diagonalCoefficient
  end
end

function MobileBody:getBoundingBox()
  return 0,0,0,0
end

function MobileBody:move(dt)
  local vx, vy = self:getVelocity()
  local x, y = self:getPosition()
  local x2,y2 = x + vx*dt, y + vy*dt

  local bx,by,w,h = self:getBoundingBox()
  local ul, ur, dl, dr = self.map:getContainingTiles(bx,by,w,h)

  if     vx > 0 and not (dr:isPassableBy(self) and ur:isPassableBy(self)) then
    x2 = ur:worldLeft() - w/2 - 1
  elseif vx < 0 and not (dl:isPassableBy(self) and ul:isPassableBy(self)) then
    x2 = ul:worldRight() + w/2 + 1
  end

  if     vy > 0 and not (dr:isPassableBy(self) and dl:isPassableBy(self)) then
    y2 = dr:worldTop() - h/2 - 1
  elseif vy < 0 and not (ur:isPassableBy(self) and ul:isPassableBy(self)) then
    y2 = ur:worldBottom() + h/2 + 1
  end

  self:setPosition(x2, y2)
end

function MobileBody:isMoving()
  local vx, vy = self:getVelocity()
  return vx ~= 0 or vy ~= 0
end


return MobileBody
