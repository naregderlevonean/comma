#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D inputTexture;
out vec4 outputColor;

void main() {
    vec4 pixelColor = texture(inputTexture, v_texcoord);
    pixelColor.rgb = 1.0 - pixelColor.rgb;
    outputColor = pixelColor;
}
