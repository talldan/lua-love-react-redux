local declare = require('rendering.declare')
local viewHandler = require('components.viewHandler')
local propTypes = {}

function render(props)
  return viewHandler(props)
end

return render