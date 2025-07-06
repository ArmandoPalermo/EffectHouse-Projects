/**
 * @file CGEqualsExactly.js
 * @author runjiatian
 * @date 2022/3/23
 * @brief CGEqualsExactly.js
 * @copyright Copyright (c) 2022, ByteDance Inc, All Rights Reserved
 */

const APJS = require('../../../amazingpro');
const {BaseNode} = require('../Utils/BaseNode');

class CGEqualsExactly extends BaseNode {
  constructor() {
    super();
    this.tolerance = 0.001;
  }

  compareResult(value1, value2) {
    // Use multiplication to avoid floating point errors
    let sign = Math.sign(this.tolerance * 100);

    // special case when this.tolerance === 0
    if (sign == 0) {
      sign = 1.0;
    }

    const difference = ((Math.abs(value1 * 100 - value2 * 100) - Math.abs(this.tolerance * 100)) * sign) / 100;

    const compareResult = difference <= Number.EPSILON;
    return compareResult;
  }

  getOutput(index) {
    const value1 = this.inputs[0]();
    const value2 = this.inputs[1]();
    this.tolerance = this.inputs[2]();

    if (value1 === undefined || value1 === null || value2 === undefined || value2 === null) {
      return false;
    }

    if (this.valueType === 'Double' || this.valueType === 'Int') {
      return this.compareResult(value1, value2);
    } else if (this.valueType === 'Vector2f') {
      const dx = this.compareResult(value1.x, value2.x);
      const dy = this.compareResult(value1.y, value2.y);
      const result = dx && dy;
      return result;
    } else if (this.valueType === 'Vector3f') {
      const dx = this.compareResult(value1.x, value2.x);
      const dy = this.compareResult(value1.y, value2.y);
      const dz = this.compareResult(value1.z, value2.z);
      return dx && dy && dz;
    } else if (this.valueType === 'Vector4f') {
      const dx = this.compareResult(value1.x, value2.x);
      const dy = this.compareResult(value1.y, value2.y);
      const dz = this.compareResult(value1.z, value2.z);
      const dw = this.compareResult(value1.w, value2.w);
      return dx && dy && dz && dw;
    } else if (this.valueType === 'Color') {
      const dr = this.compareResult(value1.r * 255.0, value2.r * 255.0);
      const dg = this.compareResult(value1.g * 255.0, value2.g * 255.0);
      const db = this.compareResult(value1.b * 255.0, value2.b * 255.0);
      const da = this.compareResult(value1.a * 100.0, value2.a * 100.0);
      return dr && dg && db && da;
    } else if (this.valueType === 'Entity') {
      return value1.equals(value2);
    } else {
      // For boolean and String
      return this.inputs[0]() === this.inputs[1]();
    }
  }
}
exports.CGEqualsExactly = CGEqualsExactly;
