local Game     = require 'game'
local Menu     = require 'lib.menu'
local MainMenu = require 'states.main_menu'

local KeyboardMenu = Game:addState('KeyboardMenu', MainMenu)

function KeyboardMenu:enteredState()
  self:log('Entering Keyboard')

  local menuOptions = {}

  local actions = { 'up', 'down', 'left', 'right', 'action' }

  for i=1,#actions do
    local action = actions[i]
    local key = self.config.keys[action]
    menuOptions[#menuOptions + 1] = {
      ("%s (%s)"):format(action, key),
      function()
        self.modifiedAction = action
        self:gotoState("ChoosingKey")
      end
    }
  end
  menuOptions[#menuOptions + 1] = { 'Back', function() self:gotoState('OptionsMenu') end }

  self.menu = Menu:new(menuOptions)
end

function KeyboardMenu:escape()
  self:gotoState('OptionsMenu')
end

return KeyboardMenu
