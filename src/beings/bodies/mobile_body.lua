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

function MobileBody:getBlocks()
  local x,y,w,h = self:getBoundingBox()
  local tl, tr, bl, br = self.map:getContainingTiles(x,y,w,h)
  local tlp, trp, blp, brp =
    tl:isPassableBy(self),
    tr:isPassableBy(self),
    bl:isPassableBy(self),
    br:isPassableBy(self)

  return not(trp and brp), -- rightBlock
         not(tlp and blp), -- leftBlock
         not(trp and tlp), -- topBlock
         not(brp and blp)  -- bottomBlock
end

function MobileBody:move(dt)
  local tile = self.map:getContainingTile(self.x, self.y)

  self.x = self.x + self.vx*dt
  self.y = self.y + self.vy*dt

  local rBlock, lBlock, tBlock, bBlock = self:getBlocks()

  if     self.vx > 0 and rBlock then
    self.x = tile.right - self.halfWidth - 1
  elseif self.vx < 0 and lBlock then
    self.x = tile.left + self.halfWidth + 1
  end

  if     self.vy > 0 and bBlock then
    self.y = tile.bottom - self.halfHeight - 1
  elseif self.vy < 0 and tBlock then
    self.y = tile.top + self.halfHeight + 1
  end

end

function MobileBody:isMoving()
  return self.vx ~= 0 or self.vy ~= 0
end


return MobileBody
