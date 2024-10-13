; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude control1.msg.html

(cl:defclass <control1> (roslisp-msg-protocol:ros-message)
  ((LF_Rpm
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
    :initform 0)
   (LF_Motor_Gear
    :reader LF_Motor_Gear
    :initarg :LF_Motor_Gear
    :type cl:fixnum
    :initform 0)
   (RF_Motor_Gear
    :reader RF_Motor_Gear
    :initarg :RF_Motor_Gear
    :type cl:fixnum
    :initform 0)
   (LR_Motor_Gear
    :reader LR_Motor_Gear
    :initarg :LR_Motor_Gear
    :type cl:fixnum
    :initform 0)
   (RR_Motor_Gear
    :reader RR_Motor_Gear
    :initarg :RR_Motor_Gear
    :type cl:fixnum
    :initform 0)
   (LF_Motor_En
    :reader LF_Motor_En
    :initarg :LF_Motor_En
    :type cl:fixnum
    :initform 0)
   (RF_Motor_En
    :reader RF_Motor_En
    :initarg :RF_Motor_En
    :type cl:fixnum
    :initform 0)
   (LR_Motor_En
    :reader LR_Motor_En
    :initarg :LR_Motor_En
    :type cl:fixnum
    :initform 0)
   (RR_Motor_En
    :reader RR_Motor_En
    :initarg :RR_Motor_En
    :type cl:fixnum
    :initform 0)
   (LF_Motor_Brake
    :reader LF_Motor_Brake
    :initarg :LF_Motor_Brake
    :type cl:fixnum
    :initform 0)
   (RF_Motor_Brake
    :reader RF_Motor_Brake
    :initarg :RF_Motor_Brake
    :type cl:fixnum
    :initform 0)
   (LR_Motor_Brake
    :reader LR_Motor_Brake
    :initarg :LR_Motor_Brake
    :type cl:fixnum
    :initform 0)
   (RR_Motor_Brake
    :reader RR_Motor_Brake
    :initarg :RR_Motor_Brake
    :type cl:fixnum
    :initform 0))
)

