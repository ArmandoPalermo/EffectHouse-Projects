//# {"AuslVersion": "2.0.6"}

//@ ---BEGIN UIPROPERTY
//@ $omtl_albedo$
//@ _AlbedoColor (omtl_color, Color) = [1.000000, 1.000000, 1.000000, 1.000000]
//@ _EnableAlbedoTexture (omtl_texture_on, Defs) = 0
//@ [_EnableAlbedoTexture] _AlbedoTexture (omtl_texture, 2D) = "Default_Material_Texture_Icon"
//@ [_EnableAlbedoTexture] AlbedoTextureUV1 (omtl_use_uv1, Defs) = 0
//@ [_EnableAlbedoTexture] _EnableAlphaTest (omtl_alpha_test, Defs) = 0
//@ [_EnableAlphaTest] _AlbedoCutoff (omtl_cutoff, Range(0.000000, 1.000000)) = 0.5

//@ $omtl_opacity$
//@ OpacityTexture (omtl_opacity, Defs) = 0
//@ [OpacityTexture] _OpacityTexture (omtl_texture, 2D) = "Default_Material_Texture_Icon"

//@ $omtl_normal$
//@ NormalTexture (omtl_normal, Defs) = 0
//@ [NormalTexture] _NormalTexture (omtl_texture, 2D) = "Default_Material_Texture_Normal"
//@ [NormalTexture] _NormalStrength (omtl_strength, Range(0.000000, 1.000000)) = 1.000000
//@ [NormalTexture] FlipNormals (omtl_flip_backface_normals, Defs) = 0
//@ [NormalTexture] NormalTextureUV1 (omtl_use_uv1, Defs) = 0

//@ $omtl_mrao$
//@ _MRAOMetallic (omtl_metallic, Range(0.000000, 1.000000)) = 0.000000
//@ _MRAORoughness (omtl_roughness, Range(0.000000, 1.000000)) = 0.500000
//@ _EnableMRAOTexture (omtl_texture_on, Defs) = 0
//@ [_EnableMRAOTexture] _MRAOTexture (omtl_texture, 2D) = "Default_Material_Texture_White"
//@ [_EnableMRAOTexture] _AO (omtl_ao, Range(0.000000, 1.000000)) = 1.000000
//@ [_EnableMRAOTexture] MraoTextureUV1 (omtl_use_uv1, Defs) = 0

//@ _EnvironmentIntensity (omtl_intensity, Range(0.000000, 7.000000), HideInInspector) = 1.000000
//@ _EnvironmentRotation (omtl_rotation, Range(0.000000, 1.000000), HideInInspector) = 0.000000
//@ _EnvironmentTintColor (omtl_color, Color, HideInInspector) = [1.000000, 1.000000, 1.000000, 1.000000]

//@ $omtl_emissive$
//@ Emissive (omtl_emissive, Defs) = 0
//@ _RadianceTexture (omtl_radiance, TextureCube, HideInInspector) = "Default_Texture_Radiance"
//@ [Emissive] _EmissiveColor (omtl_color, Color) = [1.000000, 1.000000, 1.000000, 1.000000]
//@ [Emissive] _EmissiveIntensity (omtl_intensity, Range(0.000000, 10.000000)) = 1.000000
//@ [Emissive] _EmissiveTexture (omtl_texture, 2D) = "Default_Material_Texture_White"
//@ [Emissive] EmissiveTextureUV1 (omtl_use_uv1, Defs) = 0

//@ $omtl_rim_highlight$
//@ RimHighlight (omtl_rim_highlight, Defs) = 0
//@ [RimHighlight] RimHighlightInvert (omtl_rim_highlight_invert, Defs) = 0
//@ [RimHighlight] _RimHighlightColor (omtl_color, Color) = [1.000000, 1.000000, 1.000000, 1.000000]
//@ [RimHighlight] _RimHighlightIntensity (omtl_intensity, Range(0.000000, 5.000000)) = 3.000000
//@ [RimHighlight] _RimHighlightPower (omtl_power, Range(1.000000, 10.000000)) = 5.000000
//@ [RimHighlight] _RimHighlightTexture (omtl_texture, 2D) = "Default_Material_Texture_White"

//@ $omtl_thin_film$
//@ ThinFilm (omtl_thin_film, Defs) = 0
//@ [ThinFilm] _ThinFilmIOR (omtl_ior, Range(1.500000, 5.000000)) = 5.000000
//@ [ThinFilm] _ThinFilmThickness (omtl_thickness, Range(100.000000, 1000.000000)) = 400.000000
//@ [ThinFilm] _ThinFilmTexture (omtl_texture, 2D) = "Default_Material_Texture_White"

//@ $omtl_uv_control$
//@ UVControl (omtl_uv_control, Defs) = 0
//@ [UVControl] _Tiling (omtl_tiling, Vec2) = [1.000000, 1.000000]
//@ [UVControl] _Offset (omtl_offset, Vec2) = [0.000000, 0.000000]
//@ [UVControl] _UVRotation (omtl_rotation, Range(0.000000, 1.000000)) = 0.000000

//@ $omtl_misc_render_setting$
//@ VertexColorTinting (omtl_vertex_color_tinting, Defs) = 0
//@ DisableSpecular (omtl_disable_specular, Defs) = 0

//@ AE_DIRECTIONAL_3 (AE_DIRECTIONAL_3, Defs, HideInInspector) = 1
//@ AE_DIRECTIONAL_2 (AE_DIRECTIONAL_2, Defs, HideInInspector) = 0
//@ AE_DIRECTIONAL_1 (AE_DIRECTIONAL_1, Defs, HideInInspector) = 0
//@ AE_POINT_2 (AE_POINT_2, Defs, HideInInspector) = 1
//@ AE_POINT_1 (AE_POINT_1, Defs, HideInInspector) = 0
//@ AE_SPOT_2 (AE_SPOT_2, Defs, HideInInspector) = 1
//@ AE_SPOT_1 (AE_SPOT_1, Defs, HideInInspector) = 0
//@ ---END UIPROPERTY

    #version 310 es
#pragma only_renderers glsl31 metal
#pragma multi_compile VFX_COMPAT_MODE

#pragma multi_compile AE_RECEIVE_SHADOW
#pragma shader_feature DEFINE_BUILTIN_MAT_UNIFORMS

// Attributes: attributes in vertex shader
#pragma input attributes
    #define AE_DIRECTIONAL_3
    #define AE_POINT_2
    #define AE_SPOT_2
in mediump vec3 attPosition;
in mediump vec3 attNormal;
in highp vec2 attTexcoord0;
in highp vec2 attTexcoord1;
in mediump vec4 attTangent;
in lowp vec4 attColor;
#ifdef AE_AMAZING_USE_BONES
in mediump vec4 attBoneIds;
in highp vec4 attWeights;
#endif
#pragma end

// Varyings: outputs of vertex shader, inputs for fragment shader
#pragma varying varyings
    #define AE_DIRECTIONAL_3
    #define AE_POINT_2
    #define AE_SPOT_2
    highp vec4 vfx_data_0;
    highp vec4 vfx_data_1;
    highp vec4 vfx_data_2;
    highp vec4 vfx_data_3;
    highp vec4 vfx_data_4;
//highp vec2 g_vary_uv0;
mediump vec4 v_gl_pos;

mediump vec3 v_posWS;
highp vec3 v_nDirWS;
highp vec2 v_uv0;
highp vec2 v_uv1;

highp vec3 v_tDirWS;
highp vec3 v_bDirWS;

#if defined(_DissolveVertexColor) || defined(_EnableShowVertexColor) || defined(VertexColorTinting)
mediump vec4 v_vertCol;
#endif
#pragma end

// Output: output targets in fragment shader
#pragma output targets
out lowp vec4 o_fragColor;
#pragma end

// Vertex stage section in vertex shader
#pragma vs attributes varyings
    #define VFXGRAPH
uniform vec4 Scale;
uniform float MeshID_1;
    uniform vec4 u_WorldSpaceCameraPos;
    uniform vec4 u_ScreenParams;

    uniform mat4 Model;
    uniform mat4 View;
    uniform mat4 Projection;
    uniform mat4 ModelInv;
    uniform mat4 WorldToLocal;
    uniform vec4 cameraPosition;
    uniform float delta;

    
#define VFX_PI 3.1415926538
#define VFX_PI2 6.28318530718
#define VFX_M_PI_F 3.14159265359
#define VFX_HALF_PI 1.57079632679
#define VFX_ONE_THIRD_PI 1.0471975512
#define VFX_FLT_MIN 1.1e-37
#define VFX_EPSILON 1e-5

#define WriteFloatToBuffer(buffer, i, v) (buffer[(i)] = floatBitsToUint(v))
#define WriteUintToBuffer(buffer, i, v) (buffer[(i)] = v)

#define ReadUintFromBuffer(buffer, i) (buffer[(i)])
#define ReadFloatFromBuffer(buffer, i) (uintBitsToFloat(buffer[(i)]))

#define ReadUintFromBufferCompat(tex, i) (floatBitsToUint(texelFetch(tex, ivec2((i) % BUFFER_WIDTH, (i) / BUFFER_WIDTH), 0).r))
#define ReadFloatFromBufferCompat(tex, i) (texelFetch(tex, ivec2((i) % BUFFER_WIDTH, (i) / BUFFER_WIDTH), 0).r)
#define ReadFromBufferCompat(tex, i) (texelFetch(tex, ivec2((i) % BUFFER_WIDTH, (i) / BUFFER_WIDTH), 0))

uint wang_hash(uint seed)
{
    seed = (seed ^ 61u) ^ (seed >> 16u);
    seed *= 9u;
    seed = seed ^ (seed >> 4u);
    seed *= 0x27d4eb2du;
    seed = seed ^ (seed >> 15u);
    return seed;
}

uint AnotherHash(uint seed)
{
    seed = ((seed >> 16u) ^ seed) * 0x45d9f3bu;
    seed = ((seed >> 16u) ^ seed) * 0x45d9f3bu;
    seed = (seed >> 16u) ^ seed;
    return seed;
}

float Rand(inout uint seed)
{
    seed = 0x0019660du * seed + 0x3c6ef35fu;
    float t = uintBitsToFloat((seed >> 9u) | 0x3f800000u);
    return t - 1.0f;
}
    
vec2 Rand2(inout uint seed)
{
    return vec2(Rand(seed), Rand(seed));
}

vec3 Rand3(inout uint seed)
{
    return vec3(Rand(seed), Rand(seed), Rand(seed));
}

float random(inout uint seed, float A, float B)
{
    float rand = Rand(seed);
    return mix(A, B, rand);
}

vec3 random3(inout uint seed, vec3 A, vec3 B)
{
    vec3 rand3 = Rand3(seed);
    return mix(A, B, rand3);
}

vec3 VFXSafeNormalize(vec3 v)
{
    float sqrLength = max(VFX_FLT_MIN,dot(v,v));
    return v * inversesqrt(sqrLength);
}

vec3 HUEtoRGB(float H)
{
    float R = abs(H * 6.0 - 3.0) - 1.0;
    float G = 2.0 - abs(H * 6.0 - 2.0);
    float B = 2.0 - abs(H * 6.0 - 4.0);
    return clamp(vec3(R,G,B), 0.0, 1.0);
}

vec3 RGBtoHCV(vec3 RGB)
{
    vec4 P = (RGB.g < RGB.b) ? vec4(RGB.bg, -1.0, 2.0/3.0) : vec4(RGB.gb, 0.0, -1.0/3.0);
    vec4 Q = (RGB.r < P.x) ? vec4(P.xyw, RGB.r) : vec4(RGB.r, P.yzx);
    float C = Q.x - min(Q.w, Q.y);
    float H = abs((Q.w - Q.y) / (6.0 * C + 1e-10) + Q.z);
    return vec3(H, C, Q.x);
}

vec3 RGBtoHSV(vec3 RGB)
{
    vec3 HCV = RGBtoHCV(RGB);
    float S = HCV.y / (HCV.z + 1e-10);
    return vec3(HCV.x, S, HCV.z);
}

vec3 HSVtoRGB(vec3 HSV)
{
    return ((HUEtoRGB(HSV.x) - 1.0) * HSV.y + 1.0) * HSV.z;
}

vec3 quintic(vec3 x)
{
    return x * x * x * (x * (x * 6.0 - 15.0) + 10.0);
}

float hash(vec3 v)
{
    float HASHSCALE = 0.1031;
    v = fract(v * HASHSCALE);
    v += dot(v, v.yzx + 19.19);
    return fract((v.x + v.y) * v.z);
}

float noise01(float x, float y, float z)
{
    // Gradients
    vec3 PerlinNoise_Gradients[12];
    PerlinNoise_Gradients[0] = vec3(1, 1, 0);
    PerlinNoise_Gradients[1] = vec3(-1, 1, 0);
    PerlinNoise_Gradients[2] = vec3(1, -1, 0);
    PerlinNoise_Gradients[3] = vec3(-1, -1, 0);
    PerlinNoise_Gradients[4] = vec3(1, 0, 1);
    PerlinNoise_Gradients[6] = vec3(1, 0, -1);
    PerlinNoise_Gradients[7] = vec3(-1, 0, -1);
    PerlinNoise_Gradients[8] = vec3(0, 1, 1);
    PerlinNoise_Gradients[9] = vec3(0, -1, 1);
    PerlinNoise_Gradients[10] = vec3(0, 1, -1);
    PerlinNoise_Gradients[11] = vec3(0, -1, -1);

    vec3 p = floor(vec3(x, y, z));
    vec3 t = vec3(x, y, z) - p;
    vec3 f = quintic(t);
    vec3 v0 = p + vec3(0.0, 0.0, 0.0);
    vec3 v1 = p + vec3(1.0, 0.0, 0.0);
    vec3 v2 = p + vec3(0.0, 1.0, 0.0);
    vec3 v3 = p + vec3(1.0, 1.0, 0.0);
    vec3 v4 = v0 + vec3(0.0, 0.0, 1.0);
    vec3 v5 = v1 + vec3(0.0, 0.0, 1.0);
    vec3 v6 = v2 + vec3(0.0, 0.0, 1.0);
    vec3 v7 = v3 + vec3(0.0, 0.0, 1.0);

    int g0Index = int(hash(v0) * 12.0);
    int g1Index = int(hash(v1) * 12.0);
    int g2Index = int(hash(v2) * 12.0);
    int g3Index = int(hash(v3) * 12.0);
    int g4Index = int(hash(v4) * 12.0);
    int g5Index = int(hash(v5) * 12.0);
    int g6Index = int(hash(v6) * 12.0);
    int g7Index = int(hash(v7) * 12.0);
    vec3 g0 = PerlinNoise_Gradients[g0Index];
    vec3 g1 = PerlinNoise_Gradients[g1Index];
    vec3 g2 = PerlinNoise_Gradients[g2Index];
    vec3 g3 = PerlinNoise_Gradients[g3Index];
    vec3 g4 = PerlinNoise_Gradients[g4Index];
    vec3 g5 = PerlinNoise_Gradients[g5Index];
    vec3 g6 = PerlinNoise_Gradients[g6Index];
    vec3 g7 = PerlinNoise_Gradients[g7Index];

    return mix(
        mix(
            mix(dot(g0, t - vec3(0.0, 0.0, 0.0)), dot(g1, t - vec3(1.0, 0.0, 0.0)), f.x),
            mix(dot(g2, t - vec3(0.0, 1.0, 0.0)), dot(g3, t - vec3(1.0, 1.0, 0.0)), f.x),
            f.y
        ),
        mix(
            mix(dot(g4, t - vec3(0.0, 0.0, 1.0)), dot(g5, t - vec3(1.0, 0.0, 1.0)), f.x),
            mix(dot(g6, t - vec3(0.0, 1.0, 1.0)), dot(g7, t - vec3(1.0, 1.0, 1.0)), f.x),
            f.y
        ),
        f.z
    );
}

float fBm(int octaves, float x, float y, float z, float Fre)
{
    float amplitude = 1.0;
    float frequency = Fre;
    float result = 0.0;
    float totalAmplitude = 0.0;
    
    for (int i = 0; i < octaves; i++) {
        vec3 pos = frequency * vec3(x, y, z);
        result = result + amplitude * noise01(pos.x, pos.y, pos.z);
        totalAmplitude = totalAmplitude + amplitude;
        amplitude = amplitude / 2.0;
        frequency = frequency * 2.0;
    }
    result = result / totalAmplitude;
    return result;
}

vec3 curlNoise(vec3 oldPos, float NoiseScale, float Frequency, int Octaves)
{
    float ParticleZoneSize = 5.0;
    float halfZone = ParticleZoneSize / 2.0;
    // Get noise value
    float eps = 0.0001;
    vec3 uvy = (oldPos + vec3(halfZone, halfZone, halfZone)) / ParticleZoneSize;
    uvy = uvy * NoiseScale;

    vec3 curl = vec3(0.0, 0.0, 0.0);
    float n = 0.0, a = 0.0, b = 0.0;
    float o = fBm(Octaves, uvy.x, uvy.y, uvy.z, Frequency);

    n = fBm(Octaves, uvy.x, uvy.y - eps, uvy.z, Frequency);
    a = (o - n) / eps;
    n = fBm(Octaves, uvy.x, uvy.y, uvy.z - eps, Frequency);
    b = (o - n) / eps;
    curl.x = a - b;

    n = fBm(Octaves, uvy.x, uvy.y, uvy.z - eps, Frequency);
    a = (o - n) / eps;
    n = fBm(Octaves, uvy.x - eps, uvy.y, uvy.z, Frequency);
    b = (o - n) / eps;
    curl.y = a - b;

    n = fBm(Octaves, uvy.x - eps, uvy.y, uvy.z, Frequency);
    a = (o - n) / eps;
    n = fBm(Octaves, uvy.x, uvy.y - eps, uvy.z, Frequency);
    b = (o - n) / eps;
    curl.z = a - b;

    return curl * NoiseScale * 0.01;
}

void Orient_4(inout vec3 axisX, inout vec3 axisY, inout vec3 axisZ, mat4 viewRot) /*mode:FaceCameraPlane axes:ZY */
{
    axisX = vec3(viewRot[0].x, viewRot[1].x, viewRot[2].x);
    axisY = vec3(viewRot[0].y, viewRot[1].y, viewRot[2].y);
    axisZ = vec3(viewRot[0].z, viewRot[1].z, viewRot[2].z);
}

mat3 GetScaleMatrix(vec3 scale)
{
    return mat3(scale.x,    0.0,          0.0,
                    0.0,          scale.y,    0.0,
                    0.0,          0.0,          scale.z);
}

mat3 GetEulerMatrix(vec3 angles)
{
    vec3 s,c;
    s = sin(angles);
    c = cos(angles);

    return transpose(mat3(c.y * c.z + s.x * s.y * s.z,    c.z * s.x * s.y - c.y * s.z,    c.x * s.y,
                    c.x * s.z,                      c.x * c.z,                      -s.x,
                    -c.z * s.y + c.y * s.x * s.z,   c.y * c.z * s.x + s.y * s.z,    c.x * c.y));
}

mat3 GetRotationMatrixTranspose(vec4 q) {
  float x = q.x * 2.0;
  float y = q.y * 2.0;
  float z = q.z * 2.0;
  float xx = q.x * x;
  float yy = q.y * y;
  float zz = q.z * z;
  float xy = q.x * y;
  float xz = q.x * z;
  float yz = q.y * z;
  float wx = q.w * x;
  float wy = q.w * y;
  float wz = q.w * z;

  return mat3(
    1.0f - (yy + zz), xy - wz, xz + wy,
    xy + wz, 1.0f - (xx + zz), yz - wx,
    xz - wy, yz + wx, 1.0f - (xx + yy)
  );
}
    
mat4 GetElementToVFXMatrix(vec3 axisX,vec3 axisY,vec3 axisZ,mat3 rot,vec3 pivot,vec3 size,vec3 pos)
{
    mat3 rotAndScale = GetScaleMatrix(size);
    rotAndScale = rotAndScale * rot;
    rotAndScale = rotAndScale * transpose(mat3(axisX,axisY,axisZ));
    pos -= (pivot * rotAndScale);
    return transpose(mat4(
        vec4(rotAndScale[0],pos.x),
        vec4(rotAndScale[1],pos.y),
        vec4(rotAndScale[2],pos.z),
        vec4(0.0,0.0,0.0,1.0)));
}

mat4 GetElementToVFXMatrix(vec3 axisX,vec3 axisY,vec3 axisZ,vec3 angles,vec3 pivot,vec3 size,vec3 pos)
{
    mat3 rot = GetEulerMatrix(angles);
    return GetElementToVFXMatrix(axisX,axisY,axisZ,rot,pivot,size,pos);
}

mat4 GetElementToVFXMatrix(vec3 axisX,vec3 axisY,vec3 axisZ,vec4 quat,vec3 pivot,vec3 size,vec3 pos)
{
    mat3 rot = GetRotationMatrixTranspose(quat);
    return GetElementToVFXMatrix(axisX,axisY,axisZ,rot,pivot,size,pos);
}

vec2 ParticleScreenUV(vec3 position, vec3 size, vec3 pivot, vec3 angle, uint inWorldSpace, mat4 model, mat4 view, mat4 projection) {
  vec3 worldPos = (model * vec4(position, 1.0)).xyz;
  vec3 axisX = vec3(1.0, 0.0, 0.0);
  vec3 axisY = vec3(0.0, 1.0, 0.0);
  vec3 axisZ = vec3(0.0, 0.0, 1.0);

  axisX = vec3(view[0].x, view[1].x, view[2].x);
  axisY = vec3(view[0].y, view[1].y, view[2].y);
  axisZ = vec3(view[0].z, view[1].z, view[2].z);
  // Orient_4(axisX, axisY, axisZ, view);
  mat4 elementToVFX = GetElementToVFXMatrix(
                      axisX,
                      axisY,
                      axisZ,
                      angle,
                      pivot,
                      size,
                      position);
  vec3 posInWorld = position;
  if(inWorldSpace == 0u){
      posInWorld = (model * elementToVFX * vec4(0.0, 0.0, 0.0, 1.0)).xyz;
  } else {
      posInWorld = (elementToVFX * vec4(0.0, 0.0, 0.0,    1.0)).xyz;
  }
  vec4 clipPos = projection * view * vec4(posInWorld, 1.0);
  vec3 ndcPos = clipPos.xyz / clipPos.w;
  vec2 screenUV = (ndcPos.xy + vec2(1.0)) * 0.5;
  return screenUV;
}

vec3 radians3(vec3 degree)
{
    return vec3(radians(degree.x), radians(degree.y), radians(degree.z));
}


