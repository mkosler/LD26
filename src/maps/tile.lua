local Class = require 'lib.class'
local DEFAULTS = require 'init'
local Bump = require 'lib.bump'

local Tile = Class{}
function Tile:init(x, y)
  self.x = x
  self.y = y
  self.width = DEFAULTS.TILES.WIDTH
  self.height = DEFAULTS.TILES.HEIGHT

  Bump.add(self)
end

function Tile:getBBox()
  return self.x, self.y, self.width, self.height
end

local EmptyTile = Class{ __includes = Tile }
function EmptyTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 0
  self.name = 'EMPTY'
end

local UpTile = Class{ __includes = Tile }
function UpTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 1
  self.name = 'UP'
end

local LeftTile = Class{ __includes = Tile }
function LeftTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 2
  self.name = 'LEFT'
end

local DownTile = Class{ __includes = Tile }
function DownTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 3
  self.name = 'DOWN'
end

local RightTile = Class{ __includes = Tile }
function RightTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 4
  self.name = 'RIGHT'
end

local SpaceTile = Class{ __includes = Tile }
function SpaceTile:init(x, y)
  Tile.init(self, x, y)

  self.id = 5
  self.name = 'SPACE'
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
