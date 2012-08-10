
local bump = require 'lib.bump'
local Body = require 'src.beings.bodies.Body'
local Wall = require 'src.world.tiles.Wall'
local Hole = require 'src.world.tiles.Hole'

local bump_debug = {}

-- transform grid coords into world coords
local function _getCellBBox(gx,gy)
  local cellSize = bump.getCellSize()
  return (gx - 1)*cellSize, (gy-1)*cellSize, cellSize, cellSize
end

local function _drawCell(cell, gx, gy)
  local l,t,w,h = _getCellBBox(gx,gy)
  local cx,cy = l+w*.5, t+h*.5
  love.graphics.printf(cell.itemCount, l,cy-8, w, "center")
end

local function _drawItemBBox(item)
  if instanceOf(Body, item)
  or instanceOf(Wall, item)
  or instanceOf(Hole, item)
  then
    love.graphics.rectangle("line", item:getBBox())
  end
end

function bump_debug.draw(l,t,w,h)
  love.graphics.setColor(255,255,255)
  bump.eachCell(_drawCell, l,t,w,h)
  bump.each(_drawItemBBox)
end

return bump_debug
