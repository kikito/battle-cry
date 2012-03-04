
local beholder = require 'lib.beholder'

local defaults = {
  keys = {
    up     = 'up',
    down   = 'down',
    left   = 'left',
    right  = 'right',
    action = ' '
  }
}

local GameConfig = class('GameConfig')

function GameConfig:initialize()
  if love.filesystem.exists("config.lua") then
    local f = love.filesystem.load("config.lua")
    self.keys = (f()).keys
  else
    self.keys = defaults.keys
  end
  self:bindActions()
end

function GameConfig:save()
  local file = love.filesystem.newFile("config.lua")
  file:open("w")
  file:write("return {\n")
  file:write("  keys = {\n")
  local buffer = {}
  for action, key in pairs(self.keys) do
    buffer[#buffer+1] = ("    %s = %q"):format(action, key)
  end
  file:write(table.concat(buffer, ",\n"))
  file:write("\n  }\n")
  file:write("}\n")
  file:close()
end

function GameConfig:setKey(action, key)
  self.keys[action] = key
  self:bindActions()
end

function GameConfig:bindActions()
  beholder.stopObserving(self)
  beholder.group(self, function()
    for action, key in pairs(self.keys) do
      beholder.observe('keypressed', key, function()
        beholder.trigger('startaction', action)
      end)
      beholder.observe('keyreleased', key, function()
        beholder.trigger('stopaction', action)
      end)
    end
  end)
end

return GameConfig
