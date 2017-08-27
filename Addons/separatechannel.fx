////////////////////////////////////////////////////////////////////////////
// RGBA-channel separation
// Many thanks to David Clark who wrote this shader for Construct Classic
////////////////////////////////////////////////////////////////////////////

precision mediump float;
varying vec2 vTex;
uniform sampler2D samplerFront;

uniform float pixelWidth;
uniform float pixelHeight;
uniform float redx;
uniform float redy;
uniform float bluex;
uniform float bluey;
uniform float greenx;
uniform float greeny;
uniform float alphax;
uniform float alphay;

uniform float intensity;

void main(void)
{
	vec4 front = texture2D(samplerFront, vTex); 
    vec4 color = texture2D(samplerFront, vTex); 
	
	color.r = texture2D(samplerFront, vTex - vec2(redx   * pixelWidth, redy   * pixelHeight)).r;
    color.g = texture2D(samplerFront, vTex - vec2(greenx * pixelWidth, greeny * pixelHeight)).g;
    color.b = texture2D(samplerFront, vTex - vec2(bluex  * pixelWidth, bluey  * pixelHeight)).b;  
	color.a = texture2D(samplerFront, vTex - vec2(alphax * pixelWidth, alphay * pixelHeight)).a;  
	
	gl_FragColor = mix(front, color, intensity);
}