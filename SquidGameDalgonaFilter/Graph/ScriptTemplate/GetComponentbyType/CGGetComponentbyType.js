"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CGGetComponentbyType = void 0;
const BaseNode_1 = require('../Utils/BaseNode');
class CGGetComponentbyType extends BaseNode_1.BaseNode {
    constructor() {
        super();
    }
    getOutput(index) {
        const entity = this.inputs[0]();
        if (entity === null || entity === undefined || !this.valueType) {
            return null;
        }
        if (this.valueType === 'JSScriptComponent' && this.extraType) {
            const jsScriptComps = entity.getComponents('JSScriptComponent');
            const targetComp = jsScriptComps.find(component => { var _a, _b; return ((_b = (_a = component.getScript()) === null || _a === void 0 ? void 0 : _a.ref) === null || _b === void 0 ? void 0 : _b.extraType) === this.extraType; });
            return targetComp;
        }
        return entity.getComponent(this.valueType);
    }
}
exports.CGGetComponentbyType = CGGetComponentbyType;
//# sourceMappingURL=CGGetComponentbyType.js.map