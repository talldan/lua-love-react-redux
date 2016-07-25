local declare = require('rendering.declare')
local loopHandlers = require('helpers.love.loopHandlers')
local onPostDraw = loopHandlers.onPostDraw
local propTypes = {}
local presses = {}
local releases = {}
local moves = {}
local scrolls = {}

function gather(destinationTable, data)
  destinationTable[#destinationTable + 1] = data
end

function love.mousepressed(x, y, button, isTouch)
  gather(presses, {
    x = x,
    y = y,
    button = button,
    isTouch = isTouch
  })
end

function love.mousereleased(x, y, button, isTouch)
  gather(releases, {
    x = x,
    y = y,
    button = button,
    isTouch = isTouch
  })
end

function love.mousemoved(x, y, dx, dy, isTouch)
  gather(moves, {
    x = x,
    y = y,
    dx = dx,
    dy = dy,
    isTouch = isTouch  
  })
end

function love.wheelmoved(x, y)
  gather(scrolls, {
    x = x,
    y = y
  })
end

function postDrawHandler()
  presses = {}
  releases = {}
  moves = {moves[#moves]}
  scrolls = {}
end

function render(props, children)
  props.presses = presses
  props.releases = releases
  props.moves = moves
  props.scrolls = scrolls
  props.deltaTime = love.timer.getDelta()

  return {
    type = 'inputHandler',
    props = props,
    children = children
  }
end

onPostDraw(postDrawHandler)
return declare(render, propTypes)