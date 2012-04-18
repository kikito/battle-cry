local Entity      = require 'entities.entity'
local PlayerMind  = require 'entities.minds.player_mind'
local HumanBody   = require 'entities.bodies.human_body'

local Player = class('Player', Entity)

function Player:initialize(x,y)
  Entity.initialize(self, PlayerMind:new(), HumanBody:new(x,y, 'left', 60))
end

return Player
