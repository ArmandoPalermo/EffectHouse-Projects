/**
 * @file CGDataConvert.js
 * @author liujiacheng
 * @date 2021/8/19
 * @brief CGDataConvert.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('../Utils/BaseNode');
const {GraphUtils} = require('../Utils/GraphUtils');
const APJS = require('../../../amazingpro');

class CGDataConvert extends BaseNode {
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

    const value = this.inputs[0]();
    if (value === null) {
      return null;
    }

    if (curType === 'Double' || curType === 'Int') {
      this.outputs[0] = GraphUtils.getUpdatedValue('Vector2f', this.outputs[0], value, value);
      this.outputs[1] = GraphUtils.getUpdatedValue('Vector3f', this.outputs[1], value, value, value);
      this.outputs[2] = GraphUtils.getUpdatedValue('Vector4f', this.outputs[2], value, value, value, value);
      this.outputs[3] = GraphUtils.getUpdatedValue('Color', this.outputs[3], value, value, value, value);
      this.outputs[4] = `${Number.isInteger(value) ? value : value.toFixed(2)}`;
    } else if (curType === 'Vector2f') {
      this.outputs[0] = GraphUtils.getUpdatedValue('Vector3f', this.outputs[0], value.x, value.y, 0.0);
      this.outputs[1] = GraphUtils.getUpdatedValue('Vector4f', this.outputs[1], value.x, value.y, 0.0, 0.0);
      this.outputs[2] = `x:${value.x.toFixed(2)}, y:${value.y.toFixed(2)}`;
    } else if (curType === 'Vector3f') {
      this.outputs[0] = GraphUtils.getUpdatedValue('Vector2f', this.outputs[0], value.x, value.y);
      this.outputs[1] = GraphUtils.getUpdatedValue('Vector4f', this.outputs[1], value.x, value.y, value.z, 0.0);
      this.outputs[2] = GraphUtils.getUpdatedValue('Color', this.outputs[2], value.x, value.y, value.z, 0.0);
      this.outputs[3] = `x:${value.x.toFixed(2)}, y:${value.y.toFixed(2)}, z:${value.z.toFixed(2)}`;
    } else if (curType === 'Vector4f') {
      this.outputs[0] = GraphUtils.getUpdatedValue('Vector2f', this.outputs[0], value.x, value.y);
      this.outputs[1] = GraphUtils.getUpdatedValue('Vector3f', this.outputs[1], value.x, value.y, value.z);
      this.outputs[2] = GraphUtils.getUpdatedValue('Color', this.outputs[2], value.x, value.y, value.z, value.w);
      this.outputs[3] = `x:${value.x.toFixed(2)}, y:${value.y.toFixed(2)}, z:${value.z.toFixed(2)}, w:${value.w.toFixed(
        2
      )}`;
      this.outputs[4] = GraphUtils.getUpdatedValue('Rect', this.outputs[4], value.x, value.y, value.z, value.w);
    } else if (curType === 'Color') {
      this.outputs[0] = GraphUtils.getUpdatedValue('Vector3f', this.outputs[0], value.r, value.g, value.b);
      this.outputs[1] = GraphUtils.getUpdatedValue('Vector4f', this.outputs[1], value.r, value.g, value.b, value.a);
      this.outputs[2] = `r:${value.r.toFixed(2)}, g:${value.g.toFixed(2)}, b:${value.b.toFixed(2)}, a:${value.a.toFixed(
        2
      )}`;
    } else if (curType === 'Bool') {
      this.outputs[0] = value.toString();
    } else if (curType === 'Rect') {
      this.outputs[0] = GraphUtils.getUpdatedValue(
        'Vector4f',
        this.outputs[0],
        value.x,
        value.y,
        value.width,
        value.height
      );
      this.outputs[1] = `x:${value.x.toFixed(2)}, y:${value.y.toFixed(2)}, width:${value.width.toFixed(
        2
      )}, height:${value.height.toFixed(2)}`;
    }
    return this.outputs[index];
  }
}

exports.CGDataConvert = CGDataConvert;
