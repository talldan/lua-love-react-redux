function clone(rootElement)
  local elementType = type(rootElement)
  local copy

  if elementType == 'table' then
    copy = {}
    for elementKey, elementValue in next, rootElement, nil do
      copy[clone(elementKey)] = clone(elementValue)
    end
    setmetatable(copy, clone(getmetatable(rootElement)))
  else
    copy = rootElement
  end

  return copy
end

return clone