local Map = require 'src.maps.map'

local Play = {}

function Play:init()
end

function Play:enter(prev)
  self.map = Map('1')
end

function Play:update(dt)
end

function Play:draw()
  self.map:draw()
end

function Play:keypressed(k, c)
end

function Play:keyreleased(k, c)
end

return Play
