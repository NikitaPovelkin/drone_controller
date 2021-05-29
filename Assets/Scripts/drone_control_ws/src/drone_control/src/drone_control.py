#!/usr/bin/python3
import rospy
import keyboard
from geometry_msgs.msg import Twist
from drone_input_msgs.msg import DroneControlInput
from simple_pid import PID

class DroneControl:
    def __init__(self):
        self.last_callback_time = 0
        self.not_first_callback = False
        self.finalPitch = 0
        self.finalRoll = 0
        self.finalYaw = 0
        self.yaw = 0
        self.deltaTime = 0
        self.filter = 0.5
        self.minMaxPitch = 30
        self.minMaxRoll = 30
        self.yawPower = 2

        self.twist_publisher = rospy.Publisher("/twist", Twist, queue_size=10)
        self.keyboard_input_subscriber = rospy.Subscriber("/keyboard_input", DroneControlInput, self.drone_control_callback)
        
    def drone_control_callback(self, message):
        twist_msg = Twist()
        callback_time = rospy.get_time()

        pitch = (message.w + message.s) * self.minMaxPitch
        roll = (message.a + message.d) * self.minMaxRoll
        self.yaw += (message.j + message.l) * self.yawPower
        
        self.finalPitch = self.interpolate(self.finalPitch, pitch, self.filter)
        self.finalRoll = self.interpolate(self.finalRoll, roll, self.filter)
        self.finalYaw = self.interpolate(self.finalYaw, self.yaw, 0.8)
    
        twist_msg.angular.x = self.finalRoll
        twist_msg.angular.y = self.finalPitch
        twist_msg.angular.z = self.finalYaw

        twist_msg.linear.x = 0
        twist_msg.linear.y = 0 
        twist_msg.linear.z = (message.i + message.k)

        self.twist_publisher.publish(twist_msg)

    def interpolate(self, a, b, dt):
        return ((1-dt) * a) + (dt * b)

if __name__ == '__main__':
    rospy.init_node('DroneControl')
    rate = rospy.Rate(20)
    DroneControl()
    rospy.spin()
    rate.sleep()