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

class control2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Target_Brk_Press = null;
      this.Target_Steer_F = null;
      this.Target_Steer_F_En = null;
      this.Target_Steer_R = null;
      this.Target_Steer_R_En = null;
      this.EPB_Switch = null;
      this.Target_Mode = null;
    }
    else {
      if (initObj.hasOwnProperty('Target_Brk_Press')) {
        this.Target_Brk_Press = initObj.Target_Brk_Press
      }
      else {
        this.Target_Brk_Press = 0.0;
      }
      if (initObj.hasOwnProperty('Target_Steer_F')) {
        this.Target_Steer_F = initObj.Target_Steer_F
      }
      else {
        this.Target_Steer_F = 0;
      }
      if (initObj.hasOwnProperty('Target_Steer_F_En')) {
        this.Target_Steer_F_En = initObj.Target_Steer_F_En
      }
      else {
        this.Target_Steer_F_En = 0;
      }
      if (initObj.hasOwnProperty('Target_Steer_R')) {
        this.Target_Steer_R = initObj.Target_Steer_R
      }
      else {
        this.Target_Steer_R = 0;
      }
      if (initObj.hasOwnProperty('Target_Steer_R_En')) {
        this.Target_Steer_R_En = initObj.Target_Steer_R_En
      }
      else {
        this.Target_Steer_R_En = 0;
      }
      if (initObj.hasOwnProperty('EPB_Switch')) {
        this.EPB_Switch = initObj.EPB_Switch
      }
      else {
        this.EPB_Switch = 0;
      }
      if (initObj.hasOwnProperty('Target_Mode')) {
        this.Target_Mode = initObj.Target_Mode
      }
      else {
        this.Target_Mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type control2
    // Serialize message field [Target_Brk_Press]
    bufferOffset = _serializer.float32(obj.Target_Brk_Press, buffer, bufferOffset);
    // Serialize message field [Target_Steer_F]
    bufferOffset = _serializer.uint16(obj.Target_Steer_F, buffer, bufferOffset);
    // Serialize message field [Target_Steer_F_En]
    bufferOffset = _serializer.uint8(obj.Target_Steer_F_En, buffer, bufferOffset);
    // Serialize message field [Target_Steer_R]
    bufferOffset = _serializer.uint16(obj.Target_Steer_R, buffer, bufferOffset);
    // Serialize message field [Target_Steer_R_En]
    bufferOffset = _serializer.uint8(obj.Target_Steer_R_En, buffer, bufferOffset);
    // Serialize message field [EPB_Switch]
    bufferOffset = _serializer.uint8(obj.EPB_Switch, buffer, bufferOffset);
    // Serialize message field [Target_Mode]
    bufferOffset = _serializer.uint8(obj.Target_Mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type control2
    let len;
    let data = new control2(null);
    // Deserialize message field [Target_Brk_Press]
    data.Target_Brk_Press = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Target_Steer_F]
    data.Target_Steer_F = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Target_Steer_F_En]
    data.Target_Steer_F_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Target_Steer_R]
    data.Target_Steer_R = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Target_Steer_R_En]
    data.Target_Steer_R_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [EPB_Switch]
    data.EPB_Switch = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Target_Mode]
    data.Target_Mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/control2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '02be7a927824000275f436c65ca9b8d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Target_Brk_Press
    uint16 Target_Steer_F
    uint8 Target_Steer_F_En
    uint16 Target_Steer_R
    uint8 Target_Steer_R_En
    uint8 EPB_Switch
    uint8 Target_Mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new control2(null);
    if (msg.Target_Brk_Press !== undefined) {
      resolved.Target_Brk_Press = msg.Target_Brk_Press;
    }
    else {
      resolved.Target_Brk_Press = 0.0
    }

    if (msg.Target_Steer_F !== undefined) {
      resolved.Target_Steer_F = msg.Target_Steer_F;
    }
    else {
      resolved.Target_Steer_F = 0
    }

    if (msg.Target_Steer_F_En !== undefined) {
      resolved.Target_Steer_F_En = msg.Target_Steer_F_En;
    }
    else {
      resolved.Target_Steer_F_En = 0
    }

    if (msg.Target_Steer_R !== undefined) {
      resolved.Target_Steer_R = msg.Target_Steer_R;
    }
    else {
      resolved.Target_Steer_R = 0
    }

    if (msg.Target_Steer_R_En !== undefined) {
      resolved.Target_Steer_R_En = msg.Target_Steer_R_En;
    }
    else {
      resolved.Target_Steer_R_En = 0
    }

    if (msg.EPB_Switch !== undefined) {
      resolved.EPB_Switch = msg.EPB_Switch;
    }
    else {
      resolved.EPB_Switch = 0
    }

    if (msg.Target_Mode !== undefined) {
      resolved.Target_Mode = msg.Target_Mode;
    }
    else {
      resolved.Target_Mode = 0
    }

    return resolved;
    }
};

module.exports = control2;
