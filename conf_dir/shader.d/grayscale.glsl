#version 300 es
precision mediump float;

in vec2 v_texcoord;
layout(location = 0) out vec4 fragColor;
uniform sampler2D tex;

void main() {
        vec4 pixColor = texture(tex, v_texcoord);
        float new_colour = (pixColor.r+pixColor.g+pixColor.b)/3.0;

        pixColor[2] *= 0.1;

        fragColor = pixColor;
        fragColor =  vec4(new_colour,new_colour,new_colour,1.0);
}
