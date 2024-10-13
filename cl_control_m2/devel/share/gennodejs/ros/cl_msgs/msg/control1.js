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

class control1 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.LF_Rpm = null;
      this.RF_Rpm = null;
      this.LR_Rpm = null;
      this.RR_Rpm = null;
      this.LF_Motor_Gear = null;
      this.RF_Motor_Gear = null;
      this.LR_Motor_Gear = null;
      this.RR_Motor_Gear = null;
      this.LF_Motor_En = null;
      this.RF_Motor_En = null;
      this.LR_Motor_En = null;
      this.RR_Motor_En = null;
      this.LF_Motor_Brake = null;
      this.RF_Motor_Brake = null;
      this.LR_Motor_Brake = null;
      this.RR_Motor_Brake = null;
    }
    else {
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
      if (initObj.hasOwnProperty('LF_Motor_Gear')) {
        this.LF_Motor_Gear = initObj.LF_Motor_Gear
      }
      else {
        this.LF_Motor_Gear = 0;
      }
      if (initObj.hasOwnProperty('RF_Motor_Gear')) {
        this.RF_Motor_Gear = initObj.RF_Motor_Gear
      }
      else {
        this.RF_Motor_Gear = 0;
      }
      if (initObj.hasOwnProperty('LR_Motor_Gear')) {
        this.LR_Motor_Gear = initObj.LR_Motor_Gear
      }
      else {
        this.LR_Motor_Gear = 0;
      }
      if (initObj.hasOwnProperty('RR_Motor_Gear')) {
        this.RR_Motor_Gear = initObj.RR_Motor_Gear
      }
      else {
        this.RR_Motor_Gear = 0;
      }
      if (initObj.hasOwnProperty('LF_Motor_En')) {
        this.LF_Motor_En = initObj.LF_Motor_En
      }
      else {
        this.LF_Motor_En = 0;
      }
      if (initObj.hasOwnProperty('RF_Motor_En')) {
        this.RF_Motor_En = initObj.RF_Motor_En
      }
      else {
        this.RF_Motor_En = 0;
      }
      if (initObj.hasOwnProperty('LR_Motor_En')) {
        this.LR_Motor_En = initObj.LR_Motor_En
      }
      else {
        this.LR_Motor_En = 0;
      }
      if (initObj.hasOwnProperty('RR_Motor_En')) {
        this.RR_Motor_En = initObj.RR_Motor_En
      }
      else {
        this.RR_Motor_En = 0;
      }
      if (initObj.hasOwnProperty('LF_Motor_Brake')) {
        this.LF_Motor_Brake = initObj.LF_Motor_Brake
      }
      else {
        this.LF_Motor_Brake = 0;
      }
      if (initObj.hasOwnProperty('RF_Motor_Brake')) {
        this.RF_Motor_Brake = initObj.RF_Motor_Brake
      }
      else {
        this.RF_Motor_Brake = 0;
      }
      if (initObj.hasOwnProperty('LR_Motor_Brake')) {
        this.LR_Motor_Brake = initObj.LR_Motor_Brake
      }
      else {
        this.LR_Motor_Brake = 0;
      }
      if (initObj.hasOwnProperty('RR_Motor_Brake')) {
        this.RR_Motor_Brake = initObj.RR_Motor_Brake
      }
      else {
        this.RR_Motor_Brake = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type control1
    // Serialize message field [LF_Rpm]
    bufferOffset = _serializer.uint16(obj.LF_Rpm, buffer, bufferOffset);
    // Serialize message field [RF_Rpm]
    bufferOffset = _serializer.uint16(obj.RF_Rpm, buffer, bufferOffset);
    // Serialize message field [LR_Rpm]
    bufferOffset = _serializer.uint16(obj.LR_Rpm, buffer, bufferOffset);
    // Serialize message field [RR_Rpm]
    bufferOffset = _serializer.uint16(obj.RR_Rpm, buffer, bufferOffset);
    // Serialize message field [LF_Motor_Gear]
    bufferOffset = _serializer.uint8(obj.LF_Motor_Gear, buffer, bufferOffset);
    // Serialize message field [RF_Motor_Gear]
    bufferOffset = _serializer.uint8(obj.RF_Motor_Gear, buffer, bufferOffset);
    // Serialize message field [LR_Motor_Gear]
    bufferOffset = _serializer.uint8(obj.LR_Motor_Gear, buffer, bufferOffset);
    // Serialize message field [RR_Motor_Gear]
    bufferOffset = _serializer.uint8(obj.RR_Motor_Gear, buffer, bufferOffset);
    // Serialize message field [LF_Motor_En]
    bufferOffset = _serializer.uint8(obj.LF_Motor_En, buffer, bufferOffset);
    // Serialize message field [RF_Motor_En]
    bufferOffset = _serializer.uint8(obj.RF_Motor_En, buffer, bufferOffset);
    // Serialize message field [LR_Motor_En]
    bufferOffset = _serializer.uint8(obj.LR_Motor_En, buffer, bufferOffset);
    // Serialize message field [RR_Motor_En]
    bufferOffset = _serializer.uint8(obj.RR_Motor_En, buffer, bufferOffset);
    // Serialize message field [LF_Motor_Brake]
    bufferOffset = _serializer.uint8(obj.LF_Motor_Brake, buffer, bufferOffset);
    // Serialize message field [RF_Motor_Brake]
    bufferOffset = _serializer.uint8(obj.RF_Motor_Brake, buffer, bufferOffset);
    // Serialize message field [LR_Motor_Brake]
    bufferOffset = _serializer.uint8(obj.LR_Motor_Brake, buffer, bufferOffset);
    // Serialize message field [RR_Motor_Brake]
    bufferOffset = _serializer.uint8(obj.RR_Motor_Brake, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type control1
    let len;
    let data = new control1(null);
    // Deserialize message field [LF_Rpm]
    data.LF_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [RF_Rpm]
    data.RF_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [LR_Rpm]
    data.LR_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [RR_Rpm]
    data.RR_Rpm = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [LF_Motor_Gear]
    data.LF_Motor_Gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RF_Motor_Gear]
    data.RF_Motor_Gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LR_Motor_Gear]
    data.LR_Motor_Gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RR_Motor_Gear]
    data.RR_Motor_Gear = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LF_Motor_En]
    data.LF_Motor_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RF_Motor_En]
    data.RF_Motor_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LR_Motor_En]
    data.LR_Motor_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RR_Motor_En]
    data.RR_Motor_En = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LF_Motor_Brake]
    data.LF_Motor_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RF_Motor_Brake]
    data.RF_Motor_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [LR_Motor_Brake]
    data.LR_Motor_Brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RR_Motor_Brake]
    data.RR_Motor_Brake = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/control1';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c19fad33fe2c8cea2d2038649cc83ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 LF_Rpm
    uint16 RF_Rpm
    uint16 LR_Rpm
    uint16 RR_Rpm
    uint8 LF_Motor_Gear
    uint8 RF_Motor_Gear
    uint8 LR_Motor_Gear
    uint8 RR_Motor_Gear
    uint8 LF_Motor_En
    uint8 RF_Motor_En
    uint8 LR_Motor_En
    uint8 RR_Motor_En
    uint8 LF_Motor_Brake
    uint8 RF_Motor_Brake
    uint8 LR_Motor_Brake
    uint8 RR_Motor_Brake
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new control1(null);
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

    if (msg.LF_Motor_Gear !== undefined) {
      resolved.LF_Motor_Gear = msg.LF_Motor_Gear;
    }
    else {
      resolved.LF_Motor_Gear = 0
    }

    if (msg.RF_Motor_Gear !== undefined) {
      resolved.RF_Motor_Gear = msg.RF_Motor_Gear;
    }
    else {
      resolved.RF_Motor_Gear = 0
    }

    if (msg.LR_Motor_Gear !== undefined) {
      resolved.LR_Motor_Gear = msg.LR_Motor_Gear;
    }
    else {
      resolved.LR_Motor_Gear = 0
    }

    if (msg.RR_Motor_Gear !== undefined) {
      resolved.RR_Motor_Gear = msg.RR_Motor_Gear;
    }
    else {
      resolved.RR_Motor_Gear = 0
    }

    if (msg.LF_Motor_En !== undefined) {
      resolved.LF_Motor_En = msg.LF_Motor_En;
    }
    else {
      resolved.LF_Motor_En = 0
    }

    if (msg.RF_Motor_En !== undefined) {
      resolved.RF_Motor_En = msg.RF_Motor_En;
    }
    else {
      resolved.RF_Motor_En = 0
    }

    if (msg.LR_Motor_En !== undefined) {
      resolved.LR_Motor_En = msg.LR_Motor_En;
    }
    else {
      resolved.LR_Motor_En = 0
    }

    if (msg.RR_Motor_En !== undefined) {
      resolved.RR_Motor_En = msg.RR_Motor_En;
    }
    else {
      resolved.RR_Motor_En = 0
    }

    if (msg.LF_Motor_Brake !== undefined) {
      resolved.LF_Motor_Brake = msg.LF_Motor_Brake;
    }
    else {
      resolved.LF_Motor_Brake = 0
    }

    if (msg.RF_Motor_Brake !== undefined) {
      resolved.RF_Motor_Brake = msg.RF_Motor_Brake;
    }
    else {
      resolved.RF_Motor_Brake = 0
    }

    if (msg.LR_Motor_Brake !== undefined) {
      resolved.LR_Motor_Brake = msg.LR_Motor_Brake;
    }
    else {
      resolved.LR_Motor_Brake = 0
    }

    if (msg.RR_Motor_Brake !== undefined) {
      resolved.RR_Motor_Brake = msg.RR_Motor_Brake;
    }
    else {
      resolved.RR_Motor_Brake = 0
    }

    return resolved;
    }
};

module.exports = control1;
