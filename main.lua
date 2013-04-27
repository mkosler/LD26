local Bump, GS, Play

function love.load()
  love.graphics.setBackgroundColor(139, 149, 109)

  Bump = require 'lib.bump'
  GS = require 'lib.gamestate'
  Play = require 'src.states.play'

  Bump.collision = function (o1, o2, dx, dy)
    if o1.collision then o1:collision(o2, dx, dy) end
    if o2.collision then o2:collision(o1, dx, dy) end
  end

  Bump.endCollision = function (o1, o2)
    if o1.endCollision then o1:endCollision(o2) end
    if o2.endCollision then o2:endCollision(o1) end
  end

  Bump.getBBox = function (o)
    if o.getBBox then return o:getBBox() end
  end

  Bump.shouldCollide = function (o1, o2)
    return not ((o1.name and o1.name == 'EMPTY') or
                (o2.name and o2.name == 'EMPTY'))
  end

  GS.registerEvents()
  GS.switch(Play)
end

function love.update(dt)
  Bump.collide()
end

function love.keypressed(k, c)
  if k == 'escape' then
    love.event.quit()
  end
end
