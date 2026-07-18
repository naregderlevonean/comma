#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D inputTexture;
out vec4 outputColor;

void main() {
    vec4 pixelColor = texture(inputTexture, v_texcoord);
    float luma = dot(pixelColor.rgb, vec3(0.2126, 0.7152, 0.0722));
    float invertedLuma = 1.0 - luma;
    
    pixelColor.rgb = pixelColor.rgb * (invertedLuma / max(luma, 0.0001));
    
    outputColor = pixelColor;
}

