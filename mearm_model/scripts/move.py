#!/usr/bin/env python3
import rospy
from mearm_model.srv import MoveJoints, MoveJointsResponse
from sensor_msgs.msg import JointState

#rosservice call /select_position_set "set_name: 'set3'"
#rosrun rosserial_python serial_node.py _port:=/dev/ttyACM0 _baud:=115200

def handle_select_position_set(req):
    global joint_state
    position_set = rospy.get_param('/position_sets/' + req.set_name, None)
    
    if position_set is not None:
        joint_state.position = position_set
        return MoveJointsResponse(success=True)
    else:
        rospy.logwarn("Set di posizioni non trovato: " + req.set_name)
        return MoveJointsResponse(success=False)

def move_robot():
    global joint_state
    rospy.init_node('robot_joint_mover')

    pub = rospy.Publisher('/joint_states', JointState, queue_size=10)
    rospy.Service('select_position_set', MoveJoints, handle_select_position_set)

    rate = rospy.Rate(10)  # 10 Hz

    joint_state = JointState()
    joint_state.name = ['joint_0', 'joint_1', 'joint_2', 'joint_3']
    joint_state.position = [0, 0, 0, 0]

    while not rospy.is_shutdown():
        joint_state.header.stamp = rospy.Time.now()
        pub.publish(joint_state)
        rate.sleep()

if __name__ == '__main__':
    try:
        move_robot()
    except rospy.ROSInterruptException:
        pass
