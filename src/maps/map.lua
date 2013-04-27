local Class = require 'lib.class'
local Tile = require 'src.maps.tile'
local DEFAULTS = require 'init'

local function read(filename, width, height)
  local path = 'assets.maps.' .. filename
  local map = require(path)

  local tiles = {}

  for i,v in ipairs(map.data) do
    local r, c = math.floor((i - 1) / map.width) + 1, ((i - 1) % map.width) + 1
    
    tiles[i] = Tile(
      v,
      (c - 1) * width,
      (r - 1) * height)
  end

  return tiles
end

local function buildQuads(image, tw, th, count)
  local quads = {}

  for i = 1, count do
    quads[i] = love.graphics.newQuad(
      (i - 1) * tw,
      0,
      tw,
      th,
      image:getWidth(),
      image:getHeight())
  end

  return quads
end

local function buildSpriteBatch(tiles, quads)
  local sb = love.graphics.newSpriteBatch(
    DEFAULTS.TILES.IMAGE,
    1000,
    'static')

  for _,tile in ipairs(tiles) do
    if tile.id > 0 then
      sb:bind()
      sb:addq(quads[tile.id], tile.x, tile.y)
      sb:unbind()
    end
  end

  return sb
end

local Map = Class{}
function Map:init(filename)
  self.sb = buildSpriteBatch(
    read(filename, DEFAULTS.TILES.WIDTH, DEFAULTS.TILES.HEIGHT),
    buildQuads(DEFAULTS.TILES.IMAGE, DEFAULTS.TILES.WIDTH, DEFAULTS.TILES.HEIGHT, 5))
end

function Map:draw()
  love.graphics.draw(self.sb)
end

return Map
