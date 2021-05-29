using System.Collections;
using System.Collections.Generic;
using UnityEngine; 

public class lidar_raycast : MonoBehaviour
{
    public float maxDistance = 5.0f;
    private Transform lidar_transform;
    // Start is called before the first frame update
    void Start()
    {
        lidar_transform = this.transform;
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        Vector3 rotation_vector = new Vector3(0.0f, 90.0f, 0.0f);
        lidar_transform.Rotate(rotation_vector, 5);
        RaycastHit hit;
        for (float i = -15f; i < 15; ++i){
            Vector3 ray_dir = new Vector3(Mathf.Cos(i * Mathf.Deg2Rad),Mathf.Sin(i * Mathf.Deg2Rad),0);
            if (Physics.Raycast(transform.position, transform.TransformDirection(ray_dir), out hit, maxDistance))
            {
                Debug.DrawRay(transform.position, transform.TransformDirection(ray_dir) * hit.distance, Color.yellow);
            }
            else
            {
                Debug.DrawRay(transform.position, transform.TransformDirection(ray_dir) * maxDistance, Color.white);
            }
        }
    }
}
