/**
 * @file CGMultiply.js
 * @author runjiatian
 * @date 2022/3/25
 * @brief CGMultiply.js
 * @copyright Copyright (c) 2022, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('../Utils/BaseNode');
const {GraphUtils} = require('../Utils/GraphUtils');
const APJS = require('../../../amazingpro');

class CGMultiply extends BaseNode {
  constructor() {
    super();
  }

  setNext(index, func) {
    this.nexts[index] = func;
  }

  setInput(index, func) {
    this.inputs[index] = func;
  }

  getOutput(index) {
    const curType = this.valueType;
    if (curType === null || curType === undefined) {
      return null;
    }

    const lastOutput = this.outputs[index];
    if (curType === 'Int' || curType === 'Double') {
      let result = 1.0;
      for (let k = 0; k < this.inputs.length; ++k) {
        const op = this.inputs[k]();

        if (op === null || op === undefined) {
          return null;
        }
        result *= op;
      }
      this.outputs[index] = result;
    } else if (curType === 'Vector2f') {
      let resultX = 1.0;
      let resultY = 1.0;
      for (let k = 0; k < this.inputs.length; ++k) {
        const op = this.inputs[k]();

        if (!op) {
          return null;
        }
        resultX *= op.x;
        resultY *= op.y;
      }
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector2f', lastOutput, resultX, resultY);
    } else if (curType === 'Vector3f') {
      let resultX = 1.0;
      let resultY = 1.0;
      let resultZ = 1.0;

      for (let k = 0; k < this.inputs.length; ++k) {
        const op = this.inputs[k]();

        if (!op) {
          return null;
        }
        resultX *= op.x;
        resultY *= op.y;
        resultZ *= op.z;
      }
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector3f', lastOutput, resultX, resultY, resultZ);
    } else if (curType === 'Vector4f') {
      let resultX = 1.0;
      let resultY = 1.0;
      let resultZ = 1.0;
      let resultW = 1.0;

      for (let k = 0; k < this.inputs.length; ++k) {
        const op = this.inputs[k]();

        if (!op) {
          return null;
        }
        resultX *= op.x;
        resultY *= op.y;
        resultZ *= op.z;
        resultW *= op.w;
      }
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector4f', lastOutput, resultX, resultY, resultZ, resultW);
    } else {
      return null;
    }
    return this.outputs[index];
  }
}

exports.CGMultiply = CGMultiply;
