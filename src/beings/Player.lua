local Being  = require 'src.beings.Being'
local minds  = require 'src.beings.minds'
local bodies = require 'src.beings.bodies'

local Player = class('Player', Being)

function Player:initialize(map, x,y)
  Being.initialize(self, minds.PlayerMind:new(), bodies.HumanBody:new(map,x,y,60))
end

return Player
