const {BaseNode} = require('./BaseNode');
const {ControlFlow} = require("./ControlFlow");

class CGCollision2DEvent extends BaseNode {
  constructor() {
    super();
    this.selfCollider = null;
    this.selfColliderComp = null;
    this.otherCollider = null;
    this.otherColliderComp = null;
    this.collisionEvent = null;
  }

  next(selfCollider, otherCollider, collisionInfo) {
    //this.selfCollider = selfCollider;
    this.otherCollider = otherCollider;
    this.collisionInfo = collisionInfo;
    if (this.nexts[0]) {
      this.nexts[0]();
    }
  }

  beforeStart(sys) {
    // set up listener
    const object = this.inputs[0]();
    if (object && object.isInstanceOf('JSScriptComponent') && object.path.endsWith('Collider2D.js')) {
      this.selfCollider = object.getScript().ref;
      this.selfColliderComp = object;
      const eventCallback = ControlFlow.runFlowWrapper(this, this.next);
      switch (this.inputs[1]()) {
        case 'onEnter':
          this.selfCollider.registerHitEventCallback(eventCallback, 0);
          break;
        case 'onStay':
          this.selfCollider.registerHitEventCallback(eventCallback, 1);
          break;
        case 'onExit':
          this.selfCollider.registerHitEventCallback(eventCallback, 2);
          break;
        default:
          break;
      }
    }
  }

  getOutput(index) {
    switch (index) {
      case 1:
        return this.selfColliderComp;
      case 2:
        if (this.otherCollider) {
          const jsComps = this.otherCollider.entity.getComponents('JSScriptComponent');
          for (let i = 0; i < jsComps.size(); i++) {
            const jsComp = jsComps.get(i);
            if (jsComp && jsComp.path && jsComp.path.endsWith('Collider2D.js') && jsComp.enabled) {
              if (this.otherCollider === jsComp.getScript().ref) {
                return jsComp;
              }
            }
          }
        }
        return null;
      case 3:
        if (this.collisionInfo) {
          return new effect.Amaz.Vector2f(this.collisionInfo.pointX, this.collisionInfo.pointY);
        }
        return new effect.Amaz.Vector2f(0, 0);
      case 4:
        if (this.collisionInfo) {
          return new effect.Amaz.Vector2f(this.collisionInfo.normalX, this.collisionInfo.normalY);
        }
        return new effect.Amaz.Vector2f(0, 0);
      case 5:
        if (this.collisionInfo) {
          return this.collisionInfo.normalImpulse;
        }
        return 0;
      case 6:
        if (this.collisionInfo) {
          return this.collisionInfo.tangentImpulse;
        }
        return 0;
      default:
        return null;
    }
  }
}

exports.CGCollision2DEvent = CGCollision2DEvent;
