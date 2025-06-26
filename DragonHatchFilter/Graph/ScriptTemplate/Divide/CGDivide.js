const {BaseNode} = require('../Utils/BaseNode');
const {GraphUtils} = require('../Utils/GraphUtils');
const APJS = require('../../../amazingpro');

class CGDivide extends BaseNode {
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
    if (curType === null) {
      return null;
    }

    const op1 = this.inputs[0]();
    const op2 = this.inputs[1]();
    if (op1 === null || op2 === null) {
      return null;
    }
    const lastOutput = this.outputs[index];
    if (curType === 'Int' || curType === 'Double') {
      this.outputs[index] = op1 / op2;
    } else if (curType === 'Vector2f') {
      const resultX = op1.x / op2.x;
      const resultY = op1.y / op2.y;
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector2f', lastOutput, resultX, resultY);
    } else if (curType === 'Vector3f') {
      const resultX = op1.x / op2.x;
      const resultY = op1.y / op2.y;
      const resultZ = op1.z / op2.z;
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector3f', lastOutput, resultX, resultY, resultZ);
    } else if (curType === 'Vector4f') {
      const resultX = op1.x / op2.x;
      const resultY = op1.y / op2.y;
      const resultZ = op1.z / op2.z;
      const resultW = op1.w / op2.w;
      this.outputs[index] = GraphUtils.getUpdatedValue('Vector4f', lastOutput, resultX, resultY, resultZ, resultW);
    } else if (curType === 'Color') {
      const resultR = op1.r / op2.r;
      const resultG = op1.g / op2.g;
      const resultB = op1.b / op2.b;
      const resultA = op1.a / op2.a;
      this.outputs[index] = GraphUtils.getUpdatedValue('Color', lastOutput, resultR, resultG, resultB, resultA);
    }
    return this.outputs[index];
  }
}

exports.CGDivide = CGDivide;
