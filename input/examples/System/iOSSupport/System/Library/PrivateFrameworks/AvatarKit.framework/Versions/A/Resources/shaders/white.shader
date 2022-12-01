
#pragma arguments

float captureFactor = 1.0;

#pragma body

_output.color = mix(_output.color, vec4(1.0), captureFactor);


