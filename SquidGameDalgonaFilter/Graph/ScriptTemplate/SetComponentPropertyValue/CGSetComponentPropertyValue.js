const {EffectReset} = require('../../../EffectReset');
const {PropertyNodeBase} = require('../Utils/PropertyNodeBase');
class CGSetComponentPropertyValue extends PropertyNodeBase {
  constructor() {
    super();
  }
  // eslint-disable-next-line complexity
  execute(index) {
    const componentObj = this.inputs[1] ? this.inputs[1]() : null;
    if (componentObj === null || this.property === null || this.inputs[2] === undefined || this.propertyFunc === null) {
      if (this.nexts[0]) {
        this.nexts[0]();
      }
      return false;
    }

    let inputValue = this.inputs[2]();
    if (inputValue === null) {
      if (
        this.valueType === 'Mesh' ||
        this.valueType === 'Material' ||
        this.valueType === 'Texture2D' ||
        this.valueType === 'Texture'
      ) {
        inputValue = this.resource;
      }
    }

    // set init value
    if (!EffectReset.getInstance().propertyInitValueMap.has(componentObj.guid.toString() + '|' + this.property)) {
      const initValue = this.propertyFunc.getProperty([componentObj], this.property, this.valueType);
      const callBackFuncMap = new Map();
      callBackFuncMap.set(
        (obj, value) => this.propertyFunc.setProperty([obj], this.property, value, this.valueType),
        [initValue]
      );
      EffectReset.getInstance().propertyInitValueMap.set(
        componentObj.guid.toString() + '|' + this.property,
        callBackFuncMap
      );
      if (this.propertyFunc.registerToCentralResetter) {
        this.propertyFunc.registerToCentralResetter([componentObj], this.property);
      }
    }

    this.propertyFunc.setProperty([componentObj], this.property, inputValue, this.valueType);
    if (this.propertySetingFun) {
      this.propertySetingFun(componentObj);
    }
    if (this.nexts[0]) {
      this.nexts[0]();
    }
    return true;
  }
}

exports.CGSetComponentPropertyValue = CGSetComponentPropertyValue;
