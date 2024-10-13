
(cl:in-package :asdf)

(defsystem "styx_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CarState" :depends-on ("_package_CarState"))
    (:file "_package_CarState" :depends-on ("_package"))
    (:file "EStop" :depends-on ("_package_EStop"))
    (:file "_package_EStop" :depends-on ("_package"))
    (:file "Lane" :depends-on ("_package_Lane"))
    (:file "_package_Lane" :depends-on ("_package"))
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
    (:file "TrafficLight" :depends-on ("_package_TrafficLight"))
    (:file "_package_TrafficLight" :depends-on ("_package"))
    (:file "TrafficLightArray" :depends-on ("_package_TrafficLightArray"))
    (:file "_package_TrafficLightArray" :depends-on ("_package"))
    (:file "Waypoint" :depends-on ("_package_Waypoint"))
    (:file "_package_Waypoint" :depends-on ("_package"))
    (:file "model" :depends-on ("_package_model"))
    (:file "_package_model" :depends-on ("_package"))
    (:file "uwb" :depends-on ("_package_uwb"))
    (:file "_package_uwb" :depends-on ("_package"))
  ))