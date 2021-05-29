using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace RosSharp.RosBridgeClient
{
    public class pcl_listener : UnityPublisher<MessageTypes.Sensor.PointCloud>
    {
        public string FrameId = "unity_pcl_message";
        public Transform lidar_transform;
        public float maxDistance = 5.0f;
        private MessageTypes.Sensor.PointCloud pcl_message;
        private MessageTypes.Geometry.Point32[] pcl_points;
        private int timer = 0;

        protected override void Start()
        {
            base.Start();
            InitializeMessage();
        }

        private void FixedUpdate()
        {
            HandleLidar();
            UpdateMessage();
        }

        private void InitializeMessage()
        {
            pcl_message = new MessageTypes.Sensor.PointCloud
            {
                header = new MessageTypes.Std.Header()
                {
                    frame_id = FrameId
                }
            };
            MessageTypes.Geometry.Point32[] pcl_point32_arr = {};
            pcl_points = pcl_point32_arr;
        }

        private void UpdateMessage()
        {
            if (timer == 72) {
                pcl_message.points = pcl_points;
                Publish(pcl_message);
                InitializeMessage();
                timer = 0;
            } else {
                pcl_message.header.Update();
                timer++;
            }
            
            Publish(pcl_message);
        }

        private void HandleLidar()
        {
            Vector3 rotation_vector = new Vector3(0.0f, 90.0f, 0.0f);
            lidar_transform.Rotate(rotation_vector, 5);
            RaycastHit hit;
            for (float i = -15f; i < 15; ++i){
                Vector3 ray_dir = new Vector3(Mathf.Cos(i * Mathf.Deg2Rad),Mathf.Sin(i * Mathf.Deg2Rad),0);
                if (Physics.Raycast(lidar_transform.position, lidar_transform.TransformDirection(ray_dir), out hit, maxDistance))
                {
                    Debug.DrawRay(lidar_transform.position, lidar_transform.TransformDirection(ray_dir) * hit.distance, Color.yellow);
                    MessageTypes.Geometry.Point32 pcl_point = new MessageTypes.Geometry.Point32(hit.point.x, hit.point.y, hit.point.z);
                    //pcl_points.Add(pcl_point);
                }
                else
                {
                    Debug.DrawRay(lidar_transform.position, lidar_transform.TransformDirection(ray_dir) * maxDistance, Color.white);
                }
            }
        }
    }
}