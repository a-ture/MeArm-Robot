#!/usr/bin/env python3


import rospy
from sensor_msgs.msg import JointState
from mearm_model.msg import ServoAngles
from mearm_model.srv import MoveArm, MoveArmResponse

# Costanti per i nomi dei giunti e altre configurazioni
JOINT_NAMES = ['joint_0', 'joint_1', 'joint_2', 'joint_3']
PUB_TOPIC = 'servo_pose_server'
SERVO_ANGLE_CONVERSION = 180.0 / 3.14159  # Radianti a gradi
INTERPOLATION_STEPS = 10  # Numero di step intermedi per l'interpolazione
STEP_DURATION = 0.5  # Durata di ogni step in secondi

# Inizializza il publisher
pub = rospy.Publisher(PUB_TOPIC, ServoAngles, queue_size=10)

def create_servo_angles(pose):
    """Crea un oggetto ServoAngles dai valori della pose."""
    angles = ServoAngles()
    angles.servo1, angles.servo2, angles.servo3, angles.servo4 = pose['servo1'], pose['servo2'], pose['servo3'], pose['servo4']
    return angles

def joint_states_callback(data):
    angles = ServoAngles()
    for i, name in enumerate(data.name):
        if name in JOINT_NAMES:
            servo_index = JOINT_NAMES.index(name)
            angle = int(round(data.position[i] * SERVO_ANGLE_CONVERSION))
            setattr(angles, f'servo{servo_index + 1}', angle)
    pub.publish(angles)

def main():
    rospy.init_node('mearm_controller')
    rospy.Subscriber('joint_states', JointState, joint_states_callback)
    rospy.spin()

if __name__ == '__main__':
    main()
