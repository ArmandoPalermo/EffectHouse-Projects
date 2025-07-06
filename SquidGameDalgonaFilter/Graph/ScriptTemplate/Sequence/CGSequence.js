/**
 * @file CGSequence.js
 * @author liujiacheng
 * @date 2021/8/23
 * @brief CGSequence.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('../Utils/BaseNode');
const APJS = require('../../../amazingpro');

class CGSequence extends BaseNode {
  constructor() {
    super();
  }

  execute(index) {
    for (const k in this.nexts) {
      if (this.nexts[k]) {
        this.nexts[k]();
      }
    }
  }
}

exports.CGSequence = CGSequence;
