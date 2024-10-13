; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude VCU_info_3.msg.html

(cl:defclass <VCU_info_3> (roslisp-msg-protocol:ros-message)
  ((Battery_Voltage
    :reader Battery_Voltage
    :initarg :Battery_Voltage
    :type cl:float
    :initform 0.0)
   (SOC
    :reader SOC
    :initarg :SOC
    :type cl:float
    :initform 0.0)
   (Battery_Current
    :reader Battery_Current
    :initarg :Battery_Current
    :type cl:float
    :initform 0.0)
   (DCDC_Output_Voltage
    :reader DCDC_Output_Voltage
    :initarg :DCDC_Output_Voltage
    :type cl:float
    :initform 0.0)
   (DCDC_Output_Current
    :reader DCDC_Output_Current
    :initarg :DCDC_Output_Current
    :type cl:float
    :initform 0.0))
)

(cl:defclass VCU_info_3 (<VCU_info_3>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VCU_info_3>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VCU_info_3)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<VCU_info_3> is deprecated: use cl_msgs-msg:VCU_info_3 instead.")))

(cl:ensure-generic-function 'Battery_Voltage-val :lambda-list '(m))
(cl:defmethod Battery_Voltage-val ((m <VCU_info_3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Battery_Voltage-val is deprecated.  Use cl_msgs-msg:Battery_Voltage instead.")
  (Battery_Voltage m))

(cl:ensure-generic-function 'SOC-val :lambda-list '(m))
(cl:defmethod SOC-val ((m <VCU_info_3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:SOC-val is deprecated.  Use cl_msgs-msg:SOC instead.")
  (SOC m))

(cl:ensure-generic-function 'Battery_Current-val :lambda-list '(m))
(cl:defmethod Battery_Current-val ((m <VCU_info_3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Battery_Current-val is deprecated.  Use cl_msgs-msg:Battery_Current instead.")
  (Battery_Current m))

(cl:ensure-generic-function 'DCDC_Output_Voltage-val :lambda-list '(m))
(cl:defmethod DCDC_Output_Voltage-val ((m <VCU_info_3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:DCDC_Output_Voltage-val is deprecated.  Use cl_msgs-msg:DCDC_Output_Voltage instead.")
  (DCDC_Output_Voltage m))

(cl:ensure-generic-function 'DCDC_Output_Current-val :lambda-list '(m))
(cl:defmethod DCDC_Output_Current-val ((m <VCU_info_3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:DCDC_Output_Current-val is deprecated.  Use cl_msgs-msg:DCDC_Output_Current instead.")
  (DCDC_Output_Current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VCU_info_3>) ostream)
  "Serializes a message object of type '<VCU_info_3>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Battery_Voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'SOC))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Battery_Current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'DCDC_Output_Voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'DCDC_Output_Current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VCU_info_3>) istream)
  "Deserializes a message object of type '<VCU_info_3>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Battery_Voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'SOC) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Battery_Current) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'DCDC_Output_Voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'DCDC_Output_Current) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VCU_info_3>)))
  "Returns string type for a message object of type '<VCU_info_3>"
  "cl_msgs/VCU_info_3")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VCU_info_3)))
  "Returns string type for a message object of type 'VCU_info_3"
  "cl_msgs/VCU_info_3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VCU_info_3>)))
  "Returns md5sum for a message object of type '<VCU_info_3>"
  "782618799da4eee77b13168565258a7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VCU_info_3)))
  "Returns md5sum for a message object of type 'VCU_info_3"
  "782618799da4eee77b13168565258a7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VCU_info_3>)))
  "Returns full string definition for message of type '<VCU_info_3>"
  (cl:format cl:nil "float32 Battery_Voltage~%float32 SOC~%float32 Battery_Current~%float32 DCDC_Output_Voltage~%float32 DCDC_Output_Current~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VCU_info_3)))
  "Returns full string definition for message of type 'VCU_info_3"
  (cl:format cl:nil "float32 Battery_Voltage~%float32 SOC~%float32 Battery_Current~%float32 DCDC_Output_Voltage~%float32 DCDC_Output_Current~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VCU_info_3>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VCU_info_3>))
  "Converts a ROS message object to a list"
  (cl:list 'VCU_info_3
    (cl:cons ':Battery_Voltage (Battery_Voltage msg))
    (cl:cons ':SOC (SOC msg))
    (cl:cons ':Battery_Current (Battery_Current msg))
    (cl:cons ':DCDC_Output_Voltage (DCDC_Output_Voltage msg))
    (cl:cons ':DCDC_Output_Current (DCDC_Output_Current msg))
))
