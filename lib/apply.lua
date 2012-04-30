local Apply = { static = {} }

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

function Apply.static:applyMethodSafely(method, ...)
  applyMethod(clone(self._instances), method, ...)
end

function Apply.static:applyMethod(method, ...)
  applyMethod(self._instances, method, ...)
end

function Apply.static:addInstance(instance)
  add(instance, self)
end

function Apply.static:removeInstance(instance)
  remove(instance, self)
end

return Apply
