function listen(listener, listeners)
  local position = (#listeners + 1)
  listeners[#listeners + 1] = listener

  function unsubscribe()
    local position;
    for index, listenerToCheck in ipairs(listeners) do
      if listener == listenerToCheck then
        position = index
        break
      end
    end

    table.remove(listeners, position)
  end

  return unsubscribe
end

function triggerListeners(listeners)
  for index, listener in ipairs(listeners) do
    listener()
  end
end

function createStore(reducer, intialState) 
  local store = {}
  
  local isDispatching = false
  local listeners = {}
  local storeState = intialState or {}

  function store.dispatch(action)
    assert(type(action) == "table", "Action passed to dispatch must be of type table")
    assert(type(action.actionType) == "string", "Action must have a type of string")
    assert(not isDispatching, "Reducers must not call dispatch")

    isDispatching = true
    storeState = reducer(storeState, action)
    isDispatching = false

    triggerListeners(listeners)
  end

  function store.listen(listener)
    listen(listener, listeners)
  end

  function store.getState()
    return storeState
  end

  return store
end

return createStore