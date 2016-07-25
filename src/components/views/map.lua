local declare = require('rendering.declare')
local text = require('components.love.text')
local propTypes = {}

local textProps = {
  x = 0,
  y = 10,
  r = 255,
  g = 255,
  b = 255,
  a = 255,
  value = 'map'
}

function render(props)
  return text(textProps)
end

return declare(render, propTypes)