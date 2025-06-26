/**
 * @file CGRecordVideo.js
 * @author runjiatian
 * @date 2022/3/17
 * @brief CGRecordVideo.js
 * @copyright Copyright (c) 2022, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('../Utils/BaseNode');
const APJS = require('../../../amazingpro');

class CGRecordVideo extends BaseNode {
  constructor() {
    super();
    this._videoRecordFlag = false;
  }

  setNext(index, func) {
    this.nexts[index] = func;
  }

  setInput(index, func) {
    this.inputs[index] = func;
  }

  onUpdate(sys, dt) {
    // Stay Case
    if (this.nexts[1] != null && this._videoRecordFlag) {
      this.nexts[1]();
    }

    // Idle Case
    if (this.nexts[3] != null && !this._videoRecordFlag) {
      this.nexts[3]();
    }
  }

  onEvent(sys, event) {
    if (event.type === APJS.AppEventType.COMPAT_BEF) {
      const eventResult = event.args[0];
      if (eventResult === APJS.BEFEventType.BET_RECORD_VIDEO) {
        const eventResult1 = event.args[1];

        // Video Start Event
        if (eventResult1 === APJS.BEF_RECODE_VEDIO_EVENT_CODE.RECODE_VEDIO_START) {
          if (event.args.length >= 3) {
            const eventResult2 = event.args[2];
            if (eventResult2 === 'DYNAMIC_UPDATE' || eventResult2 === 'EFFECT_RESET') {
              return;
            }
          }
          this._onRecordingStarted();
        }

        // Video End Event
        else if (eventResult1 === APJS.BEF_RECODE_VEDIO_EVENT_CODE.RECODE_VEDIO_END) {
          this._onRecordingEnded();
        }
      }
    }
  }

  _onRecordingStarted() {
    // Change video record flag
    this._videoRecordFlag = true;
    if (this.nexts[0] != null) {
      this.nexts[0]();
    }
  }

  _onRecordingEnded() {
    // Change video record flag
    this._videoRecordFlag = false;
    if (this.nexts[2] != null) {
      this.nexts[2]();
    }
  }
}

exports.CGRecordVideo = CGRecordVideo;
