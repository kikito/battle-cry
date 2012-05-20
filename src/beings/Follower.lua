local Being  = require 'src.beings.Being'
local minds  = require 'src.beings.minds'
local bodies = require 'src.beings.bodies'

local Follower = class('Follower', Being)

function Follower:initialize(map,subject,x,y)
  Being.initialize( self,
                    minds.FollowerMind:new(subject),
                    bodies.HumanBody:new(map,x,y,40) )
end

return Follower
