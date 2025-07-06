/**
 * @file CGSelect.js
 * @author xuyuan
 * @date 2021/8/27
 * @brief CGSelect.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const APJS = require('../../../amazingpro');
const {BaseNode} = require('../Utils/BaseNode');

class CGSelect extends BaseNode {
  constructor() {
    super();
  }

  getOutput(index) {
    if (true === this.inputs[0]()) {
      return this.inputs[1]();
    } else {
      return this.inputs[2]();
    }
  }
}

exports.CGSelect = CGSelect;
