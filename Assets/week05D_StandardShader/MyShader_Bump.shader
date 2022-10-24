Shader "My/Standard/MyBump"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {} //Ư���ϰ� ���ǵǾ����������� ���
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _BumpMap("NormalMap", 2D) = "bump"{} //��ö�� ���� Ư���� �� ������ ��ö��~
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

            //���� ������������ ��ŭ�� ����
            fixed3 n = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap)); //2D texture�� ��ö������ 
            o.Normal = n;//ǥ���� ��ҿ�Ҹ��� ������ϱ� ���ؼ��� �Ϲ� �� ���� �ƴ� ��ȯ����ߵ�
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
