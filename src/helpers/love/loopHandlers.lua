local handlers = {
  load = {},
  update = {},
  draw = {},
  postDraw = {}
}

-- todo - abstract these event handlers
function love.load()
  for index, handler in ipairs(handlers.load) do
    if type(handler) == 'function' then
      handler(deltaTime)
    end
  end
end

function love.update(deltaTime)
  for index, handler in ipairs(handlers.update) do
    if type(handler) == 'function' then
      handler(deltaTime)
    end
  end
end

function love.draw()
  for index, handler in ipairs(handlers.draw) do
    if type(handler) == 'function' then
      handler(deltaTime)
    end
  end

  for index, handler in ipairs(handlers.postDraw) do
    if type(handler) == 'function' then
      handler(deltaTime)
    end
  end
end

function onLoad(onLoadHandler)
  handlers.load[#handlers.load + 1] = onLoadHandler
end


function onUpdate(onUpdateHandler)
  handlers.update[#handlers.update + 1] = onUpdateHandler
end

function onDraw(onDrawHandler)
  handlers.draw[#handlers.draw + 1] = onDrawHandler
end

function onPostDraw(onDrawHandler)
  handlers.postDraw[#handlers.postDraw + 1] = onDrawHandler
end

return {
  onLoad = onLoad,
  onUpdate = onUpdate,
  onDraw = onDraw,
  onPostDraw = onPostDraw
}