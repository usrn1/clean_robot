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

class VCU_info_1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Angle_F = null;
      this.Angle_R = null;
      this.LF_Rpm = null;
      this.RF_Rpm = null;
      this.LR_Rpm = null;
      this.RR_Rpm = null;
    }
    else {
      if (initObj.hasOwnProperty('Angle_F')) {
        this.Angle_F = initObj.Angle_F
      }
      else {
        this.Angle_F = 0.0;
      }
      if (initObj.hasOwnProperty('Angle_R')) {
        this.Angle_R = initObj.Angle_R
      }
      else {
        this.Angle_R = 0.0;
      }
      if (initObj.hasOwnProperty('LF_Rpm')) {
        this.LF_Rpm = initObj.LF_Rpm
      }
      else {
        this.LF_Rpm = 0;
      }
      if (initObj.hasOwnProperty('RF_Rpm')) {
        this.RF_Rpm = initObj.RF_Rpm
      }
      else {
        this.RF_Rpm = 0;
      }
      if (initObj.hasOwnProperty('LR_Rpm')) {
        this.LR_Rpm = initObj.LR_Rpm
      }
      else {
        this.LR_Rpm = 0;
      }
      if (initObj.hasOwnProperty('RR_Rpm')) {
        this.RR_Rpm = initObj.RR_Rpm
      }
      else {
        this.RR_Rpm = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VCU_info_1
    // Serialize message field [Angle_F]
    bufferOffset = _serializer.float32(obj.Angle_F, buffer, bufferOffset);
    // Serialize message field [Angle_R]
    bufferOffset = _serializer.float32(obj.Angle_R, buffer, bufferOffset);
    // Serialize message field [LF_Rpm]
    bufferOffset = _serializer.uint16(obj.LF_Rpm, buffer, bufferOffset);
    // Serialize message field [RF_Rpm]
    bufferOffset = _serializer.uint16(obj.RF_Rpm, buffer, bufferOffset);
    // Serialize message field [LR_Rpm]
    bufferOffset = _serializer.uint16(obj.LR_Rpm, buffer, bufferOffset);
    // Serialize message field [RR_Rpm]
    bufferOffset = _serializer.uint16(obj.RR_Rpm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VCU_info_1
    let len;
    let data = new VCU_info_1(null);
    // Deserialize message field [Angle_F]
    data.Angle_F = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Angle_R]
    data.Angle_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [LF_Rpm]
    data.LF_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [RF_Rpm]
    data.RF_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [LR_Rpm]
    data.LR_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [RR_Rpm]
    data.RR_Rpm = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/VCU_info_1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '317dc21bd93b5222cd2a769eb3197f81';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Angle_F
    float32 Angle_R
    uint16 LF_Rpm
    uint16 RF_Rpm
    uint16 LR_Rpm
    uint16 RR_Rpm
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VCU_info_1(null);
    if (msg.Angle_F !== undefined) {
      resolved.Angle_F = msg.Angle_F;
    }
    else {
      resolved.Angle_F = 0.0
    }

    if (msg.Angle_R !== undefined) {
      resolved.Angle_R = msg.Angle_R;
    }
    else {
      resolved.Angle_R = 0.0
    }

    if (msg.LF_Rpm !== undefined) {
      resolved.LF_Rpm = msg.LF_Rpm;
    }
    else {
      resolved.LF_Rpm = 0
    }

    if (msg.RF_Rpm !== undefined) {
      resolved.RF_Rpm = msg.RF_Rpm;
    }
    else {
      resolved.RF_Rpm = 0
    }

    if (msg.LR_Rpm !== undefined) {
      resolved.LR_Rpm = msg.LR_Rpm;
    }
    else {
      resolved.LR_Rpm = 0
    }

    if (msg.RR_Rpm !== undefined) {
      resolved.RR_Rpm = msg.RR_Rpm;
    }
    else {
      resolved.RR_Rpm = 0
    }

    return resolved;
    }
};

module.exports = VCU_info_1;
