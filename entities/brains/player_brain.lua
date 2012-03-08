local beholder = require 'lib.beholder'

local Brain       = require 'entities.brains.brain'
local PlayerBrain = class('PlayerBrain', Brain)

function PlayerBrain:initialize()
  Brain.initialize(self)

  beholder.group(self, function()
    for _,action in ipairs({'up','down','right','left'}) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)

end

function PlayerBrain:destroy()
  beholder.stopObserving(self)
end

return PlayerBrain
