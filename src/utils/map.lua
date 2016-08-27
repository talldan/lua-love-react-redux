function map(source, func)
  local mapped = {}

  for index, sourceElement in ipairs(source) do
    mapped[index] = func(sourceElement, index)
  end

  return mapped
end

return map