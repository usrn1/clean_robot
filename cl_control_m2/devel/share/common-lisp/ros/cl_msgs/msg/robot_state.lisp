; Auto-generated. Do not edit!


(cl:in-package cl_msgs-msg)


;//! \htmlinclude robot_state.msg.html

(cl:defclass <robot_state> (roslisp-msg-protocol:ros-message)
  ((Battery_Voltage
    :reader Battery_Voltage
    :initarg :Battery_Voltage
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_state (<robot_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cl_msgs-msg:<robot_state> is deprecated: use cl_msgs-msg:robot_state instead.")))

(cl:ensure-generic-function 'Battery_Voltage-val :lambda-list '(m))
(cl:defmethod Battery_Voltage-val ((m <robot_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cl_msgs-msg:Battery_Voltage-val is deprecated.  Use cl_msgs-msg:Battery_Voltage instead.")
  (Battery_Voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_state>) ostream)
  "Serializes a message object of type '<robot_state>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Battery_Voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_state>) istream)
  "Deserializes a message object of type '<robot_state>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Battery_Voltage) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_state>)))
  "Returns string type for a message object of type '<robot_state>"
  "cl_msgs/robot_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_state)))
  "Returns string type for a message object of type 'robot_state"
  "cl_msgs/robot_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_state>)))
  "Returns md5sum for a message object of type '<robot_state>"
  "07ecd9f6cbdbd3754f8acf0447d36bfd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_state)))
  "Returns md5sum for a message object of type 'robot_state"
  "07ecd9f6cbdbd3754f8acf0447d36bfd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_state>)))
  "Returns full string definition for message of type '<robot_state>"
  (cl:format cl:nil "float32 Battery_Voltage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_state)))
  "Returns full string definition for message of type 'robot_state"
  (cl:format cl:nil "float32 Battery_Voltage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_state>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_state>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_state
    (cl:cons ':Battery_Voltage (Battery_Voltage msg))
))
