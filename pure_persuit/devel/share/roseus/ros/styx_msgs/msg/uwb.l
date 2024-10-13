;; Auto-generated. Do not edit!


(when (boundp 'styx_msgs::uwb)
  (if (not (find-package "STYX_MSGS"))
    (make-package "STYX_MSGS"))
  (shadow 'uwb (find-package "STYX_MSGS")))
(unless (find-package "STYX_MSGS::UWB")
  (make-package "STYX_MSGS::UWB"))

(in-package "ROS")
;;//! \htmlinclude uwb.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass styx_msgs::uwb
  :super ros::object
  :slots (_header _pose _distance0 _distance1 _distance2 ))

(defmethod styx_msgs::uwb
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:distance0 __distance0) 0.0)
    ((:distance1 __distance1) 0.0)
    ((:distance2 __distance2) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _distance0 (float __distance0))
   (setq _distance1 (float __distance1))
   (setq _distance2 (float __distance2))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:distance0
   (&optional __distance0)
   (if __distance0 (setq _distance0 __distance0)) _distance0)
  (:distance1
   (&optional __distance1)
   (if __distance1 (setq _distance1 __distance1)) _distance1)
  (:distance2
   (&optional __distance2)
   (if __distance2 (setq _distance2 __distance2)) _distance2)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _distance0
    4
    ;; float32 _distance1
    4
    ;; float32 _distance2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _distance0
       (sys::poke _distance0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance1
       (sys::poke _distance1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance2
       (sys::poke _distance2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _distance0
     (setq _distance0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance1
     (setq _distance1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance2
     (setq _distance2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get styx_msgs::uwb :md5sum-) "100136466d037274d5e51cedbebd7e9f")
(setf (get styx_msgs::uwb :datatype-) "styx_msgs/uwb")
(setf (get styx_msgs::uwb :definition-)
      "Header header
geometry_msgs/Pose pose
float32 distance0
float32 distance1
float32 distance2

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :styx_msgs/uwb "100136466d037274d5e51cedbebd7e9f")


