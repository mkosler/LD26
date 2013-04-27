function love.load()
  local GS = require 'lib.gamestate'

  GS.registerEvents()
end

function love.keypressed(k, c)
  if k == 'escape' then
    love.event.quit()
  end
end
