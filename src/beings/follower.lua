local Being        = require 'src.beings.being'
local FollowerMind = require 'src.beings.minds.follower_mind'
local HumanBody    = require 'src.beings.bodies.human_body'

local Follower = class('Follower', Being)

function Follower:initialize(subject, x,y)
  Being.initialize( self,
                    FollowerMind:new(subject),
                    HumanBody:new(x,y, 'left', 40) )
end

return Follower
