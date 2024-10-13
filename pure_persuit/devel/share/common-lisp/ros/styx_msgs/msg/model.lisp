; Auto-generated. Do not edit!


(cl:in-package styx_msgs-msg)


;//! \htmlinclude model.msg.html

(cl:defclass <model> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0))
)

(cl:defclass model (<model>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <model>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'model)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name styx_msgs-msg:<model> is deprecated: use styx_msgs-msg:model instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <model>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:a-val is deprecated.  Use styx_msgs-msg:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <model>) ostream)
  "Serializes a message object of type '<model>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <model>) istream)
  "Deserializes a message object of type '<model>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<model>)))
  "Returns string type for a message object of type '<model>"
  "styx_msgs/model")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'model)))
  "Returns string type for a message object of type 'model"
  "styx_msgs/model")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<model>)))
  "Returns md5sum for a message object of type '<model>"
  "5c9fb1a886e81e3162a5c87bf55c072b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'model)))
  "Returns md5sum for a message object of type 'model"
  "5c9fb1a886e81e3162a5c87bf55c072b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<model>)))
  "Returns full string definition for message of type '<model>"
  (cl:format cl:nil "int32 a~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'model)))
  "Returns full string definition for message of type 'model"
  (cl:format cl:nil "int32 a~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <model>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <model>))
  "Converts a ROS message object to a list"
  (cl:list 'model
    (cl:cons ':a (a msg))
))
