;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::control2)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'control2 (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::CONTROL2")
  (make-package "CL_MSGS::CONTROL2"))

(in-package "ROS")
;;//! \htmlinclude control2.msg.html


(defclass cl_msgs::control2
  :super ros::object
  :slots (_Target_Brk_Press _Target_Steer_F _Target_Steer_F_En _Target_Steer_R _Target_Steer_R_En _EPB_Switch _Target_Mode ))

(defmethod cl_msgs::control2
  (:init
   (&key
    ((:Target_Brk_Press __Target_Brk_Press) 0.0)
    ((:Target_Steer_F __Target_Steer_F) 0)
    ((:Target_Steer_F_En __Target_Steer_F_En) 0)
    ((:Target_Steer_R __Target_Steer_R) 0)
    ((:Target_Steer_R_En __Target_Steer_R_En) 0)
    ((:EPB_Switch __EPB_Switch) 0)
    ((:Target_Mode __Target_Mode) 0)
    )
   (send-super :init)
   (setq _Target_Brk_Press (float __Target_Brk_Press))
   (setq _Target_Steer_F (round __Target_Steer_F))
   (setq _Target_Steer_F_En (round __Target_Steer_F_En))
   (setq _Target_Steer_R (round __Target_Steer_R))
   (setq _Target_Steer_R_En (round __Target_Steer_R_En))
   (setq _EPB_Switch (round __EPB_Switch))
   (setq _Target_Mode (round __Target_Mode))
   self)
  (:Target_Brk_Press
   (&optional __Target_Brk_Press)
   (if __Target_Brk_Press (setq _Target_Brk_Press __Target_Brk_Press)) _Target_Brk_Press)
  (:Target_Steer_F
   (&optional __Target_Steer_F)
   (if __Target_Steer_F (setq _Target_Steer_F __Target_Steer_F)) _Target_Steer_F)
  (:Target_Steer_F_En
   (&optional __Target_Steer_F_En)
   (if __Target_Steer_F_En (setq _Target_Steer_F_En __Target_Steer_F_En)) _Target_Steer_F_En)
  (:Target_Steer_R
   (&optional __Target_Steer_R)
   (if __Target_Steer_R (setq _Target_Steer_R __Target_Steer_R)) _Target_Steer_R)
  (:Target_Steer_R_En
   (&optional __Target_Steer_R_En)
   (if __Target_Steer_R_En (setq _Target_Steer_R_En __Target_Steer_R_En)) _Target_Steer_R_En)
  (:EPB_Switch
   (&optional __EPB_Switch)
   (if __EPB_Switch (setq _EPB_Switch __EPB_Switch)) _EPB_Switch)
  (:Target_Mode
   (&optional __Target_Mode)
   (if __Target_Mode (setq _Target_Mode __Target_Mode)) _Target_Mode)
  (:serialization-length
   ()
   (+
    ;; float32 _Target_Brk_Press
    4
    ;; uint16 _Target_Steer_F
    2
    ;; uint8 _Target_Steer_F_En
    1
    ;; uint16 _Target_Steer_R
    2
    ;; uint8 _Target_Steer_R_En
    1
    ;; uint8 _EPB_Switch
    1
    ;; uint8 _Target_Mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Target_Brk_Press
       (sys::poke _Target_Brk_Press (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _Target_Steer_F
       (write-word _Target_Steer_F s)
     ;; uint8 _Target_Steer_F_En
       (write-byte _Target_Steer_F_En s)
     ;; uint16 _Target_Steer_R
       (write-word _Target_Steer_R s)
     ;; uint8 _Target_Steer_R_En
       (write-byte _Target_Steer_R_En s)
     ;; uint8 _EPB_Switch
       (write-byte _EPB_Switch s)
     ;; uint8 _Target_Mode
       (write-byte _Target_Mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Target_Brk_Press
     (setq _Target_Brk_Press (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _Target_Steer_F
     (setq _Target_Steer_F (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Target_Steer_F_En
     (setq _Target_Steer_F_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _Target_Steer_R
     (setq _Target_Steer_R (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _Target_Steer_R_En
     (setq _Target_Steer_R_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _EPB_Switch
     (setq _EPB_Switch (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Target_Mode
     (setq _Target_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get cl_msgs::control2 :md5sum-) "02be7a927824000275f436c65ca9b8d0")
(setf (get cl_msgs::control2 :datatype-) "cl_msgs/control2")
(setf (get cl_msgs::control2 :definition-)
      "float32 Target_Brk_Press
uint16 Target_Steer_F
uint8 Target_Steer_F_En
uint16 Target_Steer_R
uint8 Target_Steer_R_En
uint8 EPB_Switch
uint8 Target_Mode

")



(provide :cl_msgs/control2 "02be7a927824000275f436c65ca9b8d0")


