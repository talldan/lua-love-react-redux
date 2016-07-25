local declare = require('rendering.declare')
local connect = require('store.connect')
local views = require('constants.views')
local mainView = require('components.views.main')
local mapView = require('components.views.map')
local settingsView = require('components.views.settings')
local propTypes = {}

function mapStateToProps(storeState)
  return {
    activeView = storeState.activeView
  }
end

function render(props)
  local viewComponent = nil

  if props.activeView == views.main then
    viewComponent = mainView(props)

  elseif props.activeView == views.map then
    viewComponent = mapView(props)

  elseif props.activeView == views.settings then
    viewComponent = settingsView(props)

  end

  return viewComponent
end

local declared = declare(render, propTypes)
local connected = connect(mapStateToProps)(declared)
return connected