; Auto-generated. Do not edit!


(cl:in-package styx_msgs-msg)


;//! \htmlinclude uwb.msg.html

(cl:defclass <uwb> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (distance0
    :reader distance0
    :initarg :distance0
    :type cl:float
    :initform 0.0)
   (distance1
    :reader distance1
    :initarg :distance1
    :type cl:float
    :initform 0.0)
   (distance2
    :reader distance2
    :initarg :distance2
    :type cl:float
    :initform 0.0))
)

(cl:defclass uwb (<uwb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <uwb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'uwb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name styx_msgs-msg:<uwb> is deprecated: use styx_msgs-msg:uwb instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:header-val is deprecated.  Use styx_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:pose-val is deprecated.  Use styx_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'distance0-val :lambda-list '(m))
(cl:defmethod distance0-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:distance0-val is deprecated.  Use styx_msgs-msg:distance0 instead.")
  (distance0 m))

(cl:ensure-generic-function 'distance1-val :lambda-list '(m))
(cl:defmethod distance1-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:distance1-val is deprecated.  Use styx_msgs-msg:distance1 instead.")
  (distance1 m))

(cl:ensure-generic-function 'distance2-val :lambda-list '(m))
(cl:defmethod distance2-val ((m <uwb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-msg:distance2-val is deprecated.  Use styx_msgs-msg:distance2 instead.")
  (distance2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <uwb>) ostream)
  "Serializes a message object of type '<uwb>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <uwb>) istream)
  "Deserializes a message object of type '<uwb>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance2) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<uwb>)))
  "Returns string type for a message object of type '<uwb>"
  "styx_msgs/uwb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'uwb)))
  "Returns string type for a message object of type 'uwb"
  "styx_msgs/uwb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<uwb>)))
  "Returns md5sum for a message object of type '<uwb>"
  "100136466d037274d5e51cedbebd7e9f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'uwb)))
  "Returns md5sum for a message object of type 'uwb"
  "100136466d037274d5e51cedbebd7e9f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<uwb>)))
  "Returns full string definition for message of type '<uwb>"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose pose~%float32 distance0~%float32 distance1~%float32 distance2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'uwb)))
  "Returns full string definition for message of type 'uwb"
  (cl:format cl:nil "Header header~%geometry_msgs/Pose pose~%float32 distance0~%float32 distance1~%float32 distance2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <uwb>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <uwb>))
  "Converts a ROS message object to a list"
  (cl:list 'uwb
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':distance0 (distance0 msg))
    (cl:cons ':distance1 (distance1 msg))
    (cl:cons ':distance2 (distance2 msg))
))