mat4 GetModelMatrix(vec3 eulerRotation, vec3 translation, float flag)
{
    vec3 s, c;
    s = sin(eulerRotation);
    c = cos(eulerRotation);
    mat4 Rx;
    Rx[0] = vec4(1.0, 0.0, 0.0, 0.0);
    Rx[1] = vec4(0.0, c.x, s.x, 0.0);
    Rx[2] = vec4(0.0, -s.x, c.x, 0.0);
    Rx[3] = vec4(0.0, 0.0, 0.0, 1.0);
    mat4 Ry;
    Ry[0] = vec4(c.y, 0.0, s.y, 0.0);
    Ry[1] = vec4(0.0, 1.0, 0.0, 0.0);
    Ry[2] = vec4(-s.y, 0.0, c.y, 0.0);
    Ry[3] = vec4(0.0, 0.0, 0.0, 1.0);
    mat4 Rz;
    Rz[0] = vec4(c.z, s.z, 0.0, 0.0);
    Rz[1] = vec4(-s.z, c.z, 0.0, 0.0);
    Rz[2] = vec4(0.0, 0.0, 1.0, 0.0);
    Rz[3] = vec4(0.0, 0.0, 0.0, 1.0);
    mat4 Rw;
    Rw[0] = vec4(1.0, 0.0, 0.0, 0.0);
    Rw[1] = vec4(0.0, 1.0, 0.0, 0.0);
    Rw[2] = vec4(0.0, 0.0, 1.0, 0.0);
    Rw[3] = vec4(-translation.x, -translation.y, -translation.z, 1.0);
    if (flag <= 0.0) return Rw * Rx * Ry * Rz;
    return Rz * Ry * Rx * Rw;
}

mat4 GetTransformInvMatrix(vec3 angles,vec3 scale,vec3 pos)
{
    mat3 invrotAndScale = GetScaleMatrix(1.0/scale);
    mat3 invrot = GetEulerMatrix(-angles);
    invrotAndScale = invrot * invrotAndScale;
    mat4 inv = mat4(
        vec4(invrotAndScale[0],0),
        vec4(invrotAndScale[1],0),
        vec4(invrotAndScale[2],0),
        vec4(0,0,0,1));
    mat4 invpos = mat4(
        vec4(1.0,0,0,-pos.x),
        vec4(0,1.0,0,-pos.y),
        vec4(0,0,1,-pos.z),
        vec4(0,0,0,1));
    return transpose(invpos * inv);
}
    
mat4 GetTransformMatrix(vec3 angles,vec3 scale,vec3 pos)
{
    mat3 rotAndScale = GetScaleMatrix(scale);
    mat3 rot = GetEulerMatrix(angles);
    rotAndScale = rotAndScale * rot;
    return transpose(mat4(
        vec4(rotAndScale[0],pos.x),
        vec4(rotAndScale[1],pos.y),
        vec4(rotAndScale[2],pos.z),
        vec4(0,0,0,1)));
}
  

    vec2 GetSubUV(int iflipbookIndex, vec2 uv, ivec2 idim, vec2 invDim)
    {
        ivec2 tile;
        tile.y = iflipbookIndex / idim.x;
        tile.x = iflipbookIndex - idim.x * tile.y;
        return (vec2(tile.x, tile.y) + uv) * invDim;
    }

    vec2 GetUVData(vec2 flipbookSize, vec2 invFlipbookSize, vec2 uv, float texIndex) // with flipbooks
    {
        vec2 data = vec2(0.0,0.0);

        float frameBlend = fract(texIndex);
        float frameIndex = texIndex - frameBlend;

        ivec2 iflipbookSize = ivec2(flipbookSize.x, flipbookSize.y);
        data = GetSubUV(int(frameIndex), uv, iflipbookSize, invFlipbookSize);
        return data;
    }

    vec4 VFX_worldToObjectNormal(vec3 worldNormal)
    {
        return vec4(normalize((vec4(worldNormal, 0.0) * Model).xyz), 0.0);
    }

    #define BUFFER_WIDTH 2048u
    #ifdef VFX_COMPAT_MODE
    void unpackVec4To2x32Uint(vec4 packed, out uint value1, out uint value2) {
        // Directly convert back from float to 16-bit unsigned integers
        uint value1_lower = uint(packed.r + 0.5); // Rounding to the nearest integer
        uint value1_upper = uint(packed.g + 0.5);
        uint value2_lower = uint(packed.b + 0.5);
        uint value2_upper = uint(packed.a + 0.5);

        // Reassemble the 32-bit integers
        value1 = (value1_upper << 16) | value1_lower;
        value2 = (value2_upper << 16) | value2_lower;
    }
    #endif

    //buffer 1
    #ifdef VFX_COMPAT_MODE
    layout(binding = 0) uniform highp sampler2D attributeBuffer;
    layout(binding = 1) uniform highp sampler2D sortBuffer;
    #else
    layout(std430, binding = 0) buffer attributeBuffer {
        uint attributeBuffer_buf[];
    };
    layout(std430, binding = 1) buffer sortBuffer {
        uint sortBuffer_buf[];
    };
    #endif
    void SetMeshPhysics(inout vec3 position, int MeshID, float deltaTime)
{

}

void SetScale(inout vec3 scale, vec4 Scale)
{
scale.xyz = Scale.xyz;
}

precision mediump float;
uniform highp mat4 u_Model;
uniform mediump mat4 u_InvModel;
uniform highp mat4 u_MVP;
uniform mediump mat4 u_TransposeInvModel;
uniform highp vec4 u_Time;

/** USED BY: **
    PBR
    Uber
    Face Paint
    Unlit
    Simple Lighting
    Matcap
**/
/** CONTAINS: **
    General UV Control
    GLTF Texture Transform Calibration
    Surface View Dir Transform surface maps
**/

#ifndef TEXTURETRANSFORM_HPP
#define TEXTURETRANSFORM_HPP

#ifndef GLTF_UV_CALIBRATION
#if defined(UVControl) || defined(UvControl)
uniform highp vec2 _Tiling;
uniform highp vec2 _Offset;
uniform highp float _UVRotation;

vec2 UV_TRS(vec2 inputUV, vec2 uvCenter, vec2 uvPan, vec2 uvScale, float uvRotate) {
    vec2 minusCenterUV = inputUV - uvCenter;
    float cosVal = cos(uvRotate);
    float sinVal = sin(uvRotate);
    mat2 rotateMat = mat2(cosVal, -sinVal, sinVal, cosVal);

    vec2 outputUV = minusCenterUV * uvScale;
    outputUV = rotateMat * outputUV + uvCenter;
    outputUV = outputUV + uvPan;
    return outputUV;
}
#endif

#else

// GLTF Calibration
#ifdef TextureTransform
uniform highp vec2 Offset;
uniform highp vec2 Tiling;
uniform highp float UVRotation;

#ifdef _AlbedoTextureTransform
uniform highp vec2 _AlbedoOffset;
uniform highp vec2 _AlbedoTiling;
uniform highp float _AlbedoUVRotation;
#endif

#ifdef _EmissiveTextureTransform
uniform highp vec2 _EmissiveOffset;
uniform highp vec2 _EmissiveTiling;
uniform highp float _EmissiveUVRotation;
#endif

#ifdef _NormalTextureTransform
uniform highp vec2 _NormalOffset;
uniform highp vec2 _NormalTiling;
uniform highp float _NormalUVRotation;
#endif

#ifdef _MRAOTextureTransform
uniform highp vec2 _MRAOOffset;
uniform highp vec2 _MRAOTiling;
uniform highp float _MRAOUVRotation;
#endif

#ifdef _AOTextureTransform
uniform highp vec2 _AOOffset;
uniform highp vec2 _AOTiling;
uniform highp float _AOUVRotation;
#endif

#ifdef _RefractionTextureTransform
uniform highp vec2 _RefractionOffset;
uniform highp vec2 _RefractionTiling;
uniform highp float _RefractionUVRotation;
#endif

#ifdef _FabricTextureTransform
uniform highp vec2 _FabricOffset;
uniform highp vec2 _FabricTiling;
uniform highp float _FabricUVRotation;
#endif

#ifdef _CoatTextureTransform
uniform highp vec2 _CoatOffset;
uniform highp vec2 _CoatTiling;
uniform highp float _CoatUVRotation;
#endif

vec2 UVTextureTransform(vec2 inputUV, vec2 uvPan, vec2 uvScale, float uvRotate) {
    vec2 uvCenter = vec2(0.0, 1.0);
    uvRotate = uvRotate * 2.0 * 3.1415926;
    uvPan.y = -uvPan.y;
    vec2 minusCenterUV = inputUV - uvCenter;
    float cosVal = cos(uvRotate);
    float sinVal = sin(uvRotate);
    mat2 rotateMat = mat2(cosVal, -sinVal, sinVal, cosVal);

    vec2 outputUV = rotateMat * minusCenterUV;
    outputUV = outputUV * uvScale;
    outputUV = outputUV + uvCenter + uvPan;
    return outputUV;
}
#endif

vec2 getAlbedoUV(vec2 inputUV) {
#ifdef _AlbedoTextureTransform
    return UVTextureTransform(inputUV, _AlbedoOffset, _AlbedoTiling, _AlbedoUVRotation);
#else
    return inputUV;
#endif
}

vec2 getEmissiveUV(vec2 inputUV) {
#ifdef _EmissiveTextureTransform
    return UVTextureTransform(inputUV, _EmissiveOffset, _EmissiveTiling, _EmissiveUVRotation);
#else
    return inputUV;
#endif
}

vec2 getNormalUV(vec2 inputUV) {
#ifdef _NormalTextureTransform
    return UVTextureTransform(inputUV, _NormalOffset, _NormalTiling, _NormalUVRotation);
#else
    return inputUV;
#endif
}

vec2 getMRAOUV(vec2 inputUV) {
#ifdef _MRAOTextureTransform
    return UVTextureTransform(inputUV, _MRAOOffset, _MRAOTiling, _MRAOUVRotation);
#else
    return inputUV;
#endif
}

vec2 getAOUV(vec2 inputUV) {
#ifdef _AOTextureTransform
    return UVTextureTransform(inputUV, _AOOffset, _AOTiling, _AOUVRotation);
#else
    return inputUV;
#endif
}

vec2 getRefractionUV(vec2 inputUV) {
#ifdef _RefractionTextureTransform
    return UVTextureTransform(inputUV, _RefractionOffset, _RefractionTiling, _RefractionUVRotation);
#else
    return inputUV;
#endif
}

vec2 getFabricUV(vec2 inputUV) {
#ifdef _FabricTextureTransform
    return UVTextureTransform(inputUV, _FabricOffset, _FabricTiling, _FabricUVRotation);
#else
    return inputUV;
#endif
}

vec2 getCoatUV(vec2 inputUV) {
#ifdef _CoatTextureTransform
    return UVTextureTransform(inputUV, _CoatOffset, _CoatTiling, _CoatUVRotation);
#else
    return inputUV;
#endif
}
#endif

// view transform for multi surface maps
#if defined(Heightmap) || (defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake))
vec3 ViewDirTS(vec3 position, vec3 tangent, vec3 binormal, vec3 normal) {
    //transform object space viewDir to tangent space viewDir
    vec4 objectSpaceCameraPos = u_InvModel * vec4(u_WorldSpaceCameraPos.rgb, 1.0);
    vec3 viewDirOS = objectSpaceCameraPos.xyz - position.xyz;
    mat3 object2Tangent = transpose(mat3(tangent, binormal, normal));
    return object2Tangent * viewDirOS;
}
#endif

#endif
precision mediump float;

#ifdef AE_AMAZING_USE_BONES
precision highp float;
const int MAX_BONES = 100;
struct BoneMatrix {
    highp mat4 u_Bone[MAX_BONES];
};
layout(std140) uniform highp u_PalatteBuffer {
    BoneMatrix boneMatrix;
};
#endif
#define VERTEX_TRANSFORM_COMPLETE_CAL
/** USED BY: **
    Uber
    PBR
*/
/** CONTAINS: **
    Bone Transform
    General Transform
**/
/** REQUIRED UNIFORMS: **
    u_Model
    u_MVP
    u_TransposeInvModel
**/

#ifndef VERTEX_TRANSFORM_HPP
#define VERTEX_TRANSFORM_HPP

// Bone Transform
#ifdef AE_AMAZING_USE_BONES
mat4 getBoneTransform() {
    mat4 boneTransform = boneMatrix.u_Bone[int(attBoneIds.x)] * attWeights.x +
        boneMatrix.u_Bone[int(attBoneIds.y)] * attWeights.y +
        boneMatrix.u_Bone[int(attBoneIds.z)] * attWeights.z +
        boneMatrix.u_Bone[int(attBoneIds.w)] * attWeights.w;
    return boneTransform;
}
vec4 get_bm_postiton(mat4 boneTransform, vec3 attPosition) {
    return boneTransform * vec4(attPosition, 1.0);
}
vec3 get_bn_normal(mat4 boneTransform, vec3 attNormal) {
    return (boneTransform * vec4(attNormal, 0.0)).xyz;
}
vec3 get_bm_tangent(mat4 boneTransform, vec3 attTangent) {
    return (boneTransform * vec4(attTangent, 0.0)).xyz;
}
vec3 get_bm_binormal(mat4 boneTransform, vec3 attBinormal) {
    return (boneTransform * vec4(attBinormal, 0.0)).xyz;
}
// cal posWS
vec3 get_posWS(vec4 bm_postiton) {
    return (u_Model * bm_postiton).xyz;
}
vec3 get_posWS(mat4 boneTransform, vec3 attPosition) {
    vec4 bm_postiton = get_bm_postiton(boneTransform, attPosition);
    return get_posWS(bm_postiton);
}
// cal ndir
vec3 get_nDirWS(vec3 bn_normal) {
    return (u_TransposeInvModel * vec4(bn_normal, 0.0)).xyz;
}
vec3 get_nDirWS(mat4 boneTransform, vec3 attNormal) {
    vec3 bn_normal = get_bn_normal(boneTransform, attNormal);
    return get_nDirWS(bn_normal);
}
// cal tDir
vec3 get_tDirWS(vec3 bm_tangent) {
    return (u_Model * vec4(bm_tangent, 0.0)).xyz;
}
vec3 get_tDirWS(mat4 boneTransform, vec3 attTangent) {
    vec3 bm_tangent = get_bm_tangent(boneTransform, attTangent);
    return get_tDirWS(bm_tangent);
}
// cal bDir
vec3 get_bDirWS(vec3 bm_binormal) {
    return (u_Model * vec4(bm_binormal, 0.0)).xyz;
}
vec3 get_bDirWS(mat4 boneTransform, vec3 attBinormal) {
    vec3 bm_binormal = get_bm_binormal(boneTransform, attBinormal);
    return get_bDirWS(bm_binormal);
}

vec4 get_gl_Position(vec4 bm_postiton) {
    return u_MVP * bm_postiton;
}
#ifdef VERTEX_TRANSFORM_COMPLETE_CAL
vec4 BoneTransformWithParam(
    vec4 bm_postiton,
    vec3 bn_normal,
    vec3 bm_tangent,
    vec3 bm_binormal,
    vec3 attBinormal,
    inout vec3 posWS,
    inout vec3 nDirWS,
    inout vec3 tDirWS,
    inout vec3 bDirWS
) {
    posWS = get_posWS(bm_postiton);
    nDirWS = get_nDirWS(bn_normal);
    tDirWS = get_tDirWS(bm_tangent);
    bDirWS = get_bDirWS(bm_binormal);
    return get_gl_Position(bm_postiton);
}
vec4 BoneTransform(vec3 attBinormal, inout vec3 posWS, inout vec3 nDirWS, inout vec3 tDirWS, inout vec3 bDirWS) {
    precision highp float;
    mat4 boneTransform = getBoneTransform();
    vec4 bm_postiton = get_bm_postiton(boneTransform, attPosition);
    vec3 bn_normal = get_bn_normal(boneTransform, attNormal);
    vec3 bm_tangent = get_bm_tangent(boneTransform, attTangent.xyz);
    vec3 bm_binormal = get_bm_binormal(boneTransform, attBinormal);
    precision mediump float;
    return BoneTransformWithParam(bm_postiton, bn_normal, bm_tangent, bm_binormal, attBinormal, posWS, nDirWS, tDirWS, bDirWS);
}
#endif
#else
vec3 get_posWS(vec3 usedPosition) {
    return (u_Model * vec4(usedPosition, 1.0)).xyz;
}
vec3 get_nDirWS(vec3 usedNormal) {
    return (u_TransposeInvModel * vec4(usedNormal, 0.0)).xyz;
}
vec3 get_tDirWS(vec3 usedTangent) {
    return (u_Model * vec4(usedTangent, 0.0)).xyz;
}
vec3 get_bDirWS(vec3 usedBinormal) {
    return (u_Model * vec4(usedBinormal, 0.0)).xyz;
}
vec4 get_gl_Position(vec3 usedPosition) {
    return u_MVP * vec4(usedPosition, 1.0);
}
#ifdef VERTEX_TRANSFORM_COMPLETE_CAL
vec4 GeneralTransformWithParam(
    vec3 usedPosition,
    vec3 usedNormal,
    vec3 usedTangent,
    vec3 usedBinormal,
    inout vec3 posWS,
    inout vec3 nDirWS,
    inout vec3 tDirWS,
    inout vec3 bDirWS
) {
    posWS = get_posWS(usedPosition);
    nDirWS = get_nDirWS(usedNormal);
    tDirWS = get_tDirWS(usedTangent);
    bDirWS = get_bDirWS(usedBinormal);
    return get_gl_Position(usedPosition);
}
vec4 GeneralTransform(vec3 attBinormal, inout vec3 posWS, inout vec3 nDirWS, inout vec3 tDirWS, inout vec3 bDirWS) {
    return GeneralTransformWithParam(attPosition, attNormal, attTangent.xyz, attBinormal, posWS, nDirWS, tDirWS, bDirWS);
}
#endif
#endif
#endif
#pragma end

// Fragment stage section in fragment shader
#pragma fs varyings targets
    #define VFXGRAPH
    #define AE_DIRECTIONAL_3
    #define AE_POINT_2
    #define AE_SPOT_2
    uniform vec4 u_WorldSpaceCameraPos;
    uniform vec4 u_ScreenParams;
uniform lowp sampler2D u_FBOTexture;
uniform mediump mat4 u_View;
uniform mediump mat4 u_Projection;

#ifndef CORE_BLEND_HPP
#define CORE_BLEND_HPP
#ifndef INPUT_DEFINE_H
#define INPUT_DEFINE_H

#ifndef DEFINE_BUILTIN_MAT_UNIFORMS
    ///------------ Builtin shader variables ------------///
    //---1---Transformations All these matrices are matrix4x4f type
    /// matrix4x4f    Current model * view * projection matrix.
    uniform mat4 u_MVP;
    /// matrix4x4f    Current model * view matrix.
    uniform mat4 u_MV;
    /// matrix4x4f    Current view matrix.
    uniform mat4 u_View;
    /// matrix4x4f    Inverse of Current view matrix.
    uniform mat4 u_InvView;
    /// matrix4x4f    Current projection matrix.
    uniform mat4 u_Projection;
    /// matrix4x4f    Current view * projection matrix.
    uniform mat4 u_VP;
    /// matrix4x4f    Transpose of model * view matrix.
    uniform mat4 u_TransposeMV;
    /// matrix4x4f    Inverse transpose of model * view matrix.
    uniform mat4 u_InvTransposeMV;
    /// matrix4x4f    Current model matrix.
    uniform mat4 u_Model;
    /// matrix4x4f    Inverse of current world matrix.
    uniform mat4 u_InvModel;
    /// matrix4x4f    Inverse transpose of current model matrix.
    uniform mat4 u_TransposeInvModel;

    //---2---Camera and screen, These variables will correspond to the Camera that is rendering . For example during shadowmap rendering, they will still refer to the Camera component values, and not the “virtual camera” that is used for the shadowmap projection.
    /// float3    World space position of the camera.
    /// float4    x is 1.0 (or -1.0 if currently rendering with a flipped projection matrix), y is the camera's near plane, z is the camera's far plane and w is 1/FarPlane.
    uniform vec4 u_ProjectionParams;
    /// float4    x is the width of the camera's target texture in pixels, y is the height of the camera's target texture in pixels, z is 1.0 + 1.0/width and w is 1.0 + 1.0/height.
    /// float4    Used to linearize Z buffer values. x is (1-far/near), y is (far/near), z is (x/far) and w is (y/far).
    uniform vec4 u_ZBufferParams;
    /// float4    x is orthographic camera's width, y is orthographic camera's height, z is unused and w is 1.0 when camera is orthographic, 0.0 when perspective.
    uniform vec4 u_OrthoParams;
    /// float4x4    Camera's projection matrix.
    uniform mat4 u_CameraProjection;
    /// float4x4    Inverse of camera's projection matrix.
    uniform mat4 u_CameraInvProjection;
    /// float4(Vector3f,Real) Camera frustum plane world space equations left
    uniform vec4 u_CameraFrustumLeftPlane;
    /// float4(Vector3f,Real) Camera frustum plane world space equations right
    uniform vec4 u_CameraFrustumRightPlane;
    /// float4(Vector3f,Real) Camera frustum plane world space equations bottom
    uniform vec4 u_CameraFrustumBottomPlane;
    /// float4(Vector3f,Real) Camera frustum plane world space equations top
    uniform vec4 u_CameraFrustumTopPlane;
    /// float4(Vector3f,Real) Camera frustum plane world space equations near
    uniform vec4 u_CameraFrustumNearPlane;
    /// float4(Vector3f,Real) Camera frustum plane world space equations far
    uniform vec4 u_CameraFrustumFarPlane;

    //---3---Time
    /// float4    Second since level load (t/20, t, t*2, t*3), use to animate things inside the shaders.
    uniform vec4 u_Time;
    /// float4    Sine of Second: (t/8, t/4, t/2, t).
    uniform vec4 u_SinTime;
    /// float4    Cosine of Second: (t/8, t/4, t/2, t).
    uniform vec4 u_CosTime;
    /// float4    Delta Second: (dt, 1/dt, smoothDt, 1/smoothDt).
    uniform vec4 u_DeltaTime;

    /// float4    Elapsed time by seconds since scene loaded (t/20, t, t*2, t*3).
    uniform vec4 u_ElapsedTime;
    /// float4    Sine of ElpasedTime: (t/8, t/4, t/2, t).
    uniform vec4 u_SinElapsedTime;
    /// float4    Cosine of ElpasedTime: (t/8, t/4, t/2, t).
    uniform vec4 u_CosElapsedTime;
#endif

#endif
#ifndef INPUTTEXTURE_DEFINE_H
#define INPUTTEXTURE_DEFINE_H

