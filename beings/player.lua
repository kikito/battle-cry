local Being       = require 'beings.being'
local PlayerMind  = require 'beings.minds.player_mind'
local HumanBody   = require 'beings.bodies.human_body'

local Player = class('Player', Being)

function Player:initialize(x,y)
  Being.initialize(self, PlayerMind:new(), HumanBody:new(x,y, 'left', 60))
end

return Player
