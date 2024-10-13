; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude VCU_info_1.msg.html

(cl:defclass <VCU_info_1> (roslisp-msg-protocol:ros-message)
  ((Angle_F
    :reader Angle_F
    :initarg :Angle_F
    :type cl:float
    :initform 0.0)
   (Angle_R
    :reader Angle_R
    :initarg :Angle_R
    :type cl:float
    :initform 0.0)
   (LF_Rpm
    :reader LF_Rpm
    :initarg :LF_Rpm
    :type cl:fixnum
    :initform 0)
   (RF_Rpm
    :reader RF_Rpm
    :initarg :RF_Rpm
    :type cl:fixnum
    :initform 0)
   (LR_Rpm
    :reader LR_Rpm
    :initarg :LR_Rpm
    :type cl:fixnum
    :initform 0)
   (RR_Rpm
    :reader RR_Rpm
    :initarg :RR_Rpm
    :type cl:fixnum
    :initform 0))
)

(cl:defclass VCU_info_1 (<VCU_info_1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VCU_info_1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VCU_info_1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<VCU_info_1> is deprecated: use cl_msgs-msg:VCU_info_1 instead.")))

(cl:ensure-generic-function 'Angle_F-val :lambda-list '(m))
(cl:defmethod Angle_F-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Angle_F-val is deprecated.  Use cl_msgs-msg:Angle_F instead.")
  (Angle_F m))

(cl:ensure-generic-function 'Angle_R-val :lambda-list '(m))
(cl:defmethod Angle_R-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Angle_R-val is deprecated.  Use cl_msgs-msg:Angle_R instead.")
  (Angle_R m))

(cl:ensure-generic-function 'LF_Rpm-val :lambda-list '(m))
(cl:defmethod LF_Rpm-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Rpm-val is deprecated.  Use cl_msgs-msg:LF_Rpm instead.")
  (LF_Rpm m))

(cl:ensure-generic-function 'RF_Rpm-val :lambda-list '(m))
(cl:defmethod RF_Rpm-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Rpm-val is deprecated.  Use cl_msgs-msg:RF_Rpm instead.")
  (RF_Rpm m))

(cl:ensure-generic-function 'LR_Rpm-val :lambda-list '(m))
(cl:defmethod LR_Rpm-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Rpm-val is deprecated.  Use cl_msgs-msg:LR_Rpm instead.")
  (LR_Rpm m))

(cl:ensure-generic-function 'RR_Rpm-val :lambda-list '(m))
(cl:defmethod RR_Rpm-val ((m <VCU_info_1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Rpm-val is deprecated.  Use cl_msgs-msg:RR_Rpm instead.")
  (RR_Rpm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VCU_info_1>) ostream)
  "Serializes a message object of type '<VCU_info_1>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Angle_F))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Angle_R))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RR_Rpm)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VCU_info_1>) istream)
  "Deserializes a message object of type '<VCU_info_1>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Angle_F) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Angle_R) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RR_Rpm)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VCU_info_1>)))
  "Returns string type for a message object of type '<VCU_info_1>"
  "cl_msgs/VCU_info_1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VCU_info_1)))
  "Returns string type for a message object of type 'VCU_info_1"
  "cl_msgs/VCU_info_1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VCU_info_1>)))
  "Returns md5sum for a message object of type '<VCU_info_1>"
  "317dc21bd93b5222cd2a769eb3197f81")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VCU_info_1)))
  "Returns md5sum for a message object of type 'VCU_info_1"
  "317dc21bd93b5222cd2a769eb3197f81")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VCU_info_1>)))
  "Returns full string definition for message of type '<VCU_info_1>"
  (cl:format cl:nil "float32 Angle_F~%float32 Angle_R~%uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VCU_info_1)))
  "Returns full string definition for message of type 'VCU_info_1"
  (cl:format cl:nil "float32 Angle_F~%float32 Angle_R~%uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VCU_info_1>))
  (cl:+ 0
     4
     4
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VCU_info_1>))
  "Converts a ROS message object to a list"
  (cl:list 'VCU_info_1
    (cl:cons ':Angle_F (Angle_F msg))
    (cl:cons ':Angle_R (Angle_R msg))
    (cl:cons ':LF_Rpm (LF_Rpm msg))
    (cl:cons ':RF_Rpm (RF_Rpm msg))
    (cl:cons ':LR_Rpm (LR_Rpm msg))
    (cl:cons ':RR_Rpm (RR_Rpm msg))
))
