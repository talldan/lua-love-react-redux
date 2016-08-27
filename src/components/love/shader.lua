local declare = require('rendering.declare')
local propTypes = {}

function render(props, children, key)
  return {
    type = 'shader',
    props = props,
    children = children,
    key = key
  }
end

return declare(render, propTypes)