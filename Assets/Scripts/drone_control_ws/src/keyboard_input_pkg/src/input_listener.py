#!/usr/bin/python3
import rospy
import keyboard
from drone_input_msgs.msg import DroneControlInput

class InputListener:
    def __init__(self):
        self.counter = 0
        self.pub = rospy.Publisher("/keyboard_input", DroneControlInput, queue_size=10)
        while not rospy.is_shutdown():
            msg = DroneControlInput()
            
            if keyboard.is_pressed('w'):
                msg.w = 1
            else:
                msg.w = 0

            if keyboard.is_pressed('a'):
                msg.a = 1
            else:
                msg.a = 0

            if keyboard.is_pressed('s'):
                msg.s = -1
            else:
                msg.s = 0

            if keyboard.is_pressed('d'):
                msg.d = -1
            else:
                msg.d = 0
            
            if keyboard.is_pressed('i'):
                msg.i = 1
            else:
                msg.i = 0

            if keyboard.is_pressed('j'):
                msg.j = -1
            else:
                msg.j = 0

            if keyboard.is_pressed('k'):
                msg.k = -1
            else:
                msg.k = 0

            if keyboard.is_pressed('l'):
                msg.l = 1
            else:
                msg.l = 0

            self.pub.publish(msg)

if __name__ == '__main__':
    rospy.init_node('InputListener')
    rate = rospy.Rate(100)
    InputListener()
    rospy.spin()
    rate.sleep()