return {
  TILES = {
    WIDTH = 32,
    HEIGHT = 32,
    IMAGE = love.graphics.newImage('assets/images/tiles.png'),
  },
  PLAYER = {
    IMAGE = love.graphics.newImage('assets/images/car.png'),
    CONTROLS = {
      UP = { 'up', 'w' },
      DOWN = { 'down', 's' },
      LEFT = { 'left', 'a' },
      RIGHT = { 'right', 'd' },
      SPACE = { ' ' },
    },
    VELOCITY = { X = 100, Y = 0 },
  },
}
