local Graphic = class(..., nil)

function Graphic:new(ox, oy, image)
  self.ox, self.oy, self.image = ox, oy, image
end

function Graphic:draw(x,y)
  love.graphics.draw(self.image, x, y, 0, 1, 1, self.ox, self.oy)
end

return Graphic
