
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
    self:load()
  else
    self.keys = defaults.keys
  end
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

function GameConfig:load()
  local f = love.filesystem.load("config.lua")
  self.keys = (f()).keys
end

return GameConfig
