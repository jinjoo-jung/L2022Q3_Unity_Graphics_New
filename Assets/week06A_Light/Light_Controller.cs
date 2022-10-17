using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Light_Controller : MonoBehaviour
{
    public GameObject Light;
    public bool isOn;

    void Start()
    {
        isOn = false;
        Light.SetActive(isOn); //꺼진 상태에서 시작
    }

    void Update()
    {
        if(Input.GetKeyDown(KeyCode.L))
        {
            print("L down");
            print(Light.name);

            isOn = !isOn;
            Light.SetActive(isOn); //게임 오브젝트 활성화/비활성화

        }
    }
    private void onMouseDown()
    {
        print(gameObject.name + " mouse down");
    }
}
