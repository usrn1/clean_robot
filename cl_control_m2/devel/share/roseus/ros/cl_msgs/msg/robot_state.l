;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::robot_state)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'robot_state (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::ROBOT_STATE")
  (make-package "CL_MSGS::ROBOT_STATE"))

(in-package "ROS")
;;//! \htmlinclude robot_state.msg.html


(defclass cl_msgs::robot_state
  :super ros::object
  :slots (_Battery_Voltage ))

(defmethod cl_msgs::robot_state
  (:init
   (&key
    ((:Battery_Voltage __Battery_Voltage) 0.0)
    )
   (send-super :init)
   (setq _Battery_Voltage (float __Battery_Voltage))
   self)
  (:Battery_Voltage
   (&optional __Battery_Voltage)
   (if __Battery_Voltage (setq _Battery_Voltage __Battery_Voltage)) _Battery_Voltage)
  (:serialization-length
   ()
   (+
    ;; float32 _Battery_Voltage
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Battery_Voltage
       (sys::poke _Battery_Voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Battery_Voltage
     (setq _Battery_Voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cl_msgs::robot_state :md5sum-) "07ecd9f6cbdbd3754f8acf0447d36bfd")
(setf (get cl_msgs::robot_state :datatype-) "cl_msgs/robot_state")
(setf (get cl_msgs::robot_state :definition-)
      "float32 Battery_Voltage

")



(provide :cl_msgs/robot_state "07ecd9f6cbdbd3754f8acf0447d36bfd")


