local Body       = require('src.beings.bodies.Body')

local MobileBody = class(..., Body)

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

local diagonalCoefficient = math.sin(1)

function MobileBody:initialize(map,x,y,width,height,speed)
  Body.initialize(self,map,x,y,width,height)
  self.speed = speed
  self.facing = "up"
end

function MobileBody:collide(other, dx, dy)
  self.x = self.x + dx
  self.y = self.y + dy
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
  return self.x - self.halfWidth,
         self.y - self.halfHeight,
         self.width,
         self.height
end

local function canPass(self,x,y)
  return self.map:getCell(x,y).tile:isPassableBy(self)
end

function MobileBody:move(dt)
  self.x = self.x + self.vx * dt
  self.y = self.y + self.vy * dt
end

function MobileBody:isMoving()
  return self.vx ~= 0 or self.vy ~= 0
end


return MobileBody
