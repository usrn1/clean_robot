;; Auto-generated. Do not edit!


(when (boundp 'styx_msgs::Position)
  (if (not (find-package "STYX_MSGS"))
    (make-package "STYX_MSGS"))
  (shadow 'Position (find-package "STYX_MSGS")))
(unless (find-package "STYX_MSGS::POSITION")
  (make-package "STYX_MSGS::POSITION"))

(in-package "ROS")
;;//! \htmlinclude Position.msg.html


(defclass styx_msgs::Position
  :super ros::object
  :slots (_latitude _longitude _yaw ))

(defmethod styx_msgs::Position
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _yaw (float __yaw))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get styx_msgs::Position :md5sum-) "1eb7a48b066869c948b4808bcc575127")
(setf (get styx_msgs::Position :datatype-) "styx_msgs/Position")
(setf (get styx_msgs::Position :definition-)
      "float64 latitude
float64 longitude
float64 yaw
")



(provide :styx_msgs/Position "1eb7a48b066869c948b4808bcc575127")


