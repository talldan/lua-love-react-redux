local declare = require('rendering.declare')
local connect = require('store.connect')
local menuButton = require('components.menuButton')
local actionTypes = require('constants.actionTypes')
local dispatchAction = require('helpers.store.dispatchAction')
local assign = require('utils.assign')
local map = require('utils.map')
local propTypes = {}

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
  local props = props
  return map(buttonProps, function(properties)
    local key = properties.buttonKey
    local menuButtonProps = assign(
      {}, 
      properties, 
      props.buttonState[key], 
      props.buttonActions[key]
    )
    return menuButton(menuButtonProps, nil, key)
  end)
end

local declared = declare(render, propTypes)
local connected = connect(mapStateToProps, mapDispatchToProps)(declared)
return connected