"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CGRandom = void 0;
const ScriptNodeAPI_1 = require('../Utils/ScriptNodeAPI');
class CGRandom extends ScriptNodeAPI_1.BaseNode {
    constructor() {
        super();
    }
    updateRandomSeed() {
        const upper = Math.max(this.inputs[1](), this.inputs[2]());
        const lower = Math.min(this.inputs[1](), this.inputs[2]());
        this.radomNumber = Number((Math.random() * Math.abs(upper - lower) + lower).toFixed(3));
    }
    execute(index) {
        this.updateRandomSeed();
        if (this.nexts[0]) {
            this.nexts[0]();
        }
    }
    getOutput(index) {
        if (this.radomNumber === undefined) {
            this.updateRandomSeed();
        }
        return this.radomNumber;
    }
}
exports.CGRandom = CGRandom;
//# sourceMappingURL=CGRandom.js.map