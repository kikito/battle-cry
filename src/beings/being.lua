local Apply    = require 'lib.apply'
local beholder = require 'lib.beholder'

local Being = class('Entity'):include(Apply)

function Being.static:drawAll()
  self:applyMethod('draw')
end

function Being.static:updateAll(dt)
  self:applyMethodSafely('update', dt)
end

function Being.static:destroyAll()
  self:applyMethodSafely('destroy')
end

--------------------------------------

function Being:initialize(mind, body)
  self.mind = mind
  self.body = body
  self.class:addInstance(self)
end

function Being:destroy()
  self.class:removeInstance(self)
  self.body:destroy()
  self.mind:destroy()
end

function Being:draw()
  self.body:draw()
end

function Being:update(dt)
  self.mind:update(self.body.senses, dt)
  self.body:update(self.mind.wishes, dt)
end

return Being
