using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RosSharp.RosBridgeClient {
    public class Drone_Base_Rigidbody : UnitySubscriber<MessageTypes.Geometry.Twist>
    {
        public static float throttle;
        public static Quaternion rotation;
        private bool isMessageReceived;

        protected override void Start()
        {
            base.Start();
        }

        // Update is called once per frame
        void FixedUpdate()
        {
            if (isMessageReceived){
                
            }
        }

        protected override void ReceiveMessage(MessageTypes.Geometry.Twist message)
        {

            rotation = Quaternion.Euler((float)message.angular.y, (float)message.angular.z, (float)message.angular.x);
            throttle = (float)message.linear.z;
            isMessageReceived = true;
        }
    }
}
