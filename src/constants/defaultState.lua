local views = require('constants.views')

local mainViewState = {
  buttons = {
    newGameButton = {
      isHovered = false
    },
    settingsButton = {
      isHovered = false
    },  
    quitButton = {
      isHovered = false
    }
  }
}

return {
  activeView = views.main,
  windowSize = {
    height = 0,
    width = 0
  },
  deltaTime = 0,
  viewState = {
    main = mainViewState,
    map = {},
    settings = {}
  }
}