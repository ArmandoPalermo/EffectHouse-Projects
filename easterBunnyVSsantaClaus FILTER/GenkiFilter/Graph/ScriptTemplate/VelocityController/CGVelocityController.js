/**
 * @file CGVelocityController.js
 * @author Jie Li
 * @date 2021/8/23
 * @brief CGVelocityController.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
let GlobalParameters;
try {
  ({ GlobalParameters, GlobalParameters: { addModifiedProperty } } = require('./GlobalParameters'));
} catch (error) {
  console.error('Module GlobalParameters not found:', error.message);
}
const Amaz = effect.Amaz;

class CGVelocityController extends BaseNode {
  constructor() {
    super();
    this.updating = false;
    this.velocity = new effect.Amaz.Vector3f(0, 0, 0);
    this.bodyId = -1;
    this.trans = null;
  }

  execute(index) {
    if (!GlobalParameters) {
      this.updating = false;
      return;
    }

    if (index === 0) {
      this.updating = true;
      //onBegin
      if (this.nexts[0]) {
        this.nexts[0]();
      }
    } else if (index === 1) {
      this.updating = false;
      this.velocity = new effect.Amaz.Vector3f(0, 0, 0);
      // onEnd
      if (this.nexts[2]) {
        this.nexts[2]();
      }
    }

    
  }

  onUpdate(sys, deltatime) {
    if (!this.updating)
      return;

    let object = this.inputs[2]();

    if (object && object.isInstanceOf('JSScriptComponent') && object.path === 'js/RigidBody.js') {
      let rigidBody = object.getScript().ref;
      this.bodyId = rigidBody.bodyId;
      if (this.bodyId < 0)
        return;
      this.trans = object.entity.getComponent("Transform");
    } else {
      return;
    }

    this.velocity = this.inputs[3]();
    let isLocal = this.inputs[4]();
    if (this.velocity == null || isLocal == null) {
      return;
    }
    if (isLocal && this.trans) {
      this.velocity = this.trans.getWorldOrientation().rotateVectorByQuat(this.velocity);
    }
    let newValue = [this.velocity.x, this.velocity.y, this.velocity.z];
    GlobalParameters.addModifiedPropertyFast(GlobalParameters.RigidBodyVelocity, this.bodyId, newValue);
          

    if (this.nexts[1]) {
      this.nexts[1]();
    }
  }

  getOutput(index) {
    switch(index) {
      case 3:
        return this.velocity;
      default:
        return null;
    }

  }

  resetOnRecord(sys){
    this.updating = false;
    this.velocity = new effect.Amaz.Vector3f(0, 0, 0);    
  }
}

exports.CGVelocityController = CGVelocityController;
