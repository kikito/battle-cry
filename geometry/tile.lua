local Tile = class('Tile')

function Tile:initialize(image, quad)
  self.image = image
  self.quad = quad
end

function Tile:draw(x,y)
  love.graphics.drawq(self.image, self.quad, x,y)
end
