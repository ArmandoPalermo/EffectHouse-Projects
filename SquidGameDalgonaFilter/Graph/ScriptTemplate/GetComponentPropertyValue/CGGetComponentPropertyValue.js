const {PropertyNodeBase} = require('../Utils/PropertyNodeBase');

class CGGetComponentPropertyValue extends PropertyNodeBase {
  constructor() {
    super();
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
