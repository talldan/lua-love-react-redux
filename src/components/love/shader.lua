local declare = require('rendering.declare')
local propTypes = {}

function render(props, children)
  return {
    type = 'shader',
    props = props,
    children = children
  }
end

return declare(render, propTypes)