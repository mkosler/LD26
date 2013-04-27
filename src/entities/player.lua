local Class = require 'lib.class'
local Entity = require 'src.entities.entity'

local Player = Class{ __includes = Entity }
function Player:init(x, y, width, height)
  Entity.init(self)

  self.x = x
  self.y = y

  -- Temporary
  self.color = { 255, 0, 0 }
end

function Player:draw()
  -- Temporary
  love.graphics.setColor(self.color)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
