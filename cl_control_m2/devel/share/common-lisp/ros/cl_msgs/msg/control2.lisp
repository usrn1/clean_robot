; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude control2.msg.html

(cl:defclass <control2> (roslisp-msg-protocol:ros-message)
  ((Target_Brk_Press
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

(cl:defclass control2 (<control2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<control2> is deprecated: use cl_msgs-msg:control2 instead.")))

(cl:ensure-generic-function 'Target_Brk_Press-val :lambda-list '(m))
(cl:defmethod Target_Brk_Press-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Brk_Press-val is deprecated.  Use cl_msgs-msg:Target_Brk_Press instead.")
  (Target_Brk_Press m))

(cl:ensure-generic-function 'Target_Steer_F-val :lambda-list '(m))
(cl:defmethod Target_Steer_F-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_F-val is deprecated.  Use cl_msgs-msg:Target_Steer_F instead.")
  (Target_Steer_F m))

(cl:ensure-generic-function 'Target_Steer_F_En-val :lambda-list '(m))
(cl:defmethod Target_Steer_F_En-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_F_En-val is deprecated.  Use cl_msgs-msg:Target_Steer_F_En instead.")
  (Target_Steer_F_En m))

(cl:ensure-generic-function 'Target_Steer_R-val :lambda-list '(m))
(cl:defmethod Target_Steer_R-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_R-val is deprecated.  Use cl_msgs-msg:Target_Steer_R instead.")
  (Target_Steer_R m))

(cl:ensure-generic-function 'Target_Steer_R_En-val :lambda-list '(m))
(cl:defmethod Target_Steer_R_En-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Steer_R_En-val is deprecated.  Use cl_msgs-msg:Target_Steer_R_En instead.")
  (Target_Steer_R_En m))

(cl:ensure-generic-function 'EPB_Switch-val :lambda-list '(m))
(cl:defmethod EPB_Switch-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:EPB_Switch-val is deprecated.  Use cl_msgs-msg:EPB_Switch instead.")
  (EPB_Switch m))

(cl:ensure-generic-function 'Target_Mode-val :lambda-list '(m))
(cl:defmethod Target_Mode-val ((m <control2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Target_Mode-val is deprecated.  Use cl_msgs-msg:Target_Mode instead.")
  (Target_Mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control2>) ostream)
  "Serializes a message object of type '<control2>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control2>) istream)
  "Deserializes a message object of type '<control2>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control2>)))
  "Returns string type for a message object of type '<control2>"
  "cl_msgs/control2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control2)))
  "Returns string type for a message object of type 'control2"
  "cl_msgs/control2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control2>)))
  "Returns md5sum for a message object of type '<control2>"
  "02be7a927824000275f436c65ca9b8d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control2)))
  "Returns md5sum for a message object of type 'control2"
  "02be7a927824000275f436c65ca9b8d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control2>)))
  "Returns full string definition for message of type '<control2>"
  (cl:format cl:nil "float32 Target_Brk_Press~%uint16 Target_Steer_F~%uint8 Target_Steer_F_En~%uint16 Target_Steer_R~%uint8 Target_Steer_R_En~%uint8 EPB_Switch~%uint8 Target_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control2)))
  "Returns full string definition for message of type 'control2"
  (cl:format cl:nil "float32 Target_Brk_Press~%uint16 Target_Steer_F~%uint8 Target_Steer_F_En~%uint16 Target_Steer_R~%uint8 Target_Steer_R_En~%uint8 EPB_Switch~%uint8 Target_Mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control2>))
  (cl:+ 0
     4
     2
     1
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control2>))
  "Converts a ROS message object to a list"
  (cl:list 'control2
    (cl:cons ':Target_Brk_Press (Target_Brk_Press msg))
    (cl:cons ':Target_Steer_F (Target_Steer_F msg))
    (cl:cons ':Target_Steer_F_En (Target_Steer_F_En msg))
    (cl:cons ':Target_Steer_R (Target_Steer_R msg))
    (cl:cons ':Target_Steer_R_En (Target_Steer_R_En msg))
    (cl:cons ':EPB_Switch (EPB_Switch msg))
    (cl:cons ':Target_Mode (Target_Mode msg))
))
