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
        Light.SetActive(isOn); //���� ���¿��� ����
    }

    void Update()
    {
        if(Input.GetKeyDown(KeyCode.L))
        {
            print("L down");
            print(Light.name);

            isOn = !isOn;
            Light.SetActive(isOn); //���� ������Ʈ Ȱ��ȭ/��Ȱ��ȭ

        }
    }
    private void onMouseDown()
    {
        print(gameObject.name + " mouse down");
    }
}
