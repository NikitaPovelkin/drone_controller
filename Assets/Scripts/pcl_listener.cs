using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace RosSharp.RosBridgeClient
{
    public class pcl_listener : UnityPublisher<MessageTypes.Sensor.PointCloud2>
    {
        public string FrameId = "velodyne";
        public Transform lidar_transform;
        public float maxDistance = 10.0f;
        private MessageTypes.Sensor.PointCloud2 pcl2_message;
        private int timer = 0;
        private static int lidar_rotation_angle = 5;
        private static float lidar_laser_count = 15f * 2;
        private static float diff_lidar_scan_angles = 360/lidar_rotation_angle;
        private static float lidar_scan_pos_count = diff_lidar_scan_angles * lidar_laser_count;
        private static uint point_byte_length = 16;
        private byte[] lidar_data = new byte[(uint) lidar_scan_pos_count * point_byte_length];
        private MessageTypes.Sensor.PointField[] pcl2_fields;
        private ArrayList lidar_data_list = new ArrayList();

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
            pcl2_fields = new MessageTypes.Sensor.PointField[4];
            pcl2_message = new MessageTypes.Sensor.PointCloud2
            {
                header = new MessageTypes.Std.Header()
                {
                    frame_id = FrameId
                },
                height = 1,
                width = (uint) lidar_scan_pos_count,
                fields = pcl2_fields,
                is_bigendian = false,
                point_step = point_byte_length,
                row_step = (uint) lidar_scan_pos_count * point_byte_length // width * point_step
            };
            DefineFields();
        }

        private void UpdateMessage()
        {
            if (timer == diff_lidar_scan_angles) {
                pcl2_message.data = (byte[]) lidar_data_list.ToArray(typeof(byte));
                Publish(pcl2_message);
                InitializeMessage();
                timer = 0;
            } else {
                pcl2_message.header.Update();
                timer++;
            }
        }

        private void HandleLidar()
        {
            Vector3 rotation_vector = new Vector3(0.0f, 90.0f, 0.0f);
            lidar_transform.Rotate(rotation_vector, 5);
            RaycastHit hit;
            float intensity = 0;
            for (float i = -lidar_laser_count; i < lidar_laser_count; ++i){
                Vector3 ray_dir = new Vector3(Mathf.Cos(i * Mathf.Deg2Rad),Mathf.Sin(i * Mathf.Deg2Rad),0);
                if (Physics.Raycast(lidar_transform.position, lidar_transform.TransformDirection(ray_dir), out hit, maxDistance))
                {
                    Debug.DrawRay(lidar_transform.position, lidar_transform.TransformDirection(ray_dir) * hit.distance, Color.yellow);
                    if (!hit.collider.gameObject.GetComponent<Renderer>()) {
                        intensity = hit.collider.gameObject.GetComponent<Renderer>().material.GetColor("_Color").grayscale;
                    }                    
                    AddPointMemberToData(hit.point.x);
                    AddPointMemberToData(hit.point.y);
                    AddPointMemberToData(hit.point.z);
                    AddPointMemberToData(intensity);
                }
                else
                {
                    Debug.DrawRay(lidar_transform.position, lidar_transform.TransformDirection(ray_dir) * maxDistance, Color.white);
                }
            }
        }
        private void DefineFields(){
            for (int i = 0; i < pcl2_fields.Length; ++i)
            {
                pcl2_fields[i] = new MessageTypes.Sensor.PointField();
            }

            pcl2_fields[0].name = "x";
            pcl2_fields[0].offset = 0;

            pcl2_fields[1].name = "y";
            pcl2_fields[1].offset = 4;

            pcl2_fields[2].name = "z";
            pcl2_fields[2].offset = 8;

            pcl2_fields[3].name = "intensity";
            pcl2_fields[3].offset = 16;

            pcl2_fields[0].count = pcl2_fields[1].count = pcl2_fields[2].count = pcl2_fields[3].count = 1;
            pcl2_fields[0].datatype = pcl2_fields[1].datatype = pcl2_fields[2].datatype = pcl2_fields[3].datatype = 7;
        }

        private void AddPointMemberToData(float member) {
            foreach(byte b in BitConverter.GetBytes(member)){
                lidar_data_list.Add(b);
            }
        }
    }
}