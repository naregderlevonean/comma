#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D inputTexture;
out vec4 outputColor;

const float vibranceAmount = 1.00;
const vec3 luminanceCoefficients = vec3(0.212656, 0.715158, 0.072186);

vec3 sRgbToLinear(vec3 srgb) {
    vec3 linear;
    linear.r = srgb.r <= 0.04045 ? srgb.r / 12.92 : pow((srgb.r + 0.055) / 1.055, 2.4);
    linear.g = srgb.g <= 0.04045 ? srgb.g / 12.92 : pow((srgb.g + 0.055) / 1.055, 2.4);
    linear.b = srgb.b <= 0.04045 ? srgb.b / 12.92 : pow((srgb.b + 0.055) / 1.055, 2.4);
    return linear;
}

vec3 linearToSrgb(vec3 linear) {
    vec3 srgb;
    srgb.r = linear.r <= 0.0031308 ? linear.r * 12.92 : 1.055 * pow(linear.r, 1.0 / 2.4) - 0.055;
    srgb.g = linear.g <= 0.0031308 ? linear.g * 12.92 : 1.055 * pow(linear.g, 1.0 / 2.4) - 0.055;
    srgb.b = linear.b <= 0.0031308 ? linear.b * 12.92 : 1.055 * pow(linear.b, 1.0 / 2.4) - 0.055;
    return srgb;
}

void main() {
    vec4 pixelColor = texture(inputTexture, v_texcoord);
    vec3 color = sRgbToLinear(pixelColor.rgb);

    float luminance = dot(luminanceCoefficients, color);
    float maxComp = max(color.r, max(color.g, color.b));
    float minComp = min(color.r, min(color.g, color.b));

    float saturation = (maxComp > 0.0) ? (maxComp - minComp) / maxComp : 0.0;
    float boost = 1.0 + vibranceAmount * (1.0 - saturation);

    vec3 adjusted = mix(vec3(luminance), color, boost);
    adjusted = clamp(adjusted, 0.0, 1.0);
    
    outputColor = vec4(linearToSrgb(adjusted), pixelColor.a);
}

