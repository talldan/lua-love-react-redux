local declare = require('rendering.declare')
local shader = require('components.love.shader')
local propTypes = {}

local pixelcode = [[
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
    {
        vec4 texcolor = Texel(texture, texture_coords);
        color.a = 0.5;
        return texcolor * color;
    }
]]

local vertexcode = [[
    vec4 position( mat4 transform_projection, vec4 vertex_position )
    {
        return transform_projection * vertex_position;
    }
]]

local shaderProps = {
  vertexShader = vertexcode,
  pixelShader = pixelcode
}

function render(props, children)
  return shader(shaderProps, children)
end

return declare(render, propTypes)
