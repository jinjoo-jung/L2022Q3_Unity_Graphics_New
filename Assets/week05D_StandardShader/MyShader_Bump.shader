Shader "My/Standard/MyBump"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {} //특별하게 정의되어있지않으면 흰색
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _BumpMap("NormalMap", 2D) = "bump"{} //요철과 관련 특별한 값 없으면 요철로~
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
     
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        sampler2D _BumpMap;


        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;

        };

        half _Glossiness;
        half _Metallic;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;

            //면의 수직방향으로 얼만큼의 돌출
            fixed3 n = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap)); //2D texture을 요철값으로 
            o.Normal = n;//표면의 요소요소마다 돌출로하기 위해서는 일반 색 값이 아닌 변환해줘야됨
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
