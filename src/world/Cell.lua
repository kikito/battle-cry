local Cell = class(..., nil)

local itemsMt = {__mode = "k"}

function Cell:initialize(left, top, width, height)
  self.left, self.top, self.width, self.height = left, top, width, height
  self.right, self.bottom = left + width, top + height
  self.items = setmetatable({}, itemsMt)
end

function Cell:getBoundingBox()
  return self.left, self.top, self.width, self.height
end

function Cell:addItem(item)
  self.items[item] = true
end

function Cell:removeItem(item)
  self.items[item] = nil
end

return Cell
