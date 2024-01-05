#!/usr/bin/env python3

import rospy
from mearm_model.msg import ArmPosition
from mearm_model import MoveArm, MoveArmResponse
import yaml

class MeArmController:
    def __init__(self):
        rospy.init_node('mearm_controller')

        # Leggi le posizioni predefinite dal Parameter Server
        self.positions = self.load_positions_from_parameter_server()

        # Crea un servizio per muovere il braccio
        self.move_arm_service = rospy.Service('move_arm', MoveArm, self.handle_move_arm)

    def load_positions_from_parameter_server(self):
        try:
            positions = rospy.get_param('/mearm_positions')
            return positions
        except KeyError:
            rospy.logerr("Posizioni del braccio non trovate nel Parameter Server. Assicurati di configurarle correttamente.")
            return {}

    def handle_move_arm(self, req):
        position_name = req.position_name

        if position_name in self.positions:
            position = self.positions[position_name]
            # Inserisci qui la logica per muovere il braccio nella posizione desiderata
            rospy.loginfo("Moving MeArm to position: %s", position_name)
            # Implementa il controllo effettivo del braccio qui

            return MoveArmResponse(success=True)
        else:
            rospy.logwarn("Position '%s' non trovata nelle posizioni predefinite.", position_name)
            return MoveArmResponse(success=False)

if __name__ == '__main__':
    try:
        mearm_controller = MeArmController()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
