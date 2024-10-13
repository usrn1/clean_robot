; Auto-generated. Do not edit!


(cl:in-package styx_msgs-msg)


;//! \htmlinclude EStop.msg.html

(cl:defclass <EStop> (roslisp-msg-protocol:ros-message)
  ((EStop
    :reader EStop
    :initarg :EStop
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass EStop (<EStop>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EStop>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EStop)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name styx_msgs-msg:<EStop> is deprecated: use styx_msgs-msg:EStop instead.")))

(cl:ensure-generic-function 'EStop-val :lambda-list '(m))
(cl:defmethod EStop-val ((m <EStop>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:EStop-val is deprecated.  Use styx_msgs-msg:EStop instead.")
  (EStop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EStop>) ostream)
  "Serializes a message object of type '<EStop>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'EStop) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EStop>) istream)
  "Deserializes a message object of type '<EStop>"
    (cl:setf (cl:slot-value msg 'EStop) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EStop>)))
  "Returns string type for a message object of type '<EStop>"
  "styx_msgs/EStop")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EStop)))
  "Returns string type for a message object of type 'EStop"
  "styx_msgs/EStop")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EStop>)))
  "Returns md5sum for a message object of type '<EStop>"
  "15c187ac41fba10560c992ebbf27db9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EStop)))
  "Returns md5sum for a message object of type 'EStop"
  "15c187ac41fba10560c992ebbf27db9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EStop>)))
  "Returns full string definition for message of type '<EStop>"
  (cl:format cl:nil "bool EStop~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EStop)))
  "Returns full string definition for message of type 'EStop"
  (cl:format cl:nil "bool EStop~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EStop>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EStop>))
  "Converts a ROS message object to a list"
  (cl:list 'EStop
    (cl:cons ':EStop (EStop msg))
))
