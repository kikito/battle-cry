local bump        = require 'lib.bump'
local bump_debug  = require 'lib.bump_debug'
local camera      = require 'lib.camera'

local Player      = require 'src.beings.Player'
local Follower    = require 'src.beings.Follower'
local Ptero       = require 'src.beings.Ptero'
local Ghost       = require 'src.beings.Ghost'
local Being       = require 'src.beings.Being'
local Map         = require 'src.world.Map'
local Tile        = require 'src.world.tiles.Tile'

local Game        = require 'src.game.Game'
local Play        = Game:addState('Play')

local map
local player

function bump.collision(obj1,obj2,dx,dy)
  obj1:collision(obj2,dx,dy)
  obj2:collision(obj1,-dx,-dy)
end

function bump.endCollision(obj1,obj2)
  obj1:endCollision(obj2)
  obj2:endCollision(obj1)
end

function bump.shouldCollide(obj1,obj2)
  return obj1:shouldCollide(obj2) or obj2:shouldCollide(obj1)
end

function Play:enteredState()
  bump.initialize(16)
  map    = Map:new()
  camera.setBoundary(map:getBoundary())
  player = Player:new(map, 4, 4)
  Follower:new(map, player.body, 20, 20)
  Ptero:new(map, player.body, 20, 4)
  Ghost:new(map, player.body, 26, 36)
end

function Play:exitedState()
  map, player = nil, nil
  Being:safeEach('destroy')
  Tile:safeEach('destroy')
end

local function sortForDrawing(a,b)
  if a.z == b.z then
    local _,ay = a:getCenter()
    local _,by = b:getCenter()
    return ay < by
  end
  return a.z < b.z
end

function Play:draw()
  camera.draw(function(l,t,w,h)
    local objects, length = bump.collect(wl, wt, ww, wh)
    table.sort(objects, sortForDrawing)
    for i=1, length do objects[i]:draw() end
    bump_debug.draw(l,t,w,h)
  end)
end

function Play:update(dt)
  Being:updateAll(dt)
  bump.collide(camera.getViewport())
  camera.lookAt(player.body.x, player.body.y)
end

function Play:escape()
  self:gotoState("MainMenu")
end

return Play
