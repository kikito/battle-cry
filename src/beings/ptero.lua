local Being         = require 'src.beings.being'
local FollowerMind  = require 'src.beings.minds.follower_mind'
local FlyerBody     = require 'src.beings.bodies.flyer_body'

local Ptero = class('Ptero', Being)

function Ptero:initialize(map, subject, x,y)
  Being.initialize(self, FollowerMind:new(subject), FlyerBody:new(map,x,y,60))
end

return Ptero
