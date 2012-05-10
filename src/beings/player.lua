local Being       = require 'src.beings.being'
local PlayerMind  = require 'src.beings.minds.player_mind'
local HumanBody   = require 'src.beings.bodies.human_body'

local Player = class('Player', Being)

function Player:initialize(map, x,y)
  Being.initialize(self, PlayerMind:new(), HumanBody:new(map,x,y,60))
end

return Player
