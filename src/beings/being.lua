local beholder = require 'lib.beholder'

local Being = class('Entity')

local function clone(t)
  local result = {}
  for k,v in pairs(t) do result[k] = v end
  return result
end

local function add(instance, klass)
  if klass ~= Object then
    add(instance, klass.super)
    klass._instances = klass._instances or {}
    klass._instances[instance] = 1
  end
end

local function remove(instance, klass)
  if klass ~= Object then
    klass._instances[instance] = nil
    remove(instance, klass.super)
  end
end

local function applyMethod(collection, method, ...)
  for instance,_ in pairs(collection) do
    instance[method](instance, ...)
  end
end

function Being.static:applyMethodSafely(method, ...)
  applyMethod(clone(self._instances), method, ...)
end

function Being.static:applyMethod(method, ...)
  applyMethod(self._instances, method, ...)
end

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
  add(self, self.class)
end

function Being:destroy()
  remove(self, self.class)
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
