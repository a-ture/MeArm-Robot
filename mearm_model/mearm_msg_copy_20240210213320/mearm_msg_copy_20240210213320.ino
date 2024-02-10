
#include <Servo.h>
#include <ros.h>
#include <mearm_model/ServoAngles.h>

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

ros::NodeHandle nh;

void servoCallback(const mearm_model::ServoAngles& angles_msg) {
  servo1.write(angles_msg.servo1); // Imposta l'angolo del primo servo
  servo2.write(angles_msg.servo2); // Imposta l'angolo del secondo servo
  servo3.write(angles_msg.servo3); // Imposta l'angolo del terzo servo
  servo4.write(angles_msg.servo4); // Imposta l'angolo del quarto servo
}
ros::Subscriber<mearm_model::ServoAngles> sub("servo_control", &servoCallback);

void setup() {
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.subscribe(sub);

  // Correggi i collegamenti dei servo ai pin
  servo1.attach(9);  // Collega il primo servo al pin 9
  servo2.attach(10); // Collega il secondo servo al pin 10
  servo3.attach(11); // Collega il terzo servo al pin 11
  servo4.attach(12); // Collega il quarto servo al pin 12
}

void loop() {
  nh.spinOnce();
}