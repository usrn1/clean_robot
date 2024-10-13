;; Auto-generated. Do not edit!


(when (boundp 'cl_msgs::VCU_info_3)
  (if (not (find-package "CL_MSGS"))
    (make-package "CL_MSGS"))
  (shadow 'VCU_info_3 (find-package "CL_MSGS")))
(unless (find-package "CL_MSGS::VCU_INFO_3")
  (make-package "CL_MSGS::VCU_INFO_3"))

(in-package "ROS")
;;//! \htmlinclude VCU_info_3.msg.html


(defclass cl_msgs::VCU_info_3
  :super ros::object
  :slots (_Battery_Voltage _SOC _Battery_Current _DCDC_Output_Voltage _DCDC_Output_Current ))

(defmethod cl_msgs::VCU_info_3
  (:init
   (&key
    ((:Battery_Voltage __Battery_Voltage) 0.0)
    ((:SOC __SOC) 0.0)
    ((:Battery_Current __Battery_Current) 0.0)
    ((:DCDC_Output_Voltage __DCDC_Output_Voltage) 0.0)
    ((:DCDC_Output_Current __DCDC_Output_Current) 0.0)
    )
   (send-super :init)
   (setq _Battery_Voltage (float __Battery_Voltage))
   (setq _SOC (float __SOC))
   (setq _Battery_Current (float __Battery_Current))
   (setq _DCDC_Output_Voltage (float __DCDC_Output_Voltage))
   (setq _DCDC_Output_Current (float __DCDC_Output_Current))
   self)
  (:Battery_Voltage
   (&optional __Battery_Voltage)
   (if __Battery_Voltage (setq _Battery_Voltage __Battery_Voltage)) _Battery_Voltage)
  (:SOC
   (&optional __SOC)
   (if __SOC (setq _SOC __SOC)) _SOC)
  (:Battery_Current
   (&optional __Battery_Current)
   (if __Battery_Current (setq _Battery_Current __Battery_Current)) _Battery_Current)
  (:DCDC_Output_Voltage
   (&optional __DCDC_Output_Voltage)
   (if __DCDC_Output_Voltage (setq _DCDC_Output_Voltage __DCDC_Output_Voltage)) _DCDC_Output_Voltage)
  (:DCDC_Output_Current
   (&optional __DCDC_Output_Current)
   (if __DCDC_Output_Current (setq _DCDC_Output_Current __DCDC_Output_Current)) _DCDC_Output_Current)
  (:serialization-length
   ()
   (+
    ;; float32 _Battery_Voltage
    4
    ;; float32 _SOC
    4
    ;; float32 _Battery_Current
    4
    ;; float32 _DCDC_Output_Voltage
    4
    ;; float32 _DCDC_Output_Current
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _Battery_Voltage
       (sys::poke _Battery_Voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _SOC
       (sys::poke _SOC (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Battery_Current
       (sys::poke _Battery_Current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _DCDC_Output_Voltage
       (sys::poke _DCDC_Output_Voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _DCDC_Output_Current
       (sys::poke _DCDC_Output_Current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _Battery_Voltage
     (setq _Battery_Voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _SOC
     (setq _SOC (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Battery_Current
     (setq _Battery_Current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _DCDC_Output_Voltage
     (setq _DCDC_Output_Voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _DCDC_Output_Current
     (setq _DCDC_Output_Current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cl_msgs::VCU_info_3 :md5sum-) "782618799da4eee77b13168565258a7f")
(setf (get cl_msgs::VCU_info_3 :datatype-) "cl_msgs/VCU_info_3")
(setf (get cl_msgs::VCU_info_3 :definition-)
      "float32 Battery_Voltage
float32 SOC
float32 Battery_Current
float32 DCDC_Output_Voltage
float32 DCDC_Output_Current
")



(provide :cl_msgs/VCU_info_3 "782618799da4eee77b13168565258a7f")


