; Auto-generated. Do not edit!


(cl:in-package vision_pkg-msg)


;//! \htmlinclude GeometricShape.msg.html

(cl:defclass <GeometricShape> (roslisp-msg-protocol:ros-message)
  ((shape_type
    :reader shape_type
    :initarg :shape_type
    :type cl:string
    :initform "")
   (key_points
    :reader key_points
    :initarg :key_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass GeometricShape (<GeometricShape>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GeometricShape>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GeometricShape)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision_pkg-msg:<GeometricShape> is deprecated: use vision_pkg-msg:GeometricShape instead.")))

(cl:ensure-generic-function 'shape_type-val :lambda-list '(m))
(cl:defmethod shape_type-val ((m <GeometricShape>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision_pkg-msg:shape_type-val is deprecated.  Use vision_pkg-msg:shape_type instead.")
  (shape_type m))

(cl:ensure-generic-function 'key_points-val :lambda-list '(m))
(cl:defmethod key_points-val ((m <GeometricShape>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision_pkg-msg:key_points-val is deprecated.  Use vision_pkg-msg:key_points instead.")
  (key_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GeometricShape>) ostream)
  "Serializes a message object of type '<GeometricShape>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'shape_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'shape_type))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'key_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'key_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GeometricShape>) istream)
  "Deserializes a message object of type '<GeometricShape>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shape_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'shape_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'key_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'key_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GeometricShape>)))
  "Returns string type for a message object of type '<GeometricShape>"
  "vision_pkg/GeometricShape")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GeometricShape)))
  "Returns string type for a message object of type 'GeometricShape"
  "vision_pkg/GeometricShape")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GeometricShape>)))
  "Returns md5sum for a message object of type '<GeometricShape>"
  "2ca4cd4b5167d5ea4d1ac1c67df51125")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GeometricShape)))
  "Returns md5sum for a message object of type 'GeometricShape"
  "2ca4cd4b5167d5ea4d1ac1c67df51125")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GeometricShape>)))
  "Returns full string definition for message of type '<GeometricShape>"
  (cl:format cl:nil "string shape_type~%geometry_msgs/Point[] key_points~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GeometricShape)))
  "Returns full string definition for message of type 'GeometricShape"
  (cl:format cl:nil "string shape_type~%geometry_msgs/Point[] key_points~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GeometricShape>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'shape_type))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'key_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GeometricShape>))
  "Converts a ROS message object to a list"
  (cl:list 'GeometricShape
    (cl:cons ':shape_type (shape_type msg))
    (cl:cons ':key_points (key_points msg))
))
