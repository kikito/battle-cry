local anim8    = require 'lib.anim8'
local beholder = require 'lib.beholder'
local Stateful = require 'lib.stateful'

local inspect = require 'lib.inspect'

local Game   = require 'game'
local Entity = require 'entities.entity'

local Player = class('Player', Entity):include(Stateful)

local playerActions =    {'up', 'right', 'down', 'left'}
local playerDirections = {'up', 'right', 'down', 'left'}

function Player:initialize(x,y)
  Entity.initialize(self)

  self.x, self.y = x,y

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
  self.want     = {}

  beholder.group(self, function()
    for _,action in ipairs(playerActions) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)

  self.facing   = 'left'
  self:gotoState('Idle')
end

function Player:draw()
  local animation = self:getCurrentAnimation(self)
  animation:draw(self.image, self.x, self.y)
  love.graphics.print(animation.position, self.x, self.y + 40)
  love.graphics.print(self.facing, self.x, self.y + 60)
end


local Idle = Player:addState('Idle')

function Idle:update(dt)
  for _,action in ipairs(playerActions) do
    if self.want[action] then
      self:gotoState('Walking')
    end
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
  local prevStatus, prevFacing = self.status, self.facing

  local moving = false
  for _,dir in ipairs(playerDirections) do
    if self.want[dir] then
      self.facing = dir
      moving = true
    end
  end
  if not moving then self:gotoState('Idle') end

  local anim = self:getCurrentAnimation()
  if prevFacing == self.facing then
    anim:update(dt)
  else
    anim:gotoFrame(1)
  end
end

function Walking:getCurrentAnimation()
  return self.animations.walk[self.facing]
end

return Player
