local Being        = require 'src.beings.being'
local FollowerMind = require 'src.beings.minds.follower_mind'
local HumanBody    = require 'src.beings.bodies.human_body'

local Follower = class('Follower', Being)

function Follower:initialize(map,subject,x,y)
  Being.initialize( self,
                    FollowerMind:new(subject),
                    HumanBody:new(map,x,y,40) )
end

return Follower
