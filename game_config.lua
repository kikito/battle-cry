
local defaults = {
  keys = {
    up     = 'up',
    down   = 'down',
    left   = 'left',
    right  = 'right',
    action = 'space'
  }
}

local GameConfig = class('GameConfig')

function GameConfig:initialize()
  self.keys = defaults.keys
end

return GameConfig
