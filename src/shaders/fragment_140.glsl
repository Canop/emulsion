#version 140
uniform sampler2D tex;
in vec2 v_tex_coords;
out vec4 f_color;
void main() {
    vec4 color = texture(tex, v_tex_coords);
    const float grid_size = 12.0;
    vec4 grid_color;
    if ((mod(gl_FragCoord.x, grid_size * 2.0) < grid_size)
        ^^ (mod(gl_FragCoord.y, grid_size * 2.0) < grid_size)
    ) {
        grid_color = vec4(0.9);
    } else {
        grid_color = vec4(0.5);
    }
    f_color = mix(grid_color, color, color.a);
}
