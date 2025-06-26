/**
 * @file CGContactInfo.js
 * @author Jie Li
 * @date 2023/5/18
 * @brief CGContactInfo.js
 * @copyright Copyright (c) 2023, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class CGContactInfo extends BaseNode {
  constructor() {
    super();
  }

  getOutput(index) {
    let contactInfo = this.inputs[0]();
    if (!contactInfo)
      return null;

    switch(index) {
      case 0:
        return true;
      case 1:
        return contactInfo.collisionPoint;
      case 2:
        return contactInfo.collisionNormal;
      case 3:
        return contactInfo.relativeVelocity;
      case 4:
        return contactInfo.collidingObject;
      default:
        return null;
    }

  }
}

exports.CGContactInfo = CGContactInfo;
