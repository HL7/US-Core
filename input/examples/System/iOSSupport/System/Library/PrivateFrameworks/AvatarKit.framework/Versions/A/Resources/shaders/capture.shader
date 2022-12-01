
#pragma arguments

float captureFactor = 1.0;

#pragma body


#if 0
float mid = 0.3;
float smoothD = 0.05;
float gray = 0.5;

float d = dot(_surface.normal, _surface.view);
d = smoothstep(0.0, 0.5,d);
d += gray;

float x = _surface.diffuseTexcoord.x;
float x1 = 1.0 - smoothstep(mid, mid+smoothD,x);
float x2 = 1.0-smoothstep(mid, mid+smoothD,1-x);

x = x1+x2;

//_output.color = vec4(x,x,x,1.0);
d = mix(1.0, d, x);

vec4 captureColor = vec4(d,d,d,1.0);

_output.color = mix(_output.color, captureColor, captureFactor);

#else
_output.color = mix(_output.color, vec4(1.0), captureFactor);

#endif


