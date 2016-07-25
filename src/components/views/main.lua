local declare = require('rendering.declare')
local menuButton = require('components.menuButton')
local actionTypes = require('constants.actionTypes')
local propTypes = {}

function dispatchAction(dispatch, actionType)
  return function()
    dispatch({
      actionType = actionType  
    })
  end
end

function mapStateToProps(storeState)
  return {
    buttonState = storeState.viewState.main.buttons
  }
end

function mapDispatchToProps(dispatch)
  return {
    buttonActions = {
      newGameButton = {
        onPress = dispatchAction(dispatch, actionTypes.newGameButtonPress),
        onHoverIn = dispatchAction(dispatch, actionTypes.newGameButtonHoverIn),
        onHoverOut = dispatchAction(dispatch, actionTypes.newGameButtonHoverOut),
      },
      settingsButton = {
        onPress = dispatchAction(dispatch, actionTypes.settingsButtonPress),
        onHoverIn = dispatchAction(dispatch, actionTypes.settingsButtonHoverIn),
        onHoverOut = dispatchAction(dispatch, actionTypes.settingsButtonHoverOut),
      },
      quitButton = {
        onPress = dispatchAction(dispatch, actionTypes.quitButtonPress),
        onHoverIn = dispatchAction(dispatch, actionTypes.quitButtonHoverIn),
        onHoverOut = dispatchAction(dispatch, actionTypes.quitButtonHoverOut),
      }
    }
  }
end

local buttonProps = {
  {
    buttonKey = 'newGameButton',
    x = 100,
    y = 10,
    width = 300,
    height = 80,
    label = 'New Game'
  },
  {
    buttonKey = 'settingsButton',
    x = 100,
    y = 110,
    width = 300,
    height = 80,
    label = 'Settings'
  },
  {
    buttonKey = 'quitButton',
    x = 100,
    y = 210,
    width = 300,
    height = 80,
    label = 'Quit'
  }
}

function render(props)
  local buttons = {}

  for index, buttonProperties in pairs(buttonProps) do
    local key = buttonProperties.buttonKey
    buttonProperties.isHovered = props.buttonState[key].isHovered
    buttonProperties.onPress = props.buttonActions[key].onPress
    buttonProperties.onHoverIn = props.buttonActions[key].onHoverIn
    buttonProperties.onHoverOut = props.buttonActions[key].onHoverOut
    buttons[#buttons + 1] = menuButton(buttonProperties)
  end

  return buttons
end

local declared = declare(render, propTypes)
local connected = connect(mapStateToProps, mapDispatchToProps)(declared)
return connected