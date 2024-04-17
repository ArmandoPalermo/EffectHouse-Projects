const Amaz = effect.Amaz;
const {BaseNode} = require('./BaseNode');

class CGGetComponentPropertyValue extends BaseNode {
  constructor() {
    super();
    this.property = null;
    this.propertyFunc = null;
  }

  getOutput(index) {
    const componentObj = this.inputs[0] ? this.inputs[0]() : null;
    if (componentObj === null || this.propertyFunc === null) {
      return null;
    }
    return this.propertyFunc.getProperty([componentObj], this.property, this.valueType);
  }
}

exports.CGGetComponentPropertyValue = CGGetComponentPropertyValue;
