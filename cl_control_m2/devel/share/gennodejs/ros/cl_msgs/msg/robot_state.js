// Auto-generated. Do not edit!

// (in-package cl_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class robot_state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Battery_Voltage = null;
    }
    else {
      if (initObj.hasOwnProperty('Battery_Voltage')) {
        this.Battery_Voltage = initObj.Battery_Voltage
      }
      else {
        this.Battery_Voltage = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_state
    // Serialize message field [Battery_Voltage]
    bufferOffset = _serializer.float32(obj.Battery_Voltage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_state
    let len;
    let data = new robot_state(null);
    // Deserialize message field [Battery_Voltage]
    data.Battery_Voltage = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/robot_state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '07ecd9f6cbdbd3754f8acf0447d36bfd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Battery_Voltage
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_state(null);
    if (msg.Battery_Voltage !== undefined) {
      resolved.Battery_Voltage = msg.Battery_Voltage;
    }
    else {
      resolved.Battery_Voltage = 0.0
    }

    return resolved;
    }
};

module.exports = robot_state;
