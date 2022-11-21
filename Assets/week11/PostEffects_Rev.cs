using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[ExecuteInEditMode]
public class PostEffects_Rev : MonoBehaviour
{
    Shader myShader;
    Material myMaterial;

    // Start is called before the first frame update
    void Start()
    {
        myShader = Shader.Find("My/PostEffects_Rev");
        myMaterial = new Material(myMaterial);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    //카메라 컴포넌트로부터 영상이미지를 렌더텍스처 형식으로 받아서 목적지로 쏴주는 역할
    //카메라의영상을 우리가 보는 게임 화면으로 연결해주는 함수 
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        //내가 원하는 횟수 지정?
        Graphics.Blit(source, destination, myMaterial, 0);
    }
    private void OnDisable()
    {
        if (myMaterial)
        {
            DestroyImmediate(myMaterial);
        }

    }
}
