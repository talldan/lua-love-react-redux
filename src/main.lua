local createStore = require('store.createStore')
local rootReducer = require('reducers.root')
local defaultState = require('constants.defaultState')
local actionTypes = require('constants.actionTypes')
local loopHandlers = require('helpers.love.loopHandlers')
local draw = require('rendering.draw')
local app = require('components.app')
local store = nil
local onLoad = loopHandlers.onLoad
local onUpdate = loopHandlers.onUpdate
local onDraw = loopHandlers.onDraw

function handleLoad()
  store = createStore(rootReducer, defaultState)
  store.dispatch({
    actionType = actionTypes.changeWindowSize,
    size = {
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
    }
  })
end

function handleUpdate(deltaTime)
  store.dispatch({
    actionType = actionTypes.updateDeltaTime,
    deltaTime = deltaTime  
  })
end

function handleDraw()
  draw(app({
    store = store
  }))
end

onLoad(handleLoad)
onUpdate(handleUpdate)
onDraw(handleDraw)