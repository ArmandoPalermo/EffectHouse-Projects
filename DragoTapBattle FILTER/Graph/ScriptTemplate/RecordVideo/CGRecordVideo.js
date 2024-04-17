/**
 * @file CGRecordVideo.js
 * @author runjiatian
 * @date 2022/3/17
 * @brief CGRecordVideo.js
 * @copyright Copyright (c) 2022, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

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
    if (event.type === Amaz.AppEventType.COMPAT_BEF) {
      let eventResult = event.args.get(0);
      if (eventResult === Amaz.BEFEventType.BET_RECORD_VIDEO) {
        let eventResult1 = event.args.get(1);

        // Video Start Event
        if (eventResult1 === Amaz.BEF_RECODE_VEDIO_EVENT_CODE.RECODE_VEDIO_START) {
          let eventResult2 = event.args.get(2);
          if (eventResult2 === 'DYNAMIC_UPDATE') {
            return;
          }
          this._onRecordingStarted();
        }

        // Video End Event
        else if (eventResult1 === Amaz.BEF_RECODE_VEDIO_EVENT_CODE.RECODE_VEDIO_END) {
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
