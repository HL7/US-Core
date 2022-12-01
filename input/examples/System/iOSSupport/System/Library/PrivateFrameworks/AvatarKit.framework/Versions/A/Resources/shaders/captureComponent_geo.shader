#pragma arguments

float progress;

#pragma body


float f = (1.0-progress) * 0.005 * sin(u_time*5.0+_geometry.position.y*150.0);
_geometry.position.x += f;


