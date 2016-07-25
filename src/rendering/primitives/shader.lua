function makeShader(next)
    local vertexShader = next.vertexShader
    local pixelShader = next.pixelShader

    if vertexShader and pixelShader then
      return love.graphics.newShader(vertexShader, pixelShader)
    elseif vertexShader then
      return love.graphics.newShader(vertexShader)
    elseif pixelShader then
      return love.graphics.newShader(pixelShader)
    end
end

function sendExterns(shaderInstance, externs)
  if type(externs) == 'table' then
    for key, value in pairs(externs) do
      -- print(key, value)
      shaderInstance:send(key, value)
    end
  end
end

function draw(static, previous, next, drawChildren)
  if not static.shaderInstance then
    static.shaderInstance = makeShader(next)
  end

  sendExterns(static.shaderInstance, next.externs)

  love.graphics.setShader(static.shaderInstance)
  drawChildren()
  love.graphics.setShader()
end

return draw