/**
 * @file CGPhysicsInfo.js
 * @author Jie Li
 * @date 2021/8/23
 * @brief CGPhysicsInfo.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
let GlobalParameters;
try {
  ({ GlobalParameters, GlobalParameters: { pbdSimulator, gravityAcceleration } } = require('./GlobalParameters'));
} catch (error) {
  console.error('Module GlobalParameters not found:', error.message);
}

class CGPhysicsInfo extends BaseNode {
  constructor() {
    super();
  }

  execute(index) {

  }

  getOutput(index) {
    if (!GlobalParameters)
      return null;
    let object = this.inputs[0]();
    
    if (!object)
      return null;

    if (object.isInstanceOf('JSScriptComponent') && object.path === 'js/RigidBody.js') {
      let rigidBody = object.getScript().ref;
      if (rigidBody.bodyId < 0)
        return null;
      rigidBody.computeTotalForceTorque = true;
      switch(index) {
        case 0:
            return GlobalParameters.pbdSimulator.getRigidBodyVelocity(rigidBody.bodyId).magnitude();
        case 1:
          return GlobalParameters.pbdSimulator.getRigidBodyVelocity(rigidBody.bodyId);
        case 2:
          return GlobalParameters.pbdSimulator.getRigidBodyAngularVelocity(rigidBody.bodyId);
        case 3:
          let totalForce = rigidBody.totalExternalForce;
          return totalForce;
        case 4:
          let totalTorque = rigidBody.totalExternalTorque;
          return totalTorque;;
        case 5:
          return rigidBody.mass;
        case 6:
          return rigidBody.damping;
        case 7:
          return rigidBody.angularDamping;
        case 8:
          return rigidBody.isKinematic;
        default:
          return null;
      }
    }

  }
}

exports.CGPhysicsInfo = CGPhysicsInfo;
