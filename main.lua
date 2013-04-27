function love.load()
  local Bump = require 'lib.bump'
  local GS = require 'lib.gamestate'

  Bump.collision = function (o1, o2, dx, dy)
  end
  Bump.endCollision = function (o1, o2)
  end
  Bump.getBBox = function (o)
    return o.x, o.y, o.width, o.height
  end
  Bump.shouldCollide = function (o1, o2)
    return true
  end

  GS.registerEvents()
end

function love.keypressed(k, c)
  if k == 'escape' then
    love.event.quit()
  end
end
