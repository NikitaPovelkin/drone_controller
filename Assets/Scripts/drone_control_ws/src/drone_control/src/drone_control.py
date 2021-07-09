#!/usr/bin/python3
import rospy
import collections
from geometry_msgs.msg import Twist
from drone_input_msgs.msg import DroneControlInput

class DroneControl:
    def __init__(self):
        self.last_callback_time = 0
        self.not_first_callback = False
        self.finalPitch = 0
        self.finalRoll = 0
        self.finalYaw = 0
        self.yaw = 0
        self.deltaTime = 0
        self.filter = 0.4
        self.minMaxPitch = self.minMaxRoll = 20
        self.yawQueue = collections.deque([], 60)
        
        self.twist_publisher = rospy.Publisher("/twist", Twist, queue_size=10)
        self.keyboard_input_subscriber = rospy.Subscriber("/keyboard_input", DroneControlInput, self.drone_control_callback)
        
    def drone_control_callback(self, message):
        twist_msg = Twist()
        self.yawQueue.append((message.j + message.l))
        avg_yaw_angle = sum(self.yawQueue) / len(self.yawQueue)
        pitch = (message.w + message.s) * self.minMaxPitch
        roll = (message.a + message.d) * self.minMaxRoll
        self.yaw +=  avg_yaw_angle * 0.15

        if self.yaw >= 360:
            self.yaw += -360
        elif self.yaw <= -360:
            self.yaw += 360
        
        self.finalPitch = self.interpolate(self.finalPitch, pitch, self.filter)
        self.finalRoll = self.interpolate(self.finalRoll, roll, self.filter)
        # self.finalYaw = self.interpolate(self.finalYaw, self.yaw, self.filter)
    
        twist_msg.angular.x = self.finalRoll
        twist_msg.angular.y = self.finalPitch
        twist_msg.angular.z = self.yaw

        twist_msg.linear.x = 0
        twist_msg.linear.y = 0 
        twist_msg.linear.z = (message.i + message.k)

        self.twist_publisher.publish(twist_msg)

    def interpolate(self, a, b, dt):
        return ((1-dt) * a) + (dt * b)

if __name__ == '__main__':
    rospy.init_node('DroneControl')
    rate = rospy.Rate(300)
    DroneControl()
    rospy.spin()
    rate.sleep()
