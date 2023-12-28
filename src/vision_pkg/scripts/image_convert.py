import rospy
from sensor_msgs.msg import Image
import numpy as np

class ImageConverter:
    def __init__(self):
        pass
    
    # Metodo per convertire da OpenCV a ROS
    def cv_to_ros(self, cv_image):
        ros_image = Image()
        ros_image.header.stamp = rospy.Time.now()
        ros_image.height = cv_image.shape[0]
        ros_image.width = cv_image.shape[1]
        ros_image.encoding = "bgr8"
        ros_image.is_bigendian = False
        ros_image.step = cv_image.shape[1] * cv_image.shape[2]
        ros_image.data = np.array(cv_image).tostring()
        return ros_image