#ifndef DEFINE_BUILTIN_MAT_UNIFORMS
    /// Current FBO texture
    uniform sampler2D u_FBOTexture;
    /// Camera texture
    uniform sampler2D u_CameraRT;

    /// Camera texture
    uniform sampler2D u_CameraDepthTexture;
    /// Camera texture
    uniform sampler2D u_LastCameraDepthTexture;
#endif 

#endif 
//Blend.glsl-----------------begin
// --------------------- Frame buffer fetch ---------------------
vec4 TextureFromFBO(vec2 uv)
{
    #if defined(AE_FRAMEBUFFER_FETCH)
    
        //for AUSL
            vec4 result = glResult;
    #else
            vec4 result = texture(u_FBOTexture, uv);
    #endif
    return result;
}
//--------------------- Reusable Blend Functions ---------------------
float BlendBurnV2(float base, float blend)
{
    return (blend==0.0) ? blend : max((1.0-((1.0-base)/blend)), 0.0);
}
float BlendDodgeV2(float base, float blend)
{
    return (blend==1.0) ? blend : min(base/(1.0-blend), 1.0);
}
vec3 rgb2hsl(vec3 c)
{
    float h = 0.0;
    float s = 0.0;
    float l = 0.0;
    float r = c.r;
    float g = c.g;
    float b = c.b;
    float cMin = min(r, min(g,b));
    float cMax = max(r, max(g,b));
    l = (cMax + cMin) / 2.0;
    if (cMax > cMin) {
        float cDelta = cMax - cMin;
        s = l < 0.0 ? cDelta / (cMax + cMin) : cDelta / (2.0 - (cMax + cMin));
        if (r == cMax) {
            h = (g - b) / cDelta;
        } else if (g == cMax) {
            h = 2.0 + (b - r) / cDelta;
        } else {
            h = 4.0 + (r - g) / cDelta;
        }
        if (h < 0.0) {
            h += 6.0;
        }
        h = h / 6.0;
    }
    return vec3(h, s, l);
}
vec3 hsl2rgb(vec3 c)
{
    vec3 rgb = clamp(abs(mod(vec3(c.x*6.0)+vec3(0.0,4.0,2.0), 6.0)-vec3(3.0))-vec3(1.0), 0.0, 1.0);
    return vec3(c.z) + c.y * (rgb-vec3(0.5)) * (1.0-abs(2.0*c.z-1.0));
}

