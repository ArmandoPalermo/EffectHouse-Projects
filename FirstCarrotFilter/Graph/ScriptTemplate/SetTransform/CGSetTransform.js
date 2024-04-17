const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class CGSetTransform extends BaseNode {
  constructor() {
    super();
    this.isLocal = null;
  }

  beforeStart(sys) {
    this.sys = sys;
  }

  execute(index) {
    if (this.inputs[1]() == null) {
      return;
    }

    if (this.inputs[5]() == null) {
      return;
    }

    const selfTransform = this.inputs[1]();
    this.isLocal = this.inputs[5]();
    let setT = false;
    let setR = false;
    let setS = false;

    if (this.sys.setterNodeInitValueMap && !this.sys.setterNodeGuidMap.has(selfTransform.guid.toString())) {
      const callBackFuncMap = new Map();
      if (this.isLocal) {
        callBackFuncMap.set(
          (_transformComp, _localPosition, _localScale, _localEulerAngle) => {
            _transformComp.localPosition = _localPosition;
            _transformComp.localScale = _localScale;
            _transformComp.localEulerAngle = _localEulerAngle;
          },
          [selfTransform.localPosition, selfTransform.localScale, selfTransform.localEulerAngle]
        );
      } else {
        callBackFuncMap.set(
          (_transformComp, _worldPosition, _worldScale, _worldOrientation) =>
            _transformComp.setWorldTransform(_worldPosition, _worldScale, _worldOrientation),
          [selfTransform.worldPosition, selfTransform.worldScale, selfTransform.worldOrientation]
        );
      }
      this.sys.setterNodeGuidMap.add(selfTransform.guid.toString());
      this.sys.setterNodeInitValueMap.set(selfTransform.guid, callBackFuncMap);
    }

    const newPos = this.inputs[2]();
    if (this.isLocal) {
      selfTransform.localPosition = newPos;
    } else {
      selfTransform.setWorldPosition(newPos);
      setT = true;
    }

    const quat = new Amaz.Quaternionf();
    const newRot = this.inputs[3]();
    const orientation = quat.eulerToQuaternion(newRot);

    if (this.isLocal) {
      selfTransform.localEulerAngle = newRot;
    } else {
      selfTransform.worldEulerAngle = newRot;
      setR = true;
    }

    const newScale = this.inputs[4]();
    if (this.isLocal) {
      selfTransform.localScale = newScale;
    } else {
      selfTransform.setWorldScale(newScale);
      setS = true;
    }

    if (this.nexts[0]) {
      this.nexts[0]();
    }
  }
}

exports.CGSetTransform = CGSetTransform;
