const Amaz = effect.Amaz;
const {BaseNode} = require('./BaseNode');

class CGSetAssetPropertyValue extends BaseNode {
  constructor() {
    super();
    this.property = null;
    this.resource = null;
    this.propertyFunc = null;
    this.valueType = null;
  }

  beforeStart(sys) {
    this.sys = sys;
  }

  // eslint-disable-next-line complexity
  execute(index) {
    const assetObj = this.inputs[1] ? this.inputs[1]() : null;
    if (assetObj === null || this.property === null || this.inputs[2] === undefined || this.propertyFunc === null) {
      if (this.nexts[0]) {
        this.nexts[0]();
      }
      return false;
    }
    let inputValue = this.inputs[2]();
    if (inputValue === null) {
      if (this.valueType === 'Mesh' || this.valueType === 'Material' || this.valueType === 'Texture2D') {
        inputValue = this.resource;
      }
    }

    if (
      this.sys.setterNodeInitValueMap &&
      !this.sys.setterNodeInitValueMap.has(assetObj.guid.toString() + '|' + this.property)
    ) {
      const initValue = this.propertyFunc.getProperty([assetObj], this.property, this.valueType);
      const callBackFuncMap = new Map();
      callBackFuncMap.set((obj, value) => this.propertyFunc.setProperty([obj], this.property, value, this.valueType), [
        initValue,
      ]);
      this.sys.setterNodeInitValueMap.set(assetObj.guid.toString() + '|' + this.property, callBackFuncMap);
    }

    this.propertyFunc.setProperty([assetObj], this.property, inputValue, this.valueType);
    if (this.nexts[0]) {
      this.nexts[0]();
    }
    return true;
  }
}

exports.CGSetAssetPropertyValue = CGSetAssetPropertyValue;
