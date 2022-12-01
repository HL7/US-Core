
#pragma body

// diffuse
float intensity = max(0., 0.8 * dot(_light.direction, _surface.normal) + 0.2);
_lightingContribution.diffuse += _light.intensity.rgb * intensity;

// specular

//Hair specular:
//the idea is to use the albedo luminance to adjust the hairSpecular strength
//the darker, the stronger
vec3 hairAlbedo = _surface.diffuse.rgb;
float lum = (hairAlbedo.r+hairAlbedo.r+hairAlbedo.b+hairAlbedo.g+hairAlbedo.g+hairAlbedo.g)/6.0; //can be moved in the VS
float specHairMult = mix(10., 0., lum);
specHairMult *= (1.6-lum);

float specTex = _surface.specular.r;

//two highligts, shifted in the bi_normal direction
//this one is colored by the hair, and wider
vec3 halfVector = normalize(_light.direction + _surface.view);

vec3 N = _surface.normal;
vec3 T = _surface.bitangent;
vec3 H = halfVector;

// specularHair
float S = specTex + 0.13;
vec3 B = normalize(T + N * S); // shift the tangent
float dotBH = dot(B,H);
float k = sqrt(1-dotBH*dotBH);

vec3 specularHair = vec3(pow(max(k, 0.), _surface.shininess * 0.25));
specularHair *= (hairAlbedo * specHairMult) ;
specularHair *= _light.intensity.rgb;

//#ifdef USE_AMBIENT_AS_AMBIENTOCCLUSION
//float myAO = pow(_surface.ambient.r, 4.0);
//#else
float myAO = 1.0;
//#endif

_lightingContribution.specular += specularHair * myAO;

//specularLight
const float specSharpness = 0.8;

S = specTex;
B = normalize(T + N * S); // shift the tangent
dotBH = dot(B,H);
k = sqrt(1-dotBH*dotBH);

vec3 specularLight = smoothstep(0.72-specSharpness,0.72+specSharpness,pow(k ,_surface.shininess * 1.2));
specularLight *= _light.intensity.rgb;
//specularLight *= noise;
specularLight *= 1.4;

_lightingContribution.specular += specularLight * myAO;



