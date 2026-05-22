#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D inputTexture;
out vec4 outputColor;

void main() {
    vec4 pixelColor = texture(inputTexture, v_texcoord);
    float luminance = 0.299 * pixelColor.r + 0.587 * pixelColor.g + 0.114 * pixelColor.b;
    outputColor = vec4(luminance, 0.0, 0.0, pixelColor.a);
}

