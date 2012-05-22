local floor = math.floor

local Cell = require 'src.world.Cell'

local Grid = class(..., nil)

function Grid:initialize(width, height, cellWidth, cellHeight)
  self.width, self.height          = width, height
  self.cellWidth, self.cellHeight  = cellWidth, cellHeight
  self.cellsByItem = setmetatable({}, {__mode = "k"})

  self.cells = {}

  local left, top
  for x=1,width do
    self.cells[x] = {}
    for y=1,height do
      left, top        = self:toWorld(x,y)
      self.cells[x][y] = Cell:new(left, top, cellWidth, cellHeight)
    end
  end
end

local function padNumber(x,min,max)
  return x < min and min or (x > max and max or x)
end

function Grid:pad(gx,gy)
  return padNumber(gx, 1, self.width), padNumber(gy, 1, self.height)
end

function Grid:eachCell(f, wl, wt, ww, wh)

  local l,t,r,b

  if wl and wt and ww and wh then
    l, t = self:pad(self:toGrid(wl, wt))
    r, b = self:pad(self:toGrid(wl + ww, wt + wh))
  else
    l, t, r, b = 1, 1, self.width, self.height
  end

  for x = l, r do
    for y = t, b do
      f(x, y, self.cells[x][y])
    end
  end

end

function Grid:getCell(wx,wy)
  local gx,gy = self:toGrid(wx,wy)
  return self.cells[gx][gy]
end

function Grid:toWorld(gx,gy)
  return (gx-1) * self.cellWidth, (gy-1) * self.cellHeight
end

function Grid:toWorldCentered(gx,gy)
  return (gx-0.5) * self.cellWidth, (gy-0.5) * self.cellHeight
end

function Grid:toGrid(wx, wy)
  return floor(wx / self.cellWidth) + 1, floor(wy / self.cellHeight) + 1
end

function Grid:getBoundary()
  local w, h = self:toWorld(self.width + 1, self.height + 1)
  return 0, 0, w - 1, h - 1
end

function Grid:addItem(item)
  local cell = self:getCell(item.x, item.y)
  cell:addItem(item)
  self.cellsByItem[item] = cell
  return cell
end

function Grid:removeItem(item)
  local cell = self:getCell(item.x, item.y)
  cell:removeItem(item)
  self.cellsByItem[item] = nil
  return cell
end

function Grid:updateItem(item)
  local cell = self.cellsByItem[item]
  local newCell = self:getCell(item.x, item.y)
  if cell ~= newCell then
    if cell then cell:removeItem(item) end
    newCell:addItem(item)
    self.cellsByItem[item] = newCell
    return newCell
  end
  return cell
end

return Grid
