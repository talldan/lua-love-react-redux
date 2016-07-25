local declare = require('rendering.declare')
local shader = require('components.love.shader')
local propTypes = {}

local pixelcode = [[
    extern number multiplier;
    
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
    {
        vec4 texColor = Texel(texture, texture_coords);
        vec4 finalColor = texColor * color;
        finalColor.rgb *= multiplier;
        return finalColor;
    }
]]

local vertexcode = [[
    vec4 position(mat4 transform_projection, vec4 vertex_position)
    {
        return transform_projection * vertex_position;
    }
]]

function render(props, children)
  shaderProps = {
    vertexShader = vertexcode,
    pixelShader = pixelcode,
    externs = {
      multiplier = props.multiplier
    }
  }
  return shader(shaderProps, children)
end

return declare(render, propTypes)
