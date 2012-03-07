local anim8    = require 'lib.anim8'
local beholder = require 'lib.beholder'
local Stateful = require 'lib.stateful'

local inspect = require 'lib.inspect'

local Game         = require 'game'
local Entity       = require 'entities.entity'
local MobileEntity = require 'entities.mobile_entity'

local Player = class('Player', Entity):include(Stateful, MobileEntity)

local playerActions =    {'up', 'right', 'down', 'left'}

local function loadAnimations(self)
  self.image  = Game.media.images.sprite
  local g = anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight())
  self.animations = {
    walk = {
      up    = anim8.newAnimation('loop', g('2-8,1'),      0.1),
      right = anim8.newAnimation('loop', g('2-8,2', 1,2), 0.08),
      down  = anim8.newAnimation('loop', g('2-8,3'),      0.1),
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

function Player:initialize(x,y)
  Entity.initialize(self)

  loadAnimations(self)

  beholder.group(self, function()
    for _,action in ipairs(playerActions) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)

  self:setPosition(x,y)
  self.speed = 60

  self.facing   = 'left'
  self:gotoState('Idle')
end

function Player:draw()
  self:getCurrentAnimation():draw(self.image, self:getPosition())
end


local Idle = Player:addState('Idle')

function Idle:update(dt)
  self:prepareMove()
  if self:isMoving() then
    self:gotoState('Walking')
    self:update(dt)
  end
end

function Idle:getCurrentAnimation()
  return self.animations.idle[self.facing]
end

local Walking = Player:addState('Walking')

function Walking:enteredState()
  self:getCurrentAnimation():gotoFrame(1)
end

function Walking:update(dt)
  local prevFacing = self.facing

  self:prepareMove()

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

return Player
