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

class VCU_info_3 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Battery_Voltage = null;
      this.SOC = null;
      this.Battery_Current = null;
      this.DCDC_Output_Voltage = null;
      this.DCDC_Output_Current = null;
    }
    else {
      if (initObj.hasOwnProperty('Battery_Voltage')) {
        this.Battery_Voltage = initObj.Battery_Voltage
      }
      else {
        this.Battery_Voltage = 0.0;
      }
      if (initObj.hasOwnProperty('SOC')) {
        this.SOC = initObj.SOC
      }
      else {
        this.SOC = 0.0;
      }
      if (initObj.hasOwnProperty('Battery_Current')) {
        this.Battery_Current = initObj.Battery_Current
      }
      else {
        this.Battery_Current = 0.0;
      }
      if (initObj.hasOwnProperty('DCDC_Output_Voltage')) {
        this.DCDC_Output_Voltage = initObj.DCDC_Output_Voltage
      }
      else {
        this.DCDC_Output_Voltage = 0.0;
      }
      if (initObj.hasOwnProperty('DCDC_Output_Current')) {
        this.DCDC_Output_Current = initObj.DCDC_Output_Current
      }
      else {
        this.DCDC_Output_Current = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VCU_info_3
    // Serialize message field [Battery_Voltage]
    bufferOffset = _serializer.float32(obj.Battery_Voltage, buffer, bufferOffset);
    // Serialize message field [SOC]
    bufferOffset = _serializer.float32(obj.SOC, buffer, bufferOffset);
    // Serialize message field [Battery_Current]
    bufferOffset = _serializer.float32(obj.Battery_Current, buffer, bufferOffset);
    // Serialize message field [DCDC_Output_Voltage]
    bufferOffset = _serializer.float32(obj.DCDC_Output_Voltage, buffer, bufferOffset);
    // Serialize message field [DCDC_Output_Current]
    bufferOffset = _serializer.float32(obj.DCDC_Output_Current, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VCU_info_3
    let len;
    let data = new VCU_info_3(null);
    // Deserialize message field [Battery_Voltage]
    data.Battery_Voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [SOC]
    data.SOC = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Battery_Current]
    data.Battery_Current = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [DCDC_Output_Voltage]
    data.DCDC_Output_Voltage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [DCDC_Output_Current]
    data.DCDC_Output_Current = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cl_msgs/VCU_info_3';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '782618799da4eee77b13168565258a7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 Battery_Voltage
    float32 SOC
    float32 Battery_Current
    float32 DCDC_Output_Voltage
    float32 DCDC_Output_Current
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VCU_info_3(null);
    if (msg.Battery_Voltage !== undefined) {
      resolved.Battery_Voltage = msg.Battery_Voltage;
    }
    else {
      resolved.Battery_Voltage = 0.0
    }

    if (msg.SOC !== undefined) {
      resolved.SOC = msg.SOC;
    }
    else {
      resolved.SOC = 0.0
    }

    if (msg.Battery_Current !== undefined) {
      resolved.Battery_Current = msg.Battery_Current;
    }
    else {
      resolved.Battery_Current = 0.0
    }

    if (msg.DCDC_Output_Voltage !== undefined) {
      resolved.DCDC_Output_Voltage = msg.DCDC_Output_Voltage;
    }
    else {
      resolved.DCDC_Output_Voltage = 0.0
    }

    if (msg.DCDC_Output_Current !== undefined) {
      resolved.DCDC_Output_Current = msg.DCDC_Output_Current;
    }
    else {
      resolved.DCDC_Output_Current = 0.0
    }

    return resolved;
    }
};

module.exports = VCU_info_3;
