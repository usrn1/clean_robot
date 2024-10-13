; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude VCU_info_2.msg.html

(cl:defclass <VCU_info_2> (roslisp-msg-protocol:ros-message)
  ((GearPosition_LF
    :reader GearPosition_LF
    :initarg :GearPosition_LF
    :type cl:fixnum
    :initform 0)
   (GearPosition_RF
    :reader GearPosition_RF
    :initarg :GearPosition_RF
    :type cl:fixnum
    :initform 0)
   (GearPosition_LR
    :reader GearPosition_LR
    :initarg :GearPosition_LR
    :type cl:fixnum
    :initform 0)
   (GearPosition_RR
    :reader GearPosition_RR
    :initarg :GearPosition_RR
    :type cl:fixnum
    :initform 0)
   (VCU_Life_Signal
    :reader VCU_Life_Signal
    :initarg :VCU_Life_Signal
    :type cl:fixnum
    :initform 0)
   (VCU_Mode
    :reader VCU_Mode
    :initarg :VCU_Mode
    :type cl:fixnum
    :initform 0)
   (EPB_Status
    :reader EPB_Status
    :initarg :EPB_Status
    :type cl:fixnum
    :initform 0)
   (IPC_Status
    :reader IPC_Status
    :initarg :IPC_Status
    :type cl:fixnum
    :initform 0)
   (Hardware_Error_Level
    :reader Hardware_Error_Level
    :initarg :Hardware_Error_Level
    :type cl:fixnum
    :initform 0)
   (RemoteController_Status
    :reader RemoteController_Status
    :initarg :RemoteController_Status
    :type cl:fixnum
    :initform 0)
   (SES_F_En_Status
    :reader SES_F_En_Status
    :initarg :SES_F_En_Status
    :type cl:fixnum
    :initform 0)
   (SES_R_En_Status
    :reader SES_R_En_Status
    :initarg :SES_R_En_Status
    :type cl:fixnum
    :initform 0)
   (DBS_Status
    :reader DBS_Status
    :initarg :DBS_Status
    :type cl:fixnum
    :initform 0)
   (Pressure
    :reader Pressure
    :initarg :Pressure
    :type cl:float
    :initform 0.0)
   (SES_F_Error_Level
    :reader SES_F_Error_Level
    :initarg :SES_F_Error_Level
    :type cl:fixnum
    :initform 0)
   (SES_R_Error_Level
    :reader SES_R_Error_Level
    :initarg :SES_R_Error_Level
    :type cl:fixnum
    :initform 0)
   (BMS_Error
    :reader BMS_Error
    :initarg :BMS_Error
    :type cl:fixnum
    :initform 0)
   (DCDC_Error
    :reader DCDC_Error
    :initarg :DCDC_Error
    :type cl:fixnum
    :initform 0)
   (EPB_Error
    :reader EPB_Error
    :initarg :EPB_Error
    :type cl:fixnum
    :initform 0)
   (DBS_ErrorCode
    :reader DBS_ErrorCode
    :initarg :DBS_ErrorCode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass VCU_info_2 (<VCU_info_2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VCU_info_2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VCU_info_2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<VCU_info_2> is deprecated: use cl_msgs-msg:VCU_info_2 instead.")))

(cl:ensure-generic-function 'GearPosition_LF-val :lambda-list '(m))
(cl:defmethod GearPosition_LF-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:GearPosition_LF-val is deprecated.  Use cl_msgs-msg:GearPosition_LF instead.")
  (GearPosition_LF m))

(cl:ensure-generic-function 'GearPosition_RF-val :lambda-list '(m))
(cl:defmethod GearPosition_RF-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:GearPosition_RF-val is deprecated.  Use cl_msgs-msg:GearPosition_RF instead.")
  (GearPosition_RF m))

(cl:ensure-generic-function 'GearPosition_LR-val :lambda-list '(m))
(cl:defmethod GearPosition_LR-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:GearPosition_LR-val is deprecated.  Use cl_msgs-msg:GearPosition_LR instead.")
  (GearPosition_LR m))

(cl:ensure-generic-function 'GearPosition_RR-val :lambda-list '(m))
(cl:defmethod GearPosition_RR-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:GearPosition_RR-val is deprecated.  Use cl_msgs-msg:GearPosition_RR instead.")
  (GearPosition_RR m))

(cl:ensure-generic-function 'VCU_Life_Signal-val :lambda-list '(m))
(cl:defmethod VCU_Life_Signal-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:VCU_Life_Signal-val is deprecated.  Use cl_msgs-msg:VCU_Life_Signal instead.")
  (VCU_Life_Signal m))

(cl:ensure-generic-function 'VCU_Mode-val :lambda-list '(m))
(cl:defmethod VCU_Mode-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:VCU_Mode-val is deprecated.  Use cl_msgs-msg:VCU_Mode instead.")
  (VCU_Mode m))

(cl:ensure-generic-function 'EPB_Status-val :lambda-list '(m))
(cl:defmethod EPB_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:EPB_Status-val is deprecated.  Use cl_msgs-msg:EPB_Status instead.")
  (EPB_Status m))

(cl:ensure-generic-function 'IPC_Status-val :lambda-list '(m))
(cl:defmethod IPC_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:IPC_Status-val is deprecated.  Use cl_msgs-msg:IPC_Status instead.")
  (IPC_Status m))

(cl:ensure-generic-function 'Hardware_Error_Level-val :lambda-list '(m))
(cl:defmethod Hardware_Error_Level-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Hardware_Error_Level-val is deprecated.  Use cl_msgs-msg:Hardware_Error_Level instead.")
  (Hardware_Error_Level m))

(cl:ensure-generic-function 'RemoteController_Status-val :lambda-list '(m))
(cl:defmethod RemoteController_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RemoteController_Status-val is deprecated.  Use cl_msgs-msg:RemoteController_Status instead.")
  (RemoteController_Status m))

(cl:ensure-generic-function 'SES_F_En_Status-val :lambda-list '(m))
(cl:defmethod SES_F_En_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:SES_F_En_Status-val is deprecated.  Use cl_msgs-msg:SES_F_En_Status instead.")
  (SES_F_En_Status m))

(cl:ensure-generic-function 'SES_R_En_Status-val :lambda-list '(m))
(cl:defmethod SES_R_En_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:SES_R_En_Status-val is deprecated.  Use cl_msgs-msg:SES_R_En_Status instead.")
  (SES_R_En_Status m))

(cl:ensure-generic-function 'DBS_Status-val :lambda-list '(m))
(cl:defmethod DBS_Status-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:DBS_Status-val is deprecated.  Use cl_msgs-msg:DBS_Status instead.")
  (DBS_Status m))

(cl:ensure-generic-function 'Pressure-val :lambda-list '(m))
(cl:defmethod Pressure-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Pressure-val is deprecated.  Use cl_msgs-msg:Pressure instead.")
  (Pressure m))

(cl:ensure-generic-function 'SES_F_Error_Level-val :lambda-list '(m))
(cl:defmethod SES_F_Error_Level-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:SES_F_Error_Level-val is deprecated.  Use cl_msgs-msg:SES_F_Error_Level instead.")
  (SES_F_Error_Level m))

(cl:ensure-generic-function 'SES_R_Error_Level-val :lambda-list '(m))
(cl:defmethod SES_R_Error_Level-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:SES_R_Error_Level-val is deprecated.  Use cl_msgs-msg:SES_R_Error_Level instead.")
  (SES_R_Error_Level m))

(cl:ensure-generic-function 'BMS_Error-val :lambda-list '(m))
(cl:defmethod BMS_Error-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:BMS_Error-val is deprecated.  Use cl_msgs-msg:BMS_Error instead.")
  (BMS_Error m))

(cl:ensure-generic-function 'DCDC_Error-val :lambda-list '(m))
(cl:defmethod DCDC_Error-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:DCDC_Error-val is deprecated.  Use cl_msgs-msg:DCDC_Error instead.")
  (DCDC_Error m))

(cl:ensure-generic-function 'EPB_Error-val :lambda-list '(m))
(cl:defmethod EPB_Error-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:EPB_Error-val is deprecated.  Use cl_msgs-msg:EPB_Error instead.")
  (EPB_Error m))

(cl:ensure-generic-function 'DBS_ErrorCode-val :lambda-list '(m))
(cl:defmethod DBS_ErrorCode-val ((m <VCU_info_2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:DBS_ErrorCode-val is deprecated.  Use cl_msgs-msg:DBS_ErrorCode instead.")
  (DBS_ErrorCode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VCU_info_2>) ostream)
  "Serializes a message object of type '<VCU_info_2>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_LF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_RF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_LR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_RR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'VCU_Life_Signal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'VCU_Mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IPC_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RemoteController_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_F_En_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_R_En_Status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DBS_Status)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_F_Error_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_R_Error_Level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BMS_Error)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DCDC_Error)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Error)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DBS_ErrorCode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VCU_info_2>) istream)
  "Deserializes a message object of type '<VCU_info_2>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_LF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_RF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_LR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GearPosition_RR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'VCU_Life_Signal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'VCU_Mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'IPC_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Hardware_Error_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RemoteController_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_F_En_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_R_En_Status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DBS_Status)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_F_Error_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'SES_R_Error_Level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BMS_Error)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DCDC_Error)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Error)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DBS_ErrorCode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VCU_info_2>)))
  "Returns string type for a message object of type '<VCU_info_2>"
  "cl_msgs/VCU_info_2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VCU_info_2)))
  "Returns string type for a message object of type 'VCU_info_2"
  "cl_msgs/VCU_info_2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VCU_info_2>)))
  "Returns md5sum for a message object of type '<VCU_info_2>"
  "d1fba2325979e73c72ceeacbad9e46de")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VCU_info_2)))
  "Returns md5sum for a message object of type 'VCU_info_2"
  "d1fba2325979e73c72ceeacbad9e46de")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VCU_info_2>)))
  "Returns full string definition for message of type '<VCU_info_2>"
  (cl:format cl:nil "uint8 GearPosition_LF~%uint8 GearPosition_RF~%uint8 GearPosition_LR~%uint8 GearPosition_RR~%uint8 VCU_Life_Signal~%uint8 VCU_Mode~%uint8 EPB_Status~%uint8 IPC_Status~%uint8 Hardware_Error_Level~%uint8 RemoteController_Status~%uint8 SES_F_En_Status~%uint8 SES_R_En_Status~%uint8 DBS_Status~%float32 Pressure~%uint8 SES_F_Error_Level~%uint8 SES_R_Error_Level~%uint8 BMS_Error~%uint8 DCDC_Error~%uint8 EPB_Error~%uint8 DBS_ErrorCode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VCU_info_2)))
  "Returns full string definition for message of type 'VCU_info_2"
  (cl:format cl:nil "uint8 GearPosition_LF~%uint8 GearPosition_RF~%uint8 GearPosition_LR~%uint8 GearPosition_RR~%uint8 VCU_Life_Signal~%uint8 VCU_Mode~%uint8 EPB_Status~%uint8 IPC_Status~%uint8 Hardware_Error_Level~%uint8 RemoteController_Status~%uint8 SES_F_En_Status~%uint8 SES_R_En_Status~%uint8 DBS_Status~%float32 Pressure~%uint8 SES_F_Error_Level~%uint8 SES_R_Error_Level~%uint8 BMS_Error~%uint8 DCDC_Error~%uint8 EPB_Error~%uint8 DBS_ErrorCode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VCU_info_2>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     4
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VCU_info_2>))
  "Converts a ROS message object to a list"
  (cl:list 'VCU_info_2
    (cl:cons ':GearPosition_LF (GearPosition_LF msg))
    (cl:cons ':GearPosition_RF (GearPosition_RF msg))
    (cl:cons ':GearPosition_LR (GearPosition_LR msg))
    (cl:cons ':GearPosition_RR (GearPosition_RR msg))
    (cl:cons ':VCU_Life_Signal (VCU_Life_Signal msg))
    (cl:cons ':VCU_Mode (VCU_Mode msg))
    (cl:cons ':EPB_Status (EPB_Status msg))
    (cl:cons ':IPC_Status (IPC_Status msg))
    (cl:cons ':Hardware_Error_Level (Hardware_Error_Level msg))
    (cl:cons ':RemoteController_Status (RemoteController_Status msg))
    (cl:cons ':SES_F_En_Status (SES_F_En_Status msg))
    (cl:cons ':SES_R_En_Status (SES_R_En_Status msg))
    (cl:cons ':DBS_Status (DBS_Status msg))
    (cl:cons ':Pressure (Pressure msg))
    (cl:cons ':SES_F_Error_Level (SES_F_Error_Level msg))
    (cl:cons ':SES_R_Error_Level (SES_R_Error_Level msg))
    (cl:cons ':BMS_Error (BMS_Error msg))
    (cl:cons ':DCDC_Error (DCDC_Error msg))
    (cl:cons ':EPB_Error (EPB_Error msg))
    (cl:cons ':DBS_ErrorCode (DBS_ErrorCode msg))
))
