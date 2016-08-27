function getNumberUnit(inputNumber)
  return tonumber(tostring(inputNumber):sub(-1))
end

function sumUnit(num)
  local numString = tostring(num)
  local accumulator = 0

  numString:gsub(".", function(numPart)
    accumulator = accumulator + tonumber(numPart)

    if (accumulator > 10000) then
      accumulator = getNumberUnit(accumulator)
    end
  end)

  return getNumberUnit(accumulator)
end

return sumUnit