attribute vec4 a_color;
attribute vec4 a_position;
attribute vec2 a_tex_coord;

varying highp vec2 v_tex_coord;
varying lowp vec4 v_color;

void main() {
    v_color = a_color;
    v_tex_coord = a_tex_coord;
    gl_Position = a_position;
}