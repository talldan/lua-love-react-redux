
function assignOne(destination, source)
  if source == nil then return end

  assert(type(destination) == "table", "Assign must be called with a table as the first argument. Type was " .. type(destination))
  assert(type(source) == "table", "Assign must be called with a table or nil as a successive argument. Type was " .. type(source))

  for key, value in pairs(source) do
    destination[key] = value
  end 

  return destination
end

function assign(destination, ...)
  for index, source in ipairs({...}) do
    assignOne(destination, source)
  end

  return destination
end

return assign