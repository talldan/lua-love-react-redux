function getBounds(positions)
  if not positions.x and not positions.y then
    return nil
  end

  return {
    left = positions.x,
    top = positions.y,
    right = positions.x + positions.width,
    bottom = positions.y + positions.height
  }
end

function checkInputWithinBounds(inputs, bounds)
  local wasInBounds = false
  local inputData = nil

  for index, input in ipairs(inputs) do
    local inHorizontally = bounds.left <= input.x and bounds.right >= input.x
    local inVertically = bounds.top <= input.y and bounds.bottom >= input.y
    wasInBounds = inHorizontally and inVertically

    if wasInBounds then
      inputData = input
      break
    end
  end

  return wasInBounds, inputData
end

function handleBoundsInput(callback, inputs, bounds, inputType)
  local wasInputted = false
  local inputData = nil

  if bounds ~= nil and type(callback) == 'function' then
    wasInputted, inputData = checkInputWithinBounds(inputs, bounds)
    if wasInputted then
      callback(inputData)
    end
  end

  return wasInputted, inputData
end

function noop() end

function handleHoverInput(next, nextBounds, previous, previousBounds)
  local hoveredNow, hoverData = handleBoundsInput(noop, next.moves, nextBounds, 'hoverNow')
  local hoveredPreviously = handleBoundsInput(noop, previous.moves, previousBounds, 'hoveredPreviously')

  if type(next.onHover) == 'function' and hoveredNow then
    next.onHover(hoverData)
  end

  if type(next.onHoverIn) == 'function' and hoveredNow and not hoveredPreviously then
    next.onHoverIn(hoverData)
  end

  if type(next.onHoverOut) == 'function' and hoveredPreviously and not hoveredNow then
    next.onHoverOut(hoverData)
  end
end

function draw(static, previous, next, drawChildren)
  local previousBounds = getBounds(previous)
  local nextBounds = getBounds(next)

  handleBoundsInput(next.onPress, next.presses, nextBounds, 'press')
  handleBoundsInput(next.onRelease, next.releases, nextBounds, 'release')
  handleHoverInput(next, nextBounds, previous, previousBounds)

  drawChildren()
end

return draw