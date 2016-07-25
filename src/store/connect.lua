function mergeTable(sourceTable, destinationTable)
  assert(type(destinationTable) == 'table', 'mergeTable must be passed a table as the destinationTable')
  if type(sourceTable) == 'table' then
    for key, value in pairs(sourceTable) do
      destinationTable[key] = value
    end
  end
  return sourceTable
end

function connect(mapStateToProps, mapDispatchToProps)
  return function(componentToWrap)
    function render(props, children)
      assert(type(props.store) == 'table', 'Store should be passed as a prop to connect component')

      local store = props.store
      local storeState = store.getState()
      local dispatch = store.dispatch
      local childProps = {
        store = store
      }

      if type(mapStateToProps) == 'function' then
        local stateProps = mapStateToProps(storeState, ownProps) or {}
        mergeTable(stateProps, childProps)
      end

      if type(mapDispatchToProps) == 'function' then
        local dispatchProps = mapDispatchToProps(dispatch, ownProps) or {}
        mergeTable(dispatchProps, childProps)
      end

      return componentToWrap(childProps, children)
    end

    return render
  end
end

return connect