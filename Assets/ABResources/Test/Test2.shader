﻿Shader "Unlit/Test2"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
			Name "ForwardBase"
			Tags{
				"LightMode"="ForwardBase"
			}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog
			#pragma multi_compile TIME_OFF TIME_ON
			#pragma multi_compile TIME_OFF1 TIME_ON1
			#pragma multi_compile TIME_OFF2 TIME_ON2
			#pragma multi_compile TIME_OFF3 TIME_ON3
			#pragma multi_compile TIME_OFF4 TIME_ON4
			#pragma multi_compile TIME_OFF5 TIME_ON5
			#pragma multi_compile TIME_OFF6 TIME_ON6
			#pragma multi_compile TIME_OFF7 TIME_ON7
			#pragma multi_compile TIME_OFF8 TIME_ON8
			#pragma multi_compile TIME_OFF9 TIME_ON9

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                //fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 col = fixed4(0, 0, 1, 1);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }

		Pass
		{
			Name "ForwardAdd"
			Tags{
				"LightMode" = "ForwardAdd"
			}
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			#pragma multi_compile TIME_OFF TIME_ON
			#pragma multi_compile TIME_OFF1 TIME_ON1
			#pragma multi_compile TIME_OFF2 TIME_ON2
			#pragma multi_compile TIME_OFF3 TIME_ON3
			#pragma multi_compile TIME_OFF4 TIME_ON4
			#pragma multi_compile TIME_OFF5 TIME_ON5
			#pragma multi_compile TIME_OFF6 TIME_ON6
			#pragma multi_compile TIME_OFF7 TIME_ON7
			#pragma multi_compile TIME_OFF8 TIME_ON8
			#pragma multi_compile TIME_OFF9 TIME_ON9

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				// sample the texture
				//fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 col = fixed4(0, 0, 1, 1);
			// apply fog
			UNITY_APPLY_FOG(i.fogCoord, col);
			return col;
		}
		ENDCG
	}
			Pass
		{
			Name "Deferred"
			Tags{
				"LightMode" = "Deferred"
			}
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			#pragma multi_compile TIME_OFF TIME_ON
			#pragma multi_compile TIME_OFF1 TIME_ON1
			#pragma multi_compile TIME_OFF2 TIME_ON2
			#pragma multi_compile TIME_OFF3 TIME_ON3
			#pragma multi_compile TIME_OFF4 TIME_ON4
			#pragma multi_compile TIME_OFF5 TIME_ON5
			#pragma multi_compile TIME_OFF6 TIME_ON6
			#pragma multi_compile TIME_OFF7 TIME_ON7
			#pragma multi_compile TIME_OFF8 TIME_ON8
			#pragma multi_compile TIME_OFF9 TIME_ON9

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				// sample the texture
				//fixed4 col = tex2D(_MainTex, i.uv);
				fixed4 col = fixed4(0, 0, 1, 1);
			// apply fog
			UNITY_APPLY_FOG(i.fogCoord, col);
			return col;
		}
		ENDCG
		}
    }
}