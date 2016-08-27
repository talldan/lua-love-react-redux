local declare = require('rendering.declare')
local basicMesh = require('components.love.basicMesh')
local propTypes = {}

function getVertices(props)
  local color = props.color or {
    r = 255,
    g = 255,
    b = 255
  }

  return {
    -- top left
    {
      0, 0,
      0, 0,
      color.r, color.g, color.b
    },
    -- top right
    {
      1, 0,
      0, 0,
      color.r, color.g, color.b
    },
    -- bottom right
    {
      1, 1,
      0, 0,
      color.r, color.g, color.b
    },
    -- bottom left
    {
      0, 1,
      0, 0,
      color.r, color.g, color.b
    }
  }
end

function render(props, children, key)
  return basicMesh({
    vertices = getVertices(props),
    x = props.x,
    y = props.y,
    scaleX = props.width,
    scaleY = props.height,
    rotation = props.rotation or 0
  }, nil, key)
end

return declare(render, propTypes)