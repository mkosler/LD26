local Class = require 'lib.class'
local Manager = require 'src.manager'

local Entity = Class{}
function Entity:init()
  Manager.add(self)
end
