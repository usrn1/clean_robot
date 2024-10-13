; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude control3.msg.html

(cl:defclass <control3> (roslisp-msg-protocol:ros-message)
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
    :initform 0)
   (Target_Brk_Press
    :reader Target_Brk_Press
    :initarg :Target_Brk_Press
    :type cl:float
    :initform 0.0)
   (Target_Steer_F
    :reader Target_Steer_F
    :initarg :Target_Steer_F
    :type cl:fixnum
    :initform 0)
   (Target_Steer_F_En
    :reader Target_Steer_F_En
    :initarg :Target_Steer_F_En
    :type cl:fixnum
    :initform 0)
   (Target_Steer_R
    :reader Target_Steer_R
    :initarg :Target_Steer_R
    :type cl:fixnum
    :initform 0)
   (Target_Steer_R_En
    :reader Target_Steer_R_En
    :initarg :Target_Steer_R_En
    :type cl:fixnum
    :initform 0)
   (EPB_Switch
    :reader EPB_Switch
    :initarg :EPB_Switch
    :type cl:fixnum
    :initform 0)
   (Target_Mode
    :reader Target_Mode
    :initarg :Target_Mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass control3 (<control3>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control3>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control3)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<control3> is deprecated: use cl_msgs-msg:control3 instead.")))

(cl:ensure-generic-function 'LF_Rpm-val :lambda-list '(m))
(cl:defmethod LF_Rpm-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Rpm-val is deprecated.  Use cl_msgs-msg:LF_Rpm instead.")
  (LF_Rpm m))

(cl:ensure-generic-function 'RF_Rpm-val :lambda-list '(m))
(cl:defmethod RF_Rpm-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Rpm-val is deprecated.  Use cl_msgs-msg:RF_Rpm instead.")
  (RF_Rpm m))

(cl:ensure-generic-function 'LR_Rpm-val :lambda-list '(m))
(cl:defmethod LR_Rpm-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Rpm-val is deprecated.  Use cl_msgs-msg:LR_Rpm instead.")
  (LR_Rpm m))

(cl:ensure-generic-function 'RR_Rpm-val :lambda-list '(m))
(cl:defmethod RR_Rpm-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Rpm-val is deprecated.  Use cl_msgs-msg:RR_Rpm instead.")
  (RR_Rpm m))

(cl:ensure-generic-function 'LF_Motor_Gear-val :lambda-list '(m))
(cl:defmethod LF_Motor_Gear-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_Gear-val is deprecated.  Use cl_msgs-msg:LF_Motor_Gear instead.")
  (LF_Motor_Gear m))

(cl:ensure-generic-function 'RF_Motor_Gear-val :lambda-list '(m))
(cl:defmethod RF_Motor_Gear-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_Gear-val is deprecated.  Use cl_msgs-msg:RF_Motor_Gear instead.")
  (RF_Motor_Gear m))

(cl:ensure-generic-function 'LR_Motor_Gear-val :lambda-list '(m))
(cl:defmethod LR_Motor_Gear-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_Gear-val is deprecated.  Use cl_msgs-msg:LR_Motor_Gear instead.")
  (LR_Motor_Gear m))

(cl:ensure-generic-function 'RR_Motor_Gear-val :lambda-list '(m))
(cl:defmethod RR_Motor_Gear-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_Gear-val is deprecated.  Use cl_msgs-msg:RR_Motor_Gear instead.")
  (RR_Motor_Gear m))

(cl:ensure-generic-function 'LF_Motor_En-val :lambda-list '(m))
(cl:defmethod LF_Motor_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_En-val is deprecated.  Use cl_msgs-msg:LF_Motor_En instead.")
  (LF_Motor_En m))

(cl:ensure-generic-function 'RF_Motor_En-val :lambda-list '(m))
(cl:defmethod RF_Motor_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_En-val is deprecated.  Use cl_msgs-msg:RF_Motor_En instead.")
  (RF_Motor_En m))

(cl:ensure-generic-function 'LR_Motor_En-val :lambda-list '(m))
(cl:defmethod LR_Motor_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_En-val is deprecated.  Use cl_msgs-msg:LR_Motor_En instead.")
  (LR_Motor_En m))

(cl:ensure-generic-function 'RR_Motor_En-val :lambda-list '(m))
(cl:defmethod RR_Motor_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_En-val is deprecated.  Use cl_msgs-msg:RR_Motor_En instead.")
  (RR_Motor_En m))

(cl:ensure-generic-function 'LF_Motor_Brake-val :lambda-list '(m))
(cl:defmethod LF_Motor_Brake-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LF_Motor_Brake-val is deprecated.  Use cl_msgs-msg:LF_Motor_Brake instead.")
  (LF_Motor_Brake m))

(cl:ensure-generic-function 'RF_Motor_Brake-val :lambda-list '(m))
(cl:defmethod RF_Motor_Brake-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RF_Motor_Brake-val is deprecated.  Use cl_msgs-msg:RF_Motor_Brake instead.")
  (RF_Motor_Brake m))

(cl:ensure-generic-function 'LR_Motor_Brake-val :lambda-list '(m))
(cl:defmethod LR_Motor_Brake-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:LR_Motor_Brake-val is deprecated.  Use cl_msgs-msg:LR_Motor_Brake instead.")
  (LR_Motor_Brake m))

(cl:ensure-generic-function 'RR_Motor_Brake-val :lambda-list '(m))
(cl:defmethod RR_Motor_Brake-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:RR_Motor_Brake-val is deprecated.  Use cl_msgs-msg:RR_Motor_Brake instead.")
  (RR_Motor_Brake m))

(cl:ensure-generic-function 'Target_Brk_Press-val :lambda-list '(m))
(cl:defmethod Target_Brk_Press-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Brk_Press-val is deprecated.  Use cl_msgs-msg:Target_Brk_Press instead.")
  (Target_Brk_Press m))

(cl:ensure-generic-function 'Target_Steer_F-val :lambda-list '(m))
(cl:defmethod Target_Steer_F-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_F-val is deprecated.  Use cl_msgs-msg:Target_Steer_F instead.")
  (Target_Steer_F m))

(cl:ensure-generic-function 'Target_Steer_F_En-val :lambda-list '(m))
(cl:defmethod Target_Steer_F_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_F_En-val is deprecated.  Use cl_msgs-msg:Target_Steer_F_En instead.")
  (Target_Steer_F_En m))

(cl:ensure-generic-function 'Target_Steer_R-val :lambda-list '(m))
(cl:defmethod Target_Steer_R-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_R-val is deprecated.  Use cl_msgs-msg:Target_Steer_R instead.")
  (Target_Steer_R m))

(cl:ensure-generic-function 'Target_Steer_R_En-val :lambda-list '(m))
(cl:defmethod Target_Steer_R_En-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_R_En-val is deprecated.  Use cl_msgs-msg:Target_Steer_R_En instead.")
  (Target_Steer_R_En m))

(cl:ensure-generic-function 'EPB_Switch-val :lambda-list '(m))
(cl:defmethod EPB_Switch-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:EPB_Switch-val is deprecated.  Use cl_msgs-msg:EPB_Switch instead.")
  (EPB_Switch m))

(cl:ensure-generic-function 'Target_Mode-val :lambda-list '(m))
(cl:defmethod Target_Mode-val ((m <control3>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Mode-val is deprecated.  Use cl_msgs-msg:Target_Mode instead.")
  (Target_Mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control3>) ostream)
  "Serializes a message object of type '<control3>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Target_Brk_Press))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_F)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Target_Steer_F)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_F_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_R)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Target_Steer_R)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_R_En)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Switch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control3>) istream)
  "Deserializes a message object of type '<control3>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Target_Brk_Press) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_F)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Target_Steer_F)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_F_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_R)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'Target_Steer_R)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Steer_R_En)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'EPB_Switch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Target_Mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control3>)))
  "Returns string type for a message object of type '<control3>"
  "cl_msgs/control3")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control3)))
  "Returns string type for a message object of type 'control3"
  "cl_msgs/control3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control3>)))
  "Returns md5sum for a message object of type '<control3>"
  "97f59ffa6578ff05e846f79c2eb2217c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control3)))
  "Returns md5sum for a message object of type 'control3"
  "97f59ffa6578ff05e846f79c2eb2217c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control3>)))
  "Returns full string definition for message of type '<control3>"
  (cl:format cl:nil "uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%uint8 LF_Motor_Gear~%uint8 RF_Motor_Gear~%uint8 LR_Motor_Gear~%uint8 RR_Motor_Gear~%uint8 LF_Motor_En~%uint8 RF_Motor_En~%uint8 LR_Motor_En~%uint8 RR_Motor_En~%uint8 LF_Motor_Brake~%uint8 RF_Motor_Brake~%uint8 LR_Motor_Brake~%uint8 RR_Motor_Brake~%~%float32 Target_Brk_Press~%uint16 Target_Steer_F~%uint8 Target_Steer_F_En~%uint16 Target_Steer_R~%uint8 Target_Steer_R_En~%uint8 EPB_Switch~%uint8 Target_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control3)))
  "Returns full string definition for message of type 'control3"
  (cl:format cl:nil "uint16 LF_Rpm~%uint16 RF_Rpm~%uint16 LR_Rpm~%uint16 RR_Rpm~%uint8 LF_Motor_Gear~%uint8 RF_Motor_Gear~%uint8 LR_Motor_Gear~%uint8 RR_Motor_Gear~%uint8 LF_Motor_En~%uint8 RF_Motor_En~%uint8 LR_Motor_En~%uint8 RR_Motor_En~%uint8 LF_Motor_Brake~%uint8 RF_Motor_Brake~%uint8 LR_Motor_Brake~%uint8 RR_Motor_Brake~%~%float32 Target_Brk_Press~%uint16 Target_Steer_F~%uint8 Target_Steer_F_En~%uint16 Target_Steer_R~%uint8 Target_Steer_R_En~%uint8 EPB_Switch~%uint8 Target_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control3>))
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
     4
     2
     1
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control3>))
  "Converts a ROS message object to a list"
  (cl:list 'control3
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
    (cl:cons ':Target_Brk_Press (Target_Brk_Press msg))
    (cl:cons ':Target_Steer_F (Target_Steer_F msg))
    (cl:cons ':Target_Steer_F_En (Target_Steer_F_En msg))
    (cl:cons ':Target_Steer_R (Target_Steer_R msg))
    (cl:cons ':Target_Steer_R_En (Target_Steer_R_En msg))
    (cl:cons ':EPB_Switch (EPB_Switch msg))
    (cl:cons ':Target_Mode (Target_Mode msg))
))
