#include <Servo.h>

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

void setup() {
  // Inizializza i servo motori
  servo1.attach(9);   // Collega il servo1 al pin 9
  servo2.attach(10);  // Collega il servo2 al pin 10
  servo3.attach(11);  // Collega il servo3 al pin 11
  servo4.attach(12);  // Collega il servo4 al pin 12

  // Inizializza la comunicazione seriale
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    // Leggi i comandi inviati dal nodo ROS
    int servo1Pos = Serial.parseInt();
    int servo2Pos = Serial.parseInt();
    int servo3Pos = Serial.parseInt();
    int servo4Pos = Serial.parseInt();

    // Controlla che i comandi siano validi (0-180) e muovi i servo
    if (servo1Pos >= 0 && servo1Pos <= 180 &&
        servo2Pos >= 0 && servo2Pos <= 180 &&
        servo3Pos >= 0 && servo3Pos <= 180 &&
        servo4Pos >= 0 && servo4Pos <= 180) {
      servo1.write(servo1Pos);
      servo2.write(servo2Pos);
      servo3.write(servo3Pos);
      servo4.write(servo4Pos);

      // Invia conferma al nodo ROS
      Serial.println("Comandi ricevuti e servo posizionati correttamente.");
    } else {
      // Invia messaggio di errore al nodo ROS
      Serial.println("Comandi non validi.");
    }
  }
}
