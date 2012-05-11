local Being         = require 'src.beings.being'
local ScaredMind    = require 'src.beings.minds.scared_mind'
local PteroBody     = require 'src.beings.bodies.ptero_body'

local Ptero = class('Ptero', Being)

function Ptero:initialize(map, subject, x,y)
  Being.initialize(self, ScaredMind:new(subject), PteroBody:new(map,x,y,40))
end

return Ptero
