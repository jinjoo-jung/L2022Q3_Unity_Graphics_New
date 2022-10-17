Shader "My/Person2"
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
           
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex + _Time.x);

            o.Albedo = c.rgb;

            o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0); //Α¶Έν

            o.Alpha = c.a;
        

        }

        ENDCG

    }

        FallBack "Diffuse"
}
