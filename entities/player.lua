local beholder    = require 'lib.beholder'
local Entity      = require 'entities.entity'
local HumanBody   = require 'entities.bodies.human_body'

local Player = class('Player', Entity)

function Player:initialize(x,y)
  Entity.initialize(self, HumanBody:new(x,y, 'left', 60))

  beholder.group(self, function()
    for _,action in ipairs({'up','down','right','left'}) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)
end

function Player:destroy()
  beholder.stopObserving(self)
end

return Player
