// Auto-generated. Do not edit!

// (in-package vision_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GeometricShape {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.shape_type = null;
      this.key_points = null;
    }
    else {
      if (initObj.hasOwnProperty('shape_type')) {
        this.shape_type = initObj.shape_type
      }
      else {
        this.shape_type = '';
      }
      if (initObj.hasOwnProperty('key_points')) {
        this.key_points = initObj.key_points
      }
      else {
        this.key_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GeometricShape
    // Serialize message field [shape_type]
    bufferOffset = _serializer.string(obj.shape_type, buffer, bufferOffset);
    // Serialize message field [key_points]
    // Serialize the length for message field [key_points]
    bufferOffset = _serializer.uint32(obj.key_points.length, buffer, bufferOffset);
    obj.key_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GeometricShape
    let len;
    let data = new GeometricShape(null);
    // Deserialize message field [shape_type]
    data.shape_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [key_points]
    // Deserialize array length for message field [key_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.key_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.key_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.shape_type);
    length += 24 * object.key_points.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vision_pkg/GeometricShape';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ca4cd4b5167d5ea4d1ac1c67df51125';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string shape_type
    geometry_msgs/Point[] key_points
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GeometricShape(null);
    if (msg.shape_type !== undefined) {
      resolved.shape_type = msg.shape_type;
    }
    else {
      resolved.shape_type = ''
    }

    if (msg.key_points !== undefined) {
      resolved.key_points = new Array(msg.key_points.length);
      for (let i = 0; i < resolved.key_points.length; ++i) {
        resolved.key_points[i] = geometry_msgs.msg.Point.Resolve(msg.key_points[i]);
      }
    }
    else {
      resolved.key_points = []
    }

    return resolved;
    }
};

module.exports = GeometricShape;
