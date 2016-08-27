function dispatchAction(dispatch, actionType)
  return function()
    dispatch({
      actionType = actionType  
    })
  end
end

return dispatchAction