(cl:defclass control1 (<control1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<control1> is deprecated: use cl_msgs-msg:control1 instead.")))

(cl:ensure-generic-function 'LF_Rpm-val :lambda-list '(m))
(cl:defmethod LF_Rpm-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Rpm-val is deprecated.  Use cl_msgs-msg:LF_Rpm instead.")
  (LF_Rpm m))

(cl:ensure-generic-function 'RF_Rpm-val :lambda-list '(m))
(cl:defmethod RF_Rpm-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Rpm-val is deprecated.  Use cl_msgs-msg:RF_Rpm instead.")
  (RF_Rpm m))

(cl:ensure-generic-function 'LR_Rpm-val :lambda-list '(m))
(cl:defmethod LR_Rpm-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Rpm-val is deprecated.  Use cl_msgs-msg:LR_Rpm instead.")
  (LR_Rpm m))

(cl:ensure-generic-function 'RR_Rpm-val :lambda-list '(m))
(cl:defmethod RR_Rpm-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Rpm-val is deprecated.  Use cl_msgs-msg:RR_Rpm instead.")
  (RR_Rpm m))

(cl:ensure-generic-function 'LF_Motor_Gear-val :lambda-list '(m))
(cl:defmethod LF_Motor_Gear-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_Gear-val is deprecated.  Use cl_msgs-msg:LF_Motor_Gear instead.")
  (LF_Motor_Gear m))

(cl:ensure-generic-function 'RF_Motor_Gear-val :lambda-list '(m))
(cl:defmethod RF_Motor_Gear-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_Gear-val is deprecated.  Use cl_msgs-msg:RF_Motor_Gear instead.")
  (RF_Motor_Gear m))

(cl:ensure-generic-function 'LR_Motor_Gear-val :lambda-list '(m))
(cl:defmethod LR_Motor_Gear-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_Gear-val is deprecated.  Use cl_msgs-msg:LR_Motor_Gear instead.")
  (LR_Motor_Gear m))

(cl:ensure-generic-function 'RR_Motor_Gear-val :lambda-list '(m))
(cl:defmethod RR_Motor_Gear-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_Gear-val is deprecated.  Use cl_msgs-msg:RR_Motor_Gear instead.")
  (RR_Motor_Gear m))

(cl:ensure-generic-function 'LF_Motor_En-val :lambda-list '(m))
(cl:defmethod LF_Motor_En-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_En-val is deprecated.  Use cl_msgs-msg:LF_Motor_En instead.")
  (LF_Motor_En m))

(cl:ensure-generic-function 'RF_Motor_En-val :lambda-list '(m))
(cl:defmethod RF_Motor_En-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_En-val is deprecated.  Use cl_msgs-msg:RF_Motor_En instead.")
  (RF_Motor_En m))

(cl:ensure-generic-function 'LR_Motor_En-val :lambda-list '(m))
(cl:defmethod LR_Motor_En-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_En-val is deprecated.  Use cl_msgs-msg:LR_Motor_En instead.")
  (LR_Motor_En m))

(cl:ensure-generic-function 'RR_Motor_En-val :lambda-list '(m))
(cl:defmethod RR_Motor_En-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_En-val is deprecated.  Use cl_msgs-msg:RR_Motor_En instead.")
  (RR_Motor_En m))

(cl:ensure-generic-function 'LF_Motor_Brake-val :lambda-list '(m))
(cl:defmethod LF_Motor_Brake-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_Brake-val is deprecated.  Use cl_msgs-msg:LF_Motor_Brake instead.")
  (LF_Motor_Brake m))

(cl:ensure-generic-function 'RF_Motor_Brake-val :lambda-list '(m))
(cl:defmethod RF_Motor_Brake-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_Brake-val is deprecated.  Use cl_msgs-msg:RF_Motor_Brake instead.")
  (RF_Motor_Brake m))

(cl:ensure-generic-function 'LR_Motor_Brake-val :lambda-list '(m))
(cl:defmethod LR_Motor_Brake-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_Brake-val is deprecated.  Use cl_msgs-msg:LR_Motor_Brake instead.")
  (LR_Motor_Brake m))

(cl:ensure-generic-function 'RR_Motor_Brake-val :lambda-list '(m))
(cl:defmethod RR_Motor_Brake-val ((m <control1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_Brake-val is deprecated.  Use cl_msgs-msg:RR_Motor_Brake instead.")
  (RR_Motor_Brake m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control1>) ostream)
  "Serializes a message object of type '<control1>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RF_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RR_Rpm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_Gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_Gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_Gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_Gear)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_Brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_Brake)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control1>) istream)
  "Deserializes a message object of type '<control1>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RF_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'LR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'RR_Rpm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_Gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_Gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_Gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_Gear)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LF_Motor_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RF_Motor_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'LR_Motor_Brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RR_Motor_Brake)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control1>)))
  "Returns string type for a message object of type '<control1>"
  "cl_msgs/control1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control1)))
  "Returns string type for a message object of type 'control1"
  "cl_msgs/control1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control1>)))
  "Returns md5sum for a message object of type '<control1>"
  "4c19fad33fe2c8cea2d2038649cc83ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control1)))
  "Returns md5sum for a message object of type 'control1"
  "4c19fad33fe2c8cea2d2038649cc83ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control1>)))
  "Returns full string definition for message of type '<control1>"
  (cl:format cl:nil "uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%uint8 LF_Motor_Gear~%uint8 RF_Motor_Gear~%uint8 LR_Motor_Gear~%uint8 RR_Motor_Gear~%uint8 LF_Motor_En~%uint8 RF_Motor_En~%uint8 LR_Motor_En~%uint8 RR_Motor_En~%uint8 LF_Motor_Brake~%uint8 RF_Motor_Brake~%uint8 LR_Motor_Brake~%uint8 RR_Motor_Brake~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control1)))
  "Returns full string definition for message of type 'control1"
  (cl:format cl:nil "uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%uint8 LF_Motor_Gear~%uint8 RF_Motor_Gear~%uint8 LR_Motor_Gear~%uint8 RR_Motor_Gear~%uint8 LF_Motor_En~%uint8 RF_Motor_En~%uint8 LR_Motor_En~%uint8 RR_Motor_En~%uint8 LF_Motor_Brake~%uint8 RF_Motor_Brake~%uint8 LR_Motor_Brake~%uint8 RR_Motor_Brake~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control1>))
  (cl:+ 0
     2
     2
     2
     2
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
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control1>))
  "Converts a ROS message object to a list"
  (cl:list 'control1
    (cl:cons ':LF_Rpm (LF_Rpm msg))
    (cl:cons ':RF_Rpm (RF_Rpm msg))
    (cl:cons ':LR_Rpm (LR_Rpm msg))
    (cl:cons ':RR_Rpm (RR_Rpm msg))
    (cl:cons ':LF_Motor_Gear (LF_Motor_Gear msg))
    (cl:cons ':RF_Motor_Gear (RF_Motor_Gear msg))
    (cl:cons ':LR_Motor_Gear (LR_Motor_Gear msg))
    (cl:cons ':RR_Motor_Gear (RR_Motor_Gear msg))
    (cl:cons ':LF_Motor_En (LF_Motor_En msg))
    (cl:cons ':RF_Motor_En (RF_Motor_En msg))
    (cl:cons ':LR_Motor_En (LR_Motor_En msg))
    (cl:cons ':RR_Motor_En (RR_Motor_En msg))
    (cl:cons ':LF_Motor_Brake (LF_Motor_Brake msg))
    (cl:cons ':RF_Motor_Brake (RF_Motor_Brake msg))
    (cl:cons ':LR_Motor_Brake (LR_Motor_Brake msg))
    (cl:cons ':RR_Motor_Brake (RR_Motor_Brake msg))
))
