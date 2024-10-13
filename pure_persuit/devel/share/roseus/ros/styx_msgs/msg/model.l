;; Auto-generated. Do not edit!


(when (boundp 'styx_msgs::model)
  (if (not (find-package "STYX_MSGS"))
    (make-package "STYX_MSGS"))
  (shadow 'model (find-package "STYX_MSGS")))
(unless (find-package "STYX_MSGS::MODEL")
  (make-package "STYX_MSGS::MODEL"))

(in-package "ROS")
;;//! \htmlinclude model.msg.html


(defclass styx_msgs::model
  :super ros::object
  :slots (_a ))

(defmethod styx_msgs::model
  (:init
   (&key
    ((:a __a) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; int32 _a
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _a
       (write-long _a s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _a
     (setq _a (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get styx_msgs::model :md5sum-) "5c9fb1a886e81e3162a5c87bf55c072b")
(setf (get styx_msgs::model :datatype-) "styx_msgs/model")
(setf (get styx_msgs::model :definition-)
      "int32 a
")



(provide :styx_msgs/model "5c9fb1a886e81e3162a5c87bf55c072b")


