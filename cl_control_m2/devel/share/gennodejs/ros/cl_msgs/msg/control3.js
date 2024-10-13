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

class control3 {
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
      this.Target_Brk_Press = null;
      this.Target_Steer_F = null;
      this.Target_Steer_F_En = null;
      this.Target_Steer_R = null;
      this.Target_Steer_R_En = null;
      this.EPB_Switch = null;
      this.Target_Mode = null;
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
    // Serializes a message object of type control3
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
    //deserializes a message object of type control3
    let len;
    let data = new control3(null);
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
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/control3';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '97f59ffa6578ff05e846f79c2eb2217c';
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
    const resolved = new control3(null);
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

module.exports = control3;
