function validateTypes(propTypes, props)
  -- todo - implement it
end

function declare(renderFunc, propTypes)
  return function(props, children)
    validateTypes(propTypes, props)
    return renderFunc(props, children)
  end
end

return declare