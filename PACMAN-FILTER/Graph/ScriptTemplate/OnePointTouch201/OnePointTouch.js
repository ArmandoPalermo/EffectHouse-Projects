const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class OnePointTouch extends BaseNode {
  constructor() {
    super();
    this.moving = false;
    this.idle = true;
    this.frameSinceTouchBegin = 0;
    this.lastTouchPosition = new Amaz.Vector2f(-1.0, -1.0);
    this.currentTouchPosition = new Amaz.Vector2f(-1.0, -1.0);
  }

  beforeStart(sys) {
    this.reset();
    this.lastTouchPosition.x = -1.0;
    this.lastTouchPosition.y = -1.0;
  }

  onEvent(sys, event) {
    if (event.type === Amaz.EventType.TOUCH) {
      const touch = event.args.get(0);
      this.currentTouchPosition = new Amaz.Vector2f(touch.x, 1.0 - touch.y);

      // Update output while onEvent is triggered, before executing the next nodes
      this.outputs[4] = this.currentTouchPosition;

      this.moving = false;
      if (touch.type === Amaz.TouchType.TOUCH_BEGAN) {
        this.frameSinceTouchBegin = 0;
        this.idle = false;
        if (this.nexts[1]) {
          this.nexts[1]();
        }
      } else if (touch.type === Amaz.TouchType.TOUCH_ENDED || touch.type === Amaz.TouchType.TOUCH_CANCELED) {
        if (this.nexts[3]) {
          this.nexts[3]();
        }
        // reset after executing the touch end pulse
        this.reset();
      }
    }
  }

  onUpdate(sys, dt) {
    this.outputs[4] = this.currentTouchPosition;
    this.outputs[5] = this.lastTouchPosition;

    // Execute Idle function
    if (this.idle) {
      if (this.nexts[0]) {
        this.nexts[0]();
      }
    } else {
      if (this.nexts[2]) {
        this.nexts[2]();
      }
      this.lastTouchPosition = this.currentTouchPosition;
    }
  }

  reset() {
    this.idle = true;
    this.moving = false;
    this.currentTouchPosition.x = -1.0;
    this.currentTouchPosition.y = -1.0;
  }
}

exports.OnePointTouch = OnePointTouch;
