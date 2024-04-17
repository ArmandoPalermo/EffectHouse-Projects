/**
 * @file CGCollisionEvent.js
 * @author Jie Li
 * @date 2023/5/18
 * @brief CGCollisionEvent.js
 * @copyright Copyright (c) 2023, ByteDance Inc, All Rights Reserved
 */
let GlobalParameters;
const {BaseNode} = require('./BaseNode');
const {ContactInfo} = require('./GraphHelper');
try {
  ({ GlobalParameters, GlobalParameters: { colliderMap, collisionFinder, pbdSimulator } } = require('./GlobalParameters'));
} catch (error) {
  console.error('Module GlobalParameters not found:', error.message);
}

class CGCollisionEvent extends BaseNode {
  constructor() {
    super();
    this.updating = false;
    this.colliderId = -1;
    this.contactInfoArray = [];
    this.contactInfoMapCurrent = new Map();
    this.contactInfoMapPrev = this.contactInfoMapCurrent;
  }

  execute(index) {
    if (!GlobalParameters) {
      this.updating = false;
      return;
    }
    this.updating = true;

    this.eventType = this.inputs[2]();
  }

  updateContactInfo() {
    this.contactInfoArray = [];
    switch (this.eventType) {
      case 'onEnter':
        this.contactInfoMapCurrent.forEach((value, key) => {
          if (!this.contactInfoMapPrev.has(key)) {
            this.contactInfoArray.push(value);
          }
        });
        break;
      case 'onStay':
        this.contactInfoMapCurrent.forEach((value, key) => {
          if (this.contactInfoMapPrev.has(key)) {
            this.contactInfoArray.push(value);
          }
        });
        break;
      case 'onExit':
        this.contactInfoMapPrev.forEach((value, key) => {
          if (!this.contactInfoMapCurrent.has(key)) {
            this.contactInfoArray.push(value);
          }
        });
        break;
      default:
        break;
    }
  }

  onUpdate(sys, deltatime) {

    if (!this.updating)
      return;

    let object = this.inputs[1]();

    if (object && object.isInstanceOf('JSScriptComponent') && object.path.endsWith("Collider.js")) {
      let collider = object.getScript().ref;
      this.colliderId = collider.colliderId;
      if (this.colliderId < 0)
        return;
      
      GlobalParameters.collisionFinder.updateTransforms();
    } else {
      return;
    }

    
    GlobalParameters.collisionFinder.doCollisionDetectionSingleCollider(this.colliderId);
    let nContact = GlobalParameters.collisionFinder.contactCount();

    let contactInfoList = new effect.Amaz.Vector();
    for (let i = 0; i < nContact; i++) {
      contactInfoList.pushBack(new effect.Amaz.AMGContactInfo());
    }
    GlobalParameters.collisionFinder.getContactInfoList(contactInfoList);
    
    this.contactInfoMapCurrent = new Map();
    for (let i = 0; i < nContact; i++) {
      let id0 = contactInfoList.get(i).colliderId0;
      let id1 = contactInfoList.get(i).colliderId1;
      let normal = contactInfoList.get(i).normal;

      let hitPoint = contactInfoList.get(i).hitPoint1;
      
      let collider0 = GlobalParameters.colliderMap.get(id0);
      let collider1 = GlobalParameters.colliderMap.get(id1);

      if (!collider0 || !collider1)
        return;
      
      let vel0 = new effect.Amaz.Vector3f(0, 0, 0);
      if (collider0.rigidBody && collider0.rigidBody.bodyId >= 0) {
        vel0 = GlobalParameters.pbdSimulator.getRigidBodyVelocity(collider0.bodyId);
      }
      let vel1 = new effect.Amaz.Vector3f(0, 0, 0);
      if (collider1.rigidBody && collider1.rigidBody.bodyId >= 0) {
        vel1 = GlobalParameters.pbdSimulator.getRigidBodyVelocity(collider1.bodyId);
      }
      const collidingObj = collider1.entity;
      let contactInfo = new ContactInfo(hitPoint, normal, vel0.sub(vel1), collidingObj);
      this.contactInfoMapCurrent.set(id1, contactInfo);
    }

    this.updateContactInfo();
    this.contactInfoMapPrev = this.contactInfoMapCurrent;

    if (this.nexts[0] && this.contactInfoArray.length > 0) {
      this.nexts[0]();
    }
  }

  getOutput(index) {
    return this.contactInfoArray;
  }
}

exports.CGCollisionEvent = CGCollisionEvent;
