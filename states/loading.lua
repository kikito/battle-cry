local loader = require 'lib.love-loader'

local Game = require 'game'
local Loading = Game:addState('Loading')

function readMediaList(f, holder, folder)
  local lfs = love.filesystem
  local fileNames = lfs.enumerate(folder)
  for i,fileName in ipairs(fileNames) do
    local path  = folder.."/".. fileName
    if lfs.isFile(path) then
      local name = fileName:match("(.+)%.") -- transforms "file.png" into "file"
      f(holder, name, path)
    end
  end
end

function Loading:enteredState()
  self:log('Entered Loading')
  Game.static.media = {
    images  = {}
  }
  readMediaList(loader.newImage, Game.media.images, 'media/images')

  loader.start(function() self:gotoState("MainMenu") end)
end

function Loading:update()
  loader.update()
end

return Loading
