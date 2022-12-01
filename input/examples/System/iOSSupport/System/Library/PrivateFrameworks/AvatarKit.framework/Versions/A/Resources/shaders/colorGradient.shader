
#pragma body

//sample gradient (multiply) using surface.diffuse
_surface.diffuse = texture2D(u_multiplyTexture, vec2(_surface.diffuse.r, 0.));
_surface.multiply = vec4(1.0);

