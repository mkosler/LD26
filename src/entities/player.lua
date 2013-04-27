local Class = require 'lib.class'
local Entity = require 'src.entities.entity'
local DEFAULTS = require 'init'
local Vector = require 'lib.vector'
local Bump = require 'lib.bump'

local Player = Class{ __includes = Entity }
function Player:init(x, y)
  Entity.init(self)

  self.image = DEFAULTS.PLAYER.IMAGE
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  self.position = Vector(x, y)
  self.velocity = Vector(DEFAULTS.PLAYER.VELOCITY.X, DEFAULTS.PLAYER.VELOCITY.Y)

  self.angle = 0

  self.controls = {
    UP = { flag = false, angle = math.pi / 2 },
    LEFT = { flag = false, angle = math.pi },
    DOWN = { flag = false, angle = 3 * math.pi / 2 },
    RIGHT = { flag = false, angle = 0 },
    SPACE = { flag = false },
  }

  Bump.add(self)
end

function Player:getBBox()
  local x, y = self.position:unpack()
  return x, y, self.width, self.height
end

function Player:collision(o, dx, dy)
  if self.controls[o.name] and self.controls[o.name].flag then
    if o.name == 'SPACE' then
    else
      self.angle = self.controls[o.name].angle
      self.velocity:rotate_inplace(self.angle)
    end
  end
end

function Player:endCollision(o)
end

function Player:update(dt)
  self.position = self.position + (self.velocity * dt)
end

function Player:draw()
  local x, y = self.position:unpack()
  love.graphics.draw(self.image, x, y, self.angle, 1, 1, self.width / 2, self.height / 2)
end

function Player:keypressed(k, c)
  print('Player:keypressed', k, c)

  for control,v in pairs(DEFAULTS.PLAYER.CONTROLS) do
    for _,w in ipairs(v) do
      if k == w then
        print('Flagging!', control)
        self.controls[control].flag = true
      end
    end
  end
end

function Player:keyreleased(k, c)
  for control,v in pairs(DEFAULTS.PLAYER.CONTROLS) do
    for _,w in ipairs(v) do
      if k == w then
        self.controls[control].flag = false
      end
    end
  end
end

return Player