//--------------------- Blending Legacy ---------------------
#ifdef AMAZING_USE_BLENDMODE_MUTIPLAY
    vec3 BlendMultiply(vec3 base, vec3 blend)
    {
        return base * blend;
    }
    vec3 BlendMultiply(vec3 base, vec3 blend, float opacity)
    {
        return (BlendMultiply(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_OVERLAY
    float BlendOverlay(float base, float blend)
    {
        return base < 0.5 ? (2.0 * base * blend) :(1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
    }
    vec3 BlendOverlay(vec3 base, vec3 blend)
    {
        return vec3(BlendOverlay(base.r, blend.r), BlendOverlay(base.g, blend.g), BlendOverlay(base.b, blend.b));
    }
    vec3 BlendOverlay(vec3 base, vec3 blend, float opacity)
    {
        return (BlendOverlay(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_ADD
    vec3 BlendAdd(vec3 base, vec3 blend)
    {
        return min(base + blend,vec3(1.0));
    }
    vec3 BlendAdd(vec3 base, vec3 blend, float opacity)
    {
        return (BlendAdd(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SCREEN
    vec3 BlendScreen(vec3 base, vec3 blend)
    {
        return vec3(1.0) - ((vec3(1.0) - base) * (vec3(1.0) - blend));
    }
    vec3 BlendScreen(vec3 base, vec3 blend, float opacity)
    {
        return (BlendScreen(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SOFTLIGHT
    float BlendSoftLight(float base, float blend)
    {
        return (blend<0.5)?(2.0*base*blend+base*base*(1.0-2.0*blend)):(sqrt(base)*(2.0*blend-1.0)+2.0*base*(1.0-blend));
    }
    vec3 BlendSoftLight(vec3 base, vec3 blend)
    {
        return vec3(BlendSoftLight(base.r,blend.r),BlendSoftLight(base.g,blend.g),BlendSoftLight(base.b,blend.b));
    }
    vec3 BlendSoftLight(vec3 base, vec3 blend, float opacity)
    {
        return (BlendSoftLight(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE
    vec3 BlendAverage(vec3 base, vec3 blend)
    {
        return (base + blend) / 2.0;
    }
    vec3 BlendAverage(vec3 base, vec3 blend, float opacity)
    {
        return (BlendAverage(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORBURN
    float BlendColorBurn(float base, float blend)
    {
        return (blend == 0.0) ? blend : max((1.0 - ((1.0 - base) / blend)),0.0);
    }
    vec3 BlendColorBurn(vec3 base, vec3 blend)
    {
        return vec3(BlendColorBurn(base.r, blend.r), BlendColorBurn(base.g, blend.g), BlendColorBurn(base.b, blend.b));
    }
    vec3 BlendColorBurn(vec3 base, vec3 blend, float opacity)
    {
        return (BlendColorBurn(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORDODGE
    float BlendColorDodge(float base, float blend)
    {
        return (blend == 1.0) ? blend : min(base / (1.0 - blend), 1.0);
    }
    vec3 BlendColorDodge(vec3 base, vec3 blend)
    {
        return vec3(BlendColorDodge(base.r, blend.r), BlendColorDodge(base.g, blend.g), BlendColorDodge(base.b, blend.b));
    }
    vec3 BlendColorDodge(vec3 base, vec3 blend, float opacity)
    {
        return (BlendColorDodge(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKEN
    float BlendDarken(float base, float blend)
    {
        return min(blend,base);
    }
    vec3 BlendDarken(vec3 base, vec3 blend)
    {
        return vec3(BlendDarken(base.r,blend.r), BlendDarken(base.g,blend.g), BlendDarken(base.b,blend.b));
    }
    vec3 BlendDarken(vec3 base, vec3 blend, float opacity)
    {
        return (BlendDarken(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DIFFERENCE
    vec3 BlendDifference(vec3 base, vec3 blend)
    {
        return abs(base - blend);
    }
    vec3 BlendDifference(vec3 base, vec3 blend, float opacity)
    {
        return (BlendDifference(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_EXCLUSION
    vec3 BlendExclusion(vec3 base, vec3 blend)
    {
        return base + blend - 2.0 * base * blend;
    }
    vec3 BlendExclusion(vec3 base, vec3 blend, float opacity)
    {
        return (BlendExclusion(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTEN
    float BlendLighten(float base, float blend)
    {
        return max(blend,base);
    }
    vec3 BlendLighten(vec3 base, vec3 blend)
    {
        return vec3(BlendLighten(base.r,blend.r), BlendLighten(base.g,blend.g), BlendLighten(base.b,blend.b));
    }
    vec3 BlendLighten(vec3 base, vec3 blend, float opacity)
    {
        return (BlendLighten(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARDODGE
    float BlendLinearDodge(float base, float blend)
    {
        return min(base + blend, 1.0);
    }
    vec3 BlendLinearDodge(vec3 base, vec3 blend)
    {
        return min(base + blend,vec3(1.0));
    }
    vec3 BlendLinearDodge(vec3 base, vec3 blend, float opacity)
    {
        return (BlendLinearDodge(base, blend) * opacity + base * (1.0 - opacity));
    }
#endif

//--------------------- Blending ---------------------
#ifdef AMAZING_USE_BLENDMODE_COLORBURN_V2
    vec3 BlendColorBurnV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendBurnV2(base.r, blend.r),
                    BlendBurnV2(base.g, blend.g),
                    BlendBurnV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARBURN_V2
    vec3 BlendLinearBurnV2(vec3 base, vec3 blend) 
    {
        return max(base + blend - vec3(1.0), vec3(0.0));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORDODGE_V2
    vec3 BlendColorDodgeV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendDodgeV2(base.r, blend.r),
                    BlendDodgeV2(base.g, blend.g),
                    BlendDodgeV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_OVERLAY_V2
    float BlendOverlayV2(float base, float blend) // for each channel
    {
        return base < 0.5 ? (2.0 * base * blend) : 
                            (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
    }
    vec3 BlendOverlayV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendOverlayV2(base.r, blend.r),
                    BlendOverlayV2(base.g, blend.g),
                    BlendOverlayV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SOFTLIGHT_V2
    float BlendSoftLightV2(float base, float blend)
    {
        return (blend < 0.5) ? (2.0 * base * blend + base * base * (1.0 - 2.0 * blend)) :
                               (sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend));
    }
    vec3 BlendSoftLightV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendSoftLightV2(base.r, blend.r),
                    BlendSoftLightV2(base.g, blend.g),
                    BlendSoftLightV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_HARDLIGHT_V2
    float BlendHardLightV2(float base, float blend)
    {
        return (blend < 0.5) ? (2.0 * blend) * base : 1.0 - ((2.0 * (1.0 - blend)) * (1.0 - base));
    }
    vec3 BlendHardLightV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendHardLightV2(base.r, blend.r), 
                    BlendHardLightV2(base.g, blend.g), 
                    BlendHardLightV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_VIVIDLIGHT_V2
    float BlendVividLightV2(float base, float blend)
    {
        return (blend<0.5) ? BlendBurnV2(base,(2.0*blend)):
                             BlendDodgeV2(base,(2.0*(blend-0.5)));
    }
    vec3 BlendVividLightV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendVividLightV2(base.r, blend.r),
                    BlendVividLightV2(base.g, blend.g),
                    BlendVividLightV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARLIGHT_V2
    float BlendLinearBurnV2(float base, float blend)
    {
        return max(base+blend-1.0,0.0);
    }
    float BlendLinearDodgeV2(float base, float blend)
    {
        return min(base+blend,1.0);
    }
    float BlendLinearLightV2(float base, float blend)
    {   
        return blend < 0.5 ? BlendLinearBurnV2(base, (2.0*blend)):
                            BlendLinearDodgeV2(base, (2.0*(blend-0.5)));
    }
    vec3 BlendLinearLightV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendLinearLightV2(base.r, blend.r),
                    BlendLinearLightV2(base.g, blend.g),
                    BlendLinearLightV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_PINLIGHT_V2
    float BlendPinLightV2(float base, float blend)
    {
        return (blend<0.5) ? min(base, (2.0*blend)):
                             max(base, (2.0*(blend-0.5)));
    }
    vec3 BlendPinLightV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendPinLightV2(base.r, blend.r),
                    BlendPinLightV2(base.g, blend.g),
                    BlendPinLightV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_HARDMIX_V2
    float BlendHardMixV2(float base, float blend)
    {
        if(blend<0.5)
        {
            float vividLight = BlendBurnV2(base,(2.0*blend));
            return (vividLight < 0.5 ) ? 0.0:1.0;
        }
        else
        {
            float vividLight = BlendDodgeV2(base,(2.0*(blend-0.5)));
            return (vividLight < 0.5 ) ? 0.0:1.0;
        }
    }
    vec3 BlendHardMixV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendHardMixV2(base.r,blend.r),
                    BlendHardMixV2(base.g,blend.g),
                    BlendHardMixV2(base.b,blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DIFFERENCE_V2
    vec3 BlendDifferenceV2(vec3 base, vec3 blend) 
    {
        return abs(base-blend);
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_EXCLUSION_V2
    vec3 BlendExclusionV2(vec3 base, vec3 blend) 
    {
        return base+blend-2.0*base*blend;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DISSOLVE_V2
    vec3 BlendDissolveV2(vec3 base, vec3 blend, vec2 uv, float opacity) 
    {
        float random = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
        return opacity > random ? blend : base;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKERCOLOR_V2
    vec3 BlendDarkerColorV2(vec3 base, vec3 blend) 
    {
        float baseLumin = 0.2126*base.r + 0.7152*base.g + 0.0722*base.b;
        float blendLumin = 0.2126*blend.r + 0.7152*blend.g + 0.0722*blend.b;
        return baseLumin > blendLumin ? blend : base;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTERCOLOR_V2
    vec3 BlendLighterColorV2(vec3 base, vec3 blend) 
    {
        float baseLumin = 0.2126*base.r + 0.7152*base.g + 0.0722*base.b;
        float blendLumin = 0.2126*blend.r + 0.7152*blend.g + 0.0722*blend.b;
        return baseLumin > blendLumin ? base : blend;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SUBTRACT_V2
    vec3 BlendSubtractV2(vec3 base, vec3 blend) 
    {
        return max(base+blend-vec3(1.0), vec3(0.0));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DIVIDE_V2
    vec3 BlendDivideV2(vec3 base, vec3 blend) 
    {
        return blend / base;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_HUE_V2
    vec3 BlendHueV2(vec3 base, vec3 blend) 
    {
        vec3 baseHsl = rgb2hsl(base);
        return hsl2rgb(vec3(rgb2hsl(blend).r, baseHsl.g, baseHsl.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SATURATION_V2
    vec3 BlendSaturationV2(vec3 base, vec3 blend) 
    {
        vec3 baseHsl = rgb2hsl(base);
        return hsl2rgb(vec3(baseHsl.r, rgb2hsl(blend).g, baseHsl.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_COLOR_V2
    vec3 BlendColorV2(vec3 base, vec3 blend) 
    {
        vec3 baseHsl = rgb2hsl(blend);
        return hsl2rgb(vec3(baseHsl.r, baseHsl.g, rgb2hsl(base).b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LUMINOSITY_V2
    vec3 BlendLuminosityV2(vec3 base, vec3 blend) 
    {
        vec3 baseHsl = rgb2hsl(base);
        return hsl2rgb(vec3(baseHsl.r, baseHsl.g, rgb2hsl(blend).b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_COLOREDGLASS_V2
    vec3 BlendColoredGlassV2(vec3 base, vec3 blend) 
    {
        return base;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE_V2
    vec4 BlendAverageV2(vec4 blend) 
    {
        return vec4(blend.rgb, 0.5 * blend.a);
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKEN_V2
    float BlendDarkenV2(float base, float blend)
    {
        return min(blend, base);
    }
    vec3 BlendDarkenV2(vec3 base, vec3 blend) 
    {
        return vec3(BlendDarkenV2(base.r, blend.r),
                    BlendDarkenV2(base.g, blend.g),
                    BlendDarkenV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTEN_V2
    float BlendLightenV2(float base, float blend)
    {
        return max(blend, base);
    }
    vec3 BlendLightenV2(vec3 base, vec3 blend)
    {
        return vec3(BlendLightenV2(base.r, blend.r),
                    BlendLightenV2(base.g, blend.g),
                    BlendLightenV2(base.b, blend.b));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_MULTIPLY_V2
    vec3 BlendMultiplyV2(vec4 blend) 
    {
        return blend.a * blend.rgb + vec3(1.0) - blend.a;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_FACEMASK_ADD
    vec3 BlendFaceMaskAdd(vec3 base, vec4 blend)
    {
        return min(base + blend.rgb, vec3(1.0)) * blend.a + base * (1.0 - blend.a);
    }
#endif

#if defined(AMAZING_USE_BLENDMODE_SCREEN_V2) || defined(AMAZING_USE_BLENDMODE_ALPHA_PREMULTIPLY_V2) 
    vec3 BlendScreenV2(vec4 blend) 
    {
        return blend.rgb * blend.a;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARDODGE_V2
    vec3 BlendLinearDodgeV2(vec3 base, vec3 blend)
    {
        return min(base + blend, vec3(1.0));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_MULTIPLY_SOFT_V2
    vec3 BlendMultiplySoftV2(vec3 base, vec3 blend)
    {
        return base * blend;
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_SCREEN_SOFT_V2
    vec3 BlendScreenSoftV2(vec3 base, vec3 blend)
    {
        return vec3(1.0) - ((vec3(1.0) - base) * (vec3(1.0) - blend));
    }
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE_SOFT_V2
    vec3 BlendAverageSoftV2(vec3 base, vec3 blend)
    {
        return (base + blend) / 2.0;
    }
#endif

vec2 ScreenUV()
{
    vec4 proj_pos = u_Projection * u_View * vec4(v_posWS, 1.0);
    vec2 ndc_coord = proj_pos.xy / proj_pos.w;
    vec2 screen_coord = ndc_coord * 0.5 + vec2(0.5, 0.5);
    return screen_coord;
}

vec4 ApplyBlendMode(vec4 color, vec2 uv)
{
    vec4 ret = color;

// blending legacy
#ifdef AMAZING_USE_BLENDMODE_MUTIPLAY
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendMultiply(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_OVERLAY
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendOverlay(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_ADD
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendAdd(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_SCREEN
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendScreen(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_SOFTLIGHT
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendSoftLight(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendAverage(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORBURN
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColorBurn(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORDODGE
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColorDodge(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKEN
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDarken(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_DIFFERENCE
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDifference(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_EXCLUSION
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendExclusion(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTEN
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLighten(ret.rgb, framecolor.rgb, ret.a);
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARDODGE
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLinearDodge(ret.rgb, framecolor.rgb, ret.a);
#endif

// blending V2
#ifdef AMAZING_USE_BLENDMODE_COLORBURN_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColorBurnV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARBURN_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLinearBurnV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_COLORDODGE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColorDodgeV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_OVERLAY_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendOverlayV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_SOFTLIGHT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendSoftLightV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_HARDLIGHT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendHardLightV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_VIVIDLIGHT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendVividLightV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARLIGHT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLinearLightV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_PINLIGHT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendPinLightV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_HARDMIX_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendHardMixV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_DIFFERENCE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDifferenceV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_EXCLUSION_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendExclusionV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_DISSOLVE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDissolveV2(framecolor.rgb, ret.rgb, uv, ret.a);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKERCOLOR_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDarkerColorV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTERCOLOR_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLighterColorV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_SUBTRACT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendSubtractV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_DIVIDE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDivideV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_HUE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendHueV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_SATURATION_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendSaturationV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_COLOR_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColorV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_LUMINOSITY_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLuminosityV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_COLOREDGLASS_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendColoredGlassV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE_V2
    ret = BlendAverageV2(ret);
#endif

#ifdef AMAZING_USE_BLENDMODE_DARKEN_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendDarkenV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_LIGHTEN_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLightenV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_MULTIPLY_V2
    ret.rgb = BlendMultiplyV2(ret);
#endif

#ifdef AMAZING_USE_BLENDMODE_ALPHA_PREMULTIPLY_V2
    ret.rgb = BlendScreenV2(ret);
#endif

#ifdef AMAZING_USE_BLENDMODE_FACEMASK_ADD
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendFaceMaskAdd(framecolor.rgb, ret);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_SCREEN_V2
    ret.rgb = BlendScreenV2(ret);
#endif

#ifdef AMAZING_USE_BLENDMODE_LINEARDODGE_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendLinearDodgeV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_MULTIPLY_SOFT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendMultiplySoftV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_SCREEN_SOFT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendScreenSoftV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif

#ifdef AMAZING_USE_BLENDMODE_AVERAGE_SOFT_V2
    vec4 framecolor = TextureFromFBO(uv);
    ret.rgb = BlendAverageSoftV2(framecolor.rgb, ret.rgb);
    ret.rgb = mix(framecolor.rgb, ret.rgb, ret.a);
    ret.a = 1.0;
#endif


    return ret;
}

vec4 ApplyBlendMode(vec4 color) {
    vec2 uv = ScreenUV();
    return ApplyBlendMode(color, uv);
}
//Blend.glsl-----------------end

#endif

#define ae_insert_flip_uniform // FlipPatch will insert flip uniform here
#define HIGH
precision mediump float;
/*
    #ifdef _EnableAlbedoTexture
        uniform lowp sampler2D _AlbedoTexture;
    #endif
    uniform lowp vec4 _AlbedoColor;
    #ifdef AE_OpacityTexture
        uniform lowp sampler2D _OpacityTexture;
    #endif
    uniform mediump  mat4 u_VP;
    */

// TODO: finish converting uniform names
#if defined(_EnableAlbedoTexture) && defined(_EnableAlphaTest)
uniform lowp float _AlbedoCutoff;
#endif
uniform lowp vec4 _AlbedoColor;
#ifdef NormalTexture
//normal     intensity
uniform mediump float _NormalStrength;
#endif
uniform mediump float _MRAOMetallic;
uniform mediump float _MRAORoughness;
uniform mediump float _AO;
uniform mediump float _ThinFilmIOR;

//           ---                             System                                     ---
uniform mediump mat4 u_VP;
uniform mediump mat4 u_MV;
uniform mediump mat4 u_InvView;
uniform mediump mat4 u_CameraInvProjection;
uniform mediump mat4 u_InvModel;
uniform highp vec4 u_Time;

//           ---------------------           Uniform Sampler               ---------------------
#ifdef _EnableAlbedoTexture
uniform lowp sampler2D _AlbedoTexture;
#endif
#ifdef OpacityTexture
uniform lowp sampler2D _OpacityTexture;
#endif
#ifdef NormalTexture
uniform mediump sampler2D _NormalTexture;
#endif
#ifdef _EnableMRAOTexture
//r:metallic g:roughness b:ao a:cavity
uniform mediump sampler2D _MRAOTexture;
#endif

struct SurfaceParams {
    highp vec2 uv0;
    lowp float opacity;
    mediump vec3 roughParams; //X:PerceptualRoughness Y:roughness Z:roughness*roughness

    mediump vec2 occParams; //X:DiffuseOcclusion Y:SpecOcclusion
    mediump vec3 diffCol;
    mediump vec3 specCol;

    //WorldSpaceVectors
    mediump vec3 pos;
    mediump vec3 nDir;  //world space normal from texture, base normal tex + detail normal tex
    mediump vec3 vnDir; //world space normal from vertex, vertex normal
    mediump vec3 vDir;  //view dir
    mediump vec3 rDir;  //reflect dir

    //CommonOperation
    mediump float ndv;
};

struct LightParams {
    mediump vec3 lDir;
    lowp vec3 color;
    mediump float intensity;
    mediump vec3 attenuate;
    //CommonOperation
    mediump vec3 hDir;
    mediump float ndl;
    mediump float ndh;
    mediump float vdh;
};

#define AE_PCF_NUM_SAMPLES 8
// --------------------- Const ---------------------
const float M_PI = 3.14159265;
const float M_HALF_PI = 1.570796;
const float M_INV_PI = 0.31830989;
const float M_RAD = 6.28318531;
const float M_GOLDEN_ANGLE = 2.39996322;
const float MIN_ROUGH = 0.08;
const float AE_MIP_LEVEL = 7.0;
const float F0 = 0.04;

// --------------------- Fixed Parameters ---------------------
// to make Uber easier to use, those parameters are fixed, you can edit it.
const float u_IOR = 1.5;
const float _ThinFilmThickOffset = 400.0;

//https://seblagarde.wordpress.com/2014/12/01/inverse-trigonometric-functions-gpu-optimization-for-amd-gcn-architecture/
#define TRIGONOMETRIC_OPTIMIZE 1
/** USED BY: **
    PBR
    Uber
    Simple Lighting
**/
/** CONTAINS: **
    Color Space Covert
    Math Functions
**/

#ifndef UTILS_HPP
#define UTILS_HPP

#ifdef TRIGONOMETRIC_OPTIMIZE
// max absolute error 9.0x10^-3
// Eberly's polynomial degree 1 - respect bounds
// 4 VGPR, 12 FR (8 FR, 1 QR), 1 scalar
// input [-1, 1] and output [0, PI]
float ACos(float inX) {
    float x = abs(inX);
    float res = -0.156583 * x + M_HALF_PI;
    res *= sqrt(1.0 - x);
    return (inX >= 0.0) ? res : M_PI - res;
}

// Approximates acos(x) with a max absolute error of 9.0x10^-3.
// Valid only in the range 0..1.
float ACosPositive(float x) {
    float p = -0.1565827 * x + M_HALF_PI;
    return p * sqrt(1.0 - x);
}

// Same cost as Acos + 1 FR
// Same error
// input [-1, 1] and output [-PI/2, PI/2]
float ASin(float x) {
    return M_HALF_PI - ACos(x);
}

float ASinPositive(float x) {
    return M_HALF_PI - ACosPositive(x);
}

// max absolute error 1.3x10^-3
// Eberly's odd polynomial degree 5 - respect bounds
// 4 VGPR, 14 FR (10 FR, 1 QR), 2 scalar
// input [0, infinity] and output [0, PI/2]
float ATanPositive(float x) {
    float t0 = (x < 1.0) ? x : 1.0 / x;
    float t1 = t0 * t0;
    float poly = 0.0872929;
    poly = -0.301895 + poly * t1;
    poly = 1.0 + poly * t1;
    poly = poly * t0;
    return (x < 1.0) ? poly : M_HALF_PI - poly;
}

// 4 VGPR, 16 FR (12 FR, 1 QR), 2 scalar
// input [-infinity, infinity] and output [-PI/2, PI/2]
float ATan(float x) {
    float t0 = ATanPositive(abs(x));
    return (x < 0.0) ? -t0 : t0;
}

//atan(x, y) != atan(x / y)
float ATan(float x, float y) {
    float signx = x < 0.0 ? -1.0 : 1.0;
    return signx * ACos(clamp(y / length(vec2(x, y)), -1.0, 1.0));
}
#else
float ACos(float inX) {
    return acos(inX);
}

float ACosPositive(float x) {
    return acos(x);
}

float ASin(float x) {
    return asin(x);
}

float ASinPositive(float x) {
    return asin(x);
}

float ATanPositive(float x) {
    return atan(x);
}

float ATan(float x) {
    return atan(x);
}

float ATan(float x, float y) {
    return atan(x, y);
}
#endif

float IorToSpecularLevel(in float iorFrom, in float iorTo) {
    float sqrtR0 = (iorTo - iorFrom) / (iorTo + iorFrom);
    return sqrtR0 * sqrtR0;
}

#define PerceptualRoughnessToRoughness(defpr) (defpr * defpr)
#define RoughnessToPerceptualRoughness(defr) sqrt(defr);

vec3 InverseNormalY(in vec3 normal) {
    normal.y = 1.0 - normal.y;
    return normal;
}

vec3 NormalIntensity(in vec3 normalTS, in float normalIntensity) {
    return mix(vec3(0.5, 0.5, 1.0), normalTS, normalIntensity);
}

vec3 DecodeNormal(in vec3 normalTS, in float normalIntensity) {
#ifdef NormalDirectX
    //inverse normal.y defaultly
    normalTS = InverseNormalY(normalTS);
#endif

    //normalIntensity is always one, so skip this line for performance.
    normalTS = NormalIntensity(normalTS, normalIntensity);
    normalTS = normalize(normalTS * 2.0 - 1.0);

    return normalTS;
}

float GetNormalLength(in vec3 normalTS) {
    vec3 normal = normalTS * 2.0 - 1.0;
    return length(normal) + 0.02; //add 0.02 to fix 8bits normal map precision problem(it should be 32bits float format for Specular AA)
}

vec3 BlendNormal(in vec3 n1, in vec3 n2) {
    n1 += vec3(0, 0, 1);
    n2 *= vec3(-1, -1, 1);
    return n1 * dot(n1, n2) / n1.z - n2;
}

float saturate(in float x) {
    return clamp(x, 0.0, 1.0);
}

vec3 saturate(in vec3 v) {
    v = clamp(v, vec3(0.0), vec3(1.0));
    return v;
}

precision highp float;
float SafePow(in float v, in float e) {
    v = max(v, 1e-5);
    e = max(e, 1e-5);
    return pow(v, e);
}
vec3 SafePow(in vec3 v, in vec3 e) {
    v = max(v, vec3(1e-5));
    e = max(e, vec3(1e-5));
    return pow(v, e);
}

float Pow2(in float x) {
    return x * x;
}
float Pow4(in float x) {
    return x * x * x * x;
}
vec3 Pow4(in vec3 x) {
    return x * x * x * x;
}
float Pow5(in float x) {
    return x * x * x * x * x;
}
vec3 Pow5(in vec3 x) {
    return x * x * x * x * x;
}
precision mediump float;

#define maxComp3(v) max(max(v.x, v.y), v.z)

#define GammaToLinear(a) pow(a, vec3(2.2))
#define LinearToGamma(a) pow(a, vec3(1.0 / 2.2))

vec3 LinearToneMapping(in vec3 x) {
    float a = 1.8; // Mid
    float b = 1.4; // Toe
    float c = 0.5; // Shoulder
    float d = 1.5; // Mid
    return (x * (a * x + b)) / min(vec3(1000.0), (x * (a * x + c) + d));
}

#define ParamMapingScaleDark(val, scale) mix(1.0, val, scale)
#define ParamMapingScale(val, scale) (val * scale)

#endif
/** USED BY: **
    PBR
    Uber
    Simple Lighting
    Matte Shadow
**/

// TODO: After optimized, consider move into IEShadow. Merge with other 2 shadow files.
#ifndef PBR_SHADOW_HPP
#define PBR_SHADOW_HPP

uniform mediump sampler2D u_DirLight0ShadowTexture;
uniform mediump float u_DirLight0ShadowBias;
uniform mediump mat4 u_DirLight0ShadowMatrix;
uniform mediump vec2 u_DirLight0ShadowTextureSize;
uniform mediump float u_DirLight0ShadowStrength;
uniform mediump float u_DirLight0ShadowSoftness;
uniform mediump float u_DirLight0ShadowSoft;
uniform mediump float u_DirLight0ShadowEnabled;
uniform mediump vec4 u_DirLight0ShadowColor;
uniform mediump vec2 u_DirLight0ShadowBoundingBoxSize;
uniform mediump float u_DirLight0SelfShadowGradient;

#ifdef AE_RECEIVE_SHADOW
float DecodeFloat(const vec4 value) {
    const vec4 bitSh = vec4(1.0 / (256.0 * 256.0), 1.0 / (256.0), 1.0, 0.0);
    return dot(value, bitSh);
}

float GradientNoise(vec3 p) {
    return fract(sin((p.x + p.y + p.z) * 777.77777777) * 77.77777777);
}

// https://www.shadertoy.com/view/4djSRW
vec2 Hash(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

// https://www.shadertoy.com/view/XtXXDN
vec2 VogelDisc(float index, float totalNum, float angleOffset) {
    float r = (index + 1.0) / totalNum;
    float t = index * M_GOLDEN_ANGLE + angleOffset;
    return r * vec2(cos(t), sin(t));
}

struct SoftShadowParams {
    float enable;
    vec3 shadowUV;
    vec2 offsetUV;
    float depth;
    float mipmapLevel;
    float bias;
    float softness;
    vec2 textureSize;
};

void GetDirectionSoftShadowParams(inout SurfaceParams S, inout LightParams L, out SoftShadowParams SS) {
    vec4 posSS = u_DirLight0ShadowMatrix * vec4(S.pos, 1.0);
    posSS.xyz /= posSS.w;
    SS.enable = u_DirLight0ShadowEnabled;
    SS.bias = u_DirLight0ShadowBias;
    SS.bias = clamp(SS.bias, 0.0, 1.0);
    SS.shadowUV.xy = posSS.xy;
    SS.offsetUV = vec2(0.);
    SS.depth = clamp(posSS.z, 0.0, 1.0) - SS.bias;
    SS.softness = u_DirLight0ShadowSoftness;
    SS.textureSize = u_DirLight0ShadowTextureSize;
}

#define DECODE_DEPTH DecodeFloat
#define GET_SHADOW_SAMPLE_OFFSET VogelDisc 
#define GET_SHADOW_SAMPLE SampleShadowMap

float SampleShadowMap(inout SoftShadowParams SS) {
    vec4 result = texture(u_DirLight0ShadowTexture, SS.shadowUV.xy + SS.offsetUV);
    float depthInShadowMap = DECODE_DEPTH(result);
    return step(SS.depth, depthInShadowMap);
}

// Samples using PCSS, with optional VSM or EVSM sampling and configurable PCSS sampling pattern
vec4 MultiOptionPCSS(inout SurfaceParams S, inout LightParams L, inout SoftShadowParams SS) {
    vec3 result = vec3(0.);
    float shadow_factor = 0.0;
    float softness = 3. * u_DirLight0ShadowSoftness; // put in SS
    vec2 sampleStep = 1. / u_DirLight0ShadowTextureSize; // put in SS
    vec2 stepSize = sampleStep * softness;
        #if defined(AE_PCF_NUM_SAMPLES)
    float angleOffset = GradientNoise(v_posWS) * M_RAD;
    float pcfNumSamples = float(AE_PCF_NUM_SAMPLES);
    for(float i = 0.; i < pcfNumSamples; i++) {
        vec2 sampleOffset = GET_SHADOW_SAMPLE_OFFSET(i, pcfNumSamples, angleOffset);
        SS.offsetUV = stepSize * sampleOffset;
        vec4 shadowcolor = texture(u_DirLight0ShadowTexture, SS.shadowUV.xy + SS.offsetUV);
        result += shadowcolor.rgb;
        shadow_factor += step(0.5, shadowcolor.a);
    }
    result /= pcfNumSamples;
    shadow_factor /= pcfNumSamples;
        #endif
    return vec4(result, shadow_factor);
}

vec4 Shadowing(inout SurfaceParams S, inout LightParams L) {
    SoftShadowParams SS;
    GetDirectionSoftShadowParams(S, L, SS);
    if(SS.enable < 0.5 || SS.shadowUV.x < 0.0 || SS.shadowUV.y < 0.0 || SS.shadowUV.x > 1.0 || SS.shadowUV.y > 1.0)
        return vec4(1.0, 1.0, 1.0, 0.0);
    float shadowVal = 1.;
    float shadow_factor = 0.0;
    float shadow_sum = 0.0;

    vec4 shadowResult = vec4(0.0);
        #if defined(HIGH) || defined(ULTRA)
    if(u_DirLight0ShadowSoft > 0.0) {
        shadowResult = MultiOptionPCSS(S, L, SS);
    } else
        #endif
    {
        shadowResult = texture(u_DirLight0ShadowTexture, SS.shadowUV.xy);
    }
    shadowResult.a = shadowResult.a * u_DirLight0ShadowStrength;
#ifdef SHADOW_NO_BLEND
    return vec4(u_DirLight0ShadowColor.rgb, shadowResult.a);
#endif
    return shadowResult;
}

#endif

#endif

#define ILLUM_PBR
/** USED BY: **
    Uber
    PBR
**/
/** CONTAINS: **
    Flake
    Pearl 
    RimHighlight
    Emissive
    Dissolve 
    Thin Film
    Fabric 
    AO
**/

#ifndef SURFACEEFFECT_HPP
#define SURFACEEFFECT_HPP

#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
uniform mediump sampler2D _FlakeTexture;

void DoFlake(float indexCount, float index, float random, vec2 flakeUV, vec2 parallaxOffset, inout vec3 flakeColor, inout vec3 flakeNormalTS, inout float flakeFactor) {
    //index = indexCount is most bottom layer
    vec2 uvpParallax = flakeUV + parallaxOffset * (index - 1.0) + vec2(random, random);
    vec3 flakeNormal = texture(_DetailNormalTexture, uvpParallax).xyz;

    flakeNormal = DecodeNormal(flakeNormal, 1.0); //keep random
    if(flakeNormal.z < 0.99) {
        flakeNormalTS = flakeNormal;
        flakeFactor = 1.0 - (index - 1.0) / indexCount; //blend with depth
        //flakeFactor = 1.0; //keep flake bright
        flakeColor = GammaToLinear(texture(_FlakeTexture, uvpParallax).rgb);
    }
}
#endif

#ifdef Pearl
uniform mediump vec4 _PearlEdgeColor;
uniform mediump vec4 _PearlFrontColor;
uniform mediump float _PearlFallOff;

vec3 Facing(in vec3 baseCol, in vec3 facing, in float ndv, in float facingFallOff) {
    return mix(baseCol, facing, SafePow(ndv, facingFallOff));
}
#endif

#ifdef RimHighlight
uniform mediump vec4 _RimHighlightColor;
uniform mediump float _RimHighlightIntensity;
uniform mediump float _RimHighlightPower;
uniform mediump sampler2D _RimHighlightTexture;

vec3 FakeFresnel(inout SurfaceParams S) {
    vec4 fresnelColPow = vec4(GammaToLinear(texture(_RimHighlightTexture, v_uv0).rgb) * GammaToLinear(_RimHighlightColor.rgb) * _RimHighlightIntensity, _RimHighlightPower);
    vec3 normal = S.nDir;
    #ifdef RimHighlightInvert
    float fresnel = SafePow(S.ndv, fresnelColPow.a);
    #else
    float fresnel = SafePow(1.0 - S.ndv, fresnelColPow.a);
    #endif
    vec3 res = fresnel * fresnelColPow.rgb;
    return res;
}
#endif

#ifdef Emissive
uniform mediump float _EmissiveIntensity;
uniform lowp sampler2D _EmissiveTexture; //rgb
uniform lowp vec4 _EmissiveColor;

vec3 EmissiveTerm(inout SurfaceParams S) {
#ifdef EmissiveTextureUV1
    #ifdef GLTF_UV_CALIBRATION
    vec4 t_EmissiveTex = texture(_EmissiveTexture, getEmissiveUV(v_uv1));
    #else
    vec4 t_EmissiveTex = texture(_EmissiveTexture, v_uv1);
    #endif
#else
    #ifdef GLTF_UV_CALIBRATION
    vec4 t_EmissiveTex = texture(_EmissiveTexture, getEmissiveUV(S.uv0));
    #else
    vec4 t_EmissiveTex = texture(_EmissiveTexture, S.uv0);
    #endif
#endif
    return GammaToLinear(t_EmissiveTex.rgb) * _EmissiveIntensity * GammaToLinear(_EmissiveColor.rgb);
}
#endif

#ifdef Dissolve
uniform mediump float _DissolveArea;
uniform mediump float _DissolveScale;
uniform mediump float _DissolveWidth;
uniform lowp vec4 _DissolveColor;
uniform mediump float _DissolveIntensity;
uniform mediump sampler2D _DissolveEdgeColorGradient; //rgb
#ifdef _DissolveVertexColor
uniform mediump float _DissolveNoiseFactor;
#endif

precision highp float;
float Mod289(float x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec4 Mod289(vec4 x) {
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec4 Perm(vec4 x) {
    return Mod289(((x * 34.0) + 1.0) * x);
}

float Noise3d(vec3 p) {
    vec3 a = floor(p);
    vec3 d = p - a;
    d = d * d * (3.0 - 2.0 * d);

    vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
    vec4 k1 = Perm(b.xyxy);
    vec4 k2 = Perm(k1.xyxy + b.zzww);

    vec4 c = k2 + a.zzzz;
    vec4 k3 = Perm(c);
    vec4 k4 = Perm(c + 1.0);

    vec4 o1 = fract(k3 * (1.0 / 41.0));
    vec4 o2 = fract(k4 * (1.0 / 41.0));

    vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
    vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

    return o4.y * d.y + o4.x * (1.0 - d.y);
}

#ifdef _DissolveVertexColor
float remap(float x, float t1, float t2, float s1, float s2) {
    return (x - t1) / (t2 - t1) * (s2 - s1) + s1;
}
#endif
precision mediump float;

vec3 DoDissolve(vec3 finalRGB, inout SurfaceParams S) {
    vec3 dissolveColor = GammaToLinear(_DissolveColor.rgb) * _DissolveIntensity;
    float noise = Noise3d((u_InvModel * vec4(S.pos, 1.0)).xyz * _DissolveScale);
    float noiseLeft = noise - _DissolveArea;
#ifdef _DissolveVertexColor
    float a = v_vertCol.r + _DissolveNoiseFactor * noise;
    a = remap(a, 0., 1. + _DissolveNoiseFactor, 0., 1.);
    noiseLeft = a - _DissolveArea;
#endif

    if(noiseLeft < 0.0)
        discard;
    else {
        if(_DissolveArea > 0.0 && noiseLeft < _DissolveWidth) {
            float edge = noiseLeft / _DissolveWidth;
            edge = 1.0 - edge;
            edge *= edge;
            vec3 ramp = texture(_DissolveEdgeColorGradient, vec2(edge, 0.5)).rgb;
            dissolveColor = dissolveColor * ramp;
            return mix(finalRGB, dissolveColor, edge);
        }
#if defined(_DissolveVertexColor) && defined(_EnableShowVertexColor)
        finalRGB.rgb = vec3(v_vertCol.r);
#endif
        return finalRGB;
    }
}
#endif

#ifdef ThinFilm
#ifdef ILLUM_PBR
precision mediump float;
uniform mediump sampler2D _ThinFilmTexture;
uniform mediump float _ThinFilmThickness;

/* Amplitude reflection coefficient (s-polarized) */
float Rs(float n1, float n2, float cosI, float cosT) {
    return (n1 * cosI - n2 * cosT) / (n1 * cosI + n2 * cosT);
}

/* Amplitude reflection coefficient (p-polarized) */
float Rp(float n1, float n2, float cosI, float cosT) {
    return (n2 * cosI - n1 * cosT) / (n1 * cosT + n2 * cosI);
}

/* Amplitude transmission coefficient (s-polarized) */
float Ts(float n1, float n2, float cosI, float cosT) {
    return 2.0 * n1 * cosI / (n1 * cosI + n2 * cosT);
}

/* Amplitude transmission coefficient (p-polarized) */
float Tp(float n1, float n2, float cosI, float cosT) {
    return 2.0 * n1 * cosI / (n1 * cosT + n2 * cosI);
}

precision highp float;
// cosI is the cosine of the incident angle, that is, cos0 = dot(view angle, normal)
// lambda is the wavelength of the incident light (e.g. lambda = 510 for green)
// From http://www.gamedev.net/page/resources/_/technical/graphics-programming-and-theory/thin-film-interference-for-computer-graphics-r2962
float ThickFilmReflectance(float cos0, float lambda, float thick, float n0, float n1, float n2) {
    // compute the phase change term (constant)
    float d10 = (n1 > n0) ? 0.0 : M_PI;
    float d12 = (n1 > n2) ? 0.0 : M_PI;
    float delta = d10 + d12;

    // now, compute cos1, the cosine of the reflected angle
    float sin1 = pow(max(n0 / n1, 1e-5), 2.0) * (1.0 - pow(max(cos0, 1e-5), 2.0));
    if(sin1 > 1.0)
        return 1.0; // total internal reflection
    float cos1 = sqrt(1.0 - sin1);

    // compute cos2, the cosine of the final transmitted angle, i.e. cos(theta_2)
    // we need this angle for the RimHighlight terms at the bottom interface
    float sin2 = pow(max(n0 / n2, 1e-5), 2.0) * (1.0 - pow(max(cos0, 1e-5), 2.0));
    if(sin2 > 1.0)
        return 1.0; // total internal reflection
    float cos2 = sqrt(1.0 - sin2);

    // get the reflection transmission amplitude RimHighlight coefficients
    // float alpha_s = Rs(n1, n0, cos1, cos0) * Rs(n1, n2, cos1, cos2); // rho_10 * rho_12 (s-polarized)
    float alpha_s = ((n1 * cos1 - n0 * cos0) / (n1 * cos1 + n0 * cos0)) * ((n1 * cos1 - n2 * cos2) / (n1 * cos1 + n2 * cos2)); // rho_10 * rho_12 (s-polarized)
    // float alpha_p = Rp(n1, n0, cos1, cos0) * Rp(n1, n2, cos1, cos2); // rho_10 * rho_12 (p-polarized)
    float alpha_p = ((n0 * cos1 - n1 * cos0) / (n1 * cos0 + n0 * cos1)) * ((n2 * cos1 - n1 * cos2) / (n1 * cos2 + n2 * cos1));
    // float beta_s = Ts(n0, n1, cos0, cos1) * Ts(n1, n2, cos1, cos2); // tau_01 * tau_12 (s-polarized)
    float beta_s = (2.0 * n0 * cos0 / (n0 * cos0 + n1 * cos1)) * (2.0 * n1 * cos1 / (n1 * cos1 + n2 * cos2)); // tau_01 * tau_12 (s-polarized)
    // float beta_p = Tp(n0, n1, cos0, cos1) * Tp(n1, n2, cos1, cos2); // tau_01 * tau_12 (p-polarized)
    float beta_p = (2.0 * n0 * cos0 / (n0 * cos1 + n1 * cos0)) * (2.0 * n1 * cos1 / (n1 * cos2 + n2 * cos1)); // tau_01 * tau_12 (p-polarized)
    // compute the phase term (phi)
    float phi = (2.0 * M_PI / lambda) * (2.0 * n1 * thick * cos1) + delta;

    // finally, evaluate the transmitted intensity for the two possible polarizations
    float ts = pow(max(beta_s, 1e-5), 2.0) / (pow(max(alpha_s, 1e-5), 2.0) - 2.0 * alpha_s * cos(phi) + 1.0);
    float tp = pow(max(beta_p, 1e-5), 2.0) / (pow(max(alpha_p, 1e-5), 2.0) - 2.0 * alpha_p * cos(phi) + 1.0);

    // we need to take into account conservation of energy for transmission
    float beamRatio = (n2 * cos2) / (n0 * cos0);

    // calculate the average transmitted intensity (if you know the polarization distribution of your
    // light source, you should specify it here. if you don't, a 50%/50% average is generally used)
    float t = beamRatio * (ts + tp) / 2.0;
    // and finally, derive the reflected intensity
    return 1.0 - t;
}

vec3 F_ThinFilm(float ior, inout SurfaceParams S, float vdh) {
    float thickFlimNmedium = 1.0;
    float thickFlimNinternal = 1.25;
    float thick = texture(_ThinFilmTexture, S.uv0).r;
    float thinFilmThick = _ThinFilmThickness + _ThinFilmThickOffset * thick;
    float red = ThickFilmReflectance(vdh, 650.0, thinFilmThick, thickFlimNmedium, ior, thickFlimNinternal);
    float green = ThickFilmReflectance(vdh, 510.0, thinFilmThick, thickFlimNmedium, ior, thickFlimNinternal);
    float blue = ThickFilmReflectance(vdh, 475.0, thinFilmThick, thickFlimNmedium, ior, thickFlimNinternal);
    vec3 reflColor = saturate(vec3(red, green, blue));
    return reflColor;
}
#else
precision highp float;
uniform mediump float _ThinFilmIOR;
uniform mediump float _ThinFilmIntensity;
uniform mediump float _ThinFilmThicknessMax;
#ifdef _EnableThinFilmTexture
uniform mediump float _ThinFilmThicknessMin;
uniform mediump sampler2D _ThinFilmTexture;
#endif

const mat3 XYZ_TO_REC709 = mat3(3.2404542, -0.9692660, 0.0556434, -1.5371385, 1.8760108, -0.2040259, -0.4985314, 0.0415560, 1.0572252);

vec3 Fresnel0ToIor(vec3 fresnel0) {
    vec3 sqrtF0 = sqrt(fresnel0);
    return (vec3(1.0) + sqrtF0) / (vec3(1.0) - sqrtF0);
}

vec3 IorToFresnel0(vec3 transmittedIor, float incidentIor) {
    vec3 t = (transmittedIor - vec3(incidentIor)) / (transmittedIor + vec3(incidentIor));
    return t * t;
}

float IorToFresnel0(float transmittedIor, float incidentIor) {
    return Pow2((transmittedIor - incidentIor) / (transmittedIor + incidentIor));
}

vec3 evalSensitivity(float OPD, vec3 shift) {
    float phase = 2.0 * M_PI * OPD * 1.0e-9;
    vec3 val = vec3(5.4856e-13, 4.4201e-13, 5.2481e-13);
    vec3 pos = vec3(1.6810e+06, 1.7953e+06, 2.2084e+06);
    vec3 var = vec3(4.3278e+09, 9.3046e+09, 6.6121e+09);

    vec3 xyz = val * sqrt(2.0 * M_PI * var) * cos(pos * phase + shift) * exp(-Pow2(phase) * var);
    xyz.x += 9.7470e-14 * sqrt(2.0 * M_PI * 4.5282e+09) * cos(2.2399e+06 * phase + shift[0]) * exp(-4.5282e+09 * Pow2(phase));
    xyz /= 1.0685e-7;

    vec3 srgb = XYZ_TO_REC709 * xyz;
    return srgb;
}

vec3 Schlick_to_F0(vec3 f, float VdotH) {
    float t = clamp(1.0 - VdotH, 0.0, 1.0);
    t = clamp(Pow5(t), 0.0, 0.9999);

    return (f - vec3(1.0) * t) / (1.0 - t);
}
#endif
#endif

#ifdef Fabric
uniform mediump vec4 _FabricColor;
uniform mediump float _FabricRoughness;
uniform lowp sampler2D _FabricTexture;
uniform lowp sampler2D _FabricLut;

#ifdef _EnableFabricTexture
#define FABRIC_ROUGHNESS_SQRD S.sheenRoughnessSqrd
#define FABRIC_ROUGHNESS S.sheenRoughness
#define FABRIC_COLOR S.sheenColor.rgb
#else
#define FABRIC_ROUGHNESS_SQRD _FabricRoughness* _FabricRoughness
#define FABRIC_ROUGHNESS _FabricRoughness
#define FABRIC_COLOR GammaToLinear(_FabricColor.rgb)
#endif
#endif

// ------ AO ------
float sphericalCapsIntersection(in float cosCap1, in float cosCap2, in float cosDistance) {
    // Oat and Sander 2007, "Ambient Aperture Lighting"
    // Approximation mentioned by Jimenez et al. 2016
    float r1 = ACosPositive(cosCap1);
    float r2 = ACosPositive(cosCap2);
    float d = ACos(cosDistance);

    // We work with cosine angles, replace the original paper's use of
    // cos(min(r1, r2)) with max(cosCap1, cosCap2)
    // We also remove a multiplication by 2 * PI to simplify the computation
    // since we divide by 2 * PI in computeBentSpecularAO()

    if(min(r1, r2) <= max(r1, r2) - d) {
        return 1.0 - max(cosCap1, cosCap2);
    } else if(r1 + r2 <= d) {
        return 0.0;
    }

    float delta = abs(r1 - r2);
    float x = 1.0 - saturate((d - delta) / max(r1 + r2 - delta, 1e-4));
    // simplified smoothstep()
    float area = x * x * (-2.0 * x + 3.0);
    return area * (1.0 - max(cosCap1, cosCap2));
}
float SpecularAO(inout SurfaceParams S) {
#if defined(LOW) || defined(MEDIUM)
    return S.occParams.x;
#else
#if defined(_EnableBentNormal) && defined(NormalTexture)
    // Jimenez et al. 2016, "Practical Realtime Strategies for Accurate Indirect Occlusion"
    // aperture from ambient occlusion
    float cosAv = sqrt(1.0 - S.occParams.x);
    // aperture from roughness, log(10) / log(2) = 3.321928
    float cosAs = exp2(-3.321928 * S.roughParams.z);
    // angle betwen bent normal and reflection direction
    float cosB = dot(S.bnDir, S.rDir);

    // Remove the 2 * PI term from the denominator, it cancels out the same term from
    // sphericalCapsIntersection()
    float ao = sphericalCapsIntersection(cosAv, cosAs, cosB) / (1.0 - cosAs);
    // Smoothly kill specular AO when entering the perceptual roughness range [0.1..0.8] for metals
    // Without this, specular AO can remove all reflections, which looks bad on metals
    return mix(1.0, ao, smoothstep(0.01, 0.09, S.roughParams.y));
#else
    // float visibility = S.occParams.x;
    // float roughness = S.roughParams.y;
    // // Lagarde and de Rousiers 2014, "Moving Frostbite to PBR"
    // float lagardeAO = saturate(SafePow(S.ndv + visibility, exp2(-16.0 * roughness - 1.0)) - 1.0 + visibility);
    // // horizon occlusion with falloff, should be computed for direct specular too
    // float horizon = min(1.0 + dot(S.rDir, S.vnDir), 1.0);
    // float horizonAO = horizon * horizon;
    // return lagardeAO * horizonAO;
    // https://github.com/KhronosGroup/glTF-Sample-Viewer/blob/main/source/Renderer/shaders/pbr.frag
    return S.occParams.x;
#endif
#endif
}

#endif
/** USED BY: **
    Uber
    PBR
**/
/** CONTAINS: **
    Common BSDF Calculations
    Scatter
    Thin Film BSDF
    Coat BSDF
    AO
    Anistropic BSDF
    Fabric BSDF
**/

#ifndef DIRECTILLUM_HPP
#define DIRECTILLUM_HPP

// ----------------------- Direct Lighting -----------------------
// perceptualRoughness = perceptually roughness = S.roughParams.x;
// a = perceptualRoughness^2 = S.roughParams.y;
// a2 = a^2 = S.roughParams.z;

// ------ Common Shared Functions ------
// Specluar ------
//D_Charlie was made to fit in float16
float D_Charlie(float roughness, float NoH) {
    // Estevez and Kulla 2017, "Production Friendly Microfacet Sheen BRDF"
    float invAlpha = 1.0 / max(roughness, 0.0007);
    float cos2h = NoH * NoH;
    float sin2h = max(1.0 - cos2h, 0.0078125); // 2^(-14/2), so sin2h^2 > 0 in fp16
    return (2.0 + invAlpha) * SafePow(sin2h, invAlpha * 0.5) / (2.0 * M_PI);
}
precision highp float; //D and V must be in highp or else artifacting occurs
// Specluar D terms------
float D_GGX(float ndh, float a2) {
    float d = (ndh * a2 - ndh) * ndh + 1.0;
    return a2 * M_INV_PI / (d * d);
}
// pecluar V terms------
float V_Const() {
    return 0.25;
}
//Heitz 2014, “Understanding the Masking-Shadowing Function in Microfacet-Based BRDFs”
float V_SmithJointApprox(float a, float ndv, float ndl) {
    float lambdaV = ndl * sqrt(ndv * ndv * (1.0 - a) + a);
    float lambdaL = ndv * sqrt(ndl * ndl * (1.0 - a) + a);
    float v = lambdaV + lambdaL;

    //branch isn't so scary here because of so few calculations and the rarity of v being 0
    if(v > 0.0) {
        return 0.5 / v;
    } else {
        return 0.0;
    }
}
//https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_materials_sheen/README.md#AshikhminPremoze2007
float V_AshikhminPremoze(float NoV, float NoL) {
    if(NoL > 0.0001 && NoV > 0.0001) {
        return 1.0 / (4.0 * (NoL + NoV - NoL * NoV));
    } else {
        return 1.0;
    }
}
float V_Neubelt(float NoV, float NoL) {
    // Neubelt and Pettineo 2013, "Crafting a Next-gen Material Pipeline for The Order: 1886"
    return 1.0 / (4.0 * (NoL + NoV - NoL * NoV));
}
// Specluar F terms------
precision mediump float;
vec3 F_None(vec3 f0) {
    return f0;
}
//Schlick, C. (1994).  "An Inexpensive BRDF Model for Physically-based Rendering"
vec3 F_Schlick(vec3 f0, float vdh) {
    float t = clamp(1.0 - vdh, 0.0, 1.0);
    t = Pow5(t);
    return f0 + (1.0 - f0) * t;
}

float F_Schlick(float f0, float vdh) {
    float t = clamp(1.0 - vdh, 0.0, 1.0);
    return f0 + (1.0 - f0) * Pow5(t);
}
//Physical light need Illuminance = 3.14 to get as bright as light color
// Diffuse ------
vec3 Diffuse_Lambert(inout SurfaceParams S, inout LightParams L) {
    float lighting = L.ndl * M_INV_PI;
    return S.diffCol * L.color * L.intensity * L.attenuate * lighting;
}
#ifndef ILLUM_PBR
vec3 Diffuse_Lambert_High(inout SurfaceParams S, inout LightParams L) {
    return (vec3(1.0) - SPECULAR_WEIGHT * F_Schlick(S.specCol, L.vdh)) * S.diffCol * M_INV_PI * L.color * L.intensity * L.attenuate * L.ndl;
}
#endif

// ------ Thin Film ------
#ifdef ILLUM_PBR
precision mediump float;
vec3 FresnelSpecular(inout SurfaceParams S, float vdh) {
#if defined(ThinFilm)
    return F_ThinFilm(_ThinFilmIOR, S, vdh);
#else
    vec3 f0 = S.specCol;
    return F_Schlick(f0, vdh);
#endif
}

#else

vec3 FresnelSpecular(inout SurfaceParams S, float vdh) {
    vec3 f0 = S.specCol;
    return F_Schlick(f0, vdh);
}
#ifdef ThinFilm
vec3 calcThinFilmFresnel(in float cosTheta1, in float thinFilmThickness, in vec3 baseF0) {
    float iridescenceIor = mix(1.0, _ThinFilmIOR, smoothstep(0.0, 0.03, thinFilmThickness));
    float sinTheta2Sq = Pow2(1.0 / iridescenceIor) * (1.0 - Pow2(cosTheta1));

    // Handle TIR:
    float cosTheta2Sq = 1.0 - sinTheta2Sq;
    if(cosTheta2Sq < 0.0) {
        return vec3(1.0);
    }

    float cosTheta2 = sqrt(cosTheta2Sq);

    float R0 = IorToFresnel0(iridescenceIor, 1.0);
    float R12 = F_Schlick(R0, cosTheta1);
    float R21 = R12;
    float T121 = 1.0 - R12;
    float phi12 = step(iridescenceIor, 1.0) * M_PI; //if iridescenceIor < 1.0 then assign M_PI
    float phi21 = M_PI - phi12;

    vec3 baseIOR = Fresnel0ToIor(clamp(baseF0, 0.0, 0.9999)); // guard against 1.0
    vec3 R1 = IorToFresnel0(baseIOR, iridescenceIor);
    vec3 R23 = F_Schlick(R1, cosTheta2);
    vec3 phi23 = step(baseIOR, vec3(iridescenceIor)) * M_PI; //if baseIOR < iridescenceIor then make ior M_PI

    float OPD = 2.0 * iridescenceIor * thinFilmThickness * cosTheta2;
    vec3 phi = vec3(phi21) + phi23;

    vec3 R123 = clamp(R12 * R23, 1e-5, 0.9999);
    vec3 r123 = sqrt(R123);
    vec3 Rs = Pow2(T121) * R23 / (vec3(1.0) - R123);

    vec3 C0 = R12 + Rs;
    vec3 I = C0;

    vec3 Cm = Rs - T121;
    for(int m = 1; m <= 2; ++m) {
        Cm *= r123;
        vec3 Sm = 2.0 * evalSensitivity(float(m) * OPD, float(m) * phi);
        I += Cm * Sm;
    }

    return max(I, vec3(0.0));
}
#endif

#endif

// ------ Scatter ------
#ifdef Scatter
uniform mediump float _ScatterIntensity;
uniform mediump vec4 _ScatterColor;
uniform mediump float _ScatterThickness;
uniform mediump sampler2D _ScatterTexture;

vec3 Diffuse_Scatter(inout SurfaceParams S, inout LightParams L) {
    //forwardScatter base on https://colinbarrebrisebois.com/2011/03/07/gdc-2011-approximating-translucency-for-a-fast-cheap-and-convincing-subsurface-scattering-look/
    vec3 vLight = L.lDir + S.nDir * u_TransmittanceDistortion;
    float vdl = max(0.0, dot(S.vDir, -vLight));
    vec3 forwardScatter = SafePow(vdl, u_TransmittancePow) * (1.0 - S.thick) * _ScatterColor.rgb; //Transmittance

    //backScatter base on http://blog.stevemcauley.com/2011/12/03/energy-conserving-wrapped-diffuse/
    vec3 normal = mix(S.nDir, S.vnDir, S.scatter);
    float ndl = dot(normal, L.lDir);
    vec3 one = vec3(1.0, 1.0, 1.0);
    vec3 onePlusW = one + _ScatterColor.rgb;
    vec3 ndlPlusW = vec3(ndl, ndl, ndl) + _ScatterColor.rgb;
    float warpPower = 2.0;
    vec3 warpPowered = SafePow(saturate(ndlPlusW / onePlusW), vec3(warpPower, warpPower, warpPower));
    vec3 divider = 2.0 * onePlusW / (1.0 + warpPower);
    vec3 warp = warpPowered / divider;

    vec3 backScatter = saturate(warp);

    vec3 lighting = (forwardScatter + backScatter) * S.diffCol * M_INV_PI;
    vec3 scatterTerm = L.color * L.intensity * L.attenuate * lighting;
    vec3 lambertTerm = Diffuse_Lambert(S, L);

    return mix(lambertTerm, scatterTerm, S.scatter);
}
#endif

// ------ Coat ------
precision highp float;
#ifdef Coat
vec3 FresnelSpecularCoat(float coatF0, float vdh) {
    vec3 f0 = vec3(coatF0);
    return F_Schlick(f0, vdh);
}

vec3 Specular_GGX_Coat(inout SurfaceParams S, inout LightParams L) {
    float ndh = max(0.0, dot(S.cnDir, L.hDir));
    float ndl = max(0.0, dot(S.cnDir, L.lDir));
    float ndv = max(0.0, dot(S.cnDir, S.vDir));

    float a = S.coatRoughParams * S.coatRoughParams;
    float a2 = a * a;
    float V = V_SmithJointApprox(a, ndv, ndl);
    float D = D_GGX(ndh, a2);

    vec3 F = FresnelSpecularCoat(S.coatF0, L.vdh);

    return F * V * D * ndl * L.color * L.intensity * L.attenuate;
}
#endif

// ------ Flake ------
#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
vec3 Specular_Flake(inout SurfaceParams S, inout LightParams L) {
    float ndh = max(0.0, dot(S.fnDir, L.hDir));
    float ndl = max(0.0, dot(S.fnDir, L.lDir));

    float a = S.flakeRoughParams * S.flakeRoughParams;
    float a2 = a * a;
    float V = V_Const();
    float D = D_GGX(ndh, a2);

    vec3 f0 = S.flakeColor;
    vec3 F = F_Schlick(f0, L.vdh);

    vec3 specular = F * V * D * ndl * L.color * L.intensity * L.attenuate;
    return specular * SPECULAR_WEIGHT;
}
#endif

// ------ General Invoke ------
precision mediump float;
vec3 Specular_GGX_Low(inout SurfaceParams S, inout LightParams L) {
    vec3 F = FresnelSpecular(S, L.vdh); //vdh = ldh
    float a = S.roughParams.y;
    float a2 = S.roughParams.z;
    float V = V_Const();
    float D = D_GGX(L.ndh, a2);
    #ifdef ILLUM_PBR
    return D * V * F * L.ndl * L.color * L.intensity * L.attenuate;
    #else
    return D * V * F * L.ndl * L.color * L.intensity * L.attenuate * SPECULAR_WEIGHT;
    #endif
}
//it is similiar to fresnel but consider roughness
vec3 EnvBRDFApprox(vec3 F0, float perceptualRoughness, float ndv) {
    // [ Lazarov 2013, "Getting More Physical in Call of Duty: Black Ops II" ]
    // Adaptation to fit our G term.
    const vec4 c0 = vec4(-1, -0.0275, -0.572, 0.022);
    const vec4 c1 = vec4(1, 0.0425, 1.04, -0.04);
    vec4 r = perceptualRoughness * c0 + c1;
    float a004 = min(r.x * r.x, exp2(-9.28 * ndv)) * r.x + r.y;
    vec2 AB = vec2(-1.04, 1.04) * a004 + r.zw;

    // Anything less than 2% is physically impossible and is instead considered to be shadowing
    // Note: this is needed for the 'specular' show flag to work, since it uses a SpecularColor of 0
    AB.y *= saturate(50.0 * F0.g); //when F0 is 0.04, it is 2, saturate to 1

    return F0 * AB.x + AB.y; //return F0 * AB.x + F90 * AB.y;
}
precision highp float;
vec3 Specular_GGX(inout SurfaceParams S, inout LightParams L) {
    vec3 F = FresnelSpecular(S, L.vdh); //vdh = ldh
    float a = S.roughParams.y;
    float a2 = S.roughParams.z;
    float V = V_SmithJointApprox(a, S.ndv, L.ndl);
    float D = D_GGX(L.ndh, a2);
    vec3 specular = D * V * F * L.ndl * L.color * L.intensity * L.attenuate;

    #ifdef ILLUM_PBR
    #ifdef ULTRA
    //use 1.0 as F0 at Energy Compensation, reference: MaterialX on github
    vec3 Ess = EnvBRDFApprox(vec3(1.0), S.roughParams.x, S.ndv);
    vec3 energyCompensation = 1.0 + F * (1.0 - Ess) / Ess;
    specular *= energyCompensation;
    #endif
    return specular;
    #else
    return specular * SPECULAR_WEIGHT;
    #endif
}

#ifndef ILLUM_PBR
#ifdef ThinFilm
vec3 Specular_GGX_ThinFilm(inout SurfaceParams S, inout LightParams L) {
    vec3 F = mix(F_Schlick(S.specCol, L.vdh), S.thinFilmFresnel, vec3(S.thinFilmIntensity));
    float V = V_SmithJointApprox(S.roughParams.y, S.ndv, L.ndl);
    float D = D_GGX(L.ndh, S.roughParams.z);
    return D * V * F * L.ndl * L.color * L.intensity * L.attenuate * SPECULAR_WEIGHT;
}

vec3 Diffuse_ThinFilm(inout SurfaceParams S, inout LightParams L) {
    vec3 schlickFresnel = F_Schlick(S.specCol, L.vdh);
    vec3 F = mix(schlickFresnel, vec3(maxComp3(S.thinFilmF0)), S.thinFilmIntensity);

    vec3 lighting = (vec3(1.0) - SPECULAR_WEIGHT * F) * M_INV_PI;
    return S.diffCol * L.color * L.intensity * L.attenuate * lighting;
}
#endif
#endif

#ifdef Anisotropic
//https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos/KHR_materials_anisotropy
vec3 Specular_GGX_Anisotropic(inout SurfaceParams S, inout LightParams L) {
    float TdotL = dot(S.anisoT, L.lDir);
    float BdotL = dot(S.anisoB, L.lDir);
    float TdotH = dot(S.anisoT, L.hDir);
    float BdotH = dot(S.anisoB, L.hDir);
    float TdotV = dot(S.anisoT, S.vDir);
    float BdotV = dot(S.anisoB, S.vDir);

    float ab = S.roughParams.y;
    float at = mix(ab, 1.0, S.anisoIntensity * S.anisoIntensity);
    vec3 F = F_Schlick(S.specCol, L.vdh);

    float V;
    {
        float GGXV = L.ndl * length(vec3(at * TdotV, ab * BdotV, S.ndv));
        float GGXL = S.ndv * length(vec3(at * TdotL, ab * BdotL, L.ndl));
        float v = 0.5 / (GGXV + GGXL);
        V = clamp(v, 0.0, 1.0);
    }

    float D;
    {
        float a2 = at * ab;
        vec3 f = vec3(ab * TdotH, at * BdotH, a2 * L.ndh);
        float w2 = a2 / dot(f, f);
        D = a2 * w2 * w2 / M_PI;
    }

    return D * V * F * L.ndl * L.color * L.intensity * L.attenuate * SPECULAR_WEIGHT;
}
#endif

#ifdef Fabric
//https://github.com/KhronosGroup/glTF/blob/main/extensions/2.0/Khronos/KHR_materials_sheen/README.md
vec3 Specular_Sheen(inout SurfaceParams S, inout LightParams L) {
#if defined(HIGH) || defined(ULTRA)
    float a = FABRIC_ROUGHNESS_SQRD;
    float V = V_AshikhminPremoze(S.ndv, L.ndl);
    float D = D_Charlie(a, L.ndh);
    return FABRIC_COLOR * V * D * L.ndl * L.color * L.intensity * L.attenuate * S.occParams.y;
#else
#if defined(MEDIUM)
    float indv = 1.0 - S.ndv;
    float indv4 = Pow2(Pow2(indv));
    float a = FABRIC_ROUGHNESS_SQRD;
    float D = mix(indv4, indv * 0.4, a);
    return FABRIC_COLOR * D * L.ndl * L.color * L.intensity * L.attenuate * S.occParams.y;
#else
    return vec3(0.0);
#endif
#endif
}
#endif

precision mediump float;
//diffuse options: Diffuse_Lambert Diffuse_Disney Diffuse_OrenNayar Diffuse_Gotanda
//diffuse for main light
vec3 Diffuse_High(inout SurfaceParams S, inout LightParams L) {
//ThinFilm overrides all. Then Anisotropic. then everything else uses regular algorithms
#ifdef ILLUM_PBR
    return Diffuse_Lambert(S, L);
#else
#ifdef ThinFilm
    return Diffuse_ThinFilm(S, L);
#else
#ifdef Scatter
    return Diffuse_Scatter(S, L);
#else
    return Diffuse_Lambert_High(S, L);
#endif
#endif
#endif
}
//diffuse for other lights
vec3 Diffuse_Low(inout SurfaceParams S, inout LightParams L) {
    return Diffuse_Lambert(S, L);
}
//specular options: Specular_Blinn Specular_GGX_Low Specular_GGX
//specular for main light
vec3 Specular_High(inout SurfaceParams S, inout LightParams L) {
#ifdef ILLUM_PBR
    #if defined(HIGH) || defined(ULTRA)
    return Specular_GGX(S, L);
    #else
    return Specular_GGX_Low(S, L);
    #endif
#else
    #if defined(HIGH) || defined(ULTRA)
    //ThinFilm overrides all. Then Anisotropic. then everything else uses regular algorithms
        #ifdef ThinFilm
    vec3 outCol = Specular_GGX_ThinFilm(S, L);
        #endif

        #if defined(Anisotropic) && !defined(ThinFilm)
    vec3 outCol = Specular_GGX_Anisotropic(S, L);
        #endif

        #if !defined(Anisotropic) && !defined(ThinFilm)
    vec3 outCol = Specular_GGX(S, L);
        #endif
    #else
    vec3 outCol = Specular_GGX_Low(S, L);
    #endif
    return outCol;
#endif
}
//specular for other lights
vec3 Specular_Low(inout SurfaceParams S, inout LightParams L) {
    return Specular_GGX_Low(S, L);
}

#endif
precision mediump float;
/** USED BY: **
    Uber
    PBR
**/
/** CONTAINS: **
    
**/

#ifndef INDIRECTILLUM_HPP
#define INDIRECTILLUM_HPP

const int MAX_SH_NUM = 28;
uniform lowp float _Coefficients[MAX_SH_NUM];
uniform mediump float _EnvironmentIntensity;
uniform mediump float _EnvironmentRotation;
uniform mediump vec4  _EnvironmentTintColor;


// Jimenez et al. 2016, "Practical Realtime Strategies for Accurate Indirect Occlusion"
/**
    * Returns a color ambient occlusion based on a pre-computed visibility term.
    * The albedo term is meant to be the diffuse color or f0 for the diffuse and
    * specular terms respectively.
    */
vec3 GTAO_MultiBounce(float visibility, vec3 albedo) {
#if defined(HIGH) || defined(ULTRA)
    vec3 a = 2.0404 * albedo - 0.3324;
    vec3 b = -4.7951 * albedo + 0.6417;
    vec3 c = 2.7552 * albedo + 0.6903;
    return max(vec3(visibility), ((visibility * a + b) * visibility + c) * visibility);
#else
    return vec3(visibility);
#endif
}

#ifdef ILLUM_PBR
//https://www.unrealengine.com/zh-CN/blog/physically-based-shading-on-mobile
vec3 EnvBRDF(inout SurfaceParams S) {
#if defined(ThinFilm)
    return F_ThinFilm(_ThinFilmIOR, S, S.ndv);
#else
#ifdef ULTRA
    //use 1.0 as F0 at Energy Compensation, reference: MaterialX on github
    vec3 Ess = EnvBRDFApprox(vec3(1.0), S.roughParams.x, S.ndv);
    vec3 energyCompensation = 1.0 + S.specCol * (1.0 - Ess) / Ess;
    return EnvBRDFApprox(S.specCol, S.roughParams.x, S.ndv) * energyCompensation;
#endif
#endif
    return EnvBRDFApprox(S.specCol, S.roughParams.x, S.ndv);
}
#else
//https://www.unrealengine.com/zh-CN/blog/physically-based-shading-on-mobile
vec3 EnvBRDF(in vec2 uv, in float ndv, in float roughness, in vec3 specCol /*F0*/) {
#ifdef ULTRA
    //use 1.0 as F0 at Energy Compensation, reference: MaterialX on github
    vec3 Ess = EnvBRDFApprox(vec3(1.0), roughness, ndv);
    vec3 energyCompensation = 1.0 + specCol * (1.0 - Ess) / Ess;
    return EnvBRDFApprox(specCol, roughness, ndv) * energyCompensation;
#else
    return EnvBRDFApprox(specCol, roughness, ndv);
#endif
}
#endif

// ------ Env Mapping ------
uniform lowp samplerCube _RadianceTexture;
vec3 SampleCubemap(samplerCube cubemap, vec3 dir, float lod) {
    dir = normalize(dir);
    vec4 sampleColor = textureLod(cubemap, dir, lod);
    return sampleColor.rgb / sampleColor.a;
}
// 360 degree is normalized into rotation range 0 - 1
vec3 SampleIBL(vec3 dir, float rotation, float lod) {
    float rad = rotation * M_RAD;
    dir = vec3(cos(rad) * dir.x + sin(rad) * -dir.z, dir.y, -sin(rad) * dir.x + cos(rad) * -dir.z);
    return SampleCubemap(_RadianceTexture, dir, lod).xyz * _EnvironmentTintColor.xyz * _EnvironmentIntensity;
}
vec3 GetSHDiffuse(vec3 normal, float rotation) {
    float rad = rotation * M_RAD;
    normal = vec3(cos(rad) * normal.x + sin(rad) * -normal.z, normal.y, -sin(rad) * normal.x + cos(rad) * -normal.z);
    vec4 vDifSHCoef[7];
    vDifSHCoef[0].x = _Coefficients[0];
    vDifSHCoef[0].y = _Coefficients[1];
    vDifSHCoef[0].z = _Coefficients[2];
    vDifSHCoef[0].w = _Coefficients[3];
    vDifSHCoef[1].x = _Coefficients[4];
    vDifSHCoef[1].y = _Coefficients[5];
    vDifSHCoef[1].z = _Coefficients[6];
    vDifSHCoef[1].w = _Coefficients[7];
    vDifSHCoef[2].x = _Coefficients[8];
    vDifSHCoef[2].y = _Coefficients[9];
    vDifSHCoef[2].z = _Coefficients[10];
    vDifSHCoef[2].w = _Coefficients[11];
    vDifSHCoef[3].x = _Coefficients[12];
    vDifSHCoef[3].y = _Coefficients[13];
    vDifSHCoef[3].z = _Coefficients[14];
    vDifSHCoef[3].w = _Coefficients[15];
    vDifSHCoef[4].x = _Coefficients[16];
    vDifSHCoef[4].y = _Coefficients[17];
    vDifSHCoef[4].z = _Coefficients[18];
    vDifSHCoef[4].w = _Coefficients[19];
    vDifSHCoef[5].x = _Coefficients[20];
    vDifSHCoef[5].y = _Coefficients[21];
    vDifSHCoef[5].z = _Coefficients[22];
    vDifSHCoef[5].w = _Coefficients[23];
    vDifSHCoef[6].x = _Coefficients[24];
    vDifSHCoef[6].y = _Coefficients[25];
    vDifSHCoef[6].z = _Coefficients[26];
    vDifSHCoef[6].w = _Coefficients[27];

    vec4 NormalVector = vec4(normal.x, normal.z, -normal.y, 1);

    vec3 Intermediate0, Intermediate1, Intermediate2;
    Intermediate0.x = dot(vDifSHCoef[0], NormalVector);
    Intermediate0.y = dot(vDifSHCoef[1], NormalVector);
    Intermediate0.z = dot(vDifSHCoef[2], NormalVector);

    vec4 vB = NormalVector.xyzz * NormalVector.yzzx;
    Intermediate1.x = dot(vDifSHCoef[3], vB);
    Intermediate1.y = dot(vDifSHCoef[4], vB);
    Intermediate1.z = dot(vDifSHCoef[5], vB);

    float vC = NormalVector.x * NormalVector.x - NormalVector.y * NormalVector.y;
    Intermediate2 = vDifSHCoef[6].xyz * vC;

    // max to not get negative colors, maybe we can optimize to use saturate() and scale later or clamp this way: saturate(A/100)*100
    return max(vec3(0.0, 0.0, 0.0), Intermediate0 + Intermediate1 + Intermediate2).xyz * _EnvironmentTintColor.xyz * _EnvironmentIntensity;
}

// ------ Indirect Diffuse ------
vec3 Diffuse_Env(inout SurfaceParams S) {
#if defined(_EnableBentNormal) && defined(NormalTexture) && (defined(HIGH) || defined(ULTRA))
    vec3 diffuseNormal = S.bnDir;
#else
    vec3 diffuseNormal = S.nDir;
#endif
    vec3 lighting = GetSHDiffuse(diffuseNormal, _EnvironmentRotation);
    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.x, S.diffCol);
    return S.diffCol * lighting * multiBounceColor;
}

#ifdef Fabric
vec3 Sheen_IBL(inout SurfaceParams S, in float brdf) {
#if defined(_EnableBentNormal) && defined(NormalTexture) && (defined(HIGH) || defined(ULTRA))
    vec3 diffuseNormal = S.bnDir;
#else
    vec3 diffuseNormal = S.nDir;
#endif
    vec3 refl = normalize(reflect(-S.vDir, diffuseNormal));
    vec3 lighting = SampleIBL(refl, _EnvironmentRotation, FABRIC_ROUGHNESS * AE_MIP_LEVEL);
    return FABRIC_COLOR * lighting * S.occParams.x * brdf;
}
#endif

#ifdef Scatter
vec3 Diffuse_Env_Scatter(inout SurfaceParams S) {
    vec3 lighting = GetSHDiffuse(S.vnDir, _EnvironmentRotation);

    //forwardScatter
    float transmit = 1.0 - S.ndv;
    float attenuation = 1.0 - S.thick;
    vec3 thickScatterCol = Pow5(_ScatterColor.rgb);
    vec3 forwardScatter = mix(_ScatterColor.rgb, thickScatterCol, S.thick) * transmit * attenuation;
    forwardScatter *= 2.0;

    //backScatter
    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.x, S.diffCol);
    vec3 backScatter = multiBounceColor * lighting;

    vec3 scatterTerm = (forwardScatter + backScatter) * S.diffCol;
    vec3 lambertTerm = Diffuse_Env(S);
    return mix(lambertTerm, scatterTerm, S.scatter);
}
#endif

// ------ Indrecit Specluar ------
vec3 Specular_Env(inout SurfaceParams S) {
    //from Moving Frostbite to Physically Based Rendering  (Specular Dominant Dir)
    vec3 dir = mix(S.rDir, S.nDir, S.roughParams.x * S.roughParams.y);
    //https://google.github.io/filament/Filament.md.html      5.3.4.4
    vec3 specEnv = SampleIBL(dir, _EnvironmentRotation, S.roughParams.x * AE_MIP_LEVEL);
    #ifdef ILLUM_PBR
    vec3 brdf = EnvBRDF(S);
    #else
    vec3 brdf = EnvBRDF(S.uv0, S.ndv, S.roughParams.x, S.specCol);
    #endif
    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.y, S.specCol);
    vec3 Fr = brdf * multiBounceColor * specEnv;
#ifdef Flake
    vec3 FrFlake = S.flakeColor * SampleIBL(S.frDir, _EnvironmentRotation, S.flakeRoughParams * AE_MIP_LEVEL);
    Fr = mix(Fr, FrFlake, S.flakeFactor);
#endif

    #ifdef ILLUM_PBR
    return Fr;
    #else
    return Fr * SPECULAR_WEIGHT;
    #endif
}

#if !defined(ILLUM_PBR) && defined(ThinFilm)
vec3 Specular_Env_ThinFilm(inout SurfaceParams S) {
    //from Moving Frostbite to Physically Based Rendering  (Specular Dominant Dir)
    vec3 dir = mix(S.rDir, S.nDir, S.roughParams.x * S.roughParams.y);
    //https://google.github.io/filament/Filament.md.html      5.3.4.4
    vec3 specEnv = SampleIBL(dir, _EnvironmentRotation, S.roughParams.x * AE_MIP_LEVEL);

    vec3 F0 = mix(S.specCol, S.thinFilmFresnel, S.thinFilmIntensity);
    vec3 brdf = EnvBRDF(S.uv0, S.ndv, S.roughParams.x, F0);

    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.y, S.specCol);
    vec3 Fr = brdf * multiBounceColor * specEnv;

#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
    vec3 FrFlake = S.flakeColor * SampleIBL(S.frDir, _EnvironmentRotation, S.flakeRoughParams * AE_MIP_LEVEL);
    Fr = mix(Fr, FrFlake, S.flakeFactor);
#endif

    return Fr * SPECULAR_WEIGHT;
}
vec3 Diffuse_Env_ThinFilm(inout SurfaceParams S) {
#if defined(_EnableBentNormal) && defined(NormalTexture) && (defined(HIGH) || defined(ULTRA))
    vec3 diffuseNormal = S.bnDir;
#else
    vec3 diffuseNormal = S.nDir;
#endif
    vec3 lighting = GetSHDiffuse(diffuseNormal, _EnvironmentRotation);
    vec3 F0 = mix(S.specCol, vec3(maxComp3(S.thinFilmF0)), vec3(S.thinFilmIntensity));
    //fresnel schlick roughness calculation
    vec3 ks = F0 + (max(vec3(1.0 - S.roughParams.x), F0) - F0) * Pow5(clamp(1.0 - S.ndv, 0.0, 1.0));
    vec3 kd = vec3(1.0) - ks * SPECULAR_WEIGHT;
    return S.diffCol * lighting * kd * S.occParams.x;
}
#endif

#ifdef Anisotropic
vec3 Specular_Env_Anisotropic(inout SurfaceParams S) {
    float bentFactor = Pow4(1.0 - S.anisoIntensity * (1.0 - S.roughParams.x));
    vec3 bentNormal = cross(S.anisoB, S.vDir);
    bentNormal = cross(S.anisoT, S.anisoB);
    bentNormal = normalize(mix(bentNormal, S.nDir, bentFactor));
    vec3 reflectVec = normalize(reflect(-S.vDir, bentNormal));
    reflectVec = normalize(mix(reflectVec, bentNormal, S.roughParams.x * S.roughParams.x));
    vec3 specEnv = SampleIBL(reflectVec, _EnvironmentRotation, S.roughParams.x * AE_MIP_LEVEL);
    vec3 brdf = EnvBRDF(S.uv0, S.ndv, S.roughParams.x, S.specCol);
    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.y, S.specCol);
    vec3 Fr = brdf * multiBounceColor * specEnv;
#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
    vec3 FrFlake = S.flakeColor * SampleIBL(S.frDir, _EnvironmentRotation, S.flakeRoughParams * AE_MIP_LEVEL);
    Fr = mix(Fr, FrFlake, S.flakeFactor);
#endif
    return Fr * SPECULAR_WEIGHT;
}
#endif

#ifdef Coat
vec3 Specular_Env_Coat(inout SurfaceParams S) {
    float ndv = max(0.0, dot(S.cnDir, S.vDir));
    vec3 specEnv = SampleIBL(S.crDir, _EnvironmentRotation, S.coatRoughParams * AE_MIP_LEVEL);
    vec3 brdf = EnvBRDF(S.uv0, ndv, S.coatRoughParams, vec3(S.coatF0));
    float specularAO = S.occParams.y;
    return specularAO * brdf * specEnv * SPECULAR_WEIGHT;
}
#endif

// ------Indrecit  Refraction ------
#ifdef Refraction

uniform mediump float _RefractionTransmittance;
uniform mediump sampler2D _RefractionTexture;
uniform mediump sampler2D _RefractionBackground;

#ifdef EnableVolume
uniform mediump float _VolumeThickness;
#ifdef EnableNonInfiniteAttenDist
uniform vec4 _VolumeAttenuationColor;
uniform mediump float _VolumeAttenuationDistance;
#endif
#endif

float applyIorToRoughness(in float roughness, in float ior) {
    // Scale roughness with IOR so that an IOR of 1.0 results in no microfacet refraction and
    // an IOR of 1.5 results in the default amount of microfacet refraction.
    return roughness * clamp(ior * 2.0 - 2.0, 0.0, 1.0);
}

vec3 sampleEnvMap(in vec3 transmissionRay, in float roughness, in float ior) {
//enabled by the blend mode Transmisson
#ifdef EH_TRANSMISSION_ENABLED
    vec3 refractedRayExit = v_posWS + transmissionRay;
    vec4 ndcPos = u_VP * vec4(refractedRayExit, 1.0);
    vec2 refractionCoords = ndcPos.xy / ndcPos.w;
    refractionCoords += 1.0;
    refractionCoords /= 2.0;
    float lod = log2(1.0 / max(v_pixelSize.x, v_pixelSize.y)) * applyIorToRoughness(roughness, ior);
    vec2 offset = (exp2(lod) * v_pixelSize);
    vec3 A = textureLod(_RefractionBackground, refractionCoords.xy, lod).rgb;
    vec3 B = textureLod(_RefractionBackground, refractionCoords.xy + offset * vec2(-0.5, -0.5), lod).rgb;
    vec3 C = textureLod(_RefractionBackground, refractionCoords.xy + offset * vec2(-0.5, 0.5), lod).rgb;
    vec3 D = textureLod(_RefractionBackground, refractionCoords.xy + offset * vec2(0.5, -0.5), lod).rgb;
    vec3 E = textureLod(_RefractionBackground, refractionCoords.xy + offset * vec2(0.5, 0.5), lod).rgb;
    return GammaToLinear(0.2 * (A + B + C + D + E));

#else
    return SampleIBL(normalize(transmissionRay), _EnvironmentRotation, roughness * AE_MIP_LEVEL);
#endif
}

//https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos/KHR_materials_volume
vec3 applyVolumeAttenuation(in vec3 radiance, inout SurfaceParams S) {
#if defined(EnableVolume) && defined(EnableNonInfiniteAttenDist)
    float attenuationDistance = max(_VolumeAttenuationDistance, 0.001);
    vec3 attenuationCoefficient = -log(GammaToLinear(_VolumeAttenuationColor.rgb)) / attenuationDistance;
    vec3 transmittance = exp(-attenuationCoefficient * S.transmissionRayLength);
    return transmittance * radiance;
#else
    return radiance;
#endif
}

vec3 IndirectVolumeRefraction(inout SurfaceParams S) {
//transmissionRay is 0 in this case
#if !defined(EnableVolume) && !defined(EH_TRANSMISSION_ENABLED)
    vec3 ray = refract(-S.vDir, S.nDir, 1.0 / _IOR);
    vec3 radiance = sampleEnvMap(ray, S.roughParams.x, _IOR);
#else
    vec3 radiance = sampleEnvMap(S.transmissionRay, S.roughParams.x, _IOR);
#endif
    vec3 attenuatedColor = applyVolumeAttenuation(radiance, S);

    vec3 brdf = EnvBRDF(S.uv0, S.ndv, S.roughParams.x, S.specCol);
    vec3 multiBounceColor = GTAO_MultiBounce(S.occParams.y, S.specCol);
    vec3 Fr = (vec3(1.0) - brdf) * multiBounceColor * attenuatedColor * S.diffCol;

    return Fr;
}

vec3 getTransmissionRadiance(inout SurfaceParams S, inout LightParams L) {
    float transmissionRougness = applyIorToRoughness(S.roughParams.y, _IOR);
    vec3 l_mirror = normalize(L.rayToLight + 2.0 * S.nDir * dot(-L.rayToLight, S.nDir)); // Mirror light reflection vector on surface
    vec3 h = normalize(l_mirror + S.vDir);                                               // Halfway vector between transmission light vector and v

    float D = D_GGX(clamp(dot(S.nDir, h), 0.0, 1.0), transmissionRougness);
    vec3 F = F_Schlick(S.specCol, clamp(dot(S.vDir, h), 0.0, 1.0));
    float V = V_SmithJointApprox(transmissionRougness, S.ndv, clamp(dot(S.nDir, l_mirror), 0.0, 1.0));

    return (vec3(1.0) - F) * S.diffCol * D * V;
}
#endif

#endif
/** USED BY: **
    PBR
    Uber
    Simple Lighting
    Matte Shadow
**/

#ifndef LIGHTING_HPP
#define LIGHTING_HPP

const int MAX_NUM_DIR = 3;
const int MAX_NUM_POINT = 2;
const int MAX_NUM_SPOT = 2;

// DirLight
uniform lowp float u_DirLightsEnabled[MAX_NUM_DIR];
uniform mediump vec4 u_DirLightsDirection[MAX_NUM_DIR];
uniform lowp vec4 u_DirLightsColor[MAX_NUM_DIR];
uniform mediump float u_DirLightsIntensity[MAX_NUM_DIR];
// PointLight
uniform lowp float u_PointLightsEnabled[MAX_NUM_POINT];
uniform highp vec4 u_PointLightsPosition[MAX_NUM_POINT];
uniform lowp vec4 u_PointLightsColor[MAX_NUM_POINT];
uniform mediump float u_PointLightsIntensity[MAX_NUM_POINT];
uniform mediump float u_PointLightsAttenRangeInv[MAX_NUM_POINT];
// SpotLight
uniform lowp float u_SpotLightsEnabled[MAX_NUM_SPOT];
uniform mediump vec4 u_SpotLightsDirection[MAX_NUM_SPOT];
uniform highp vec4 u_SpotLightsPosition[MAX_NUM_SPOT];
uniform lowp vec4 u_SpotLightsColor[MAX_NUM_SPOT];
uniform mediump float u_SpotLightsIntensity[MAX_NUM_SPOT];
uniform mediump float u_SpotLightsInnerAngleCos[MAX_NUM_SPOT];
uniform mediump float u_SpotLightsOuterAngleCos[MAX_NUM_SPOT];
uniform mediump float u_SpotLightsAttenRangeInv[MAX_NUM_SPOT];

#ifdef BUILD_SIMPLE_LIGHTING
struct LightGroupParams {
    LightParams DirLights[MAX_NUM_DIR];
    LightParams PointLights[MAX_NUM_POINT];
    LightParams SpotLights[MAX_NUM_SPOT];
    float dummy;
};
// for simple lighting adn matteshadow
LightParams BuildSimpleDirLightParams(SurfaceParams S, int index) {
    LightParams ML;
    ML.lDir = normalize(-u_DirLightsDirection[index].xyz);
    ML.color = u_DirLightsColor[index].xyz;
#ifdef BUILD_SIMPLE_LIGHTING
    ML.intensity = u_DirLightsIntensity[index];
#else
    ML.intensity = u_DirLightsIntensity[index] * u_DirLightsEnabled[index] * 3.141592;
#endif
    ML.attenuate = vec3(1.0, 1.0, 1.0);
    return ML;
}
LightParams BuildSimplePointLightParams(SurfaceParams S, int index) {
    vec3 lVec = vec3(0.0);
    float lDist = 0.0;
    LightParams PL;
    lVec = u_PointLightsPosition[index].xyz - S.pos;
    lDist = length(lVec);
    PL.lDir = lVec / lDist;
    PL.color = u_PointLightsColor[index].xyz;
#ifdef BUILD_SIMPLE_LIGHTING
    PL.intensity = u_PointLightsIntensity[index];
#else
    PL.intensity = u_PointLightsIntensity[index] * u_PointLightsEnabled[index] * 3.141592;
#endif
    float lWorldDist = lDist;
    lDist *= u_PointLightsAttenRangeInv[index];
    // This formula comes from chapter 5.2.2.3 of this website (https://google.github.io/filament/Filament.md.html#lighting/directlighting/punctuallights)
    float attenuate = Pow2(saturate(1.0 - Pow4(lDist))) * (Pow2(lWorldDist) + 1.0) * 0.25;
    PL.attenuate = vec3(attenuate, attenuate, attenuate);
    return PL;
}
LightParams BuildSimpleSpotLightParams(SurfaceParams S, int index) {
    vec3 lVec = vec3(0.0);
    float lDist = 0.0;
    vec3 spotDir = vec3(0.0);
    float angleAtten = 0.0;
    LightParams SL;
    lVec = u_SpotLightsPosition[index].xyz - S.pos;
    lDist = length(lVec);
    SL.lDir = lVec / lDist;
    SL.color = u_SpotLightsColor[index].xyz;
    SL.intensity = u_SpotLightsIntensity[index] * u_SpotLightsEnabled[index] * 3.14159265;
    float lWorldDist = lDist;
    lDist *= u_SpotLightsAttenRangeInv[index];
    // This formula comes from chapter 5.2.2.3 of this website (https://google.github.io/filament/Filament.md.html#lighting/directlighting/punctuallights)
    float attenuate = Pow2(saturate(1.0 - Pow4(lDist))) * (Pow2(lDist) + 1.0) * 0.25;
    spotDir = normalize(-u_SpotLightsDirection[index].xyz);
    angleAtten = max(0.0, dot(SL.lDir, spotDir));
    attenuate *= smoothstep(u_SpotLightsOuterAngleCos[index], u_SpotLightsInnerAngleCos[index], angleAtten);
    SL.attenuate = vec3(attenuate, attenuate, attenuate);
    return SL;
}
LightGroupParams BuildLightGroupParams(SurfaceParams S) {
    LightGroupParams LG;
    LG.dummy = 0.0;
// Dir Light
#if defined(AE_DIRECTIONAL_1) || defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
    LG.DirLights[0] = BuildSimpleDirLightParams(S, 0);
#ifdef AE_RECEIVE_SHADOW
    if(u_DirLightsEnabled[0] > 0.5) {
        vec4 shadowFactor = Shadowing(S, LG.DirLights[0]);
        LG.DirLights[0].attenuate = mix(LG.DirLights[0].attenuate, shadowFactor.rgb, shadowFactor.a);
    }
#endif
#if defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
    LG.DirLights[1] = BuildSimpleDirLightParams(S, 1);
#if defined(AE_DIRECTIONAL_3)
    LG.DirLights[2] = BuildSimpleDirLightParams(S, 2);
#endif
#endif
#endif

// Point Light
#if defined(AE_POINT_1) || defined(AE_POINT_2)
    LG.PointLights[0] = BuildSimplePointLightParams(S, 0);
#if defined(AE_POINT_2)
    LG.PointLights[1] = BuildSimplePointLightParams(S, 1);
#endif
#endif

// Spot Light
#if defined(AE_SPOT_1) || defined(AE_SPOT_2)
    LG.SpotLights[0] = BuildSimpleSpotLightParams(S, 0);
#if defined(AE_SPOT_2)
    LG.SpotLights[1] = BuildSimpleSpotLightParams(S, 1);
#endif
#endif
    return LG;
}
vec3 Diffuse_Low(SurfaceParams S, LightParams L) {
    // diffuse
    vec3 lightDir = L.lDir;
    float diff = 0.5 * dot(lightDir, S.nDir) + 0.5;
    vec3 diffuse = diff * S.albedo * L.color * L.intensity * L.attenuate;
    return diffuse;
    // vec4 result = vec4(ambient + diffuse, 1.0);
    // vec4 result = vec4(color, 1.0);
}
#ifdef Specular
vec3 Specular_Low(SurfaceParams S, LightParams L) {
    // specular
    vec3 viewDir = normalize(u_WorldSpaceCameraPos.xyz - S.pos);
    vec3 halfwayDir = normalize(L.lDir + viewDir);
    float vdh = max(dot(S.nDir, halfwayDir), 0.0);
    float spec = clamp(pow(vdh, _SpecularPower) * _SpecularIntensity, 0.0, 1.0);
    // Fresnel
    // float t = pow(1.0 - vdh, 5);
    // vec3 f0 = vec3(0.04);
    // float f = f0 + (1.0 - f0) * t;
    float f = 1.0;
    vec3 specular = f * L.color.rgb * spec * _SpecularColor.rgb * L.attenuate * L.intensity;
    #ifdef SpecularTexture
        specular *= texture(_SpecularTexture, v_uv0).rgb;
    #endif
    return specular;
}
#endif
void DoLight(SurfaceParams S, LightParams L, inout vec3 Fd, inout vec3 Fr) {
    float coatAttenuate = 1.0;
    Fd += Diffuse_Low(S, L) * coatAttenuate;
#ifdef Specular
    Fr += Specular_Low(S, L) * coatAttenuate;
#endif
}
vec3 Lighting(
    SurfaceParams S,
    LightGroupParams LG
) {
    // ------ LightMode ------
    vec3 Fd = vec3(0.0);
    vec3 Fr = vec3(0.0);
    vec3 finalRGB = vec3(0.0);

#if defined(AE_DIRECTIONAL_1) || defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
    if(u_DirLightsEnabled[0] > 0.5) {
        DoLight(S, LG.DirLights[0], Fd, Fr);
    }
#if defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
    if(u_DirLightsEnabled[1] > 0.5) {
        DoLight(S, LG.DirLights[1], Fd, Fr);
    }
#if defined(AE_DIRECTIONAL_3)
    if(u_DirLightsEnabled[2] > 0.5) {
        DoLight(S, LG.DirLights[2], Fd, Fr);
    }
#endif
#endif
#endif

#if defined(AE_POINT_1) || defined(AE_POINT_2)
    if(u_PointLightsEnabled[0] > 0.5) {
        DoLight(S, LG.PointLights[0], Fd, Fr);
    }
#if defined(AE_POINT_2)
    if(u_PointLightsEnabled[1] > 0.5) {
        DoLight(S, LG.PointLights[1], Fd, Fr);
    }
#endif
#endif

#if defined(AE_SPOT_1) || defined(AE_SPOT_2)
    if(u_SpotLightsEnabled[0] > 0.5) {
        DoLight(S, LG.SpotLights[0], Fd, Fr);
    }
#if defined(AE_SPOT_2)
    if(u_SpotLightsEnabled[1] > 0.5) {
        DoLight(S, LG.SpotLights[1], Fd, Fr);
    }
#endif
#endif

#ifdef Emissive
    Fd += S.emissive;
#endif

    finalRGB = Fd + Fr;
    return finalRGB;
}
#else
// for pbr lights
void LightCommomOperations(inout SurfaceParams S, inout LightParams L) {
    // TODO, check compiler optimization on unused params of sturct
    L.hDir = normalize(L.lDir + S.vDir);
    L.ndl = max(0.0, dot(S.nDir, L.lDir));
    L.ndh = clamp(dot(S.nDir, L.hDir), 0.0001, 1.0);
    L.vdh = max(0.0, dot(S.vDir, L.hDir));
}
void BuildDirLightParams(inout SurfaceParams S, int index, out LightParams ML) {
    ML.lDir = normalize(-u_DirLightsDirection[index].rgb);
    ML.color = u_DirLightsColor[index].rgb;
    ML.intensity = u_DirLightsIntensity[index] * u_DirLightsEnabled[index] * 3.141592;
    ML.attenuate = vec3(1.0, 1.0, 1.0);
    LightCommomOperations(S, ML);
#ifdef Refraction
    ML.refractionIntensity = ML.color * ML.intensity;
    ML.rayToLight = normalize(ML.lDir - S.transmissionRay);
#endif
}
void BuildPointLightParams(inout SurfaceParams S, int index, out LightParams PL) {
    vec3 lVec = vec3(0.0);
    float lDist = 0.0;
    lVec = u_PointLightsPosition[index].rgb - S.pos;
    lDist = length(lVec);
    PL.lDir = lVec / lDist;
    PL.color = u_PointLightsColor[index].rgb;
    PL.intensity = u_PointLightsIntensity[index] * u_PointLightsEnabled[index] * 3.141592;
    float lWorldDist = lDist;
    lDist *= u_PointLightsAttenRangeInv[index];
    // This formula comes from chapter 5.2.2.3 of this website (https://google.github.io/filament/Filament.md.html#lighting/directlighting/punctuallights)
    float attenuate = Pow2(saturate(1.0 - Pow4(lDist))) * (Pow2(lDist) + 1.0) * 0.25;
    PL.attenuate = vec3(attenuate, attenuate, attenuate);
    LightCommomOperations(S, PL);
#ifdef Refraction
    vec3 rl = lVec - S.transmissionRay;
    float rlDist = length(rl);
    PL.rayToLight = rl / rlDist;
    float rlAtten = rlDist * u_PointLightsAttenRangeInv[index];
    rlAtten = (Pow2(saturate(1.0 - Pow4(rlAtten))) * (Pow2(rlAtten) + 1.0) * 0.25);
    PL.refractionIntensity = vec3(rlAtten, rlAtten, rlAtten) * PL.intensity * PL.color;
#endif
}
void BuildSpotLightParams(inout SurfaceParams S, int index, out LightParams SL) {
    vec3 lVec = vec3(0.0);
    float lDist = 0.0;
    vec3 spotDir = vec3(0.0);
    float angleAtten = 0.0;
    lVec = u_SpotLightsPosition[index].rgb - S.pos;
    lDist = length(lVec);
    SL.lDir = lVec / lDist;
    SL.color = u_SpotLightsColor[index].rgb;
    SL.intensity = u_SpotLightsIntensity[index] * u_SpotLightsEnabled[index] * 3.141592;
    float lWorldDist = lDist;
    lDist *= u_SpotLightsAttenRangeInv[index];
    // This formula comes from chapter 5.2.2.3 of this website (https://google.github.io/filament/Filament.md.html#lighting/directlighting/punctuallights)
    // float attenuate   = Pow2(saturate(1.0 - Pow4(lDist))) / max(Pow2(lWorldDist), Pow2(0.01));
    float attenuate = Pow2(saturate(1.0 - Pow4(lDist))) * (Pow2(lDist) + 1.0) * 0.25;
    spotDir = normalize(-u_SpotLightsDirection[index].rgb);
    angleAtten = max(0.0, dot(SL.lDir, spotDir));
    attenuate *= smoothstep(u_SpotLightsOuterAngleCos[index], u_SpotLightsInnerAngleCos[index], angleAtten);
    SL.attenuate = vec3(attenuate, attenuate, attenuate);
    LightCommomOperations(S, SL);
#ifdef Refraction
    vec3 rl = lVec - S.transmissionRay;
    float rlDist = length(rl);
    SL.rayToLight = rl / rlDist;
    float rlAtten = rlDist * u_PointLightsAttenRangeInv[index];
    rlAtten = (Pow2(saturate(1.0 - Pow4(rlAtten))) * (Pow2(rlAtten) + 1.0) * 0.25);
    angleAtten = max(0.0, dot(SL.rayToLight, spotDir));
    rlAtten *= smoothstep(u_SpotLightsOuterAngleCos[index], u_SpotLightsInnerAngleCos[index], angleAtten);
    SL.refractionIntensity = vec3(rlAtten, rlAtten, rlAtten) * SL.intensity * SL.color;
#endif
}
void DoHeavyLight(
    inout SurfaceParams S,
    inout LightParams L,
    inout vec3 Fd,
    inout vec3 Fr
#ifdef Coat
    ,
    inout vec3 coatColor
#endif
#ifdef Refraction
    ,
    inout vec3 transmission
#endif
#ifdef Fabric
    ,
    inout vec3 sheenColor
#endif
) {
#ifdef Coat
    coatColor += Specular_GGX_Coat(S, L);
#endif

#ifdef Refraction
#ifdef DirectTransmission
#ifdef EnableVolume
    vec3 radiance = L.refractionIntensity * getTransmissionRadiance(S, L);
    radiance = applyVolumeAttenuation(radiance, S);
    transmission += radiance;
#else
    transmission += L.refractionIntensity * getTransmissionRadiance(S, L);
#endif
#endif
#endif

#ifdef Fabric
    sheenColor += Specular_Sheen(S, L);
#endif

    Fd += Diffuse_High(S, L);
    Fr += Specular_High(S, L);

#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
    vec3 FrFlake = Specular_Flake(S, L);
    Fr += FrFlake * S.flakeFactor;
#endif
}
void DoLight(
    inout SurfaceParams S,
    inout LightParams L,
    inout vec3 Fd,
    inout vec3 Fr
#ifdef Coat
    ,
    inout vec3 coatColor
#endif
#ifdef Refraction
    ,
    inout vec3 transmission
#endif
) {
#if defined(HIGH) || defined(ULTRA)
#ifdef Coat
    coatColor += Specular_GGX_Coat(S, L);
#endif

#ifdef Refraction
    transmission += L.refractionIntensity * getTransmissionRadiance(S, L);
#endif
#endif

    Fd += Diffuse_Low(S, L);
    Fr += Specular_Low(S, L);
}
void DoIndirectLight(
    inout SurfaceParams S,
    inout vec3 Fd,
    inout vec3 Fr
#ifdef Coat
    ,
    out vec3 coatColor
#endif
#ifdef Refraction
    ,
    out vec3 transmission
#endif
) {
#ifdef Coat
    coatColor = Specular_Env_Coat(S);
#endif

#ifdef Refraction
    transmission = IndirectVolumeRefraction(S);
#endif

// ThinFilm overrides all. Then Anisotropic. then everything else uses regular algorithms
#ifdef ThinFilm
    #ifdef ILLUM_PBR
    Fd += Diffuse_Env(S);
    Fr += Specular_Env(S);
    #else
    Fd = Diffuse_Env_ThinFilm(S);
    Fr = Specular_Env_ThinFilm(S);
    #endif
#endif

#if defined(Anisotropic) && !defined(ThinFilm)
    Fd = Diffuse_Env(S);
    Fr = Specular_Env_Anisotropic(S);
#endif

#if defined(Scatter) && !defined(Anisotropic) && !defined(ThinFilm)
    Fd = Diffuse_Env_Scatter(S);
    Fr = Specular_Env(S);
#endif

#if !defined(Scatter) && !defined(Anisotropic) && !defined(ThinFilm)
    Fd = Diffuse_Env(S);
    Fr = Specular_Env(S);
#endif
}
vec3 Lighting(inout SurfaceParams S) {
    // ------ LightMode ------
    vec3 Fd = vec3(0.0);
    vec3 Fr = vec3(0.0);
    vec3 finalRGB = vec3(0.0);

    // will get removed by the omtl compiler if not used
    vec3 coatColor;
    vec3 transmission;
    vec3 sheenColor = vec3(0.0);

    DoIndirectLight(S, Fd, Fr
#ifdef Coat
    , coatColor
#endif
#ifdef Refraction
    , transmission
#endif
    );

// 3 directional lights
#if defined(AE_DIRECTIONAL_1) || defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
    if(u_DirLightsEnabled[0] != 0.0) {
        LightParams DL0;
        BuildDirLightParams(S, 0, DL0);
#ifdef AE_RECEIVE_SHADOW
        vec4 shadowFactor = Shadowing(S, DL0);
        DL0.attenuate = mix(DL0.attenuate, shadowFactor.rgb, shadowFactor.a);
#endif
        DoHeavyLight(S, DL0, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
#ifdef Fabric
        , sheenColor
#endif
        );
    }
#if defined(AE_DIRECTIONAL_2) || defined(AE_DIRECTIONAL_3)
#if defined(HIGH) || defined(ULTRA)
    if(u_DirLightsEnabled[1] != 0.0) {
        LightParams DL1;
        BuildDirLightParams(S, 1, DL1);
        DoLight(S, DL1, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
        );
    }
#if defined(AE_DIRECTIONAL_3)
    if(u_DirLightsEnabled[2] != 0.0) {
        LightParams DL2;
        BuildDirLightParams(S, 2, DL2);
        DoLight(S, DL2, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
        );
    }
#endif
#endif
#endif
#endif

// 2 point lights
#if defined(AE_POINT_1) || defined(AE_POINT_2)
    if(u_PointLightsEnabled[0] != 0.0) {
        LightParams PL0;
        BuildPointLightParams(S, 0, PL0);
        DoHeavyLight(S, PL0, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
#ifdef Fabric
        , sheenColor
#endif
        );
    }
#if defined(AE_POINT_2)
#if defined(HIGH) || defined(ULTRA)
    if(u_PointLightsEnabled[1] != 0.0) {
        LightParams PL1;
        BuildPointLightParams(S, 1, PL1);
        DoLight(S, PL1, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
        );
    }
#endif
#endif
#endif

// 2 spot lights
#if defined(AE_SPOT_1) || defined(AE_SPOT_2)
    if(u_SpotLightsEnabled[0] != 0.0) {
        LightParams SL0;
        BuildSpotLightParams(S, 0, SL0);
        DoHeavyLight(S, SL0, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
#ifdef Fabric
        , sheenColor
#endif
        );
    }
#if defined(AE_SPOT_2)
#if defined(HIGH) || defined(ULTRA)
    if(u_SpotLightsEnabled[1] != 0.0) {
        LightParams SL1;
        BuildSpotLightParams(S, 1, SL1);
        DoLight(S, SL1, Fd, Fr
#ifdef Coat
        , coatColor
#endif
#ifdef Refraction
        , transmission
#endif
        );
    }
#endif
#endif
#endif

#ifdef Lightmap
    SampleLightMap(Fd, Fr, v_uv1);
#endif

#ifdef Emissive
    Fd += EmissiveTerm(S);
#endif

#ifdef RimHighlight
    Fd += FakeFresnel(S);
#endif

#ifdef Refraction
    Fd = mix(Fd, transmission, S.transmittance);
#endif

#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
    finalRGB = Fd * (1.0 - S.flakeFactor) + Fr;
#else
    #ifdef DisableSpecular 
        finalRGB = Fd;
    #else
        finalRGB = Fd + Fr;
    #endif
#endif

#ifdef Fabric
    //_fabriclut is set to wrap and having it go to 1.0 will actually wrap due to linear interpolation
    float sheenBRDF = texture(_FabricLut, clamp(vec2(S.ndv, FABRIC_ROUGHNESS), vec2(0.001), vec2(.99))).b;
    sheenColor += Sheen_IBL(S, sheenBRDF);
    float sheenAlbedoScaling = 1.0 - maxComp3(FABRIC_COLOR) * sheenBRDF;
    finalRGB.rgb = finalRGB.rgb * sheenAlbedoScaling + sheenColor;
#endif

#ifdef Coat
    vec3 coatFresnel = FresnelSpecularCoat(S.coatF0, saturate(dot(S.cnDir, S.vDir)));
    vec3 coatAtten = vec3(1.0) - S.coatFactor * coatFresnel;
    finalRGB = finalRGB * coatAtten + coatColor * S.coatFactor;
#endif

    return finalRGB;
}
#endif

#endif
/** USED BY: **
    Uber
    PBR
**/
/** CONTAINS: **
    General Invoke of Surface Rendering
**/

#ifndef BUILDSURFACEPARAM_HPP
#define BUILDSURFACEPARAM_HPP

void BuildSurfaceParams(out SurfaceParams S, out float opacity) {
    vec3 vnDirWS = normalize(v_nDirWS);
    vec3 vDir = normalize(u_WorldSpaceCameraPos.rgb - v_posWS);
    vec3 vtDirWS = normalize(v_tDirWS);
    vec3 vbDirWS = normalize(v_bDirWS);
#ifdef FlipNormals
    if(dot(vDir, vnDirWS) < -0.05) {
        vnDirWS = -vnDirWS;
        vtDirWS = -vtDirWS;
        vbDirWS = -vbDirWS;
    }
#endif
    vec2 uv0 = v_uv0;
#if defined(NormalTexture) || defined(_EnableCoatNormal) || (defined(Heightmap) && defined(_HeightmapCorrectDepth)) || defined(Anisotropic)
    mat3 TBN = mat3(vtDirWS, vbDirWS, vnDirWS);
#endif

#ifdef Heightmap
    float ParallaxDepth = 0.0;
    vec3 TangentViewDir = normalize(vec3(v_viewDirTS.x, v_viewDirTS.y, v_viewDirTS.z));
    uv0 = ParallaxMapping(uv0, TangentViewDir, ParallaxDepth);
#ifndef UVControl
    //clamp it if UVControl isn't specified
    uv0 = clamp(uv0, vec2(0.0), vec2(0.999));
#endif
#if defined(_HeightmapCorrectDepth)
    float zndc = AdjustViewDir(TangentViewDir, ParallaxDepth);
#endif
#endif

    S.uv0 = uv0;
    vec3 albedo = GammaToLinear(_AlbedoColor.rgb);
    opacity = _AlbedoColor.a;

#ifdef _EnableAlbedoTexture
#ifdef AlbedoTextureUV1
    #ifdef ILLUM_PBR
    vec4 t_AlbedoTex = texture(_AlbedoTexture, v_uv1);
    #else
    vec4 t_AlbedoTex = texture(_AlbedoTexture, getAlbedoUV(v_uv1));
    #endif
#else
    #ifdef ILLUM_PBR
    vec4 t_AlbedoTex = texture(_AlbedoTexture, uv0);
    #else
    vec4 t_AlbedoTex = texture(_AlbedoTexture, getAlbedoUV(uv0));
    #endif
#endif
    albedo *= GammaToLinear(t_AlbedoTex.rgb);
    opacity *= t_AlbedoTex.a;
#endif

#ifdef OpacityTexture
    vec4 t_OpacityTex = texture(_OpacityTexture, uv0);
    opacity *= t_OpacityTex.r;
#endif

#if defined(VertexColorTinting) && !(defined(Dissolve) && defined(_DissolveVertexColor))
    albedo *= v_vertCol.rgb;
    opacity *= v_vertCol.a;
#endif

#ifdef DetailAlbedo
    SampleDetailAlbedo(albedo, opacity, v_uv0_src, _DetailAlbedoScale);
#endif

#ifdef _EnableMRAOTexture
#ifdef MraoTextureUV1
    #ifdef ILLUM_PBR
    vec4 t_MaskTex = texture(_MRAOTexture, v_uv1);
    #else
    vec4 t_MaskTex = texture(_MRAOTexture, getMRAOUV(v_uv1));
    #endif
#else
    #ifdef ILLUM_PBR
    vec4 t_MaskTex = texture(_MRAOTexture, uv0);
    #else
    vec4 t_MaskTex = texture(_MRAOTexture, getMRAOUV(uv0));
    #endif
#endif

#ifdef AoTextureUV1
    t_MaskTex.b = texture(_MRAOTexture, getAOUV(v_uv1)).b;
#endif

    float metallic = ParamMapingScale(t_MaskTex.r, _MRAOMetallic);
    float roughness = ParamMapingScale(t_MaskTex.g, _MRAORoughness);
    float ao = ParamMapingScaleDark(t_MaskTex.b, _AO);
    float cavity = t_MaskTex.a;
#else
    float metallic = _MRAOMetallic;
    float roughness = _MRAORoughness;
    float ao = 1.0;
    float cavity = 1.0;
#endif

    vec3 normal = vnDirWS;
    S.vDir = vDir;

#ifdef Coat
#if (defined(HIGH) || defined(ULTRA)) && defined(_EnableCoatNormal)
    vec3 cnormalTS = texture(_CoatNormalTexture, uv0).xyz;
    vec3 coatNormal = DecodeNormal(cnormalTS, 1.0);
    coatNormal = TBN * coatNormal;
    coatNormal = normalize(coatNormal);
    S.cnDir = coatNormal;
    S.crDir = normalize(reflect(-S.vDir, S.cnDir));
#else
    S.cnDir = normal;
    S.crDir = normalize(reflect(-S.vDir, S.cnDir));
#endif
#endif

#if (defined(HIGH) || defined(ULTRA)) && defined(_EnableBentNormal) && defined(NormalTexture)
#ifdef NormalTextureUV1
    vec3 bentNormalTS = texture(_BentNormalTexture, v_uv1).xyz;
#else
    vec3 bentNormalTS = texture(_BentNormalTexture, uv0).xyz;
#endif
    vec3 bentNormal = DecodeNormal(bentNormalTS, u_BentNormInt);
    bentNormal = TBN * bentNormal;
    bentNormal = normalize(bentNormal);
    S.bnDir = bentNormal;
#endif

    //normal
    float avgTextureNormalLength = 1.0;
#ifdef NormalTexture
    float normalLengthSum = 0.0;
    float normalLengthCount = 0.0;

#ifdef NormalTextureUV1
    #ifdef ILLUM_PBR
    vec3 normalTS = texture(_NormalTexture, v_uv1).xyz;
    #else
    vec3 normalTS = texture(_NormalTexture, getNormalUV(v_uv1)).xyz;
    #endif
#else
    #ifdef ILLUM_PBR
    vec3 normalTS = texture(_NormalTexture, uv0).xyz;
    #else
    vec3 normalTS = texture(_NormalTexture, getNormalUV(uv0)).xyz;
    #endif
#endif

#ifdef ULTRA
    normalLengthSum += GetNormalLength(normalTS);
    normalLengthCount++;
#endif
    normal = DecodeNormal(normalTS, _NormalStrength);

//blend with detail normal
#if defined(_EnableDetailNormal) && defined(NormalTexture)
#ifdef DetailNormalUV2
    vec2 detailNormalUV = v_uv1;
#else
    vec2 detailNormalUV = uv0;
#endif
    vec2 detailNormalUVTiling = detailNormalUV * _DetailNormalTiling;
    vec3 flakeNormalTS = vec3(0.0, 0.0, 1.0);
#ifdef _EnableFlake
    S.flakeFactor = 0.0;
    S.flakeColor = vec3(1.0);
    //negative is depth
    vec2 parallaxOffset = -u_FlakeDepth * v_viewDirTS.xy / v_viewDirTS.z;
    DoFlake(3.0, 3.0, 0.321543, detailNormalUVTiling, parallaxOffset, S.flakeColor, flakeNormalTS, S.flakeFactor);
    DoFlake(3.0, 2.0, 0.756345, detailNormalUVTiling, parallaxOffset, S.flakeColor, flakeNormalTS, S.flakeFactor);
    DoFlake(3.0, 1.0, -0.83242, detailNormalUVTiling, parallaxOffset, S.flakeColor, flakeNormalTS, S.flakeFactor);

    flakeNormalTS = BlendNormal(normal, flakeNormalTS);
    S.fnDir = normalize(TBN * flakeNormalTS);
    S.flakeColor *= _FlakeStrength;
    S.frDir = normalize(reflect(-S.vDir, S.fnDir));
#else
    //keep it simple
    vec3 detailNormalTS = texture(_DetailNormalTexture, detailNormalUVTiling).xyz;
#ifdef ULTRA
    normalLengthSum += GetNormalLength(detailNormalTS);
    normalLengthCount++;
#endif
    detailNormalTS = DecodeNormal(detailNormalTS, u_DetailNormalInt);
    normal = BlendNormal(normal, detailNormalTS);
#endif
#endif

    normal = TBN * normal;

#ifdef ULTRA
    avgTextureNormalLength = normalLengthSum / normalLengthCount;
#endif
#endif

#if defined(AMAZING_USE_BLENDMODE_ALPHATEST) || (defined(_EnableAlbedoTexture) && defined(_EnableAlphaTest))
    if(opacity < _AlbedoCutoff)
        discard;
#endif
    metallic = saturate(metallic);
    S.nDir = normal;
#ifdef Anisotropic
    vec3 anisoTex = texture(_AnisotropyTexture, uv0).rgb;
    //go from -PI/2 - PI/2
    vec2 aniRotVals = vec2(cos(_AnisotropyRotation * 1.6), sin(_AnisotropyRotation * 1.6));
    //remap and rotate
    vec3 anisoDir = normalize(vec3(mat2(aniRotVals.x, aniRotVals.y, -aniRotVals.y, aniRotVals.x) * (anisoTex.xy * 2.0 - vec2(1.0)), 0.0));
    S.anisoIntensity = clamp(_AnisotropyIntensity * anisoTex.z, 0.0, 1.0);
    S.anisoT = TBN * anisoDir;
    S.anisoB = cross(vnDirWS, S.anisoT);
#endif
    float perceptualRoughness = clamp(roughness, MIN_ROUGH, 1.0);
#ifdef ULTRA
//perceptualRoughness             = SpecularAA(perceptualRoughness, vnDirWS, avgTextureNormalLength);
#endif
    S.roughParams.x = perceptualRoughness;
    S.roughParams.y = Pow2(S.roughParams.x);
    S.roughParams.z = Pow2(S.roughParams.y);
#if defined(NormalTexture) && defined(_EnableDetailNormal) && defined(_EnableFlake)
    S.flakeRoughParams = clamp(u_FlakeRoughness, MIN_ROUGH, S.roughParams.x);
#endif
    S.diffCol = albedo * (1.0 - metallic);
#ifdef Scatter
    vec4 scatterTex = texture(_ScatterTexture, uv0);
    S.scatter = _ScatterIntensity * scatterTex.r;
    float thick = ParamMapingScale(scatterTex.g, _ScatterThickness);
    S.thick = saturate(thick);
//S.diffBlurCol                   = GammaToLinear(texture(u_AlbedoBlurTex, uv0).rgb);
#endif
    //world dir
    S.pos = v_posWS;
    S.vnDir = vnDirWS;
    S.ndv = max(0.0, dot(S.nDir, S.vDir));
    S.rDir = reflect(-S.vDir, S.nDir);
#ifdef ILLUM_PBR
    float ior = u_IOR;
    #ifdef ThinFilm
        ior = _ThinFilmIOR;
    #endif
    float dielectricF0 = IorToSpecularLevel(1.0, ior);
#else
    float dielectricF0 = IorToSpecularLevel(1.0, _IOR);
#endif
#if defined(Fabric) && defined(_EnableFabricTexture)
    vec4 sheenTex = texture(_FabricTexture, getFabricUV(S.uv0));
    S.sheenColor = GammaToLinear(_FabricColor.rgb) * GammaToLinear(sheenTex.rgb);
    S.sheenRoughness = _FabricRoughness * sheenTex.a;
    S.sheenRoughnessSqrd = _FabricRoughness * sheenTex.a;
    S.sheenRoughnessSqrd *= S.sheenRoughnessSqrd;
#endif
#ifdef Coat
    vec4 coatTex = texture(_CoatTexture, getCoatUV(uv0));
    S.coatFactor = coatTex.r * _CoatIntensity;
    S.coatRoughParams = coatTex.g * _CoatRoughness;
    S.coatF0 = IorToSpecularLevel(1.0, CLEAR_COAT_IOR);
#endif
    vec3 specularAlbedo = albedo;
#ifdef Pearl
    specularAlbedo *= Facing(GammaToLinear(_PearlEdgeColor.rgb), GammaToLinear(_PearlFrontColor.rgb), S.ndv, _PearlFallOff);
#endif
    S.specCol = mix(vec3(dielectricF0), specularAlbedo, metallic);
#ifdef _EnableMRAOTexture
    S.occParams.x = saturate(ao);
    S.occParams.y = SpecularAO(S);
    S.specCol *= cavity; //cavity only affect specular, in this way to affect all specular
#else
    S.occParams = vec2(1.0);
#endif

// Uber Only
#ifdef SpecularWorkflow
    vec4 specTex = vec4(1.0);
// S.specularWeight = _SpecularFactor; no need. use SPECULAR_WEIGHT macro
#ifdef EnableSpecularTexture
    specTex = texture(_SpecularWorkflowTexture, uv0);
    S.specularWeight = specTex.a * _SpecularFactor;
#endif

    vec3 dielectricSpecularF0 = min(S.specCol * GammaToLinear(specTex.rgb) * GammaToLinear(_SpecularColor.rgb), vec3(1.0));
    S.specCol = mix(dielectricSpecularF0, albedo, metallic);
#endif

#ifdef Refraction
#ifdef EnableRefractionTexture
    vec4 transTex = texture(_RefractionTexture, getRefractionUV(uv0));
#else
    vec4 transTex = vec4(1.0);
#endif
    S.transmittance = transTex.r * _RefractionTransmittance;

#ifdef EnableVolume
    float thickness = transTex.g * _VolumeThickness;
    vec3 scale = vec3(length(u_Model[0].xyz), length(u_Model[1].xyz), length(u_Model[2].xyz));
#ifdef EH_TRANSMISSION_ENABLED
    vec3 refractionVector = normalize(refract(-S.vDir, S.nDir, 1.0 / _IOR));
#else
    vec3 scaledPos = v_posWS - (thickness * scale * S.nDir);
    vec3 ivector = normalize(scaledPos - u_WorldSpaceCameraPos.rgb);
    vec3 refractionVector = normalize(refract(ivector, S.nDir, 1.0 / _IOR));
#endif
    S.transmissionRay = refractionVector * thickness * scale;
    S.transmissionRayLength = length(S.transmissionRay);
#else
    //thickness is 0 so the ray gets zerod out
    S.transmissionRayLength = 0.0;
    S.transmissionRay = vec3(0.0);
#endif

#endif

#if !defined(ILLUM_PBR) && defined(ThinFilm)
    S.thinFilmFresnel = S.specCol;
    S.thinFilmF0 = S.specCol;
//step is used if thickness is 0 then intensity must be 0
#ifdef _EnableThinFilmTexture
    vec2 thinFilmTex = texture(_ThinFilmTexture, uv0).xy;
    float thinFilmThickness = mix(_ThinFilmThicknessMin, _ThinFilmThicknessMax, thinFilmTex.g);
    S.thinFilmIntensity = thinFilmTex.r * _ThinFilmIntensity * (1.0 - step(thinFilmThickness, 0.0));
#else
    float thinFilmThickness = _ThinFilmThicknessMax;
    S.thinFilmIntensity = _ThinFilmIntensity * (1.0 - step(thinFilmThickness, 0.0));
#endif

    if(S.thinFilmIntensity > 0.0) {
        S.thinFilmFresnel = calcThinFilmFresnel(S.ndv, thinFilmThickness, S.specCol);
        S.thinFilmF0 = Schlick_to_F0(S.thinFilmFresnel, S.ndv);
    }
#endif
}

#endif


vec4 MainEntry() {
    // ------ RenderData ------
    SurfaceParams S;
    float opacity = 1.0;
    BuildSurfaceParams(S, opacity);

    // ------ Lighting ------
    vec3 finalRGB = Lighting(S);

    // ------ PostProcess ------
    finalRGB = LinearToGamma(finalRGB);

    vec4 result = vec4(finalRGB, opacity);

    return result;
}
#pragma end

// Entry function in vertex shader, must match "void vertex()"
void vertex() {

        mat4 localToWorld = Model;
        mat4 worldToLocal = WorldToLocal;
        mat4 viewMatrix = View;
        mat4 projectionMatrix = Projection;
        vec3 cameraPos = u_WorldSpaceCameraPos.xyz;
        vec2 tex_cord = vec2(float(uint(gl_VertexID) & 1u),float((uint(gl_VertexID) & 2u)>>1));
        vec2 vOffsets = (tex_cord - 0.5) * 2.0;
        
        uint particleOffset = uint(gl_InstanceID);

#ifdef VFX_COMPAT_MODE
				float age;
				vec3 size;
				vec4 rotation;
				vec3 position;
				vec3 velocity;
				vec3 normal;
				vec3 pointA;
				vec3 pointB;
				float velN;
				float particleRadius;
				bool hasCollision;
				float lifetime;
				float friction;
				vec3 gravity;
				uint particleIdx;
				uint originalParticleIdx;
				uint seed;
				uint alive;
				uint inWorldSpace;
				uint meshID;
				vec3 angle;
				vec3 scale_vfx;
				float texIndex;
				vec3 color;
				vec3 pivot;
				float alpha;
				vec4 customAttribute;
				vec3 targetPosition;
				float mass;
				vec3 direction;
				{
					uint _bufferOffset = particleOffset * 44u;
					int index_t = int(_bufferOffset / 4u);
					vec4 data[11];
					for(int i = 0; i < 11; i++) {
						data[i] = ReadFromBufferCompat(attributeBuffer, uint(index_t + i));
					}
					age = data[0].x;
					size = data[0].yzw;
					rotation = data[1];
					position = data[2].xyz;
					velocity.x = data[2].w;
					velocity.yz = data[3].xy;
					normal.xy = data[3].zw;
					normal.z = data[4].x;
					pointA = data[4].yzw;
					pointB = data[5].xyz;
					velN = data[5].w;
					particleRadius = data[6].x;
					{
						uint data1 = 0u;
						uint data2 = 0u;
						unpackVec4To2x32Uint(data[4], data1, data2);
						particleRadius = float(data1);
						hasCollision = bool(data2);
					}
					lifetime = data[6].z;
					friction = data[6].w;
					gravity = data[7].xyz;
					{
						uint data1 = 0u;
						uint data2 = 0u;
						unpackVec4To2x32Uint(data[8], data1, data2);
						particleIdx = uint(data1);
						originalParticleIdx = uint(data2);
					}
					{
						uint data1 = 0u;
						uint data2 = 0u;
						unpackVec4To2x32Uint(data[9], data1, data2);
						seed = uint(data1);
						alive = uint(data2);
					}
					{
						uint data1 = 0u;
						uint data2 = 0u;
						unpackVec4To2x32Uint(data[10], data1, data2);
						inWorldSpace = uint(data1);
						meshID = uint(data2);
					}
					angle = vec3(0.0, 0.0, 0.0);
					scale_vfx = vec3(1.0, 1.0, 1.0);
					texIndex = 0.0;
					color = vec3(1.0, 1.0, 1.0);
					pivot = vec3(0.0, 0.0, 0.0);
					alpha = 1.0;
					customAttribute = vec4(0.0, 0.0, 0.0, 0.0);
					targetPosition = vec3(0.0, 0.0, 0.0);
					mass = 1.0;
					direction = vec3(1.0, 0.0, 0.0);
				}

#else
				uint particleIdx;
				uint alive;
				vec3 position;
				vec3 angle;
				vec3 size;
				vec3 scale_vfx;
				float texIndex;
				vec3 color;
				vec3 pivot;
				uint inWorldSpace;
				float alpha;
				float lifetime;
				vec3 velocity;
				float age;
				vec4 customAttribute;
				vec3 targetPosition;
				float mass;
				vec3 direction;
				uint meshID;
				vec4 rotation;
				{
					uint _bufferOffset = particleOffset * 44u;
					particleIdx = ReadUintFromBuffer(attributeBuffer_buf, _bufferOffset + 32u);
					alive = ReadUintFromBuffer(attributeBuffer_buf, _bufferOffset + 35u);
					position = vec3(
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 8u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 9u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 10u)
					);
					angle = vec3(0.0, 0.0, 0.0);
					size = vec3(
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 1u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 2u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 3u)
					);
					scale_vfx = vec3(1.0, 1.0, 1.0);
					texIndex = 0.0;
					color = vec3(1.0, 1.0, 1.0);
					pivot = vec3(0.0, 0.0, 0.0);
					inWorldSpace = ReadUintFromBuffer(attributeBuffer_buf, _bufferOffset + 36u);
					alpha = 1.0;
					lifetime = ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 26u);
					velocity = vec3(
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 11u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 12u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 13u)
					);
					age = ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 0u);
					customAttribute = vec4(0.0, 0.0, 0.0, 0.0);
					targetPosition = vec3(0.0, 0.0, 0.0);
					mass = 1.0;
					direction = vec3(1.0, 0.0, 0.0);
					meshID = ReadUintFromBuffer(attributeBuffer_buf, _bufferOffset + 37u);
					rotation = vec4(
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 4u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 5u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 6u),
						ReadFloatFromBuffer(attributeBuffer_buf, _bufferOffset + 7u)
					);
				}

#endif        
        if(inWorldSpace == 0u){
          cameraPos = (ModelInv * vec4(cameraPos, 1.0)).xyz;
        }
        vec3 axisX = vec3(1.0, 0.0, 0.0);
        vec3 axisY = vec3(0.0, 1.0, 0.0);
        vec3 axisZ = vec3(0.0, 0.0, 1.0);

        vec2 flipbookSize = vec2(1.0, 1.0);
        // Use quaternion for particle mesh rotations
        vec4 quaternion0 = vec4(0.0, 0.0, 0.0, 1.0);

        uint collisionFlag = 0u;
                {

    SetMeshPhysics(position, int(MeshID_1), delta);
}

        {

    SetScale(scale_vfx, Scale);
}

if(alive != uint(0) && meshID == uint(0))
      
        {
            vfx_data_0.xyz = color;
            vfx_data_0.w = alpha;
            vfx_data_1 = customAttribute;
            vfx_data_2 = vec4(age/lifetime, mass, texIndex, particleIdx);
            vfx_data_3 = vec4(velocity, 1.0);
            vfx_data_4 = vec4(direction, 1.0);
        precision highp float;
    v_uv0 = vec2(attTexcoord0.x, attTexcoord0.y);
    v_uv1 = vec2(attTexcoord1.x, attTexcoord1.y);
    precision mediump float;
#if defined(_DissolveVertexColor) || defined(VertexColorTinting)
    v_vertCol = attColor;
#endif
#ifdef UVControl
    v_uv0 = UV_TRS(v_uv0.xy, vec2(0.5, 0.5), _Offset, _Tiling, _UVRotation * 3.14159 * 2.0);
#endif
    vec3 attBinormal = normalize(cross(attNormal, attTangent.xyz)) * attTangent.w; //attTangent.w require maya, blender will not work!
#ifdef AE_AMAZING_USE_BONES
    gl_Position = BoneTransform(attBinormal, v_posWS, v_nDirWS, v_tDirWS, v_bDirWS);
#else
    gl_Position = GeneralTransform(attBinormal, v_posWS, v_nDirWS, v_tDirWS, v_bDirWS);
#endif
    v_gl_pos = gl_Position;


            float t = age / lifetime;
            vec2 invFlipbookSize = 1.0 / flipbookSize;
            texIndex = mod(texIndex, flipbookSize.x * flipbookSize.y);
            size *= scale_vfx;
            if(inWorldSpace == 0u){
              position = (Model * vec4(position, 1.0)).xyz;
            }
            vec3 localPosition = (ModelInv * vec4(v_posWS, 1.0)).xyz;
            mat4 transMat = GetElementToVFXMatrix(
                      axisX,
                      axisY,
                      axisZ,
                      rotation,
                      pivot,
                      size,
                      position);
            vec3 modelPosition = (transMat * vec4(localPosition, 1.0)).xyz;
            vec4 posV = Projection * View * vec4(modelPosition, 1.0);
            v_posWS     = modelPosition;
            
    mat3 invTransMat = transpose(mat3(inverse(transMat)));
    v_nDirWS    = normalize(invTransMat * VFX_worldToObjectNormal(v_nDirWS).xyz);
    #if defined(NormalMap) || defined(NormalTexture)
      v_tDirWS    = invTransMat * (ModelInv * vec4(v_tDirWS, 0.0)).xyz;
      v_bDirWS    = (cross(v_nDirWS, v_tDirWS)).xyz;
    #endif
    
            gl_Position = posV;
        }else
        {
            vfx_data_0 = vec4(0.0);
            vfx_data_1 = vec4(0.0);
            vfx_data_2 = vec4(0.0);
            vfx_data_3 = vec4(0.0);
            vfx_data_4 = vec4(0.0);
            gl_Position = vec4(0.0, 0.0,0.0,1.0);
        }
    }

// Entry function in fragment shader, must match "void fragment()"
void fragment() {
    precision mediump float;
    vec4 final_color = MainEntry();
    o_fragColor = ApplyBlendMode(final_color);

//fix bug of mshader macro
#ifdef LOW
#endif
#ifdef HIGH
#endif
}
