// Auto-generated. Do not edit!

// (in-package styx_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class uwb {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pose = null;
      this.distance0 = null;
      this.distance1 = null;
      this.distance2 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('distance0')) {
        this.distance0 = initObj.distance0
      }
      else {
        this.distance0 = 0.0;
      }
      if (initObj.hasOwnProperty('distance1')) {
        this.distance1 = initObj.distance1
      }
      else {
        this.distance1 = 0.0;
      }
      if (initObj.hasOwnProperty('distance2')) {
        this.distance2 = initObj.distance2
      }
      else {
        this.distance2 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type uwb
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [distance0]
    bufferOffset = _serializer.float32(obj.distance0, buffer, bufferOffset);
    // Serialize message field [distance1]
    bufferOffset = _serializer.float32(obj.distance1, buffer, bufferOffset);
    // Serialize message field [distance2]
    bufferOffset = _serializer.float32(obj.distance2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type uwb
    let len;
    let data = new uwb(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance0]
    data.distance0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance1]
    data.distance1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance2]
    data.distance2 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'styx_msgs/uwb';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '100136466d037274d5e51cedbebd7e9f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Pose pose
    float32 distance0
    float32 distance1
    float32 distance2
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new uwb(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.distance0 !== undefined) {
      resolved.distance0 = msg.distance0;
    }
    else {
      resolved.distance0 = 0.0
    }

    if (msg.distance1 !== undefined) {
      resolved.distance1 = msg.distance1;
    }
    else {
      resolved.distance1 = 0.0
    }

    if (msg.distance2 !== undefined) {
      resolved.distance2 = msg.distance2;
    }
    else {
      resolved.distance2 = 0.0
    }

    return resolved;
    }
};

module.exports = uwb;
