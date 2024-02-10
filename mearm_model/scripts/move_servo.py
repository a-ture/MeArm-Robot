#!/usr/bin/env python3

import rospy
from mearm_model.srv import MoveArm, MoveArmResponse
from mearm_model.msg import ServoAngles

pub = rospy.Publisher('servo_control', ServoAngles, queue_size=10)

def handle_set_servo_pose(req):
    # Ottieni i valori dei servo dai parametri ROS in base a position_id
    param_name = f"pose_{req.position_id}"
    if rospy.has_param(param_name):
        pose = rospy.get_param(param_name)
        angles = ServoAngles()
        angles.servo1 = pose['servo1']
        angles.servo2 = pose['servo2']
        angles.servo3 = pose['servo3']
        angles.servo4 = pose['servo4']
        pub.publish(angles)
        return MoveArmResponse(True)
    else:
        rospy.logwarn(f"Position ID {req.position_id} not found.")
        return MoveArmResponse(False)

def servo_pose_server():
    rospy.init_node('servo_pose_server')
    s = rospy.Service('set_servo_pose', MoveArm, handle_set_servo_pose)
    rospy.spin()

if __name__ == '__main__':
    servo_pose_server()
