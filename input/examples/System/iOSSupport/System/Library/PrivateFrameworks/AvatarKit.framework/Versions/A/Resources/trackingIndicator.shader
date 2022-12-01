#pragma transparent
#pragma arguments
float hold=0.;


#pragma declaration
float roundedBox( float2 p, float2 b, float r )
{
return length(max(abs(p)-b,0.0))-r;
}

#pragma body
float breathing = sin(scn_frame.time * 9.3778885182) * .5 +.5 ;
float invHold = 1. - hold;

// color
float4 col = float4(scn::srgb_to_linear(float3(255.,204.,0.)/255.), 1);

// width (1280 -> 1 ; 2200 -> 0)
float width = min(1.0, max(0.0, 2.0 * scn_frame.inverseResolution.y * 640 - 1.0));

// dimensions
const float2 viewport  = float2(1948., 1948.);
const float2 center    = viewport / 2.;
const float2 sizeMin   = float2(1124., 1055. + hold*20.)/2.;
const float2 sizeMax   = float2(1181., 1112. + hold*20.)/2.;
const float2 border    = float2(150., 120.*(1.+breathing*.1)+hold*5.);
const float lengthCrop = 210. * invHold;
const float lengthMinCrop = 200. * invHold;
const float lengthCrop2 = mix(lengthMinCrop, lengthCrop, width);

// uv
float2 size = mix(sizeMin, sizeMax, breathing);
float2 p = _surface.diffuseTexcoord*viewport - center;
p += sign(p) * length(p) * .07 * invHold;

float2 absp = abs(p);
float2 sp = sign(p);
sp += (1. - abs(sp));

// sdf
float box = max(roundedBox(p, size.xx-border.x, border.x), -roundedBox(p, size.yy-border.y, border.y));

float sSize = 17. - hold * 5.;
float2 sOffset = float2(2.-lengthCrop, -sSize-size.y);
float sphere = min( length(p + sp*sOffset.yx), length(p + sp*sOffset.xy) ) - sSize;

float crop = lengthCrop2 - min(absp.x, absp.y);

// antialiased output
float d = min( max(box, crop), sphere);

float globalAlpha = _output.color.a;
_output.color = mix( col, float4(0.), smoothstep(0., 5., d+1.+(1.-width)*9.0 ) ) * globalAlpha;

#ifdef USE_COLOR1_OUTPUT
_output.color1.rg = 1.h;
#endif
