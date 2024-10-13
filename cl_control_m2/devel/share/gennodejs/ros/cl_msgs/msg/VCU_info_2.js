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

class VCU_info_2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.GearPosition_LF = null;
      this.GearPosition_RF = null;
      this.GearPosition_LR = null;
      this.GearPosition_RR = null;
      this.VCU_Life_Signal = null;
      this.VCU_Mode = null;
      this.EPB_Status = null;
      this.IPC_Status = null;
      this.Hardware_Error_Level = null;
      this.RemoteController_Status = null;
      this.SES_F_En_Status = null;
      this.SES_R_En_Status = null;
      this.DBS_Status = null;
      this.Pressure = null;
      this.SES_F_Error_Level = null;
      this.SES_R_Error_Level = null;
      this.BMS_Error = null;
      this.DCDC_Error = null;
      this.EPB_Error = null;
      this.DBS_ErrorCode = null;
    }
    else {
      if (initObj.hasOwnProperty('GearPosition_LF')) {
        this.GearPosition_LF = initObj.GearPosition_LF
      }
      else {
        this.GearPosition_LF = 0;
      }
      if (initObj.hasOwnProperty('GearPosition_RF')) {
        this.GearPosition_RF = initObj.GearPosition_RF
      }
      else {
        this.GearPosition_RF = 0;
      }
      if (initObj.hasOwnProperty('GearPosition_LR')) {
        this.GearPosition_LR = initObj.GearPosition_LR
      }
      else {
        this.GearPosition_LR = 0;
      }
      if (initObj.hasOwnProperty('GearPosition_RR')) {
        this.GearPosition_RR = initObj.GearPosition_RR
      }
      else {
        this.GearPosition_RR = 0;
      }
      if (initObj.hasOwnProperty('VCU_Life_Signal')) {
        this.VCU_Life_Signal = initObj.VCU_Life_Signal
      }
      else {
        this.VCU_Life_Signal = 0;
      }
      if (initObj.hasOwnProperty('VCU_Mode')) {
        this.VCU_Mode = initObj.VCU_Mode
      }
      else {
        this.VCU_Mode = 0;
      }
      if (initObj.hasOwnProperty('EPB_Status')) {
        this.EPB_Status = initObj.EPB_Status
      }
      else {
        this.EPB_Status = 0;
      }
      if (initObj.hasOwnProperty('IPC_Status')) {
        this.IPC_Status = initObj.IPC_Status
      }
      else {
        this.IPC_Status = 0;
      }
      if (initObj.hasOwnProperty('Hardware_Error_Level')) {
        this.Hardware_Error_Level = initObj.Hardware_Error_Level
      }
      else {
        this.Hardware_Error_Level = 0;
      }
      if (initObj.hasOwnProperty('RemoteController_Status')) {
        this.RemoteController_Status = initObj.RemoteController_Status
      }
      else {
        this.RemoteController_Status = 0;
      }
      if (initObj.hasOwnProperty('SES_F_En_Status')) {
        this.SES_F_En_Status = initObj.SES_F_En_Status
      }
      else {
        this.SES_F_En_Status = 0;
      }
      if (initObj.hasOwnProperty('SES_R_En_Status')) {
        this.SES_R_En_Status = initObj.SES_R_En_Status
      }
      else {
        this.SES_R_En_Status = 0;
      }
      if (initObj.hasOwnProperty('DBS_Status')) {
        this.DBS_Status = initObj.DBS_Status
      }
      else {
        this.DBS_Status = 0;
      }
      if (initObj.hasOwnProperty('Pressure')) {
        this.Pressure = initObj.Pressure
      }
      else {
        this.Pressure = 0.0;
      }
      if (initObj.hasOwnProperty('SES_F_Error_Level')) {
        this.SES_F_Error_Level = initObj.SES_F_Error_Level
      }
      else {
        this.SES_F_Error_Level = 0;
      }
      if (initObj.hasOwnProperty('SES_R_Error_Level')) {
        this.SES_R_Error_Level = initObj.SES_R_Error_Level
      }
      else {
        this.SES_R_Error_Level = 0;
      }
      if (initObj.hasOwnProperty('BMS_Error')) {
        this.BMS_Error = initObj.BMS_Error
      }
      else {
        this.BMS_Error = 0;
      }
      if (initObj.hasOwnProperty('DCDC_Error')) {
        this.DCDC_Error = initObj.DCDC_Error
      }
      else {
        this.DCDC_Error = 0;
      }
      if (initObj.hasOwnProperty('EPB_Error')) {
        this.EPB_Error = initObj.EPB_Error
      }
      else {
        this.EPB_Error = 0;
      }
      if (initObj.hasOwnProperty('DBS_ErrorCode')) {
        this.DBS_ErrorCode = initObj.DBS_ErrorCode
      }
      else {
        this.DBS_ErrorCode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VCU_info_2
    // Serialize message field [GearPosition_LF]
    bufferOffset = _serializer.uint8(obj.GearPosition_LF, buffer, bufferOffset);
    // Serialize message field [GearPosition_RF]
    bufferOffset = _serializer.uint8(obj.GearPosition_RF, buffer, bufferOffset);
    // Serialize message field [GearPosition_LR]
    bufferOffset = _serializer.uint8(obj.GearPosition_LR, buffer, bufferOffset);
    // Serialize message field [GearPosition_RR]
    bufferOffset = _serializer.uint8(obj.GearPosition_RR, buffer, bufferOffset);
    // Serialize message field [VCU_Life_Signal]
    bufferOffset = _serializer.uint8(obj.VCU_Life_Signal, buffer, bufferOffset);
    // Serialize message field [VCU_Mode]
    bufferOffset = _serializer.uint8(obj.VCU_Mode, buffer, bufferOffset);
    // Serialize message field [EPB_Status]
    bufferOffset = _serializer.uint8(obj.EPB_Status, buffer, bufferOffset);
    // Serialize message field [IPC_Status]
    bufferOffset = _serializer.uint8(obj.IPC_Status, buffer, bufferOffset);
    // Serialize message field [Hardware_Error_Level]
    bufferOffset = _serializer.uint8(obj.Hardware_Error_Level, buffer, bufferOffset);
    // Serialize message field [RemoteController_Status]
    bufferOffset = _serializer.uint8(obj.RemoteController_Status, buffer, bufferOffset);
    // Serialize message field [SES_F_En_Status]
    bufferOffset = _serializer.uint8(obj.SES_F_En_Status, buffer, bufferOffset);
    // Serialize message field [SES_R_En_Status]
    bufferOffset = _serializer.uint8(obj.SES_R_En_Status, buffer, bufferOffset);
    // Serialize message field [DBS_Status]
    bufferOffset = _serializer.uint8(obj.DBS_Status, buffer, bufferOffset);
    // Serialize message field [Pressure]
    bufferOffset = _serializer.float32(obj.Pressure, buffer, bufferOffset);
    // Serialize message field [SES_F_Error_Level]
    bufferOffset = _serializer.uint8(obj.SES_F_Error_Level, buffer, bufferOffset);
    // Serialize message field [SES_R_Error_Level]
    bufferOffset = _serializer.uint8(obj.SES_R_Error_Level, buffer, bufferOffset);
    // Serialize message field [BMS_Error]
    bufferOffset = _serializer.uint8(obj.BMS_Error, buffer, bufferOffset);
    // Serialize message field [DCDC_Error]
    bufferOffset = _serializer.uint8(obj.DCDC_Error, buffer, bufferOffset);
    // Serialize message field [EPB_Error]
    bufferOffset = _serializer.uint8(obj.EPB_Error, buffer, bufferOffset);
    // Serialize message field [DBS_ErrorCode]
    bufferOffset = _serializer.uint8(obj.DBS_ErrorCode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VCU_info_2
    let len;
    let data = new VCU_info_2(null);
    // Deserialize message field [GearPosition_LF]
    data.GearPosition_LF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [GearPosition_RF]
    data.GearPosition_RF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [GearPosition_LR]
    data.GearPosition_LR = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [GearPosition_RR]
    data.GearPosition_RR = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [VCU_Life_Signal]
    data.VCU_Life_Signal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [VCU_Mode]
    data.VCU_Mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [EPB_Status]
    data.EPB_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [IPC_Status]
    data.IPC_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Hardware_Error_Level]
    data.Hardware_Error_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RemoteController_Status]
    data.RemoteController_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [SES_F_En_Status]
    data.SES_F_En_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [SES_R_En_Status]
    data.SES_R_En_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DBS_Status]
    data.DBS_Status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Pressure]
    data.Pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [SES_F_Error_Level]
    data.SES_F_Error_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [SES_R_Error_Level]
    data.SES_R_Error_Level = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [BMS_Error]
    data.BMS_Error = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DCDC_Error]
    data.DCDC_Error = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [EPB_Error]
    data.EPB_Error = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [DBS_ErrorCode]
    data.DBS_ErrorCode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 23;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/VCU_info_2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1fba2325979e73c72ceeacbad9e46de';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 GearPosition_LF
    uint8 GearPosition_RF
    uint8 GearPosition_LR
    uint8 GearPosition_RR
    uint8 VCU_Life_Signal
    uint8 VCU_Mode
    uint8 EPB_Status
    uint8 IPC_Status
    uint8 Hardware_Error_Level
    uint8 RemoteController_Status
    uint8 SES_F_En_Status
    uint8 SES_R_En_Status
    uint8 DBS_Status
    float32 Pressure
    uint8 SES_F_Error_Level
    uint8 SES_R_Error_Level
    uint8 BMS_Error
    uint8 DCDC_Error
    uint8 EPB_Error
    uint8 DBS_ErrorCode
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VCU_info_2(null);
    if (msg.GearPosition_LF !== undefined) {
      resolved.GearPosition_LF = msg.GearPosition_LF;
    }
    else {
      resolved.GearPosition_LF = 0
    }

    if (msg.GearPosition_RF !== undefined) {
      resolved.GearPosition_RF = msg.GearPosition_RF;
    }
    else {
      resolved.GearPosition_RF = 0
    }

    if (msg.GearPosition_LR !== undefined) {
      resolved.GearPosition_LR = msg.GearPosition_LR;
    }
    else {
      resolved.GearPosition_LR = 0
    }

    if (msg.GearPosition_RR !== undefined) {
      resolved.GearPosition_RR = msg.GearPosition_RR;
    }
    else {
      resolved.GearPosition_RR = 0
    }

    if (msg.VCU_Life_Signal !== undefined) {
      resolved.VCU_Life_Signal = msg.VCU_Life_Signal;
    }
    else {
      resolved.VCU_Life_Signal = 0
    }

    if (msg.VCU_Mode !== undefined) {
      resolved.VCU_Mode = msg.VCU_Mode;
    }
    else {
      resolved.VCU_Mode = 0
    }

    if (msg.EPB_Status !== undefined) {
      resolved.EPB_Status = msg.EPB_Status;
    }
    else {
      resolved.EPB_Status = 0
    }

    if (msg.IPC_Status !== undefined) {
      resolved.IPC_Status = msg.IPC_Status;
    }
    else {
      resolved.IPC_Status = 0
    }

    if (msg.Hardware_Error_Level !== undefined) {
      resolved.Hardware_Error_Level = msg.Hardware_Error_Level;
    }
    else {
      resolved.Hardware_Error_Level = 0
    }

    if (msg.RemoteController_Status !== undefined) {
      resolved.RemoteController_Status = msg.RemoteController_Status;
    }
    else {
      resolved.RemoteController_Status = 0
    }

    if (msg.SES_F_En_Status !== undefined) {
      resolved.SES_F_En_Status = msg.SES_F_En_Status;
    }
    else {
      resolved.SES_F_En_Status = 0
    }

    if (msg.SES_R_En_Status !== undefined) {
      resolved.SES_R_En_Status = msg.SES_R_En_Status;
    }
    else {
      resolved.SES_R_En_Status = 0
    }

    if (msg.DBS_Status !== undefined) {
      resolved.DBS_Status = msg.DBS_Status;
    }
    else {
      resolved.DBS_Status = 0
    }

    if (msg.Pressure !== undefined) {
      resolved.Pressure = msg.Pressure;
    }
    else {
      resolved.Pressure = 0.0
    }

    if (msg.SES_F_Error_Level !== undefined) {
      resolved.SES_F_Error_Level = msg.SES_F_Error_Level;
    }
    else {
      resolved.SES_F_Error_Level = 0
    }

    if (msg.SES_R_Error_Level !== undefined) {
      resolved.SES_R_Error_Level = msg.SES_R_Error_Level;
    }
    else {
      resolved.SES_R_Error_Level = 0
    }

    if (msg.BMS_Error !== undefined) {
      resolved.BMS_Error = msg.BMS_Error;
    }
    else {
      resolved.BMS_Error = 0
    }

    if (msg.DCDC_Error !== undefined) {
      resolved.DCDC_Error = msg.DCDC_Error;
    }
    else {
      resolved.DCDC_Error = 0
    }

    if (msg.EPB_Error !== undefined) {
      resolved.EPB_Error = msg.EPB_Error;
    }
    else {
      resolved.EPB_Error = 0
    }

    if (msg.DBS_ErrorCode !== undefined) {
      resolved.DBS_ErrorCode = msg.DBS_ErrorCode;
    }
    else {
      resolved.DBS_ErrorCode = 0
    }

    return resolved;
    }
};

module.exports = VCU_info_2;
