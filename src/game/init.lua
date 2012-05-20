local require_tree = require 'lib.require_tree'

local Game = require 'src.game.game'
require_tree('src.game.states')
return Game
