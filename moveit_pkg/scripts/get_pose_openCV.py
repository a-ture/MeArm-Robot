#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from shape_msgs.msg import SolidPrimitive
from visualization_msgs.msg import Marker
from tf.transformations import euler_from_quaternion
import sys
import cv2
import numpy as np

# Inizializzazione della fotocamera
cap = cv2.VideoCapture(0)

# Inizializzazione del publisher ROS per la forma e il disegno
shape_pub = rospy.Publisher('shape_info', String, queue_size=10)
drawing_pub = rospy.Publisher('drawing', Marker, queue_size=10)

rospy.init_node('vision', anonymous=True)
rate = rospy.Rate(10)  # Frequenza di pubblicazione (10 Hz)
rospy.loginfo("La direzione viene pubblicata sulla topic '/direction'...")

# Inizializzazione delle variabili per la posizione e l'orientazione
positionX = -0.0023734011670250126
positionY = 0.026825106858739834
positionZ = 0.32402280551708873

orientationX = 0.4966690471541269
orientationY = -0.4966708043538031
orientationZ = -0.5033089303160498
orientationW = -0.5033071531040186

while (1):
    _, img = cap.read()

    # Conversione del frame (BGR) in HSV (tonalità-saturazione-valore)
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

    # Definizione del range di colore blu
    blue_lower = np.array([94, 123, 46], np.uint8)
    blue_upper = np.array([125, 255, 255], np.uint8)

    # Estrazione del colore blu dall'immagine
    blue = cv2.inRange(hsv, blue_lower, blue_upper)

    # Trasformazione morfologica, dilatazione
    kernal = np.ones((5, 5), "uint8")
    blue = cv2.dilate(blue, kernal)

    # Ricerca dei contorni nell'immagine
    contours, hierarchy = cv2.findContours(blue, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)


    if len(contours) > 0:
        # Trova il contorno più grande (la forma più grande)
        contour = max(contours, key=cv2.contourArea)
        area = cv2.contourArea(contour)
        if area > 800:
            # Trova il rettangolo circoscritto alla forma
            x, y, w, h = cv2.boundingRect(contour)

            # Calcola la posizione relativa alla forma
            OldRangeX = (640 - 0)
            NewRangeX = (0.2 - (-0.2))
            positionX = (((x - 0) * NewRangeX) / OldRangeX) + (-0.2)

            OldRangeY = (480 - 0)
            NewRangeY = (0.2 - (-0.2))
            positionY = (((y - 0) * NewRangeY) / OldRangeY) + (-0.2)

            positionZ = 0.0087

            orientationX = 0.0
            orientationY = 0.0
            orientationZ = 0.0
            orientationW = 1.0

            # Identifica la forma in base al numero di lati approssimati
            epsilon = 0.04 * cv2.arcLength(contour, True)
            approx = cv2.approxPolyDP(contour, epsilon, True)
            num_sides = len(approx)

            shape_info = "Sconosciuta"
            if num_sides == 3:
                shape_info = "Triangolo"
            elif num_sides == 4:
                shape_info = "Quadrato" if cv2.isContourConvex(approx) else "Rettangolo"
            elif num_sides == 5:
                shape_info = "Pentagono"
            elif num_sides >= 6:
                shape_info = "Cerchio"

            # Pubblica le informazioni sulla forma
            shape_pub.publish(shape_info)

            # Invia un messaggio di disegno al robot
            marker = Marker()
            marker.header.frame_id = "base_link"
            marker.header.stamp = rospy.Time.now()
            marker.type = Marker.SPHERE  # Cambia il tipo in base alla forma
            marker.action = Marker.ADD
            marker.pose.position.x = positionX
            marker.pose.position.y = positionY
            marker.pose.position.z = positionZ
            marker.pose.orientation.x = orientationX
            marker.pose.orientation.y = orientationY
            marker.pose.orientation.z = orientationZ
            marker.pose.orientation.w = orientationW
            marker.scale.x = 0.05  # Dimensione del disegno (puoi regolare)
            marker.scale.y = 0.05
            marker.scale.z = 0.05
            marker.color.a = 1.0
            marker.color.r = 1.0  # Colore del disegno (puoi regolare)
            marker.color.g = 0.0
            marker.color.b = 0.0

            drawing_pub.publish(marker)

    # Visualizzazione dell'immagine con il colore blu e il testo
    cv2.imshow("Maschera Blu", blue)
    cv2.imshow("Rilevamento Colore", img)

    # Gestione della pressione del tasto 'ESC' per uscire dal video
    k = cv2.waitKey(10) & 0xff
    if k == 27:
        break

    # Pubblicazione dei dati tramite ROS
    if not rospy.is_shutdown():
        p = Pose()
        p.position.x = positionX
        p.position.y = positionY
        p.position.z = positionZ
        p.orientation.x = orientationX
        p.orientation.y = orientationY
        p.orientation.z = orientationZ
        p.orientation.w = orientationW

        pub.publish(p)
        rate.sleep()

# Rilascio della fotocamera e chiusura delle finestre
cap.release()
cv2.destroyAllWindows()
