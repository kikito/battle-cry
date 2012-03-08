local beholder = require 'lib.beholder'

local Entity      = require 'entities.entity'
local HumanBody   = require 'entities.bodies.human_body'

local Player = class('Player', Entity)

local playerActions = {'up', 'right', 'down', 'left'}

function Player:initialize(x,y)
  Entity.initialize(self)

  beholder.group(self, function()
    for _,action in ipairs(playerActions) do
      beholder.observe('start_player_action', action, function() self.want[action] = true end)
      beholder.observe('stop_player_action',  action, function() self.want[action] = false end)
    end
  end)

  self.body = HumanBody:new(x,y, 'left', 60)
end

function Player:draw()
  self.body:draw()
end

function Player:update(dt)
  self.body:update(self.want, dt)
end

return Player
