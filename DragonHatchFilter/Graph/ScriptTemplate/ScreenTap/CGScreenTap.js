/**
 * @file CGMouthOpen.js
 * @author xuyuan
 * @date 2021/8/13
 * @brief CGMouthOpen.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const APJS = require('../../../amazingpro');
const {BaseNode} = require('../Utils/BaseNode');

const {BEMessage} = require('../Utils/BEMessage');
const BEMsg = BEMessage.ScreenEvent;
class CGScreenTap extends BaseNode {
  constructor() {
    super();
    this.tapPosition = new APJS.Vector2f(-1.0, -1.0);
  }

  getOutput(index) {
    return this.tapPosition;
  }

  onEvent(sys, event) {
    if (event.type === APJS.EventType.TOUCH) {
      const touch = event.args[0];
      if (touch.type === APJS.TouchType.TOUCH_BEGAN) {
        this.tapPosition = new APJS.Vector2f(touch.x, 1.0 - touch.y);
        if (this.nexts[0]) {
          this.nexts[0]();
        }
        if (sys.APJScene) {
          sys.APJScene.postMessage(BEMsg.msgId, BEMsg.action.ScreenTap.id, 0, '');
        }
      }
    }
  }

  resetOnRecord(sys) {
    this.tapPosition = new APJS.Vector2f(-1.0, -1.0);
  }
}

exports.CGScreenTap = CGScreenTap;
