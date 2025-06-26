"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CGAdd = void 0;
const ScriptNodeAPI_1 = require('../Utils/ScriptNodeAPI');
class CGAdd extends ScriptNodeAPI_1.BaseNode {
    constructor() {
        super();
    }
    getOutput(index) {
        const curType = this.valueType;
        if (!curType) {
            return null;
        }
        const lastOutput = this.outputs[index];
        if (curType === 'Int' || curType === 'Double') {
            let result = 0.0;
            for (let k = 0; k < this.inputs.length; ++k) {
                const op = this.inputs[k]();
                if (op === null || op === undefined) {
                    return null;
                }
                result += op;
            }
            return result;
        }
        else if (curType === 'Vector2f') {
            let resultX = 0.0;
            let resultY = 0.0;
            for (let k = 0; k < this.inputs.length; ++k) {
                const op = this.inputs[k]();
                if (op === null || op === undefined) {
                    return null;
                }
                resultX += op.x;
                resultY += op.y;
            }
            this.outputs[index] = ScriptNodeAPI_1.GraphUtils.getUpdatedValue('Vector2f', lastOutput, resultX, resultY);
        }
        else if (curType === 'Vector3f') {
            let resultX = 0.0;
            let resultY = 0.0;
            let resultZ = 0.0;
            for (let k = 0; k < this.inputs.length; ++k) {
                const op = this.inputs[k]();
                if (op === null || op === undefined) {
                    return null;
                }
                resultX += op.x;
                resultY += op.y;
                resultZ += op.z;
            }
            this.outputs[index] = ScriptNodeAPI_1.GraphUtils.getUpdatedValue('Vector3f', lastOutput, resultX, resultY, resultZ);
        }
        else if (curType === 'Vector4f') {
            let resultX = 0.0;
            let resultY = 0.0;
            let resultZ = 0.0;
            let resultW = 0.0;
            for (let k = 0; k < this.inputs.length; ++k) {
                const op = this.inputs[k]();
                if (op === null || op === undefined) {
                    return null;
                }
                resultX += op.x;
                resultY += op.y;
                resultZ += op.z;
                resultW += op.w;
            }
            this.outputs[index] = ScriptNodeAPI_1.GraphUtils.getUpdatedValue('Vector4f', lastOutput, resultX, resultY, resultZ, resultW);
        }
        else {
            return null;
        }
        return this.outputs[index];
    }
}
exports.CGAdd = CGAdd;
//# sourceMappingURL=CGAdd.js.map