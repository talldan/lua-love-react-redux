local declare = require('rendering.declare')
local button = require('components.button')
local colorMultiplier = require('components.shaders.colorMultiplier')
local propTypes = {}

local backgroundColor = {
  r = 200,
  g = 200,
  b = 200,
}

local textColor = {
  r = 0,
  g = 0,
  b = 0,
  a = 255
}

function render(props, children, key)
  local multiplier = 1

  if props.isHovered then
    multiplier = 1.2
  end

  local colorMultiplierProps = {
    multiplier = multiplier
  }

  local buttonProps = {
    label = props.label,
    x = props.x,
    y = props.y,
    width = props.width,
    height = props.height,
    onPress = props.onPress,
    onHoverIn = props.onHoverIn,
    onHoverOut = props.onHoverOut,
    backgroundColor = backgroundColor,
    textColor = textColor,
    fontSize = 20
  }

  return colorMultiplier(colorMultiplierProps, button(buttonProps, nil, key))
end

return declare(render, propTypes)