-- this is not a class, but a mixin
-- it represents entities that can be moved


local MobileEntity = {}

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

function MobileEntity:setPosition(x,y)
  self.x, self.y = x, y
end

function MobileEntity:getPosition()
  return self.x, self.y
end

function MobileEntity:getVelocity()
  return self.vx, self.vy
end

function MobileEntity:prepareMove()
  local dx, dy = 0,0
  for dir,delta in pairs(deltasByDirection) do
    if self.want[dir] then
      dx = dx + delta[1]
      dy = dy + delta[2]
      self.facing = dir
    end
  end
  self.vx = self.speed * dx
  self.vy = self.speed * dy
end

function MobileEntity:move(dt)
  local x, y = self:getPosition()
  local vx, vy = self:getVelocity()
  self:setPosition(x + vx*dt, y + vy*dt)
end

function MobileEntity:isMoving()
  local vx, vy = self:getVelocity()
  return vx ~= 0 or vy ~= 0
end


return MobileEntity
