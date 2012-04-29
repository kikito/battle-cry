local require_dir = require 'lib.require_dir'

local Game       = require 'src.game.game'
require_dir('src/game/states')
return Game
