function makeMesh(next)
    local mode = next.mode or "fan"
    local usage = next.usage or "dynamic"
    local vertices = next.vertices
    local vertexFormat = next.vertexFormat

    if vertexFormat then
      return love.graphics.newMesh(vertexFormat, vertices, mode, usage)
    else
      return love.graphics.newMesh(vertices, mode, usage)
    end
end

function updateMesh(drawable, previous, next, drawChildren)
  -- todo - its hard to compare a list of vertices
  -- due to object equality issues, find a way to fix this
  -- if previous.vertices ~= next.vertices then
  --   drawable.setVertices(drawable, next.vertices)
  --   print('redraw')
  -- end

  if previous.mode ~= next.mode then
    drawable.setDrawMode(next.mode)
  end
end

function draw(static, previous, next)
  if not static.meshDrawable then
    static.meshDrawable = makeMesh(next)
  else
    updateMesh(static.meshDrawable, previous, next)
  end

  local x = next.x or 0
  local y = next.y or 0
  local rotation = next.rotation or 0
  local scaleX = next.scaleX or 1
  local scaleY = next.scaleY or 1
  
  love.graphics.draw(static.meshDrawable, x, y, rotation, scaleX, scaleY)
  drawChildren()
end

return draw