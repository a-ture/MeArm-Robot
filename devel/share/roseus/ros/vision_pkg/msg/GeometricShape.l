;; Auto-generated. Do not edit!


(when (boundp 'vision_pkg::GeometricShape)
  (if (not (find-package "VISION_PKG"))
    (make-package "VISION_PKG"))
  (shadow 'GeometricShape (find-package "VISION_PKG")))
(unless (find-package "VISION_PKG::GEOMETRICSHAPE")
  (make-package "VISION_PKG::GEOMETRICSHAPE"))

(in-package "ROS")
;;//! \htmlinclude GeometricShape.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass vision_pkg::GeometricShape
  :super ros::object
  :slots (_shape_type _key_points ))

(defmethod vision_pkg::GeometricShape
  (:init
   (&key
    ((:shape_type __shape_type) "")
    ((:key_points __key_points) ())
    )
   (send-super :init)
   (setq _shape_type (string __shape_type))
   (setq _key_points __key_points)
   self)
  (:shape_type
   (&optional __shape_type)
   (if __shape_type (setq _shape_type __shape_type)) _shape_type)
  (:key_points
   (&rest __key_points)
   (if (keywordp (car __key_points))
       (send* _key_points __key_points)
     (progn
       (if __key_points (setq _key_points (car __key_points)))
       _key_points)))
  (:serialization-length
   ()
   (+
    ;; string _shape_type
    4 (length _shape_type)
    ;; geometry_msgs/Point[] _key_points
    (apply #'+ (send-all _key_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _shape_type
       (write-long (length _shape_type) s) (princ _shape_type s)
     ;; geometry_msgs/Point[] _key_points
     (write-long (length _key_points) s)
     (dolist (elem _key_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _shape_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point[] _key_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _key_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _key_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vision_pkg::GeometricShape :md5sum-) "2ca4cd4b5167d5ea4d1ac1c67df51125")
(setf (get vision_pkg::GeometricShape :datatype-) "vision_pkg/GeometricShape")
(setf (get vision_pkg::GeometricShape :definition-)
      "string shape_type
geometry_msgs/Point[] key_points

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :vision_pkg/GeometricShape "2ca4cd4b5167d5ea4d1ac1c67df51125")


