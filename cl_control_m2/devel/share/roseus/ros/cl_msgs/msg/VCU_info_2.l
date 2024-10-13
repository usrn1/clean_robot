;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::VCU_info_2)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'VCU_info_2 (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::VCU_INFO_2")
  (make-package "CL_MSGS::VCU_INFO_2"))

(in-package "ROS")
;;//! \htmlinclude VCU_info_2.msg.html


(defclass cl_msgs::VCU_info_2
  :super ros::object
  :slots (_GearPosition_LF _GearPosition_RF _GearPosition_LR _GearPosition_RR _VCU_Life_Signal _VCU_Mode _EPB_Status _IPC_Status _Hardware_Error_Level _RemoteController_Status _SES_F_En_Status _SES_R_En_Status _DBS_Status _Pressure _SES_F_Error_Level _SES_R_Error_Level _BMS_Error _DCDC_Error _EPB_Error _DBS_ErrorCode ))

(defmethod cl_msgs::VCU_info_2
  (:init
   (&key
    ((:GearPosition_LF __GearPosition_LF) 0)
    ((:GearPosition_RF __GearPosition_RF) 0)
    ((:GearPosition_LR __GearPosition_LR) 0)
    ((:GearPosition_RR __GearPosition_RR) 0)
    ((:VCU_Life_Signal __VCU_Life_Signal) 0)
    ((:VCU_Mode __VCU_Mode) 0)
    ((:EPB_Status __EPB_Status) 0)
    ((:IPC_Status __IPC_Status) 0)
    ((:Hardware_Error_Level __Hardware_Error_Level) 0)
    ((:RemoteController_Status __RemoteController_Status) 0)
    ((:SES_F_En_Status __SES_F_En_Status) 0)
    ((:SES_R_En_Status __SES_R_En_Status) 0)
    ((:DBS_Status __DBS_Status) 0)
    ((:Pressure __Pressure) 0.0)
    ((:SES_F_Error_Level __SES_F_Error_Level) 0)
    ((:SES_R_Error_Level __SES_R_Error_Level) 0)
    ((:BMS_Error __BMS_Error) 0)
    ((:DCDC_Error __DCDC_Error) 0)
    ((:EPB_Error __EPB_Error) 0)
    ((:DBS_ErrorCode __DBS_ErrorCode) 0)
    )
   (send-super :init)
   (setq _GearPosition_LF (round __GearPosition_LF))
   (setq _GearPosition_RF (round __GearPosition_RF))
   (setq _GearPosition_LR (round __GearPosition_LR))
   (setq _GearPosition_RR (round __GearPosition_RR))
   (setq _VCU_Life_Signal (round __VCU_Life_Signal))
   (setq _VCU_Mode (round __VCU_Mode))
   (setq _EPB_Status (round __EPB_Status))
   (setq _IPC_Status (round __IPC_Status))
   (setq _Hardware_Error_Level (round __Hardware_Error_Level))
   (setq _RemoteController_Status (round __RemoteController_Status))
   (setq _SES_F_En_Status (round __SES_F_En_Status))
   (setq _SES_R_En_Status (round __SES_R_En_Status))
   (setq _DBS_Status (round __DBS_Status))
   (setq _Pressure (float __Pressure))
   (setq _SES_F_Error_Level (round __SES_F_Error_Level))
   (setq _SES_R_Error_Level (round __SES_R_Error_Level))
   (setq _BMS_Error (round __BMS_Error))
   (setq _DCDC_Error (round __DCDC_Error))
   (setq _EPB_Error (round __EPB_Error))
   (setq _DBS_ErrorCode (round __DBS_ErrorCode))
   self)
  (:GearPosition_LF
   (&optional __GearPosition_LF)
   (if __GearPosition_LF (setq _GearPosition_LF __GearPosition_LF)) _GearPosition_LF)
  (:GearPosition_RF
   (&optional __GearPosition_RF)
   (if __GearPosition_RF (setq _GearPosition_RF __GearPosition_RF)) _GearPosition_RF)
  (:GearPosition_LR
   (&optional __GearPosition_LR)
   (if __GearPosition_LR (setq _GearPosition_LR __GearPosition_LR)) _GearPosition_LR)
  (:GearPosition_RR
   (&optional __GearPosition_RR)
   (if __GearPosition_RR (setq _GearPosition_RR __GearPosition_RR)) _GearPosition_RR)
  (:VCU_Life_Signal
   (&optional __VCU_Life_Signal)
   (if __VCU_Life_Signal (setq _VCU_Life_Signal __VCU_Life_Signal)) _VCU_Life_Signal)
  (:VCU_Mode
   (&optional __VCU_Mode)
   (if __VCU_Mode (setq _VCU_Mode __VCU_Mode)) _VCU_Mode)
  (:EPB_Status
   (&optional __EPB_Status)
   (if __EPB_Status (setq _EPB_Status __EPB_Status)) _EPB_Status)
  (:IPC_Status
   (&optional __IPC_Status)
   (if __IPC_Status (setq _IPC_Status __IPC_Status)) _IPC_Status)
  (:Hardware_Error_Level
   (&optional __Hardware_Error_Level)
   (if __Hardware_Error_Level (setq _Hardware_Error_Level __Hardware_Error_Level)) _Hardware_Error_Level)
  (:RemoteController_Status
   (&optional __RemoteController_Status)
   (if __RemoteController_Status (setq _RemoteController_Status __RemoteController_Status)) _RemoteController_Status)
  (:SES_F_En_Status
   (&optional __SES_F_En_Status)
   (if __SES_F_En_Status (setq _SES_F_En_Status __SES_F_En_Status)) _SES_F_En_Status)
  (:SES_R_En_Status
   (&optional __SES_R_En_Status)
   (if __SES_R_En_Status (setq _SES_R_En_Status __SES_R_En_Status)) _SES_R_En_Status)
  (:DBS_Status
   (&optional __DBS_Status)
   (if __DBS_Status (setq _DBS_Status __DBS_Status)) _DBS_Status)
  (:Pressure
   (&optional __Pressure)
   (if __Pressure (setq _Pressure __Pressure)) _Pressure)
  (:SES_F_Error_Level
   (&optional __SES_F_Error_Level)
   (if __SES_F_Error_Level (setq _SES_F_Error_Level __SES_F_Error_Level)) _SES_F_Error_Level)
  (:SES_R_Error_Level
   (&optional __SES_R_Error_Level)
   (if __SES_R_Error_Level (setq _SES_R_Error_Level __SES_R_Error_Level)) _SES_R_Error_Level)
  (:BMS_Error
   (&optional __BMS_Error)
   (if __BMS_Error (setq _BMS_Error __BMS_Error)) _BMS_Error)
  (:DCDC_Error
   (&optional __DCDC_Error)
   (if __DCDC_Error (setq _DCDC_Error __DCDC_Error)) _DCDC_Error)
  (:EPB_Error
   (&optional __EPB_Error)
   (if __EPB_Error (setq _EPB_Error __EPB_Error)) _EPB_Error)
  (:DBS_ErrorCode
   (&optional __DBS_ErrorCode)
   (if __DBS_ErrorCode (setq _DBS_ErrorCode __DBS_ErrorCode)) _DBS_ErrorCode)
  (:serialization-length
   ()
   (+
    ;; uint8 _GearPosition_LF
    1
    ;; uint8 _GearPosition_RF
    1
    ;; uint8 _GearPosition_LR
    1
    ;; uint8 _GearPosition_RR
    1
    ;; uint8 _VCU_Life_Signal
    1
    ;; uint8 _VCU_Mode
    1
    ;; uint8 _EPB_Status
    1
    ;; uint8 _IPC_Status
    1
    ;; uint8 _Hardware_Error_Level
    1
    ;; uint8 _RemoteController_Status
    1
    ;; uint8 _SES_F_En_Status
    1
    ;; uint8 _SES_R_En_Status
    1
    ;; uint8 _DBS_Status
    1
    ;; float32 _Pressure
    4
    ;; uint8 _SES_F_Error_Level
    1
    ;; uint8 _SES_R_Error_Level
    1
    ;; uint8 _BMS_Error
    1
    ;; uint8 _DCDC_Error
    1
    ;; uint8 _EPB_Error
    1
    ;; uint8 _DBS_ErrorCode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _GearPosition_LF
       (write-byte _GearPosition_LF s)
     ;; uint8 _GearPosition_RF
       (write-byte _GearPosition_RF s)
     ;; uint8 _GearPosition_LR
       (write-byte _GearPosition_LR s)
     ;; uint8 _GearPosition_RR
       (write-byte _GearPosition_RR s)
     ;; uint8 _VCU_Life_Signal
       (write-byte _VCU_Life_Signal s)
     ;; uint8 _VCU_Mode
       (write-byte _VCU_Mode s)
     ;; uint8 _EPB_Status
       (write-byte _EPB_Status s)
     ;; uint8 _IPC_Status
       (write-byte _IPC_Status s)
     ;; uint8 _Hardware_Error_Level
       (write-byte _Hardware_Error_Level s)
     ;; uint8 _RemoteController_Status
       (write-byte _RemoteController_Status s)
     ;; uint8 _SES_F_En_Status
       (write-byte _SES_F_En_Status s)
     ;; uint8 _SES_R_En_Status
       (write-byte _SES_R_En_Status s)
     ;; uint8 _DBS_Status
       (write-byte _DBS_Status s)
     ;; float32 _Pressure
       (sys::poke _Pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _SES_F_Error_Level
       (write-byte _SES_F_Error_Level s)
     ;; uint8 _SES_R_Error_Level
       (write-byte _SES_R_Error_Level s)
     ;; uint8 _BMS_Error
       (write-byte _BMS_Error s)
     ;; uint8 _DCDC_Error
       (write-byte _DCDC_Error s)
     ;; uint8 _EPB_Error
       (write-byte _EPB_Error s)
     ;; uint8 _DBS_ErrorCode
       (write-byte _DBS_ErrorCode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _GearPosition_LF
     (setq _GearPosition_LF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _GearPosition_RF
     (setq _GearPosition_RF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _GearPosition_LR
     (setq _GearPosition_LR (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _GearPosition_RR
     (setq _GearPosition_RR (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _VCU_Life_Signal
     (setq _VCU_Life_Signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _VCU_Mode
     (setq _VCU_Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _EPB_Status
     (setq _EPB_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _IPC_Status
     (setq _IPC_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Hardware_Error_Level
     (setq _Hardware_Error_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RemoteController_Status
     (setq _RemoteController_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _SES_F_En_Status
     (setq _SES_F_En_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _SES_R_En_Status
     (setq _SES_R_En_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DBS_Status
     (setq _DBS_Status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Pressure
     (setq _Pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _SES_F_Error_Level
     (setq _SES_F_Error_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _SES_R_Error_Level
     (setq _SES_R_Error_Level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _BMS_Error
     (setq _BMS_Error (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DCDC_Error
     (setq _DCDC_Error (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _EPB_Error
     (setq _EPB_Error (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _DBS_ErrorCode
     (setq _DBS_ErrorCode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get cl_msgs::VCU_info_2 :md5sum-) "d1fba2325979e73c72ceeacbad9e46de")
(setf (get cl_msgs::VCU_info_2 :datatype-) "cl_msgs/VCU_info_2")
(setf (get cl_msgs::VCU_info_2 :definition-)
      "uint8 GearPosition_LF
uint8 GearPosition_RF
uint8 GearPosition_LR
uint8 GearPosition_RR
uint8 VCU_Life_Signal
uint8 VCU_Mode
uint8 EPB_Status
uint8 IPC_Status
uint8 Hardware_Error_Level
uint8 RemoteController_Status
uint8 SES_F_En_Status
uint8 SES_R_En_Status
uint8 DBS_Status
float32 Pressure
uint8 SES_F_Error_Level
uint8 SES_R_Error_Level
uint8 BMS_Error
uint8 DCDC_Error
uint8 EPB_Error
uint8 DBS_ErrorCode
")



(provide :cl_msgs/VCU_info_2 "d1fba2325979e73c72ceeacbad9e46de")


