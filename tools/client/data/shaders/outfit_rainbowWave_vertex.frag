attribute vec2 a_TexCoord;
uniform mat3 u_TextureMatrix;
varying vec2 v_TexCoord;
varying vec2 v_TexCoord2;
varying vec2 v_TexCoord3;
attribute vec2 a_Vertex;
uniform mat3 u_TransformMatrix;
uniform mat3 u_ProjectionMatrix;
uniform vec2 u_Offset;
uniform vec2 u_Center;
uniform float u_Time;

vec2 effectTextureSize = vec2(466.0, 342.0);
vec2 direction = vec2(1.0,0.2);
float speed = 100.0;

vec2 rotate(vec2 v, float a) {
	float s = sin(a);
	float c = cos(a);
	mat2 m = mat2(c, -s, s, c);
	return m * v;
}

void main()
{
    vec2 offset = direction * speed;
    gl_Position = vec4((u_ProjectionMatrix * u_TransformMatrix * vec3(a_Vertex.xy, 1.0)).xy, 1.0, 1.0);
    v_TexCoord = (u_TextureMatrix * vec3(a_TexCoord,1.0)).xy;
    v_TexCoord2 = (u_TextureMatrix * vec3(a_TexCoord + u_Offset,1.0)).xy;
}

