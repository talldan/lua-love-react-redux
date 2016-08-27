function getFormattedText(next)
  local value = next.value
  local wraplimit = nil
  local alignment = 'left'

  if next.width ~= nil then
    wraplimit = next.width
  end

  if next.alignment ~= nil then
    alignment = next.alignment
  end
  
  return value, wraplimit, alignment
end

function makeText(next)
  local fontSize = next.fontSize or 12
  local font = next.font or love.graphics.newFont(fontSize)
  local textDrawable = love.graphics.newText(font)
  textDrawable:setf(getFormattedText(next)) 
  return textDrawable
end

function updateText(drawable, previous, next)
  if previous.value ~= next.value then
    drawable:setf(getFormattedText(next))
  end

  if previous.font ~= next.font then
    drawable:setFont(next.font)
  end
end

function draw(static, previous, next, drawChildren)
  if not static.textDrawable then
    static.textDrawable = makeText(next)
  else
    updateText(static.textDrawable, previous, next)
  end

  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(
    next.r or r,
    next.g or g,
    next.b or b,
    next.a or a
  )
  love.graphics.draw(static.textDrawable, next.x, next.y)
  love.graphics.setColor(r, g, b, a)
end

return draw