local actionTypes = require('constants.actionTypes')
local views = require('constants.views')

function reducer(state, action)
  local mainViewState = state.viewState.main
  local buttons = mainViewState.buttons

  if action.actionType == actionTypes.newGameButtonPress then
    state.activeView = views.map

  elseif action.actionType == actionTypes.newGameButtonHoverIn then
    buttons.newGameButton.isHovered = true

  elseif action.actionType == actionTypes.newGameButtonHoverOut then
    buttons.newGameButton.isHovered = false

  elseif action.actionType == actionTypes.settingsButtonPress then
    state.activeView = views.settings

  elseif action.actionType == actionTypes.settingsButtonHoverIn then
    buttons.settingsButton.isHovered = true

  elseif action.actionType == actionTypes.settingsButtonHoverOut then
    buttons.settingsButton.isHovered = false

  elseif action.actionType == actionTypes.quitButtonPress then
    love.event.quit(0)

  elseif action.actionType == actionTypes.quitButtonHoverIn then
    buttons.quitButton.isHovered = true

  elseif action.actionType == actionTypes.quitButtonHoverOut then
    buttons.quitButton.isHovered = false

  end

  return state
end

return reducer