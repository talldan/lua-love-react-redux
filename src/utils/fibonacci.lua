function fibonacci(iterations, ...)
  local sequence = {...}

  if iterations == 0 then
    return sequence
  end

  local last = sequence[#sequence]
  local penultimate = sequence[#sequence - 1]
  local next = penultimate + last
  sequence[#sequence + 1] = next

  return fibonacci(iterations - 1, unpack(sequence))
end

return fibonacci