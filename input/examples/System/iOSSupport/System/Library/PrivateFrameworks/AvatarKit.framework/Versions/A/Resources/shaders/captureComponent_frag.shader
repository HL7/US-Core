#pragma arguments

float progress;

#pragma body



float d = max(0.5, _surface.normal.b);
float f = (min(0.9,_surface.normal.r) * min(0.9,_surface.normal.g) / d);
float p = saturate(f*f);

if(progress < p){
discard_fragment();
}

float diff = (progress - p);
diff = smoothstep(diff, 0.01, 0.02);
_output.color.rgb = mix(vec3(1.0), _output.color.rgb, max(progress, diff));


