#!/usr/bin/env python

import cv2
import numpy as np
import rospy
import sys
import geometry_msgs.msg
from sensor_msgs.msg import Image
from vision_pkg.msg import GeometricShape
from image_convert import ImageConverter

class CameraNode:
    def __init__(self):
        rospy.init_node('camera_node', anonymous=True)
        self.shape_pub = rospy.Publisher('recognized_shape', GeometricShape, queue_size=10)
        self.image_pub = rospy.Publisher('camera_image', Image, queue_size=10)
        self.capture = cv2.VideoCapture(0)
        self.converter = ImageConverter()

        if not self.capture.isOpened():
            rospy.logerr("Could not open camera")
            sys.exit(-1)

    def process_image(self, frame):
        # Converti in HSV e in scala di grigi
        hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        # Rileva il foglio bianco
        _, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY)
        contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        # Assicurati di avere contorni prima di proseguire
        if not contours:
            return frame

        for cnt in contours:
            # Filtra i contorni in base all'area e alla forma
            area = cv2.contourArea(cnt)
            x, y, w, h = cv2.boundingRect(cnt)

            if area > 100 and w/h < 1.5:  # 1.5 è un esempio di rapporto aspetto
                approx = cv2.approxPolyDP(cnt, 0.01 * cv2.arcLength(cnt, True), True)
                if len(approx) == 3:
                    shape_name = "Triangolo"
                elif len(approx) == 4:
                    shape_name = "Quadrato"
                elif len(approx) > 10:
                    shape_name = "Cerchio"
                else:
                    shape_name = "Sconosciuto"

                shape_msg = GeometricShape()  # Crea un messaggio GeometricShape
                shape_msg.shape_type = shape_name  # Imposta il tipo di figura

                # Converti i punti approx in Point messages e aggiungili a shape_msg.key_points
                for p in approx:
                    point = geometry_msgs.msg.Point()
                    point.x = p[0][0]
                    point.y = p[0][1]
                    point.z = 0  # Imposta z a 0 se lavori in 2D
                    shape_msg.key_points.append(point)

                self.shape_pub.publish(shape_msg)
                # Disegna i contorni e il nome della forma
                cv2.drawContours(frame, [approx], 0, (0, 255, 0), 3)
                cv2.putText(frame, shape_name, (x, y), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2)

        
        return frame

    def publish_frame(self):
        ret, frame = self.capture.read()
        if ret:
            processed_image = self.process_image(frame)
            ros_image = self.converter.cv_to_ros(processed_image)
            self.image_pub.publish(ros_image)
            cv2.imshow("Processed Image", processed_image)
            cv2.waitKey(1)

    def run(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.publish_frame()
            rate.sleep()

if __name__ == '__main__':
    camera_node = CameraNode()
    try:
        camera_node.run()
    except rospy.ROSInterruptException:
        pass
    finally:
        camera_node.capture.release()
        cv2.destroyAllWindows()

