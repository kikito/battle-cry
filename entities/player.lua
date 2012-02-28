local anim8    = require 'lib.anim8'
local beholder = require 'lib.beholder'

local inspect = require 'lib.inspect'

local Game   = require 'game'
local Entity = require 'entities.entity'

local Player = class('Player', Entity)

function Player:initialize(x,y)
  Entity.initialize(self)

  self.x, self.y = x,y

  self.image  = Game.media.images.sprite
  local g = anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight())
  self.animations = {
    walk = {
      up    = anim8.newAnimation('loop', 0.1,  g('2-8,1')),
      right = anim8.newAnimation('loop', 0.08, g('2-8,2', 1,2)),
      down  = anim8.newAnimation('loop', 0.1,  g('2-8,3')),
      left  = anim8.newAnimation('loop', 0.08, g('2-8,4', 1,4))
    },
    idle = {
      up    = anim8.newAnimation('once', 0.1,  g(1,1)),
      right = anim8.newAnimation('once', 0.1,  g(1,2)),
      down  = anim8.newAnimation('once', 0.1,  g(1,3)),
      left  = anim8.newAnimation('once', 0.1,  g(1,4))
    }
  }
  self.status   = 'idle'
  self.facing   = 'left'
  self.want     = {}

  local ids = {}
  for _,dir in ipairs({'up','right','down','left'}) do
    ids[#ids+1] = beholder.observe('keypressed', dir, function() self.want[dir] = true end)
    ids[#ids+1] = beholder.observe('keyreleased', dir, function() self.want[dir] = false end)
  end
  self.ids = ids
end

local function getCurrentAnimation(self)
  return self.animations[self.status][self.facing]
end

function Player:draw()
  local animation = getCurrentAnimation(self)
  animation:draw(self.image, self.x, self.y)
  love.graphics.print(animation.position, self.x, self.y + 40)
  love.graphics.print(self.facing, self.x, self.y + 60)
end

function Player:update(dt)
  local prevStatus, prevFacing = self.status, self.facing

  self.status = 'idle'
  local facing = self.facing
  for _,dir in ipairs({'up','right','down','left'}) do
    if self.want[dir] then
      self.facing = dir
      self.status = 'walk'
    end
  end

  local animation = getCurrentAnimation(self)
  if prevStatus ~= self.status or prevFacing ~= self.facing then
    animation:gotoFrame(1)
  else
    animation:update(dt)
  end
end


function Player:destroy()
  for _,id in ipairs(self.ids) do
    beholder.stopObserving(id)
  end
  Entity.destroy(self)
end

return Player
