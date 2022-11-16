using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Audio_Controller : MonoBehaviour
{
    AudioSource Audio;

    // Start is called before the first frame update
    void Start()
    {
        Audio = GetComponent<AudioSource>();
        Audio.Play(); //시작과동시에 오디오 재생 (stop은 시작하고 재생x)
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.P))
        {
            Audio.Play();
        }
        if(Input.GetKeyDown(KeyCode.S))
        {
            Audio.Stop();
        }
    }
}
