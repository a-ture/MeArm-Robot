
(cl:in-package :asdf)

(defsystem "vision_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "GeometricShape" :depends-on ("_package_GeometricShape"))
    (:file "_package_GeometricShape" :depends-on ("_package"))
  ))