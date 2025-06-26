/**
 * @file CGOr.js
 * @author
 * @date 2021/8/15
 * @brief CGOr.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class CGOr extends BaseNode {
  constructor() {
    super();
  }

  getOutput() {
    return this.inputs[0]() || this.inputs[1]();
  }
}

exports.CGOr = CGOr;
