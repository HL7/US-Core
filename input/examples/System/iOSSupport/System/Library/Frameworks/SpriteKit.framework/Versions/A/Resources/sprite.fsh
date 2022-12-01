uniform lowp sampler2D u_texture;

varying highp vec2 v_tex_coord;
varying lowp vec4 v_color;

void main() {
    gl_FragColor = v_color * texture2D(u_texture, v_tex_coord);
}