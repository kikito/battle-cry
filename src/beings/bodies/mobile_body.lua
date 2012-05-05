local Body       = require('src.beings.bodies.body')

local MobileBody = class('MobileBody', Body)

local deltasByDirection = {
  up   =  { 0, -1 },
  down =  { 0,  1 },
  left =  {-1,  0 },
  right = { 1,  0 }
}

local diagonalCoefficient = math.sin(1)

function MobileBody:initialize(map,x,y,width,height)
  Body.initialize(self,map,x,y)
  self.width = width
  self.height = height
  self.halfWidth = width/2
  self.halfHeight = height/2
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
  return self.map:getContainingTile(x,y):isPassableBy(self)
end

function MobileBody:move(dt)

  local vx, vy = self.vx, self.vy

  if vx == 0 and vy == 0 then return end

  local dx, dy = vx * dt, vy * dt
  local w2,h2 = self.halfWidth, self.halfHeight
  local tile = nil
  local x,y,w,h = self:getBoundingBox()

  if vx ~= 0 then -- moving left or right
    local futureX = x + dx + (vx > 0 and w or 0)
    if canPass(self, futureX, y) and canPass(self, futureX, y + h) then
      self.x = self.x + dx
    else
      tile = self:getContainingTile()
      self.x = vx > 0 and (tile.right - w2 - 1) or (tile.left + w2)
    end
  end

  if vy ~= 0 then -- moving up or down
    local futureY = y + dy + (vy > 0 and h or 0)
    if canPass(self, x, futureY) and canPass(self, x + w, futureY) then
      self.y = self.y + dy
    else
      tile = tile or self:getContainingTile()
      self.y = vy > 0 and (tile.bottom - h2 - 1) or (tile.top + h2)
    end
  end
  -- TODO: this might not work when impacting one diagonal precisely through its corner

end

function MobileBody:isMoving()
  return self.vx ~= 0 or self.vy ~= 0
end


return MobileBody
