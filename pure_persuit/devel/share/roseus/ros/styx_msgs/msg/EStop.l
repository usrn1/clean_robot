;; Auto-generated. Do not edit!


(when (boundp 'styx_msgs::EStop)
  (if (not (find-package "STYX_MSGS"))
    (make-package "STYX_MSGS"))
  (shadow 'EStop (find-package "STYX_MSGS")))
(unless (find-package "STYX_MSGS::ESTOP")
  (make-package "STYX_MSGS::ESTOP"))

(in-package "ROS")
;;//! \htmlinclude EStop.msg.html


(defclass styx_msgs::EStop
  :super ros::object
  :slots (_EStop ))

(defmethod styx_msgs::EStop
  (:init
   (&key
    ((:EStop __EStop) nil)
    )
   (send-super :init)
   (setq _EStop __EStop)
   self)
  (:EStop
   (&optional __EStop)
   (if __EStop (setq _EStop __EStop)) _EStop)
  (:serialization-length
   ()
   (+
    ;; bool _EStop
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _EStop
       (if _EStop (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _EStop
     (setq _EStop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get styx_msgs::EStop :md5sum-) "15c187ac41fba10560c992ebbf27db9f")
(setf (get styx_msgs::EStop :datatype-) "styx_msgs/EStop")
(setf (get styx_msgs::EStop :definition-)
      "bool EStop
")



(provide :styx_msgs/EStop "15c187ac41fba10560c992ebbf27db9f")


