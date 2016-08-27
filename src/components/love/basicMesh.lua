local declare = require('rendering.declare')
local propTypes = {}

function render(props, children)
  return {
    type = 'basicMesh',
    props = props,
    children = children,
    key = key
  }
end

return declare(render, propTypes)