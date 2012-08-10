local Body       = require('src.beings.bodies.Body')

local MobileBody = class(..., Body)

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

local diagonalCoefficient = math.sin(1)


local function sign(x) return x > 0 and 1 or (x < 0 and -1 or 0) end
local function mustStop(v,d) return d ~= 0 and sign(d) ~= sign(v) end


function MobileBody:initialize(map,x,y,width,height,speed)
  Body.initialize(self,map,x,y,width,height)
  self.speed = speed
  self.facing = "up"
end



function MobileBody:collision(other, dx, dy)
  if mustStop(self.vx, dx) then self.vx = 0 end
  if mustStop(self.vy, dy) then self.vy = 0 end
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
