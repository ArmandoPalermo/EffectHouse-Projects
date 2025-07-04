const {BaseNode} = require('../Utils/BaseNode');
const APJS = require('../../../amazingpro');

class CGSwitch extends BaseNode {
  constructor() {
    super();
  }

  execute(index) {
    const idx = Math.floor(this.inputs[1]());
    if (idx !== null && idx !== undefined) {
      if (this.nexts[idx]) {
        this.nexts[idx]();
      }
    }
  }
}

exports.CGSwitch = CGSwitch;
