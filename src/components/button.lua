local declare = require('rendering.declare')
local rect = require('components.rect')
local text = require('components.love.text')
local inputHandler = require('components.love.inputHandler')
local propTypes = {}

function render(props)
  local inputHandlerProps = {
    x = props.x,
    y = props.y,
    width = props.width,
    height = props.height,
    onPress = props.onPress,
    onHover = props.onHover,
    onRelease = props.onRelease
  }

  local rectProps = {
    x = props.x,
    y = props.y,
    width = props.width,
    height = props.height,
    color = props.backgroundColor
  }

  local textProps = {
    value = props.label,
    fontSize = props.fontSize,
    horizontalAlignment = 'center',
    verticalAlignment = 'center',
    x = props.x,
    y = props.y,
    width = props.width,
    height = props.height,
    r = props.textColor.r,
    g = props.textColor.g,
    b = props.textColor.b,
    a = props.textColor.a
  }

  return {
    inputHandler(props, {
      rect(rectProps),
      text(textProps)
    })
  }
end

return declare(render, props)