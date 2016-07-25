local actionTypes = require('constants.actionTypes')
local mainViewReducer = require('reducers.mainView')

function reducer(state, action)
  if action.actionType == actionTypes.changeWindowSize then
    state.windowSize = action.size
  elseif action.actionType == actionTypes.updateDeltaTime then
    state.deltaTime = action.deltaTime
  end

  mainViewReducer(state, action)

  return state
end

return reducer