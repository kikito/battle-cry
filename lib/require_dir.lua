local function toRequirePath(fsPath)
  return fsPath:gsub('%.lua$',''):gsub('/','.')
end


-- public functions

return function(dirPath)
  local fileNames = love.filesystem.enumerate(dirPath)
  for _,fileName in ipairs(fileNames) do
    require(toRequirePath(dirPath .. '.' .. fileName))
  end
end
