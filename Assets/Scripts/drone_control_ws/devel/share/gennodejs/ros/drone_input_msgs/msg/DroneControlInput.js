// Auto-generated. Do not edit!

// (in-package drone_input_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DroneControlInput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.w = null;
      this.a = null;
      this.s = null;
      this.d = null;
      this.i = null;
      this.j = null;
      this.k = null;
      this.l = null;
    }
    else {
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0;
      }
      if (initObj.hasOwnProperty('a')) {
        this.a = initObj.a
      }
      else {
        this.a = 0;
      }
      if (initObj.hasOwnProperty('s')) {
        this.s = initObj.s
      }
      else {
        this.s = 0;
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0;
      }
      if (initObj.hasOwnProperty('i')) {
        this.i = initObj.i
      }
      else {
        this.i = 0;
      }
      if (initObj.hasOwnProperty('j')) {
        this.j = initObj.j
      }
      else {
        this.j = 0;
      }
      if (initObj.hasOwnProperty('k')) {
        this.k = initObj.k
      }
      else {
        this.k = 0;
      }
      if (initObj.hasOwnProperty('l')) {
        this.l = initObj.l
      }
      else {
        this.l = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DroneControlInput
    // Serialize message field [w]
    bufferOffset = _serializer.int8(obj.w, buffer, bufferOffset);
    // Serialize message field [a]
    bufferOffset = _serializer.int8(obj.a, buffer, bufferOffset);
    // Serialize message field [s]
    bufferOffset = _serializer.int8(obj.s, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.int8(obj.d, buffer, bufferOffset);
    // Serialize message field [i]
    bufferOffset = _serializer.int8(obj.i, buffer, bufferOffset);
    // Serialize message field [j]
    bufferOffset = _serializer.int8(obj.j, buffer, bufferOffset);
    // Serialize message field [k]
    bufferOffset = _serializer.int8(obj.k, buffer, bufferOffset);
    // Serialize message field [l]
    bufferOffset = _serializer.int8(obj.l, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DroneControlInput
    let len;
    let data = new DroneControlInput(null);
    // Deserialize message field [w]
    data.w = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [a]
    data.a = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [s]
    data.s = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [i]
    data.i = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [j]
    data.j = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [k]
    data.k = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [l]
    data.l = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drone_input_msgs/DroneControlInput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6513e4e1c03e5976bc99005c604e739';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Cyclic controls
    int8 w
    int8 a
    int8 s
    int8 d
    
    # Pedals
    int8 i
    int8 j
    int8 k
    int8 l
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DroneControlInput(null);
    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0
    }

    if (msg.a !== undefined) {
      resolved.a = msg.a;
    }
    else {
      resolved.a = 0
    }

    if (msg.s !== undefined) {
      resolved.s = msg.s;
    }
    else {
      resolved.s = 0
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0
    }

    if (msg.i !== undefined) {
      resolved.i = msg.i;
    }
    else {
      resolved.i = 0
    }

    if (msg.j !== undefined) {
      resolved.j = msg.j;
    }
    else {
      resolved.j = 0
    }

    if (msg.k !== undefined) {
      resolved.k = msg.k;
    }
    else {
      resolved.k = 0
    }

    if (msg.l !== undefined) {
      resolved.l = msg.l;
    }
    else {
      resolved.l = 0
    }

    return resolved;
    }
};

module.exports = DroneControlInput;
