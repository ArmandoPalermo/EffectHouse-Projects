'use strict';
const Amaz = effect.Amaz;
const {BaseNode} = require('./BaseNode');
class CGGetComponentbyType extends BaseNode {
  constructor() {
    super();
    this.valueType = null;
  }

  getOutput(index) {
    const entity = this.inputs[0]();
    if (entity === null || entity === undefined) {
      return;
    }

    return entity.getComponent(this.valueType);
  }
}
exports.CGGetComponentbyType = CGGetComponentbyType;
