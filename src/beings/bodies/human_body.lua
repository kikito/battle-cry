
local anim8      = require 'lib.anim8'
local Stateful   = require 'lib.stateful'

local Media      = require 'src.media'
local MobileBody = require 'src.beings.bodies.mobile_body'

local HumanBody = class('HumanBody', MobileBody):include(Stateful)

local function loadAnimations(self)
  self.image  = Media.images.sprite
  local g = anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight())
  self.animations = {
    walk = {
      up    = anim8.newAnimation('loop', g('2-9,1'),      0.08),
      right = anim8.newAnimation('loop', g('2-8,2', 1,2), 0.08),
      down  = anim8.newAnimation('loop', g('2-9,3'),      0.08),
      left  = anim8.newAnimation('loop', g('2-8,4', 1,4), 0.08)
    },
    idle = {
      up    = anim8.newAnimation('once', g(1,1), 1),
      right = anim8.newAnimation('once', g(1,2), 1),
      down  = anim8.newAnimation('once', g(1,3), 1),
      left  = anim8.newAnimation('once', g(1,4), 1)
    }
  }
end

function HumanBody:initialize(x,y,facing,speed)
  MobileBody.initialize(self, x,y)

  loadAnimations(self)

  self.facing = facing
  self.speed  = speed
  self:gotoState('Idle')
end

function HumanBody:draw()
  self:getCurrentAnimation():draw(self.image, self:getPosition())
end

function HumanBody:getFeetPosition()
  local x,y = self:getPosition()
  return x+16,y+26
end

local Idle = HumanBody:addState('Idle')

function Idle:update(wishes, dt)
  MobileBody.update(self, wishes, dt)
  self:prepareMove(wishes)
  if self:isMoving() then
    self:gotoState('Walking')
    self:update(wishes, dt)
  end
end

function Idle:getCurrentAnimation()
  return self.animations.idle[self.facing]
end

local Walking = HumanBody:addState('Walking')

function Walking:enteredState()
  self:getCurrentAnimation():gotoFrame(1)
end

function Walking:update(wishes, dt)
  MobileBody.update(self, wishes, dt)

  local prevFacing = self.facing

  self:prepareMove(wishes)

  if not self:isMoving() then self:gotoState('Idle') end

  local anim = self:getCurrentAnimation()
  if prevFacing == self.facing then
    anim:update(dt)
  else
    anim:gotoFrame(1)
  end

  self:move(dt)
end

function Walking:getCurrentAnimation()
  return self.animations.walk[self.facing]
end

return HumanBody
