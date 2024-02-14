
#include <Servo.h>
#include <ros.h>
#include <mearm_model/ServoAngles.h>  // Include solo ServoAngles

Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;

ros::NodeHandle nh;

void servoAnglesCallback(const mearm_model::ServoAngles& angles_msg) {
  servo1.write(angles_msg.servo1);
  servo2.write(angles_msg.servo2);
  servo3.write(angles_msg.servo3);
  servo4.write(angles_msg.servo4);
}

// Sottoscrivi solo al topic servo_pose_server per i messaggi ServoAngles
ros::Subscriber<mearm_model::ServoAngles> servoAnglesSub("servo_pose_server", &servoAnglesCallback);

void setup() {
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.subscribe(servoAnglesSub);

  servo1.attach(9);
  servo2.attach(10);
  servo3.attach(11);
  servo4.attach(12);
}

void loop() {
  nh.spinOnce();
}
