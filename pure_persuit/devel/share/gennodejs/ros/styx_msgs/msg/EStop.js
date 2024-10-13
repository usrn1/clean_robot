// Auto-generated. Do not edit!

// (in-package styx_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EStop {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.EStop = null;
    }
    else {
      if (initObj.hasOwnProperty('EStop')) {
        this.EStop = initObj.EStop
      }
      else {
        this.EStop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EStop
    // Serialize message field [EStop]
    bufferOffset = _serializer.bool(obj.EStop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EStop
    let len;
    let data = new EStop(null);
    // Deserialize message field [EStop]
    data.EStop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'styx_msgs/EStop';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '15c187ac41fba10560c992ebbf27db9f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool EStop
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EStop(null);
    if (msg.EStop !== undefined) {
      resolved.EStop = msg.EStop;
    }
    else {
      resolved.EStop = false
    }

    return resolved;
    }
};

module.exports = EStop;
