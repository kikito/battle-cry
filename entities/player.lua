
local Entity      = require 'entities.entity'
local HumanBody   = require 'entities.bodies.human_body'
local PlayerBrain = require 'entities.brains.player_brain'

local Player = class('Player', Entity)

function Player:initialize(x,y)
  Entity.initialize(self,
    PlayerBrain:new(),
    HumanBody:new(x,y, 'left', 60)
  )
end

return Player
