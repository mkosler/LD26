local Map = require 'src.maps.map'
local Player = require 'src.entities.player'
local Manager = require 'src.manager'

local Play = {}

function Play:init()
end

function Play:enter(prev)
  self.map = Map('1')
  self.player = Player(16, 16)
end

function Play:update(dt)
  Manager.map('update', dt)
end

function Play:draw()
  self.map:draw()
  Manager.map('draw')
end

function Play:keypressed(k, c)
  Manager.map('keypressed', k, c)
end

function Play:keyreleased(k, c)
  Manager.map('keyreleased', k, c)
end

return Play
