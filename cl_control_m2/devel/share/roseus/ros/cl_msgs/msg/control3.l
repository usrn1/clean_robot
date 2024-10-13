;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::control3)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'control3 (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::CONTROL3")
  (make-package "CL_MSGS::CONTROL3"))

(in-package "ROS")
;;//! \htmlinclude control3.msg.html


(defclass cl_msgs::control3
  :super ros::object
  :slots (_LF_Rpm _RF_Rpm _LR_Rpm _RR_Rpm _LF_Motor_Gear _RF_Motor_Gear _LR_Motor_Gear _RR_Motor_Gear _LF_Motor_En _RF_Motor_En _LR_Motor_En _RR_Motor_En _LF_Motor_Brake _RF_Motor_Brake _LR_Motor_Brake _RR_Motor_Brake _Target_Brk_Press _Target_Steer_F _Target_Steer_F_En _Target_Steer_R _Target_Steer_R_En _EPB_Switch _Target_Mode ))

(defmethod cl_msgs::control3
  (:init
   (&key
    ((:LF_Rpm __LF_Rpm) 0)
    ((:RF_Rpm __RF_Rpm) 0)
    ((:LR_Rpm __LR_Rpm) 0)
    ((:RR_Rpm __RR_Rpm) 0)
    ((:LF_Motor_Gear __LF_Motor_Gear) 0)
    ((:RF_Motor_Gear __RF_Motor_Gear) 0)
    ((:LR_Motor_Gear __LR_Motor_Gear) 0)
    ((:RR_Motor_Gear __RR_Motor_Gear) 0)
    ((:LF_Motor_En __LF_Motor_En) 0)
    ((:RF_Motor_En __RF_Motor_En) 0)
    ((:LR_Motor_En __LR_Motor_En) 0)
    ((:RR_Motor_En __RR_Motor_En) 0)
    ((:LF_Motor_Brake __LF_Motor_Brake) 0)
    ((:RF_Motor_Brake __RF_Motor_Brake) 0)
    ((:LR_Motor_Brake __LR_Motor_Brake) 0)
    ((:RR_Motor_Brake __RR_Motor_Brake) 0)
    ((:Target_Brk_Press __Target_Brk_Press) 0.0)
    ((:Target_Steer_F __Target_Steer_F) 0)
    ((:Target_Steer_F_En __Target_Steer_F_En) 0)
    ((:Target_Steer_R __Target_Steer_R) 0)
    ((:Target_Steer_R_En __Target_Steer_R_En) 0)
    ((:EPB_Switch __EPB_Switch) 0)
    ((:Target_Mode __Target_Mode) 0)
    )
   (send-super :init)
   (setq _LF_Rpm (round __LF_Rpm))
   (setq _RF_Rpm (round __RF_Rpm))
   (setq _LR_Rpm (round __LR_Rpm))
   (setq _RR_Rpm (round __RR_Rpm))
   (setq _LF_Motor_Gear (round __LF_Motor_Gear))
   (setq _RF_Motor_Gear (round __RF_Motor_Gear))
   (setq _LR_Motor_Gear (round __LR_Motor_Gear))
   (setq _RR_Motor_Gear (round __RR_Motor_Gear))
   (setq _LF_Motor_En (round __LF_Motor_En))
   (setq _RF_Motor_En (round __RF_Motor_En))
   (setq _LR_Motor_En (round __LR_Motor_En))
   (setq _RR_Motor_En (round __RR_Motor_En))
   (setq _LF_Motor_Brake (round __LF_Motor_Brake))
   (setq _RF_Motor_Brake (round __RF_Motor_Brake))
   (setq _LR_Motor_Brake (round __LR_Motor_Brake))
   (setq _RR_Motor_Brake (round __RR_Motor_Brake))
   (setq _Target_Brk_Press (float __Target_Brk_Press))
   (setq _Target_Steer_F (round __Target_Steer_F))
   (setq _Target_Steer_F_En (round __Target_Steer_F_En))
   (setq _Target_Steer_R (round __Target_Steer_R))
   (setq _Target_Steer_R_En (round __Target_Steer_R_En))
   (setq _EPB_Switch (round __EPB_Switch))
   (setq _Target_Mode (round __Target_Mode))
   self)
  (:LF_Rpm
   (&optional __LF_Rpm)
   (if __LF_Rpm (setq _LF_Rpm __LF_Rpm)) _LF_Rpm)
  (:RF_Rpm
   (&optional __RF_Rpm)
   (if __RF_Rpm (setq _RF_Rpm __RF_Rpm)) _RF_Rpm)
  (:LR_Rpm
   (&optional __LR_Rpm)
   (if __LR_Rpm (setq _LR_Rpm __LR_Rpm)) _LR_Rpm)
  (:RR_Rpm
   (&optional __RR_Rpm)
   (if __RR_Rpm (setq _RR_Rpm __RR_Rpm)) _RR_Rpm)
  (:LF_Motor_Gear
   (&optional __LF_Motor_Gear)
   (if __LF_Motor_Gear (setq _LF_Motor_Gear __LF_Motor_Gear)) _LF_Motor_Gear)
  (:RF_Motor_Gear
   (&optional __RF_Motor_Gear)
   (if __RF_Motor_Gear (setq _RF_Motor_Gear __RF_Motor_Gear)) _RF_Motor_Gear)
  (:LR_Motor_Gear
   (&optional __LR_Motor_Gear)
   (if __LR_Motor_Gear (setq _LR_Motor_Gear __LR_Motor_Gear)) _LR_Motor_Gear)
  (:RR_Motor_Gear
   (&optional __RR_Motor_Gear)
   (if __RR_Motor_Gear (setq _RR_Motor_Gear __RR_Motor_Gear)) _RR_Motor_Gear)
  (:LF_Motor_En
   (&optional __LF_Motor_En)
   (if __LF_Motor_En (setq _LF_Motor_En __LF_Motor_En)) _LF_Motor_En)
  (:RF_Motor_En
   (&optional __RF_Motor_En)
   (if __RF_Motor_En (setq _RF_Motor_En __RF_Motor_En)) _RF_Motor_En)
  (:LR_Motor_En
   (&optional __LR_Motor_En)
   (if __LR_Motor_En (setq _LR_Motor_En __LR_Motor_En)) _LR_Motor_En)
  (:RR_Motor_En
   (&optional __RR_Motor_En)
   (if __RR_Motor_En (setq _RR_Motor_En __RR_Motor_En)) _RR_Motor_En)
  (:LF_Motor_Brake
   (&optional __LF_Motor_Brake)
   (if __LF_Motor_Brake (setq _LF_Motor_Brake __LF_Motor_Brake)) _LF_Motor_Brake)
  (:RF_Motor_Brake
   (&optional __RF_Motor_Brake)
   (if __RF_Motor_Brake (setq _RF_Motor_Brake __RF_Motor_Brake)) _RF_Motor_Brake)
  (:LR_Motor_Brake
   (&optional __LR_Motor_Brake)
   (if __LR_Motor_Brake (setq _LR_Motor_Brake __LR_Motor_Brake)) _LR_Motor_Brake)
  (:RR_Motor_Brake
   (&optional __RR_Motor_Brake)
   (if __RR_Motor_Brake (setq _RR_Motor_Brake __RR_Motor_Brake)) _RR_Motor_Brake)
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
    ;; uint16 _LF_Rpm
    2
    ;; uint16 _RF_Rpm
    2
    ;; uint16 _LR_Rpm
    2
    ;; uint16 _RR_Rpm
    2
    ;; uint8 _LF_Motor_Gear
    1
    ;; uint8 _RF_Motor_Gear
    1
    ;; uint8 _LR_Motor_Gear
    1
    ;; uint8 _RR_Motor_Gear
    1
    ;; uint8 _LF_Motor_En
    1
    ;; uint8 _RF_Motor_En
    1
    ;; uint8 _LR_Motor_En
    1
    ;; uint8 _RR_Motor_En
    1
    ;; uint8 _LF_Motor_Brake
    1
    ;; uint8 _RF_Motor_Brake
    1
    ;; uint8 _LR_Motor_Brake
    1
    ;; uint8 _RR_Motor_Brake
    1
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
     ;; uint16 _LF_Rpm
       (write-word _LF_Rpm s)
     ;; uint16 _RF_Rpm
       (write-word _RF_Rpm s)
     ;; uint16 _LR_Rpm
       (write-word _LR_Rpm s)
     ;; uint16 _RR_Rpm
       (write-word _RR_Rpm s)
     ;; uint8 _LF_Motor_Gear
       (write-byte _LF_Motor_Gear s)
     ;; uint8 _RF_Motor_Gear
       (write-byte _RF_Motor_Gear s)
     ;; uint8 _LR_Motor_Gear
       (write-byte _LR_Motor_Gear s)
     ;; uint8 _RR_Motor_Gear
       (write-byte _RR_Motor_Gear s)
     ;; uint8 _LF_Motor_En
       (write-byte _LF_Motor_En s)
     ;; uint8 _RF_Motor_En
       (write-byte _RF_Motor_En s)
     ;; uint8 _LR_Motor_En
       (write-byte _LR_Motor_En s)
     ;; uint8 _RR_Motor_En
       (write-byte _RR_Motor_En s)
     ;; uint8 _LF_Motor_Brake
       (write-byte _LF_Motor_Brake s)
     ;; uint8 _RF_Motor_Brake
       (write-byte _RF_Motor_Brake s)
     ;; uint8 _LR_Motor_Brake
       (write-byte _LR_Motor_Brake s)
     ;; uint8 _RR_Motor_Brake
       (write-byte _RR_Motor_Brake s)
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
   ;; uint16 _LF_Rpm
     (setq _LF_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _RF_Rpm
     (setq _RF_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _LR_Rpm
     (setq _LR_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _RR_Rpm
     (setq _RR_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _LF_Motor_Gear
     (setq _LF_Motor_Gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RF_Motor_Gear
     (setq _RF_Motor_Gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LR_Motor_Gear
     (setq _LR_Motor_Gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RR_Motor_Gear
     (setq _RR_Motor_Gear (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LF_Motor_En
     (setq _LF_Motor_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RF_Motor_En
     (setq _RF_Motor_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LR_Motor_En
     (setq _LR_Motor_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RR_Motor_En
     (setq _RR_Motor_En (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LF_Motor_Brake
     (setq _LF_Motor_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RF_Motor_Brake
     (setq _RF_Motor_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _LR_Motor_Brake
     (setq _LR_Motor_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RR_Motor_Brake
     (setq _RR_Motor_Brake (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(setf (get cl_msgs::control3 :md5sum-) "97f59ffa6578ff05e846f79c2eb2217c")
(setf (get cl_msgs::control3 :datatype-) "cl_msgs/control3")
(setf (get cl_msgs::control3 :definition-)
      "uint16 LF_Rpm
uint16 RF_Rpm
uint16 LR_Rpm
uint16 RR_Rpm
uint8 LF_Motor_Gear
uint8 RF_Motor_Gear
uint8 LR_Motor_Gear
uint8 RR_Motor_Gear
uint8 LF_Motor_En
uint8 RF_Motor_En
uint8 LR_Motor_En
uint8 RR_Motor_En
uint8 LF_Motor_Brake
uint8 RF_Motor_Brake
uint8 LR_Motor_Brake
uint8 RR_Motor_Brake

float32 Target_Brk_Press
uint16 Target_Steer_F
uint8 Target_Steer_F_En
uint16 Target_Steer_R
uint8 Target_Steer_R_En
uint8 EPB_Switch
uint8 Target_Mode

")



(provide :cl_msgs/control3 "97f59ffa6578ff05e846f79c2eb2217c")


