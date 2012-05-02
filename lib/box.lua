local box = {}

local function min(a,b)
  return a < b and a or b
end

local function max(a,b)
  return a > b and a or b
end

local function pad(n,min,max)
  return n < min and min or n > max or max or n
end

-- returns true if a and b itersect
function box.intersect(ax,ay,aw,ah, bx,by,bw,bh)
  return ax      < bx + bw and
         ax + aw > bx      and
         ay      < by + bh and
         ay + ah > by
end

-- returns the geometric center of b
function box.center(x,y,w,h)
  return x + w/2, y + h/2
end

-- returns a box containing the two given boxes
function box.union(ax,ay,aw,ah, bx,by,bw,bh)
  local x, y = min(ax, bx), min(ay, by)
  return x, y, max(ax+aw, bx+bw) - x, max(ay+ah, bx+bh) - y
end

-- returns box b "moved" so "a" contains it
function box.pad(ax,ay,aw,ah, bx,by,bw,bh)
  local x,y = bx, by

  return pad(bx, ax, ax+aw-bw),
         pad(by, ay, ay+ah-bh),
         bw, bh
end

return box
