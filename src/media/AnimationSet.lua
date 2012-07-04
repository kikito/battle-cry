local Graphic = require 'src.media.Graphic'

local AnimationSet = class(..., Graphic)

function AnimationSet:initialize(ox,oy,image)
  Graphic.initialize(self, ox, oy, image)
  self.animations = {}
  self.currentAnimation = nil
end

function AnimationSet:add(name, animation)
  self.animations[name] = animation
end

function AnimationSet:set(name)
  self.currentAnimation = self.animations[name]
  self.currentAnimation:gotoFrame(1)
end

function AnimationSet:draw(x,y)
  self.currentAnimation:draw(self.image, x, y, 0, 1, 1, self.ox, self.oy)
end

return AnimationSet
