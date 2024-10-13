;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::VCU_info_1)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'VCU_info_1 (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::VCU_INFO_1")
  (make-package "CL_MSGS::VCU_INFO_1"))

(in-package "ROS")
;;//! \htmlinclude VCU_info_1.msg.html


(defclass cl_msgs::VCU_info_1
  :super ros::object
  :slots (_Angle_F _Angle_R _LF_Rpm _RF_Rpm _LR_Rpm _RR_Rpm ))

(defmethod cl_msgs::VCU_info_1
  (:init
   (&key
    ((:Angle_F __Angle_F) 0.0)
    ((:Angle_R __Angle_R) 0.0)
    ((:LF_Rpm __LF_Rpm) 0)
    ((:RF_Rpm __RF_Rpm) 0)
    ((:LR_Rpm __LR_Rpm) 0)
    ((:RR_Rpm __RR_Rpm) 0)
    )
   (send-super :init)
   (setq _Angle_F (float __Angle_F))
   (setq _Angle_R (float __Angle_R))
   (setq _LF_Rpm (round __LF_Rpm))
   (setq _RF_Rpm (round __RF_Rpm))
   (setq _LR_Rpm (round __LR_Rpm))
   (setq _RR_Rpm (round __RR_Rpm))
   self)
  (:Angle_F
   (&optional __Angle_F)
   (if __Angle_F (setq _Angle_F __Angle_F)) _Angle_F)
  (:Angle_R
   (&optional __Angle_R)
   (if __Angle_R (setq _Angle_R __Angle_R)) _Angle_R)
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
  (:serialization-length
   ()
   (+
    ;; float32 _Angle_F
    4
    ;; float32 _Angle_R
    4
    ;; uint16 _LF_Rpm
    2
    ;; uint16 _RF_Rpm
    2
    ;; uint16 _LR_Rpm
    2
    ;; uint16 _RR_Rpm
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Angle_F
       (sys::poke _Angle_F (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Angle_R
       (sys::poke _Angle_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint16 _LF_Rpm
       (write-word _LF_Rpm s)
     ;; uint16 _RF_Rpm
       (write-word _RF_Rpm s)
     ;; uint16 _LR_Rpm
       (write-word _LR_Rpm s)
     ;; uint16 _RR_Rpm
       (write-word _RR_Rpm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Angle_F
     (setq _Angle_F (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Angle_R
     (setq _Angle_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint16 _LF_Rpm
     (setq _LF_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _RF_Rpm
     (setq _RF_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _LR_Rpm
     (setq _LR_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _RR_Rpm
     (setq _RR_Rpm (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get cl_msgs::VCU_info_1 :md5sum-) "317dc21bd93b5222cd2a769eb3197f81")
(setf (get cl_msgs::VCU_info_1 :datatype-) "cl_msgs/VCU_info_1")
(setf (get cl_msgs::VCU_info_1 :definition-)
      "float32 Angle_F
float32 Angle_R
uint16 LF_Rpm
uint16 RF_Rpm
uint16 LR_Rpm
uint16 RR_Rpm

")



(provide :cl_msgs/VCU_info_1 "317dc21bd93b5222cd2a769eb3197f81")


