#!/usr/bin/env python

import rospy
from vision_pkg.msg import GeometricShape  # Importa il tuo messaggio personalizzato


def shape_callback(msg):
    rospy.loginfo("Ricevuta figura: %s" % msg.shape_type)
    
    if msg.shape_type == "Triangolo":
        # Implementa la logica per muovere il braccio e disegnare un triangolo
        pass
    elif msg.shape_type == "Quadrato":
        # Implementa la logica per muovere il braccio e disegnare un quadrato
        pass
    elif msg.shape_type == "Cerchio":
        # Implementa la logica per muovere il braccio e disegnare un cerchio
        pass
    else:
        rospy.loginfo("Figura non riconosciuta o non implementata")


def arm_control_node():
    """
    Funzione principale per inizializzare il nodo e sottoscriversi al topic.
    """
    rospy.init_node('arm_control_node', anonymous=True)
    rospy.Subscriber('recognized_shape', GeometricShape, shape_callback)

    # Mantieni il nodo in esecuzione finché non viene interrotto
    rospy.spin()

if __name__ == '__main__':
    try:
        arm_control_node()
    except rospy.ROSInterruptException:
        pass
