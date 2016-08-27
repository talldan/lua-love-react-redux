local clone = require('utils.clone')

local function shuffle(sourceTable)
  assert(type(sourceTable) == 'table', "shuffleTable() expected a table, got nil")

  local tableClone = clone(sourceTable)
  
  local rand = math.random 
  local iterations = #tableClone
  local swapTarget
  
  for swapSource = iterations, 2, -1 do
    swapTarget = rand(swapSource)
    tableClone[swapSource], tableClone[swapTarget] = tableClone[swapTarget], tableClone[swapSource]
  end

  return tableClone
end

return shuffle