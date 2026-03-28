#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D inputTexture;
out vec4 outputColor;

const vec3 vibranceBalance = vec3(1.0, 1.0, 1.0);
const float vibranceAmount = 0.20;
const vec3 vibranceCoefficient = vibranceBalance * -vibranceAmount;

void main() {
    vec4 pixelColor = texture(inputTexture, v_texcoord);
    vec3 originalColor = pixelColor.rgb;

    vec3 luminanceCoefficients = vec3(0.212656, 0.715158, 0.072186);
    float luma = dot(luminanceCoefficients, originalColor);

    float maxColorComponent = max(originalColor.r, max(originalColor.g, originalColor.b));
    float minColorComponent = min(originalColor.r, min(originalColor.g, originalColor.b));
    float colorSaturation = maxColorComponent - minColorComponent;

    vec3 vibranceMixFactor = (sign(vibranceCoefficient) * colorSaturation - 1.0) * vibranceCoefficient + 1.0;

    vec3 adjustedColor = mix(vec3(luma), originalColor, vibranceMixFactor);
    outputColor = vec4(adjustedColor, pixelColor.a);
}
