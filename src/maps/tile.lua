local Class = require 'lib.class'
local DEFAULTS = require 'init'

local EmptyTile = Class{}
function EmptyTile:init(x, y)
  self.id = 0

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local UpTile = Class{}
function UpTile:init(x, y)
  self.id = 1

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local LeftTile = Class{}
function LeftTile:init(x, y)
  self.id = 2

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local DownTile = Class{}
function DownTile:init(x, y)
  self.id = 3

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local RightTile = Class{}
function RightTile:init(x, y)
  self.id = 4

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local SpaceTile = Class{}
function SpaceTile:init(x, y)
  self.id = 5

  self.x = x
  self.y = y

  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT
end

local function factory(tn, x, y)
  if tn == 0 then
    return EmptyTile(x, y)
  elseif tn == 1 then
    return UpTile(x, y)
  elseif tn == 2 then
    return LeftTile(x, y)
  elseif tn == 3 then
    return DownTile(x, y)
  elseif tn == 4 then
    return RightTile(x, y)
  elseif tn == 5 then
    return SpaceTile(x, y)
  else
    error('Unknown tile type')
  end
end

return factory
