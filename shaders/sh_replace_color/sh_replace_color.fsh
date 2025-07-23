//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float range;
uniform vec4 colorMatch0;
uniform vec4 colorReplace0;
uniform vec4 colorMatch1;
uniform vec4 colorReplace1;
uniform vec4 colorMatch2;
uniform vec4 colorReplace2;
uniform vec4 colorMatch3;
uniform vec4 colorReplace3;
uniform vec4 colorMatch4;
uniform vec4 colorReplace4;
uniform vec4 colorMatch5;
uniform vec4 colorReplace5;
uniform vec4 colorMatch6;
uniform vec4 colorReplace6;
uniform vec4 colorMatch7;
uniform vec4 colorReplace7;
uniform vec4 colorMatch8;
uniform vec4 colorReplace8;
uniform vec4 colorMatch9;
uniform vec4 colorReplace9;

bool isMatch(vec3 a, vec3 b, float range) {
    return all(lessThanEqual(abs(a - b), vec3(range)));
}

void main()
{
    vec4 pixelColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float newRange = range / 255.0;

    if (isMatch(pixelColor.rgb, colorMatch0.rgb, newRange)) {
        pixelColor.rgb = colorReplace0.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch1.rgb, newRange)) {
        pixelColor.rgb = colorReplace1.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch2.rgb, newRange)) {
        pixelColor.rgb = colorReplace2.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch3.rgb, newRange)) {
        pixelColor.rgb = colorReplace3.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch4.rgb, newRange)) {
        pixelColor.rgb = colorReplace4.rgb;
	} else if (isMatch(pixelColor.rgb, colorMatch5.rgb, newRange)) {
        pixelColor.rgb = colorReplace5.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch6.rgb, newRange)) {
        pixelColor.rgb = colorReplace6.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch7.rgb, newRange)) {
        pixelColor.rgb = colorReplace7.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch8.rgb, newRange)) {
        pixelColor.rgb = colorReplace8.rgb;
    } else if (isMatch(pixelColor.rgb, colorMatch9.rgb, newRange)) {
        pixelColor.rgb = colorReplace9.rgb;
    }
	

    gl_FragColor = pixelColor;
}