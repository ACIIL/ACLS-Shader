﻿//// ACiiL
//// Citations in readme and in source.
//// https://github.com/ACIIL/ACLS-Shader
#ifndef ACLS_CORE
#define ACLS_CORE
            ////
            #include "./ACLS_HELPERS.cginc"
            ////
            Texture2D _ClippingMask;    uniform float4 _ClippingMask_ST;

            Texture2D _NormalMap;       uniform float4 _NormalMap_ST;
            
            Texture2D _MainTex;         uniform float4 _MainTex_ST;
            Texture2D _1st_ShadeMap;    uniform float4 _1st_ShadeMap_ST;
            Texture2D _2nd_ShadeMap;    uniform float4 _2nd_ShadeMap_ST;

            Texture2D _Set_1st_ShadePosition;   uniform float4 _Set_1st_ShadePosition_ST;
            Texture2D _Set_2nd_ShadePosition;   uniform float4 _Set_2nd_ShadePosition_ST;
            Texture2D _LightMap; uniform float4 _LightMap_ST;

            Texture2D _HighColor_Tex;       uniform float4 _HighColor_Tex_ST;
            Texture2D _Set_HighColorMask;   uniform float4 _Set_HighColorMask_ST;
            
            Texture2D _Set_RimLightMask;    uniform float4 _Set_RimLightMask_ST;
            
            Texture2D _MatCapTexAdd;        uniform float4 _MatCapTexAdd_ST;
            Texture2D _MatCapTexMult;       uniform float4 _MatCapTexMult_ST;
            Texture2D _MatCapTexEmis;       uniform float4 _MatCapTexEmis_ST;
            Texture2D _NormalMapForMatCap;  uniform float4 _NormalMapForMatCap_ST;
            Texture2D _Set_MatcapMask;      uniform float4 _Set_MatcapMask_ST;

            Texture2D _Emissive_Tex;        uniform float4 _Emissive_Tex_ST;
            Texture2D _EmissionColorTex;    uniform float4 _EmissionColorTex_ST;
            
            TextureCube _CubemapFallback; uniform float4 _CubemapFallback_HDR;

            Texture2D _DetailMap;   uniform float4 _DetailMap_ST;
            Texture2D _DetailMask;  uniform float4 _DetailMask_ST;

            Texture2D _NormalMapDetail; uniform float4 _NormalMapDetail_ST;
            Texture2D _DetailNormalMask; uniform float4 _DetailNormalMask_ST;

            Texture2D _DynamicShadowMask; uniform float4 _DynamicShadowMask_ST; uniform float4 _DynamicShadowMask_TexelSize;

            sampler3D _DitherMaskLOD;

            //// sample sets: normals, albedo(shades/masks), AOs, matcap, emissionTex
            SamplerState sampler_MainTex;
            SamplerState sampler_Set_1st_ShadePosition;
            SamplerState sampler_NormalMap;
            SamplerState sampler_MatCap_Trilinear_clamp;
            SamplerState sampler_EmissionColorTex;
            SamplerState sampler_DetailMap;

            ////
            uniform half _Clipping_Level;
            uniform half _Tweak_transparency;
            uniform int _Inverse_Clipping;
            uniform int _IsBaseMapAlphaAsClippingMask;
            
            uniform float4 _Color;
            uniform float4 _0_ShadeColor;
            uniform float4 _1st_ShadeColor;
            uniform float4 _2nd_ShadeColor;

            uniform float4 _HighColor;

            uniform float4 _RimLightColor;
            uniform float4 _Ap_RimLightColor;

            uniform float4 _MatCapColAdd;
            uniform float4 _MatCapColMult;
            uniform float4 _MatCapColEmis;

            uniform float4 _Emissive_Color;
            uniform float4 _EmissiveProportional_Color;

            uniform int _Is_NormalMapToBase;
            uniform int _Is_NormalMapToHighColor;
            uniform int _Is_NormalMapToRimLight;
            uniform int _Is_NormaMapToEnv;
            uniform int _Is_NormaMapEnv;

            uniform int _Use_BaseAs1st;
            uniform int _Use_1stAs2nd;
            uniform half _BaseColor_Step;
            uniform half _ShadeColor_Step;
            uniform half _BaseShade_Feather;
            uniform half _1st2nd_Shades_Feather;

            uniform half _shadowCastMin_black;
            uniform half _shadeShadowOffset1;
            uniform half _shadeShadowOffset2;
            uniform half _Is_UseTweakHighColorOnShadow;
            uniform half _Tweak_SystemShadowsLevel;
            uniform int _shadowUseCustomRampNDL;
            uniform half _shadowNDLStep;
            uniform half _shadowNDLFeather;
            uniform half _shadowMaskPinch;
            uniform int _shadowSplits;

            uniform half _highColTexSource;
            uniform half _Tweak_HighColorMaskLevel;
            uniform half _HighColor_Power;
            uniform int _Is_BlendAddToHiColor;
            uniform int _Is_SpecularToHighColor;
            uniform half _TweakHighColorOnShadow;

            uniform half _Tweak_RimLightMaskLevel;
            uniform int _RimLight;
            uniform int _Add_Antipodean_RimLight;
            uniform int _RimLightSource;
            uniform half _RimLightMixMode;
            uniform int _LightDirection_MaskOn;
            uniform half _RimLightAreaOffset;
            uniform half _RimLight_Power;
            uniform half _Ap_RimLight_Power;
            uniform half _RimLight_InsideMask;
            uniform half _Tweak_LightDirection_MaskLevel;

            uniform int _useCubeMap;
            uniform int _ENVMmode;
            uniform half _ENVMix;
            uniform half _envRoughness;
            uniform half _envOnRim;

            uniform half _Is_NormalMapForMatCap;
            uniform int _MatCap;
            uniform half _Is_BlendAddToMatCap;
            uniform half _Tweak_MatCapUV;
            uniform half _Rotate_MatCapUV;
            uniform half _Rotate_NormalMapForMatCapUV;
            uniform half _Is_UseTweakMatCapOnShadow;
            uniform half _TweakMatCapOnShadow;
            uniform half _Tweak_MatcapMaskLevel;
            uniform int _matcapRoughnessSource0;
            uniform int _matcapRoughnessSource1;
            uniform int _matcapRoughnessSource2;
            uniform half _BlurLevelMatcap0;
            uniform half _BlurLevelMatcap1;
            uniform half _BlurLevelMatcap2;
            uniform int _CameraRolling_Stabilizer;

            uniform float _Metallic;
            uniform float _Glossiness;
            uniform float _Anisotropic;
            uniform float _testMix;
            uniform int _Diff_GSF_01;
            uniform float _DiffGSF_Offset;
            uniform float _DiffGSF_Feather;
            uniform float4 _lightMap_remapArr;
            uniform int _UseLightMap;
            uniform float4 _toonLambAry_01;
            uniform float4 _toonLambAry_02;
            uniform int _UseSpecAlpha;
            uniform float _envOnRimColorize;
            uniform float _DetailNormalMapScale01;
            uniform int _CubemapFallbackMode;
            uniform float _EnvGrazeMix;
            uniform int _EnvGrazeRimMix;
            uniform int _ToonRampLightSourceType_Backwards;
            uniform half _diffuseIndirectDirectSimMix;
            uniform int _UseSpecularSystem;
            uniform float3 _backFaceColorTint;
            uniform float4 _SpecularMaskHSV;
            uniform int _forceLightClamp;
            uniform float _rimAlbedoMix;
            uniform float _directLightIntensity;
            uniform half _McDiffAlbedoMix;
            uniform half _indirectAlbedoMaxAveScale;
            uniform half _indirectGIDirectionalMix;
            uniform half _indirectGIBlur;
            uniform half _emissiveUseMainTexA;
            uniform half _emissiveUseMainTexCol;
            uniform half _rimLightLightsourceType;

            uniform int _useCrossOverRim;
            uniform half _crossOverPinch;
            uniform half _crossOverStep;
            uniform half _crossOverFeather;
            uniform half _crosspOverRimPow;

            uniform int _useRimLightOverTone;
            uniform half _rimLightOverToneLow;
            uniform half _rimLightOverToneHigh;
            uniform half4 _rimLightOverToneBlendColor1;
            uniform half4 _rimLightOverToneBlendColor2;

            uniform half _DetailAlbedo;
            uniform half _DetailSmoothness;

            uniform int _uvSet_ShadePosition;
            uniform int _uvSet_LightMap;
            uniform int _uvSet_NormalMapDetail;
            uniform int _uvSet_NormalMapForMatCap;
            uniform int _uvSet_DetailMap;
            uniform int _uvSet_EmissionColorTex;







            struct VertexInput {
                float4 vertex   : POSITION;
                float3 normal   : NORMAL;
                float4 tangent  : TANGENT;
                float2 uv0      : TEXCOORD0;
                float2 uv1      : TEXCOORD1;
                float4 color    : COLOR;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            //// test "_centroid" for MSAA workarounds
            struct VertexOutput {
                float4 pos      : SV_POSITION;
                float4 color    : COLOR0;
                float4 center   : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
                float3 wNormal  : TEXCOORD2;
                float4 tangent  : TEXCOORD3;
                float3 biTangent   : TEXCOORD4;
                float3 vertexLighting    : TEXCOORD5;
                float3 dirGI        : TEXCOORD6;
                float4 uv01         : TEXCOORD7;
                float4 screenPos    : TEXCOORD8;
                float3 vertTo0      : TEXCOORD9;
                UNITY_FOG_COORDS(10)
                UNITY_SHADOW_COORDS(11)
                // LIGHTING_COORDS(11,12)
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };






//// vert            
            VertexOutput vert (VertexInput v) 
            {
                UNITY_SETUP_INSTANCE_ID(v);
                VertexOutput o;
                // VertexOutput o  = (VertexOutput)0;
                UNITY_INITIALIZE_OUTPUT(VertexOutput, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                o.pos           = UnityObjectToClipPos(v.vertex);
                o.uv01          = float4(v.uv0.xy, v.uv1.xy);
                o.worldPos      = mul( unity_ObjectToWorld, v.vertex);
                o.center        = mul( unity_ObjectToWorld, float4(0,0,0,1));
                o.wNormal       = UnityObjectToWorldNormal( v.normal);
                o.tangent       = ( float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w));
                o.biTangent    = ( cross( o.wNormal, o.tangent.xyz ) * v.tangent.w);
                o.screenPos     = ComputeScreenPos(o.pos);
                o.color         = v.color;
                // TRANSFER_VERTEX_TO_FRAGMENT(o);
                UNITY_TRANSFER_SHADOW(o, 0);  // o.uv1 used for lightmap variants (dont exist)
                UNITY_TRANSFER_FOG(o, o.pos);

#ifdef VERTEXLIGHT_ON
                o.vertexLighting    = softShade4PointLights_Atten(
                    unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0
                    , unity_LightColor
                    , unity_4LightAtten0
                    , o.worldPos, o.wNormal, o.vertTo0);
#endif                    
#ifdef UNITY_PASS_FORWARDBASE
                o.dirGI       = GIDominantDir();
#endif
                return o;
            }





//// frag
            float4 frag(
                VertexOutput i
                , bool frontFace : SV_IsFrontFace ) : SV_TARGET 
            {
                UNITY_SETUP_INSTANCE_ID(i);
                bool isAmbientOnlyMap   = !(any(_LightColor0.rgb));
                bool isBackFace         = !frontFace;
                bool isMirror           = IsInMirror();
                i.wNormal               = normalize(i.wNormal);
                if(isBackFace) { //// flip normal for back faces.
                    i.wNormal = -i.wNormal;
                }
                float3 worldviewPos     = StereoWorldViewPos();
                float3 posDiff          = worldviewPos - i.worldPos.xyz;
                float viewDis           = length(posDiff);
                float3 dirView          = normalize(posDiff);
                //// screen pos
                float4 screenPos        = i.screenPos;
                float4 screenUV         = screenPos / (screenPos.w + 0.00001);
            #ifdef UNITY_SINGLE_PASS_STEREO
                screenUV.xy             *= float2(_ScreenParams.x * 2, _ScreenParams.y);
            #else
                screenUV.xy             *= _ScreenParams.xy;
            #endif
                //// helper vars
                half mip,testw,testw2,testh,lodMax;
                mip = testw = testw2 = testh = lodMax = 0;
                

//// normal map
                UV_DD uv_normalMap              = UVDD(TRANSFORM_TEX( UVPick01(i.uv01), _NormalMap));
                UV_DD uv_normalMapDetail        = UVDD(TRANSFORM_TEX( UVPick01(i.uv01, _uvSet_NormalMapDetail), _NormalMapDetail));
                UV_DD uv_normalMapDetailMask    = UVDD(TRANSFORM_TEX( UVPick01(i.uv01), _DetailNormalMask));
                float3 normalMap            = UnpackNormal( _NormalMap.SampleGrad( sampler_NormalMap, uv_normalMap.uv, uv_normalMap.dx, uv_normalMap.dy));
                if (_DetailNormalMapScale01)  //// slider > 0
                {
                    float4 normalDetailMask = _DetailNormalMask.SampleGrad( sampler_MainTex, uv_normalMapDetailMask.uv, uv_normalMapDetailMask.dx, uv_normalMapDetailMask.dy);
                    float3 normalMapDetail  = UnpackNormal( _NormalMapDetail.SampleGrad( sampler_NormalMap, uv_normalMapDetail.uv, uv_normalMapDetail.dx, uv_normalMapDetail.dy));
                    normalMap               = lerp( normalMap, BlendNormals(normalMap, normalMapDetail), (normalDetailMask.g * _DetailNormalMapScale01));
                }
				float3 dirTangent   = i.tangent.xyz;
				float3 dirBitangent = i.biTangent.xyz;
				float3x3 tangentTransform   = float3x3(dirTangent, dirBitangent, i.wNormal);
				float3 dirNormal            = normalize( mul( normalMap, tangentTransform ));
				dirTangent          = normalize(dirTangent);
				dirBitangent        = normalize(dirBitangent);
                // return float4(dirNormal*.5+.5,1);

//// albedo texure
                UV_DD uv_toon           = UVDD( TRANSFORM_TEX( UVPick01(i.uv01), _MainTex));
                float4 mainTex          = _MainTex.SampleGrad( sampler_MainTex, uv_toon.uv, uv_toon.dx, uv_toon.dy);

//// detail textures
                UV_DD uv_detalAlbedo    = UVDD( TRANSFORM_TEX( UVPick01(i.uv01, _uvSet_DetailMap), _DetailMap));
                half4 detailMap         = SetupDetail( _DetailMap.SampleGrad( sampler_DetailMap, uv_detalAlbedo.uv, uv_detalAlbedo.dx, uv_detalAlbedo.dy));///R albedo, B smoothness
                half4 detailMask         = _DetailMask.SampleGrad( sampler_MainTex, uv_toon.uv, uv_toon.dx, uv_toon.dy);

//// clip & alpha handling. Here so clip() may interrupt flow.
#ifndef NotAlpha
                float4 clipMask          = _ClippingMask.Sample(sampler_MainTex, TRANSFORM_TEX( UVPick01(i.uv01), _ClippingMask));
                float useMainTexAlpha   = (_IsBaseMapAlphaAsClippingMask) ? mainTex.a : clipMask.r;
                float alpha             = (_Inverse_Clipping) ? (1.0 - useMainTexAlpha) : useMainTexAlpha;

                float clipTest          = (alpha - _Clipping_Level);
                clip(clipTest);

    #ifndef IsClip
                alpha        = saturate(alpha + _Tweak_transparency);
        #ifdef UseAlphaDither
                // dither pattern with some a2c blending.
                //// citation to Silent and Xiexe for guidance and research documentation.
                //// assumes cutout blending + alpha to coverage. Subtracted alpha must return.
                float dither    = ScreenDitherToAlphaCutout_ac(screenUV.xy, (1 - alpha));
                alpha           = alpha - dither;
                clip(alpha);
        #endif //// UseAlphaDither
                alpha           = saturate(alpha);
    #else //// IsClip
                alpha           = 1;
    #endif //// IsClip
#else //// NotAlpha
                float alpha     = 1;
#endif //// NotAlpha


//// toon shade manual paint textures
                UNITY_BRANCH
                float4 shadeMapTex_1 = (_Use_BaseAs1st) ? (mainTex) : (_1st_ShadeMap.SampleGrad(sampler_MainTex, uv_toon.uv, uv_toon.dx, uv_toon.dy));
                float4 shadeMapTex_2 = 0;
                UNITY_BRANCH
                if (_Use_1stAs2nd > 1)
                {
                    shadeMapTex_2 = mainTex;
                } else if (_Use_1stAs2nd > 0)
                {
                    shadeMapTex_2 = shadeMapTex_1;
                } else
                {
                    shadeMapTex_2 = (_2nd_ShadeMap.SampleGrad(sampler_MainTex, uv_toon.uv, uv_toon.dx, uv_toon.dy));
                }



//// early light dir pass for dir for supporting DIRECT light dot()
#ifdef UNITY_PASS_FORWARDBASE
                float3 dirLight   = _WorldSpaceLightPos0.xyz;
#elif UNITY_PASS_FORWARDADD
                float3 dirLight   = normalize( lerp( _WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.worldPos.xyz, _WorldSpaceLightPos0.w));
#endif



//// main light direction with weighted factors of light types
#ifdef UNITY_PASS_FORWARDBASE
                float3 viewLightDirection   = normalize( UNITY_MATRIX_V[2].xyz + UNITY_MATRIX_V[1].xyz); // [1] = camera y upward, [2] = camera z forward
                //// experiment for weighted angles.
                // dirLight                    = dot(1, lightDirect) * _WorldSpaceLightPos0.xyz + dot(1, lightIndirectColAve) * (i.dirGI)  + dot(1, vertexLit) * (i.vertTo0) + (.0001 * viewLightDirection);
                dirLight                    = 100*(_WorldSpaceLightPos0.xyz) + (i.dirGI) + 0.001*(i.vertTo0) + .0001*(viewLightDirection);
                dirLight                    = normalize(dirLight);
                // return float4(((.5*dot(dirLight, i.wNormal)+.5)).xxx, 1);
#elif UNITY_PASS_FORWARDADD
#endif
                if (isBackFace) //// treat backfaces towards light
                {
                    dirLight    = -dirLight;
                }



//// dot() set. Organized extensive input values per effect, per normal map
                ////
                float3 dirNormalToonRamp        = _Is_NormalMapToBase       ? dirNormal : i.wNormal;
                float3 dirNormalSpecular        = _Is_NormalMapToHighColor  ? dirNormal : i.wNormal;
                float3 dirNormalEnv             = _Is_NormaMapToEnv         ? dirNormal : i.wNormal;
                float3 dirNormalRimLight        = _Is_NormalMapToRimLight   ? dirNormal : i.wNormal;
                float3 dirHalf                  = normalize(dirLight + dirView);
                float ldh_Norm_Full             = dot(dirLight, dirHalf);
                float ldh_Norm_Cap              = saturate(ldh_Norm_Full);
                float vdh_Norm_Full             = dot(dirView, dirHalf);
                //// normal toon
                struct Dot_Diff { float ndl; float ndv; float ldhS; float ldh;};
                Dot_Diff dDiff;
                dDiff.ndl   = dot(dirNormalToonRamp, dirLight)*.5+.5;
                dDiff.ndv   = dot(dirNormalToonRamp, dirView);
                dDiff.ldhS  = ldh_Norm_Full*.5+.5;
                // dDiff.ldh   = saturate(ldh_Norm_Full);
                //// normal spec
                struct Dot_Spec { float ndhS; float ndh; float ndlS; float ndl; float ndv; float vdh; float ldh;};
                float spec_ndh  = dot(dirNormalSpecular, dirHalf);
                float spec_ndl  = dot(dirNormalSpecular, dirLight);
                Dot_Spec dSpec;
                dSpec.ndhS      = spec_ndh *.5+.5;
                dSpec.ndh       = saturate(spec_ndh);
                dSpec.ndlS      = spec_ndl *.5+.5;
                dSpec.ndl       = saturate(spec_ndl);
                dSpec.ndv       = saturate(dot(dirNormalSpecular, dirView));
                dSpec.vdh       = saturate(vdh_Norm_Full);
                dSpec.ldh       = ldh_Norm_Cap;
                //// normal env
                struct Dot_Env {float ndv; float ldh; float3 dirViewReflection;};
                Dot_Env dEnv;
                dEnv.ndv                = saturate(dot(dirNormalEnv, dirView));
                dEnv.ldh                = ldh_Norm_Cap;
                dEnv.dirViewReflection  = reflect(-dirView, dirNormalEnv);
                //// normal rimLight
                struct Dot_RimLight {float ndv; float ndlS;};
                Dot_RimLight dRimLight;
                dRimLight.ndv   =  ( dot(dirNormalRimLight, dirView) + (.5*smoothstep(.1, 0, viewDis)));//// needs [-1,1]
                dRimLight.ndlS  = dot(dirNormalRimLight, dirLight)*.5+.5;
                //// normal mc add
                //// normal mc mult
                //// normal mc emis

                //// aniso support. Observe [-1..1]
                // float hdx_Norm_full = (dot(dirHalf,  dirTangent));
                // float hdy_Norm_full = (dot(dirHalf,  dirBitangent));



//// Light attenuation (falloff and shadows), used for mixing in shadows and effects that react to shadow
/*
                fixed shadowAttenuationRaw = 0;
            #if defined(SHADOWS_SCREEN)
                screenPos.xy        = screenPos.xy / screenPos.w;
                shadowAttenuationRaw  =(tex2Dlod(_ShadowMapTexture, float4(screenPos.xy, .5, 0)).r);
            
                // shadowAttenuationRaw   =
                //     ( tex2Dlod(_ShadowMapTexture, float4(0.25, 0.25, 0, 0.5)).r)
                //     + ( tex2Dlod(_ShadowMapTexture, float4(0.25, 0.75, 0, 0.5)).r)
                //     + ( tex2Dlod(_ShadowMapTexture, float4(0.5, 0.5, 0, 0.5)).r)
                //     + ( tex2Dlod(_ShadowMapTexture, float4(0.75, 0.25, 0, 0.5)).r)
                //     + ( tex2Dlod(_ShadowMapTexture, float4(0.75, 0.75, 0, 0.5)).r);
                // shadowAttenuationRaw   *= 0.2;
            #endif
                return float4(shadowAttenuationRaw.xxx,1);
*/

            #ifdef DIRECTIONAL
                //// directional lights handle UNITY_LIGHT_ATTENUATION() differently. I want to split attenuation and shadows, but both concepts fuse in directional lights
                // float lightAtten = LIGHT_ATTENUATION(i);
                // UNITY_LIGHT_ATTENUATION(lightAtten, i, i.worldPos.xyz);
                UNITY_LIGHT_ATTENUATION_NOSHADOW(lightAtten, i, i.worldPos.xyz);
                if (isAmbientOnlyMap) /// lightAtten is random in scenes without directional lights. Using this raw is unstable so we correct when lacking light color.
                {
                    lightAtten = 1;
                }
                half shadowAtten = lightAtten;

            #else
                // float lightAtten = LIGHT_ATTENUATION(i);
                // UNITY_LIGHT_ATTENUATION(lightAtten, i, i.worldPos.xyz);
                UNITY_LIGHT_ATTENUATION_NOSHADOW(lightAtten, i, i.worldPos.xyz);
                half shadowAtten = UNITY_SHADOW_ATTENUATION(i, i.worldPos.xyz);
            #endif
				shadowAtten = RemapRange(shadowAtten, max(0, _LightShadowData.x - .001), 1, 0, 1);//// floor shadow to 0.0, as to normalize
                if (_shadowUseCustomRampNDL) //// nDl shadow
                {
                    half nDlSha = dot(dirNormalToonRamp, dirLight) *.5+.5;                    
                    nDlSha      = StepFeatherRemap(nDlSha, _shadowNDLStep, _shadowNDLFeather);
                    // shadowAtten = (shadowAtten * nDlSha);
                    shadowAtten = min(shadowAtten, nDlSha);
                }
                if (_shadowMaskPinch)
                {
                    shadowAtten = saturate(RemapRange(shadowAtten, 0, 1-_shadowMaskPinch,0,1));
                }
                if (_shadowSplits)
                {
                    shadowAtten = round(shadowAtten * _shadowSplits) / _shadowSplits; 
                }
                half shadowMaskNormalized = shadowAtten;
                
                //// setup shadow darkness control
                half shadowRemoval = 0;
                UNITY_BRANCH
                if ( (_shadowCastMin_black) || !(_DynamicShadowMask_TexelSize.z <16)) 
                {
                    half dynamicShadowMask = _DynamicShadowMask.SampleGrad(sampler_MainTex, uv_toon.uv, uv_toon.dx, uv_toon.dy).g;
                    shadowRemoval = max(_shadowCastMin_black, dynamicShadowMask);
                }
                shadowAtten = saturate(RemapRange(shadowAtten+shadowRemoval,0,1,_LightShadowData.x+.001,1));//// then return 0.0 to floor



//// collect scene light sources. sLight
#ifdef UNITY_PASS_FORWARDBASE
                //// prepare cubemap albedo support lighting
                half3 refGIcol  = shadeSH9LinearAndWhole(float4(normalize(i.wNormal + dEnv.dirViewReflection),1)); //// gi light at a weird angle
                half3 colGIGray = LinearRgbToLuminance_ac(refGIcol);
                //// get vertex lighting
                half3 vertexLit = i.vertexLighting;
                //// build indirect light source
                half3 lightIndirectColAve   = DecodeLightProbe_average();   //// L0 Average light
                half3 lightIndirectColL1    = max(0, SHEvalDirectL1(normalize(i.dirGI)));    //// L1 raw. Add to L0 as max color of GI
                half3 lightIndirectColStatic = 0, lightIndirectColDir = 0;
                ////
                half3 stackIndirectMaxL0L1 = lightIndirectColL1 + lightIndirectColAve;
                half ratioCols = RatioOfColors(stackIndirectMaxL0L1, lightIndirectColAve, _indirectAlbedoMaxAveScale);
                lightIndirectColStatic  = lerp(stackIndirectMaxL0L1, lightIndirectColAve, ratioCols);
                if (_indirectGIDirectionalMix > 0)
                {
                    float4 indirectGIDirectionBlur = float4(i.wNormal, (_indirectGIBlur) );
                    lightIndirectColDir = max(0, ShadeSH9_ac(indirectGIDirectionBlur)) / (indirectGIDirectionBlur.w);
                    // float3 lightIndirectColAngle = shadeSH9LinearAndWhole(float4(i.wNormal,1));  //// not blur adaptiable without intense math
                }
                half3 lightIndirectCol  = lerp(lightIndirectColStatic, lightIndirectColDir, _indirectGIDirectionalMix);

                //// build direct light source
                half3 lightDirect   = _LightColor0.rgb;
                //// build ambient LUM for reflection types
                //// build indirect light
                half3 lightIndirectSource  = (lightIndirectCol);
                //// build direct light
                half3 lightDirectSource = 0;
                if (isAmbientOnlyMap) //// this setup sucks for preserving Direct light effects
                {
                    if (any(lightIndirectColL1)) //// L1 in pure ambient maps is black. Recover by spliting indirect energy.
                    {
                        lightDirectSource   = lightIndirectColL1;
                    }
                    else
                    {
                        lightDirectSource   = lightIndirectColAve * .2;
                        lightIndirectSource = lightIndirectColAve * .7;
                    }
                }
                else
                {
                    lightDirectSource = lightDirect;
                }
                lightDirectSource = (lightDirectSource + vertexLit) * _directLightIntensity;
                lightIndirectSource += vertexLit;
                // float3 lightDirectSource    = (mixColorsMaxAve(lightIndirectColL1, lightDirect) + vertexLit) * _directLightIntensity;

#elif UNITY_PASS_FORWARDADD
                float3 lightDirect      = _LightColor0.rgb;
                lightDirect             *= lightAtten;
                //// out light source by types
                float3 lightDirectSource    = lightDirect * _directLightIntensity;
                float3 lightIndirectSource  = 0;
#endif

//// simple light systems reused. slsys
                half3 lightSimpleSystem = (lightDirectSource * shadowAtten) + lightIndirectSource;
                lightDirect             = _LightColor0.rgb;
#ifdef UNITY_PASS_FORWARDBASE
                half3 cubeMapAveAlbedo  = ((lightDirect * _LightShadowData.x * .5) + lightDirect ) * .5 + lightIndirectSource;
                half lightAverageLum    = LinearRgbToLuminance_ac(cubeMapAveAlbedo);
#elif UNITY_PASS_FORWARDADD
                half3 cubeMapAveAlbedo  = ((lightDirect * _LightShadowData.x * .5) + lightDirect) * .5 * lightAtten;
                half lightAverageLum    = LinearRgbToLuminance_ac(cubeMapAveAlbedo);
#endif



//// toon ramp, prepare ramp masks
                //// Normalized values: 1 represents brighter, 0 darker
                //// toon ramp AO masks. These down ramp as to "force shadow"
                UV_DD uv_ShadePosition  = UVDD(TRANSFORM_TEX( UVPick01(i.uv01, _uvSet_ShadePosition), _MainTex));
                float shadowTex_1       = _Set_1st_ShadePosition.SampleGrad(sampler_Set_1st_ShadePosition, uv_ShadePosition.uv, uv_ShadePosition.dx, uv_ShadePosition.dy).g;
                float shadowTex_2       = _Set_2nd_ShadePosition.SampleGrad(sampler_Set_1st_ShadePosition, uv_ShadePosition.uv, uv_ShadePosition.dx, uv_ShadePosition.dy).g;
                //// Assist for shadow mask
                float shadeRamp_n1 = dDiff.ndl;//// ndl Core area
                float shadeRamp_n2 = dDiff.ndl;//// ndl Backward area
                //// light mask setup. N dol L modified by ****. 50% gray mean natural influence.
                float pivotOffset_1 = 0;
                float pivotOffset_2 = 0;
                float4 lightMask    = 0.5;
                UNITY_BRANCH
                if (_UseLightMap)
                {
                    UV_DD uv_lightMap   = UVDD( TRANSFORM_TEX( UVPick01(i.uv01, _uvSet_LightMap), _LightMap));
                    lightMask           = _LightMap.SampleGrad( sampler_MainTex, uv_lightMap.uv, uv_lightMap.dx, uv_lightMap.dy);
                    lightMask.g         = saturate(RemapRange01(lightMask.g, _lightMap_remapArr[2], _lightMap_remapArr[3]));////[0,1]->[A,B]->clamp
                    //// enum mode 2. Use vertex color red
                    UNITY_BRANCH
                    if (_UseLightMap > 1) { //// use vertex color 
                        lightMask.g *= i.color.r;
                    }
                    //// bright side mix
                    float toonOffsetMask_1  = lightMask.g;
                    float2 AOmCalibrate_1   = (toonOffsetMask_1.xx * float2(_toonLambAry_01[0],_toonLambAry_01[0]) + float2(_toonLambAry_01[1],_toonLambAry_01[1]));
                    float AOmaskPivot_1     = (toonOffsetMask_1 < 0.5);
                    pivotOffset_1           = (AOmaskPivot_1) ? AOmCalibrate_1.x : AOmCalibrate_1.y;
                    //// dark side mix
                    float toonOffsetMask_2  = lightMask.g;
                    float2 AOmCalibrate_2   = (toonOffsetMask_2.xx * float2(_toonLambAry_02[0],_toonLambAry_02[0]) + float2(_toonLambAry_02[1],_toonLambAry_02[1]));
                    float AOmaskPivot_2     = (toonOffsetMask_2 < 0.5);
                    pivotOffset_2           = (AOmaskPivot_2) ? AOmCalibrate_2.x : AOmCalibrate_2.y;

                    shadeRamp_n1 = (pivotOffset_1 + shadeRamp_n1) * 0.5;
                    shadeRamp_n2 = (pivotOffset_2 + shadeRamp_n2) * 0.5;
                    _BaseColor_Step = _ShadeColor_Step = .5;////calabrate .5 Step
                }
                //// d.shadow shifting
                half dsMask = (1 - shadowMaskNormalized) * 2;
                shadeRamp_n1 -= (_shadeShadowOffset1 * dsMask);
                shadeRamp_n2 -= (_shadeShadowOffset2 * dsMask);

                shadeRamp_n1    = (shadeRamp_n1 - _BaseColor_Step + _BaseShade_Feather);
                shadeRamp_n1    = shadowTex_1 * shadeRamp_n1 / (_BaseShade_Feather);
                ////
                shadeRamp_n2    = (shadeRamp_n2 - _ShadeColor_Step + _1st2nd_Shades_Feather);
                shadeRamp_n2    = shadowTex_2 * shadeRamp_n2 / ( _1st2nd_Shades_Feather );
                //// negate for color mixer
                shadeRamp_n1    = saturate(shadeRamp_n1);
                shadeRamp_n2    = saturate(shadeRamp_n2);





//// toon ramp color setup
                //// Albedo variable remap zone of pain.
                // get albedo samples
                half3 albedoCol_1      = mainTex.rgb;
                half3 albedoCol_2      = shadeMapTex_1.rgb;
                half3 albedoCol_3      = shadeMapTex_2.rgb;
                //
                half3 shadeCol_1       = _0_ShadeColor.rgb     * _Color.rgb;
                half3 shadeCol_2       = _1st_ShadeColor.rgb   * _Color.rgb;
                half3 shadeCol_3       = _2nd_ShadeColor.rgb   * _Color.rgb;

//// Toon albedo and ramp mixer
                //// mix scene colors per region
                //// Normalized values:
                UNITY_BRANCH
                if (_ToonRampLightSourceType_Backwards) //// diffuse lighting: backface area is part of shadow thus indirect light only
                {
                    half3 lDSAdjest = lightDirectSource;
                    half3 lightDirectSim = (lDSAdjest * shadowAtten) + lightIndirectSource;
                    shadeCol_1 *= lightDirectSim;
                    shadeCol_2 *= lightDirectSim;
                    shadeCol_3 *= lerp(lightIndirectSource, lightDirectSim, _diffuseIndirectDirectSimMix);
                } else //// diffuse lighting: surface uses entire albedo
                {
                    half3 lDSAdjest = lightDirectSource;
                    half3 lightDirectSim = (lDSAdjest * shadowAtten) + lightIndirectSource;
                    shadeCol_1 *= lightDirectSim;
                    shadeCol_2 *= lightDirectSim;
                    shadeCol_3 *= lightDirectSim;
                }

                //// mix textures
                half3 toonMix_bright_albedo = lerp(albedoCol_2, albedoCol_1, shadeRamp_n1);
                half3 toonMix_dark_albedo   = lerp(albedoCol_3, albedoCol_2, shadeRamp_n2);
                //// mix ramp
                half3 toonMix_bright_mix    = lerp(shadeCol_2, shadeCol_1, shadeRamp_n1);
                half3 toonMix_dark_mix      = lerp(shadeCol_3, shadeCol_2, shadeRamp_n2);

                half pivotBlendSideShades = 0;
                UNITY_BRANCH
                if (_Diff_GSF_01)
                {
                    pivotBlendSideShades = GSF_Diff_ac(dDiff.ndl, saturate(dDiff.ndv), dDiff.ldhS);
                    pivotBlendSideShades = StepFeatherRemap(pivotBlendSideShades, _DiffGSF_Offset, _DiffGSF_Feather);
                }
                else
                {
                    pivotBlendSideShades = min(shadeRamp_n1, shadeRamp_n2);
                }
                //// complete diffuse mix
                half3 shadeColor_albedo = lerp(toonMix_dark_albedo, toonMix_bright_albedo, pivotBlendSideShades);//// textures
                half3 shadeColor_mix    = lerp(toonMix_dark_mix, toonMix_bright_mix, pivotBlendSideShades);//// ramp
                UNITY_BRANCH
                if (_useCrossOverRim)
                {
                    half d_BDFlipper    = dot((reflect(-dirView, dirNormalToonRamp)), -dirLight)*.5+.5;
                    d_BDFlipper         = saturate(RemapRange(d_BDFlipper,0+_crossOverPinch,1-_crossOverPinch,0,1));
                    half dbCrossoverDot = (pow(StepFeatherRemap(1-dDiff.ndv,_crossOverStep,_crossOverFeather), exp2( lerp(3,0,_crosspOverRimPow))));

                    half3 toonMix_BD_albedo         = lerp(albedoCol_2, albedoCol_3, d_BDFlipper);
                    half3 toonMix_BD_mix            = lerp(shadeCol_2, shadeCol_3, d_BDFlipper);

                    half3 toonMix_darkRim_albedo    = Lerp3High2(shadeColor_albedo, toonMix_BD_albedo, dbCrossoverDot);
                    half3 shadeColor_darkRim_albedo = Lerp3High2(shadeColor_mix, toonMix_BD_mix, dbCrossoverDot);
                    shadeColor_albedo               = toonMix_darkRim_albedo;
                    shadeColor_mix                  = shadeColor_darkRim_albedo;
                }
                UNITY_BRANCH
                if (_DetailAlbedo)
                {
                    shadeColor_albedo = lerp(sqrt(shadeColor_albedo), (detailMap.r < 0.0) ? 0.0 : 1.0, abs(detailMap.r) * detailMask.r * _DetailAlbedo);
                    shadeColor_albedo *= shadeColor_albedo;
                }
                //// fuse all
                half3 shadeColor = shadeColor_albedo * shadeColor_mix;//// mix ramp
                // return float4(shadeColor,1);




//// specular setup control
                UV_DD uv_specularMask       = UVDD( TRANSFORM_TEX( UVPick01(i.uv01), _Set_HighColorMask));
                float4 specularMask         = _Set_HighColorMask.SampleGrad( sampler_MainTex, uv_specularMask.uv, uv_specularMask.dx, uv_specularMask.dy);
                float aoSpecularM           = saturate(specularMask.g + _Tweak_HighColorMaskLevel);
                UV_DD uv_specular           = UVDD( TRANSFORM_TEX( UVPick01(i.uv01), _HighColor_Tex));
                float4 highColorTex         = _HighColor_Tex.SampleGrad( sampler_MainTex, uv_specular.uv, uv_specular.dx, uv_specular.dy);
                float3 specularSrcCol       = highColorTex.rgb;
                float smoothness            = (highColorTex.a) * _Glossiness;
                UNITY_BRANCH
                if (_DetailSmoothness)
                {
                    smoothness = lerp(smoothness, (detailMap.b < 0.0) ? 0.0 : 1.0, abs(detailMap.b) * detailMask.b * _DetailSmoothness);
                }
                //// specular work flow. Tint the specular mask.
                specularSrcCol  *= _SpecColor.rgb;
                UNITY_BRANCH
                if (_highColTexSource) // if mixing main texture
                {
                    half3 tempCol = _SpecColor.rgb * lerp(1, shadeColor_albedo, _highColTexSource);//// want 1.0 mix for countering extreme dark 0.0 RGBs
                    half3 AlbedoHSVI = HSVI_controller(tempCol, _SpecularMaskHSV.x, _SpecularMaskHSV.y, _SpecularMaskHSV.z, _SpecularMaskHSV.w);
                    specularSrcCol *= lerp(1, AlbedoHSVI, _highColTexSource);
                }
                UNITY_BRANCH
                if (!(_UseSpecularSystem)) //// forgive this lazy switch. Needs DEFINE code block shutoff and letting the assembler optimize.
                {
                    specularSrcCol = _EnvGrazeMix = _EnvGrazeRimMix = 0;
                }
                float perceptualRoughness   = SmoothnessToPerceptualRoughness(smoothness);
                float oneMinusReflectivity  = 1;
                EnergyConservationBetweenDiffuseAndSpecularOMF(specularSrcCol, /* out */ oneMinusReflectivity);



//// Specular. High Color.
                float highColorInShadow = 1;
                float specMaskSetup_1   = 0;
                UNITY_BRANCH
                if ((dSpec.ndl < 0) || (dSpec.ndv < 0)) //// impossible dot setups
                {
                    specMaskSetup_1         = 0;
                }
                else {
                    float roughness         = PerceptualRoughnessToRoughness_ac(perceptualRoughness);
                    roughness               = max(roughness, 0.002);
                    UNITY_BRANCH
                    if (_Is_SpecularToHighColor > 1) //// unity
                    {
                        float spec_NDF      = GGXTerm_ac(dSpec.ndh, roughness);
                        float spec_GSF      = SmithJointGGXVisibilityTerm_ac(dSpec.ndl, dSpec.ndv, roughness);
                        specMaskSetup_1     = (spec_NDF * spec_GSF * UNITY_PI);
                        specMaskSetup_1     *= dSpec.ndl;
                        specMaskSetup_1     = max(0, specMaskSetup_1);
                    }
                    else if (_Is_SpecularToHighColor > 0) //// smooth
                    {
                        specMaskSetup_1     = pow(dSpec.ndh, RoughnessToSpecPower_ac(roughness)) * UNITY_PI;
                        // specMaskSetup_1     = NDFBlinnPhongNormalizedTerm(dSpec.ndh, PerceptualRoughnessToSpecPower_ac(perceptualRoughness));
                        specMaskSetup_1     *= SmithBeckmannVisibilityTerm_ac(dSpec.ndl, dSpec.ndv, roughness);
                        specMaskSetup_1     *= dSpec.ndl;
                        // return float4(specMaskSetup_1.xxx,1);
                    }
                    else {  //// sharp
                        specMaskSetup_1     = (1 - step(dSpec.ndhS * KelemenGSF(dSpec.ndl, dSpec.ndv, dSpec.vdh), (1 - roughness)));
                    }
                    UNITY_BRANCH
                    if (_TweakHighColorOnShadow) //// slider > 0
                    {
                        highColorInShadow   = lerp(1, shadowMaskNormalized, _TweakHighColorOnShadow);
                    }
                    specMaskSetup_1         *= highColorInShadow;
                }
                //// mix lobs, system intented to mix +1 spec's lobes
                float3 highColorTotalCol_1  = specularSrcCol * _HighColor.rgb;



//// Env Reflection
                float3 colEnv           = 0;
                float3 envOntoRimSetup  = 0;
                half envRimMask         = 0;
                float pRoughnessFix = 0;//// cubemap, matcap
                UNITY_BRANCH
                // if ((_ENVMmode) || ((_envOnRim) && (_rimLightLightsourceType)))
                if (_useCubeMap)
                {
                    float3 reflDir0 = BoxProjection(dEnv.dirViewReflection, i.worldPos, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    float envLOD;
                    half mip,testw,testw2,testh,lodMax;
                    mip = testw = testw2 = testh = lodMax = 0;
                    unity_SpecCube0.GetDimensions(mip,testw,testw,lodMax);
                    UNITY_BRANCH
                    if (_ENVMmode > 1) //// override
                    {
                        pRoughnessFix   = 1 - _envRoughness;
                        smoothness      = _envRoughness;
                        pRoughnessFix   = RoughnessMagicNumberUnityWhy(pRoughnessFix);
                        envLOD  = perceptualRoughnessToMipmapLevel_ac(pRoughnessFix, lodMax);
                    } else
                    { //// standard
                        pRoughnessFix = RoughnessMagicNumberUnityWhy(perceptualRoughness);
                        envLOD  = perceptualRoughnessToMipmapLevel_ac(pRoughnessFix, lodMax);
                    }
                    UNITY_BRANCH
                    if (_CubemapFallbackMode < 2) //// not override cubemap, solve real cubemaps
                    {
                        float4 refColor0    = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir0, envLOD);
                        refColor0.rgb   = DecodeHDR(refColor0, unity_SpecCube0_HDR);
                        colEnv  = refColor0.rgb;
                        UNITY_BRANCH
                        if (unity_SpecCube0_BoxMin.w < 0.9999)
                        {
                            unity_SpecCube1.GetDimensions(mip,testw2,testh,lodMax);
                            envLOD  = perceptualRoughnessToMipmapLevel_ac(pRoughnessFix, lodMax);
                            float3 reflDir1 = BoxProjection(dEnv.dirViewReflection, i.worldPos, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                            float4 refColor1    = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflDir1, envLOD);
                            refColor1.rgb   = DecodeHDR(refColor1, unity_SpecCube1_HDR);
                            colEnv  = lerp(refColor1.rgb, refColor0.rgb, unity_SpecCube0_BoxMin.w);
                        }
                    }
                    UNITY_BRANCH
                    if (_CubemapFallbackMode) //// not off
                    {
                        // float testw=0; float testh=0;
                        // unity_SpecCube0.GetDimensions(testw,testh);
                        UNITY_BRANCH
                        if ( (_CubemapFallbackMode > 1) || (testw < 16)) //// mode forced or smart. Conditionals cannot short-circit
                        {
                            _CubemapFallback.GetDimensions(mip,testw,testh,lodMax);
                            envLOD  = perceptualRoughnessToMipmapLevel_ac(pRoughnessFix, lodMax);
                            float4 colEnvBkup   = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(_CubemapFallback, unity_SpecCube0, reflDir0, envLOD);
                            colEnvBkup.rgb  = DecodeHDR(colEnvBkup, _CubemapFallback_HDR);
                            colEnv  = colEnvBkup * cubeMapAveAlbedo;
                        }
                    }
                    //// natural grazing rim mask
                    if (_EnvGrazeMix)
                    {
                        envRimMask = Pow4_ac(1 - dEnv.ndv);
                    }
                    //// env on rim lights
                    // float colEnvGray    = LinearRgbToLuminance_ac(colEnv);
                    // envOntoRimSetup     = lerp(colEnvGray, colEnv, _envOnRimColorize); 
                    envOntoRimSetup = colEnv;
                }


//// matcap
                float matcapMask    = 1;
                float matcapShaMask = 1;
                float3 mcMixAdd     = 0;
                float3 mcMixMult    = 1;
                float3 mcMixEmis    = 0;
                UNITY_BRANCH
                if (_MatCap)
                {
                    float matcapRotStablizer = 0;
                    if (_CameraRolling_Stabilizer)
                    {
                        // (UTS2 v.2.0.6) : CameraRolling Stabilizer Simplified by ACiiL
                        //// get vectors
                        float3 cameraRightAxis  = UNITY_MATRIX_V[0].xyz;//// UNITY_MATRIX_V camera matrix is powerful to the eyes that see it
                        float3 cameraFrontAxis  = UNITY_MATRIX_V[2].xyz;//// get cam [0]:right and [2]:forward vectors
                        float3 upAxis           = float3(0, 1, 0);      //// get world upward (camera matrix is world)
                        //// get cross of cam forward to world/object(???) up
                        float3 crossRightAxisMag = normalize( cross(cameraFrontAxis, upAxis));////
                        if(isMirror)//// mirror is a lie as we fake the UV twist
                        {
                            crossRightAxisMag   *= -1;
                            _Rotate_MatCapUV    *= -1;
                        }
                        //// cam roll secret sauce
                        float cameraRollCosTheta    = dot(crossRightAxisMag, cameraRightAxis);//// wait
                        float cameraRollRad         = acos(clamp(cameraRollCosTheta, -1, 1)); //// what
                        matcapRotStablizer          = cameraRollRad; //// oh actual CosTheta usage
                        if (cameraRightAxis.y > 0)//// camera axis sign affects roll symmetry
                        {
                            matcapRotStablizer *= -1.0;
                        }
                        //// now add that rad to the UV roll formula
                    }
                    //// normalmap rotate
                    float2 rot_MatCapNmUV       = rotateUV( UVPick01(i.uv01, _uvSet_NormalMapForMatCap), float2(0.5,0.5), (_Rotate_NormalMapForMatCapUV * 3.141592654));
                    //// normal map
                    UV_DD uv_matcap_nm          = UVDD( TRANSFORM_TEX( rot_MatCapNmUV, _NormalMapForMatCap));
                    float4 normalMapForMatCap   = _NormalMapForMatCap.SampleGrad( sampler_NormalMap, uv_matcap_nm.uv, uv_matcap_nm.dx, uv_matcap_nm.dy);
                    float3 matCapNormalMapTex   = UnpackNormal( normalMapForMatCap);
                    //// v.2.0.5: MatCap with camera skew correction. @kanihira
                    float3 dirNormalMatcap      = (_Is_NormalMapForMatCap) ? mul( matCapNormalMapTex, tangentTransform) : i.wNormal;
                    ////
                    float3 viewNormal                   = mul( UNITY_MATRIX_V, dirNormalMatcap);
                    float3 normalBlendMatcapUVDetail    = viewNormal.xyz * float3(-1,-1,1);
                    float3 normalBlendMatcapUVBase      = (mul( UNITY_MATRIX_V, float4(dirView,0) ).xyz * float3(-1,-1,1)) + float3(0,0,1);
                    float3 noSknewViewNormal            = (normalBlendMatcapUVBase * dot(normalBlendMatcapUVBase, normalBlendMatcapUVDetail) / normalBlendMatcapUVBase.z) - normalBlendMatcapUVDetail;
                    float2 viewNormalAsMatCapUV         = ((noSknewViewNormal).xy * 0.5) + 0.5;
                    //// matcap rotation
                    float2 scl_MatCapUV         = scaleUV(viewNormalAsMatCapUV, float2(0.5,0.5), -2 * _Tweak_MatCapUV + 1);
                    float2 rot_MatCapUV         = rotateUV(scl_MatCapUV, float2(0.5,0.5),  (_Rotate_MatCapUV * 3.141592654) + matcapRotStablizer);
                    //// get blur
                    float mcLodMax0, mcLodMax1, mcLodMax2;
                    mcLodMax0 = mcLodMax1 = mcLodMax2 = 0;
                    _MatCapTexAdd.GetDimensions(mip,testw2,testh,mcLodMax0);
                    _MatCapTexMult.GetDimensions(mip,testw2,testh,mcLodMax1);
                    _MatCapTexEmis.GetDimensions(mip,testw2,testh,mcLodMax2);
                    
                    //// UV to texture
                    // half mcRoughness = _BlurLevelMatcap0;//// _BlurLevelMatcap0
                    // if (_matcapRoughnessSource0)//// _matcapRoughnessSource0 [self,0,cubemap,1]
                    // {
                    //     mcRoughness = RoughnessMagicNumberUnityWhy(perceptualRoughness);
                    //     // mcRoughness = pRoughnessFix;
                    // }
                    half mcNaturalRoughness = RoughnessMagicNumberUnityWhy(perceptualRoughness);
                    half mcBlur0 = (_matcapRoughnessSource0) ? mcNaturalRoughness : _BlurLevelMatcap0;
                    half mcBlur1 = (_matcapRoughnessSource1) ? mcNaturalRoughness : _BlurLevelMatcap1;
                    half mcBlur2 = (_matcapRoughnessSource2) ? mcNaturalRoughness : _BlurLevelMatcap2;
                    float2 matcapUV         = TRANSFORM_TEX(rot_MatCapUV, _MatCapTexAdd);
                    float4 matCapTexAdd     = _MatCapTexAdd .SampleLevel(sampler_MatCap_Trilinear_clamp, matcapUV, perceptualRoughnessToMipmapLevel_ac(mcBlur0,mcLodMax0));
                    float4 matCapTexMult    = _MatCapTexMult.SampleLevel(sampler_MatCap_Trilinear_clamp, matcapUV, perceptualRoughnessToMipmapLevel_ac(mcBlur1,mcLodMax1));
                    float4 matCapTexEmis    = _MatCapTexEmis.SampleLevel(sampler_MatCap_Trilinear_clamp, matcapUV, perceptualRoughnessToMipmapLevel_ac(mcBlur2,mcLodMax2));
                    ////
                    mcMixAdd          = matCapTexAdd.rgb * matCapTexAdd.a;
                    mcMixMult         = matCapTexMult.rgb * matCapTexMult.a;
                    mcMixEmis         = matCapTexEmis.rgb * matCapTexEmis.a;
                    UNITY_BRANCH
                    if (_TweakMatCapOnShadow)//// slider > 0
                    {
                        matcapShaMask       = lerp(1, shadowMaskNormalized, _TweakMatCapOnShadow);
                    }
                    UV_DD uv_mcMask         = UVDD( TRANSFORM_TEX( UVPick01(i.uv01), _Set_MatcapMask));
                    float4 matcapMaskTex    = _Set_MatcapMask.SampleGrad( sampler_MainTex, uv_mcMask.uv, uv_mcMask.dx, uv_mcMask.dy);
                    matcapMask              *= saturate(matcapMaskTex.g + _Tweak_MatcapMaskLevel);
                }
                else {
                    matcapMask      = 0;
                }




//// rim lighting
                half rimLightMask1, rimLightMask2;
                half3 rimLightCol1, rimLightCol2;
                rimLightMask1   = rimLightMask2 = 0;
                rimLightCol1    = rimLightCol2 = 0;
                UV_DD uv_rimLight   = UVDD( TRANSFORM_TEX(  UVPick01(i.uv01), _Set_RimLightMask));
                UNITY_BRANCH
                if ((_RimLight) || (_Add_Antipodean_RimLight))
                {
                    half4 rimLightMaskTex  = _Set_RimLightMask.SampleGrad( sampler_MainTex, uv_rimLight.uv, uv_rimLight.dx, uv_rimLight.dy);
                    half rimLightTexMask   = saturate( rimLightMaskTex.g + _Tweak_RimLightMaskLevel);
                    ////
                    half rimArea        = (1.0 - dRimLight.ndv);
                    half rimArea1       = StepFeatherRemap(rimArea, -_RimLightAreaOffset + 1, 1 - _RimLight_InsideMask);
                    half rimLightPower1 = pow(rimArea1, exp2( lerp(3, 0, _RimLight_Power)));
                    half rimLightPower2 = pow(rimArea1, exp2( lerp(3, 0, _Ap_RimLight_Power)));

                    // rim mask
                    half rimlightMaskSetup1 = rimLightPower1, rimlightMaskSetup2 = rimLightPower2;
                    ////
                    UNITY_BRANCH
                    if (_LightDirection_MaskOn)
                    {
                        half vdl                = (dot(UNITY_MATRIX_V[2].xyz, dirNormalRimLight) * .1 + .1); /// camera z forward vector
                        half nDl                = dot(dirLight,dirNormalRimLight)*.5+.5;
                        half rimlightMaskToward = (1 - nDl) + _Tweak_LightDirection_MaskLevel;
                        half rimLightMaskAway   = (nDl) + _Tweak_LightDirection_MaskLevel;
                        rimLightMask1           = max(0, rimlightMaskSetup1 - rimlightMaskToward - vdl);
                        rimLightMask2           = max(0, rimlightMaskSetup2 - rimLightMaskAway - vdl);
                    } 
                    else
                    {
                        rimLightMask1   = rimlightMaskSetup1;
                        rimLightMask2   = 0;
                    }
                    ////
                    rimLightMask1   *= rimLightTexMask;
                    rimLightMask2   *= rimLightTexMask;
                    //// colors input
                    half3 rimTexAlbedo = 1;
                    UNITY_BRANCH
                    if (_rimAlbedoMix)
                    {
                        UNITY_BRANCH
                        if (_RimLightSource) 
                        {
                            rimTexAlbedo = specularSrcCol;
                        } else
                        {
                            rimTexAlbedo = shadeColor_albedo;
                        }
                        rimTexAlbedo = lerp(1, rimTexAlbedo, _rimAlbedoMix);
                    }
                    ////
                    rimLightCol1 = _RimLightColor.rgb;
                    rimLightCol2 = _Ap_RimLightColor.rgb;
                    UNITY_BRANCH
                    if (_useRimLightOverTone)
                    {
                        half rimEdgeBoundary1   = saturate(RemapRange(rimLightPower1, _rimLightOverToneLow, _rimLightOverToneHigh, 0, 1));//// edge color
                        half rimEdgeBoundary2   = saturate(RemapRange(rimLightPower2, _rimLightOverToneLow, _rimLightOverToneHigh, 0, 1));//// edge color
                        rimLightCol1            = lerp(_RimLightColor.rgb,    _rimLightOverToneBlendColor1,  rimEdgeBoundary1);
                        rimLightCol2            = lerp(_Ap_RimLightColor.rgb, _rimLightOverToneBlendColor2,  rimEdgeBoundary2);
                    }
                    rimLightCol1 *= rimTexAlbedo;
                    rimLightCol2 *= rimTexAlbedo;
                }


//// Emission
#ifdef UNITY_PASS_FORWARDBASE
                float4 emissiveMask     = _Emissive_Tex.Sample( sampler_EmissionColorTex, TRANSFORM_TEX( UVPick01(i.uv01), _Emissive_Tex));
                float4 emissionTex      = _EmissionColorTex.Sample( sampler_EmissionColorTex, TRANSFORM_TEX( UVPick01(i.uv01, _uvSet_EmissionColorTex), _EmissionColorTex));
                if (_emissiveUseMainTexA) //// because i know games that store emission mask in main texture alpha channel
                {
                    emissiveMask.g  = mainTex.a;
                }
                if (_emissiveUseMainTexCol) //// and color from main texture
                {
                    emissionTex.rgba = mainTex.rgba;
                }
                float3 emissionColor    = max( (_EmissiveProportional_Color * lightAverageLum), _Emissive_Color.rgb);
                float3 emissionMixReal  = emissionTex.rgb * emissionColor * emissionTex.a;
                float3 emissionMix      = emissionMixReal;
                if (_MatCap){
                    float3 emissionMatcap   = mcMixEmis * _MatCapColEmis.rgb;
                    emissionMix             = max(emissionMix, emissionMatcap);
                }
#endif //// UNITY_PASS_FORWARDBASE



////////////////////////////////////////////////////////////////
//// The Mix zone. Blend everything. In intent all effects are prepared. Requires masks and color sets.
                float4 fragColor    = 0;
                float3 colDiffuse   = 0;
                float3 colSpecular  = 0;
                float3 colFernel    = 0;
                float3 colReflect   = 0;
                float3 colEmission  = 0;

//// base diffuse
                //// mcMixMult shadeColor_albedo shadeColor
                colDiffuse      = shadeColor;
                if (_MatCap){ //// gets scene lighting from toon ramp chain
                    {
                        float3 diffMixMC = 1;
                        if (_McDiffAlbedoMix)
                        {
                            diffMixMC = lerp(1, shadeColor_albedo, _McDiffAlbedoMix);
                        }
                        colDiffuse = lerp(colDiffuse, (colDiffuse + (diffMixMC * lightSimpleSystem * mcMixMult.rgb * _MatCapColMult.rgb) * (_MatCapColMult.a)), matcapMask);
                    }
                }

//// fernel
                float3 rimMixer = 0; //// get effects
                if (_RimLight)
                {
                    rimMixer    += rimLightCol1 * rimLightMask1;
                }
                if (_Add_Antipodean_RimLight)
                {
                    rimMixer    += rimLightCol2 * rimLightMask2;
                }
                colFernel   = rimMixer; //// get lighting
                half3 colFernelLight = 1;
                if (true) //// fake function incapsulation
                {
                    #ifdef UNITY_PASS_FORWARDADD
                    envOntoRimSetup = envOntoRimSetup * lightAtten; //// ADD lights falloff * cubemap is a contradiction, but falloff is needed
                    #endif
                    colFernelLight = lerp(cubeMapAveAlbedo, envOntoRimSetup, _envOnRim); //// get cubemap setup
                    colFernelLight = lerp(LinearRgbToLuminance_ac(colFernelLight), colFernelLight, _envOnRimColorize); //// cubemap color
                    colFernelLight = lerp(lightSimpleSystem, colFernelLight, _rimLightLightsourceType); //// select light system
                }
                colFernel *= colFernelLight;
                // colFernel   *= (lightDirectSource * shadowAtten) + lightIndirectSource; //// light source is lazy combined
                
                
//// specularity
                colSpecular = specMaskSetup_1 * aoSpecularM;
                colSpecular *= FresnelTerm_ac(highColorTotalCol_1, dSpec.ldh);
                colSpecular *= (lightDirectSource); //// light source is Direct light
                // return float4(colSpecular,1);



//// reflection
                float3 envColMixCore    = specularSrcCol;
#ifdef UNITY_PASS_FORWARDBASE
                float envGrazeMask      = max( (envRimMask), ((_EnvGrazeRimMix) ?max(rimLightMask1, rimLightMask2) : 0)); //// mix graze types
                float surfaceReduction;
                if (_ENVMmode > 1) //// override
                { 
                    surfaceReduction    = _ENVMix;
                }
                else if (_ENVMmode > 0) { //// standard
                    float roughness     = PerceptualRoughnessToRoughness_ac(perceptualRoughness);
                    surfaceReduction    = _ENVMix / (roughness * roughness + 1.0);
                }
                else { //// none
                    surfaceReduction    = 0;
                }
                ////
                if (_ENVMmode > 0) //// using env
                {
                    float grazingTerm       = saturate(smoothness + (1 - oneMinusReflectivity));
                    float envColMixGraze    = grazingTerm * (1 + colGIGray);
                    float3 envColMix        = lerp(envColMixCore, envColMixGraze.xxx, envGrazeMask); //// graze effect
                    colReflect              = colEnv;
                    colReflect              *= surfaceReduction.xxx * aoSpecularM.xxx;
                    colReflect              *= envColMix;
                    // colReflect              *= lightAverageLum;
                    // return float4(colReflect,1);
                }
#endif //// UNITY_PASS_FORWARDBASE
                //// spec matcap
                if (_MatCap){
                    half3 mcSpecSourceLight = lerp(lightAverageLum, cubeMapAveAlbedo, 1); //// _MatcapSpecSourceLightMix
                    colReflect      += (mcMixAdd * _MatCapColAdd.rgb * mcSpecSourceLight) * (_MatCapColAdd.a * matcapShaMask * aoSpecularM);\
                }



                //// energy conservation
                float3 colDiffuseTerms      = (colDiffuse);
                float3 colSpecularTerms     = colSpecular + colFernel + colReflect;
                //// solve oneMinusReflectivity for transparancy
                colDiffuseTerms             = EnergyConservationBetweenDiffuseAndSpecular_ac(
                                                _Is_BlendAddToHiColor, colDiffuseTerms, specularSrcCol, oneMinusReflectivity); /// oneMinusReflectivity unused

                //// emission blending in premultiply format
#if !defined(NotAlpha) && !defined(UseAlphaDither) //// cutout mode. dont use premultiplay block
                UNITY_BRANCH
                if (_UseSpecAlpha)
                {
                    PremultiplyAlpha_ac(colDiffuseTerms/* inout */, alpha/* inout */, 1);
                    fragColor.rgb   += colDiffuseTerms + colSpecularTerms;
                    fragColor.a     = alpha;
                }
                else {
                    float3 fuseCol  = colDiffuseTerms + colSpecularTerms;
                    fuseCol         *= alpha;
                    fragColor.rgb   += fuseCol;
                    fragColor.a     = alpha;
                }
#else //// NotAlpha
                fragColor.rgb   = colDiffuseTerms + colSpecularTerms;
                fragColor.a     = alpha;
#endif //// NotAlpha
                fragColor.rgb   = max(0, fragColor);
                if (_forceLightClamp)
                {
                    float sceneIntensity = LinearRgbToLuminance_ac(lightDirectSource + lightIndirectSource); //// grab all light at max potencial
                    if (sceneIntensity > 1.0) //// bloom defaults at > 1.1
                    {
                        fragColor.rgb = fragColor.rgb / sceneIntensity;
                    }
                } 
                //// blend emission
#ifdef UNITY_PASS_FORWARDBASE
                emissionMix     = lerp( lerp(0, fragColor.rgb, emissiveMask.g), (emissionMix), emissiveMask.g);
                colEmission     = emissionMix;
                fragColor.rgb   += colEmission;
#endif // UNITY_PASS_FORWARDBASE

                //// backface tint
                if (isBackFace){
                    fragColor.rgb *= _backFaceColorTint;
                }

                if (!(_forceLightClamp)) /// non HDR self post pressing, like how Standard cheats on emission.
                {
                #ifndef UNITY_HDR_ON
                    //// non HDR maps recurve
                    float ExposureBias  = 2;
                    float3 curr = Uncharted2Tonemap(fragColor.rgb * ExposureBias);
                    float3 whiteScale   = 1 / Uncharted2Tonemap(11.2);
                    fragColor.rgb   =  curr * whiteScale;
                #endif
                }

                UNITY_APPLY_FOG(i.fogCoord, fragColor);
                return fragColor;
            }
#endif //// ACLS_CORE