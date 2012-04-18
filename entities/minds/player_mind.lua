local beholder    = require 'lib.beholder'
local Mind        = require 'entities.minds.mind'

local PlayerMind = class('PlayerMind', Mind)

function PlayerMind:initialize()
  Mind.initialize(self)

  beholder.group(self, function()
    for _,action in ipairs({'up','down','right','left'}) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)
end

function PlayerMind:destroy()
  beholder.stopObserving(self)
end

return PlayerMind
