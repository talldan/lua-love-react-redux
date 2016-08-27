local clone = require('utils.clone')

function pickRandom(sourceTable)
  assert(type(sourceTable) == 'table', 'expected sourceTable to be of type table in call to #pickRandomFromTable')

  local index = math.random(#sourceTable)
  return clone(sourceTable[index])
end

return pickRandom