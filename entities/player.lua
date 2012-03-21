
local Entity      = require 'entities.entity'
local HumanBody   = require 'entities.bodies.human_body'
local PlayerMind  = require 'entities.minds.player_mind'

local Player = class('Player', Entity)

function Player:initialize(x,y)
  Entity.initialize(self,
    PlayerMind:new(),
    HumanBody:new(x,y, 'left', 60)
  )
end

return Player
