

float directionnalAttenuation = pow(dot(_surface.normal,vec3(0.5,1., -0.8))*0.5+.5,2.);

_surface.reflective *= directionnalAttenuation;
