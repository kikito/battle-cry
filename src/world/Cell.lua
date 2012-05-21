local Cell = class(..., nil)

function Cell:initialize(left, top, width, height)
  self.left, self.top, self.width, self.height = left, top, width, height
  self.right, self.bottom = left + width, top + height
end

function Cell:getBoundingBox()
  return self.left, self.top, self.width, self.height
end


return Cell
