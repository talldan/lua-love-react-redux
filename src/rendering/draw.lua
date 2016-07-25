local text = require('rendering.primitives.text')
local basicMesh = require('rendering.primitives.basicMesh')
local shader = require('rendering.primitives.shader')
local inputHandler = require('rendering.primitives.inputHandler')

local primitives = {
  text = text,
  basicMesh = basicMesh,
  shader = shader,
  inputHandler = inputHandler
}

local primitiveStates = {}
local visitedPrimitives = {}

-- todo - all this code was quite hastily written, so consider a rewrite

function getPrimitiveDrawFunction(primitiveType)
  return primitives[primitiveType]
end

function getPrimitiveState(path)
  return primitiveStates[path]
end

function setNewPrimitiveState(path, primitiveType)
  primitiveStates[path] = {
    type = primitiveType,
    static = {},
    previous = {}
  }
  return primitiveStates[path]
end

function cleanUnvisitedPrimitives()
  for key, state in pairs(primitiveStates) do
    if not visitedPrimitives[key] then
      primitiveStates[key] = nil
    end
  end
  visitedPrimitives = {}
end

function drawPrimitive(primitiveData, path)
  local primitiveType = primitiveData['type']
  assert(primitiveType ~= nil, 'expect primitive to have a type property')

  -- todo - no guarantee that components of the same type that are siblings
  -- wouldn't be confused for one another if the table containing them
  -- was reordered. Does it matter? Two meshes might potentially have different
  -- vertices defined, so the wrong thing would be rendered. How does React do this?  
  path = path .. '.' .. primitiveType
  local primitiveState = getPrimitiveState(path)
  local drawFunc = getPrimitiveDrawFunction(primitiveType)

  if primitiveState == nil or primitiveState.type ~= primitiveData.type then
    primitiveState = setNewPrimitiveState(path, primitiveType)
  end

  local static = primitiveState.static
  local previous = primitiveState.previous
  local next = primitiveData.props
  local children = primitiveData.children

  drawFunc(static, previous, next, drawChildren(children, path), path)

  primitiveState.previous = next
  visitedPrimitives[path] = true
end

function drawChildren(list, path)
  return function()
    draw(list, path)
  end
end

function drawList(list, path)
  local originalPath = path

  if type(list) ~= 'table' then
    error('expected list to be table when drawing at path: ' .. path .. ', received ' .. type(list))
  end

  for index, item in ipairs(list) do
    local innerPath = path .. '.' .. index
    draw(item, innerPath)
  end
end

function debug(item)
  if item == nil then return end

  local primitiveType = item.type
  if type(primitiveType) == 'string' then
    if primitiveType == 'shader' then
      print(primitiveType, item.props.externs.multiplier)
    end
  else
    for index, bit in ipairs(item) do
      debug(bit)
    end
  end
end

function draw(item, path)
  -- debug(item)
  if item == nil then return end

  local primitiveType = item.type
  local path = path or '1'

  if type(primitiveType) == 'string' then
    drawPrimitive(item, path)
  else
    drawList(item, path)
  end

  if path == '1' then
    cleanUnvisitedPrimitives()
  end
end

return draw