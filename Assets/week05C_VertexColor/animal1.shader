Shader "My/animal1"
{
    Properties

    {

        _MainTex("Albedo (RGB)", 2D) = "white" {}

    }

        SubShader

    {

        Tags { "RenderType" = "Opaque" }



        CGPROGRAM

        #pragma surface surf Standard fullforwardshadows



        // Use shader model 3.0 target, to get nicer looking lighting

        #pragma target 3.0



        sampler2D _MainTex;



        struct Input

        {

            float2 uv_MainTex;

        };



        void surf(Input IN, inout SurfaceOutputStandard o)

        {

            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);

            o.Albedo = c.rgb;

            o.Alpha = c.a;

        }

        ENDCG

    }

        FallBack "Diffuse"
}