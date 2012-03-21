local beholder = require 'lib.beholder'

local Entity = class('Entity')

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

function Entity.static:applyMethodSafely(method, ...)
  applyMethod(clone(self._instances), method, ...)
end

function Entity.static:applyMethod(method, ...)
  applyMethod(self._instances, method, ...)
end

function Entity.static:drawAll()
  self:applyMethod('draw')
end

function Entity.static:updateAll(dt)
  self:applyMethodSafely('update', dt)
end

function Entity.static:destroyAll()
  self:applyMethodSafely('destroy')
end

--------------------------------------

function Entity:initialize(body)
  self.body = body
  self.want = {}
  add(self, self.class)
end

function Entity:destroy()
  remove(self, self.class)
  self.body:destroy()
end

function Entity:draw()
  self.body:draw()
end

function Entity:update(dt)
  self.body:update(self.want, dt)
end

return Entity
