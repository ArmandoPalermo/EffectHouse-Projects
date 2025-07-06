const {BaseNode} = require('../Utils/BaseNode');

class CGAppendString extends BaseNode {
  constructor() {
    super();
  }

  getOutput() {
    let concatString = '';
    const flag = this.inputs[0](); // whether to append by row
    if (!flag) {
      for (let i = 1; i < this.inputs.length; i++) {
        if (this.inputs[i]() === null || this.inputs[i]() === undefined) {
          continue;
        }
        concatString = concatString.concat(this.inputs[i]());
      }
    } else {
      for (let i = 1; i < this.inputs.length; i++) {
        if (this.inputs[i]() === null || this.inputs[i]() === undefined) {
          continue;
        }
        concatString = concatString.concat(this.inputs[i]() + '\n');
      }
    }

    return (this.outputs[0] = concatString);
  }
}

exports.CGAppendString = CGAppendString;
