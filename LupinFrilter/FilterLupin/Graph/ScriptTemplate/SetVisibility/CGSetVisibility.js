/**
 * @file CGSetVisibility.js
 * @author liujiacheng
 * @date 2021/8/20
 * @brief CGSetVisibility.js
 * @copyright Copyright (c) 2021, ByteDance Inc, All Rights Reserved
 */

const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class CGSetVisibility extends BaseNode {
  constructor() {
    super();
    this.isVisible = true;
  }

  _registerResetCallback(sys, object, callbackFunctionArray, argsArray) {
    if (callbackFunctionArray.length != argsArray.length) {
      return;
    }

    if (sys.setterNodeInitValueMap && !this.sys.setterNodeGuidMap.has(object.guid.toString())) {
      const callBackFuncMap = new Map();
      for (let i = 0; i < callbackFunctionArray.length; ++i) {
        callBackFuncMap.set(callbackFunctionArray[i], [...argsArray[i]]);
      }
      sys.setterNodeGuidMap.add(object.guid.toString());
      sys.setterNodeInitValueMap.set(object.guid, callBackFuncMap);
    }
  }

  _updateScriptComponentRecursively(entity, enable) {
    const jsComps = entity.getComponents('JSScriptComponent');
    const luaComps = entity.getComponents('ScriptComponent');
    if (jsComps && jsComps.size() > 0) {
      for (let i = 0; i < jsComps.size(); i++) {
        const comps = jsComps.get(i);

        // Register Reset callback functions
        this._registerResetCallback(
          this.sys,
          comps,
          [(_comp, _enabled) => (_comp.enabled = _enabled)],
          [[comps.enabled]]
        );

        const compsEnable = CGSetVisibility.compsEnableMap.get(comps.guid.toString());
        if (compsEnable === undefined) {
          CGSetVisibility.compsEnableMap.set(comps.guid.toString(), comps.enabled);
        }
        comps.enabled = enable && CGSetVisibility.compsEnableMap.get(comps.guid.toString());
      }
    }
    if (luaComps && luaComps.size() > 0) {
      for (let i = 0; i < luaComps.size(); i++) {
        const comps = luaComps.get(i);

        // Register Reset callback functions
        this._registerResetCallback(
          this.sys,
          comps,
          [(_comp, _enabled) => (_comp.enabled = _enabled)],
          [[comps.enabled]]
        );

        const compsEnable = CGSetVisibility.compsEnableMap.get(comps.guid.toString());
        if (compsEnable === undefined) {
          CGSetVisibility.compsEnableMap.set(comps.guid.toString(), comps.enabled);
        }
        comps.enabled = enable && CGSetVisibility.compsEnableMap.get(comps.guid.toString());
      }
    }
    const transform = entity.getComponent('Transform');
    if (transform && transform.isInstanceOf('Transform')) {
      const childrens = transform.children;
      for (let i = 0; i < childrens.size(); i++) {
        if (childrens.get(i).entity.isInstanceOf('Entity')) {
          this._updateScriptComponentRecursively(childrens.get(i).entity, enable);
        }
      }
    }
  }

  getOutput(index) {
    return this.isVisible;
  }

  execute(sys, dt) {
    if (this.inputs[1] !== null && this.inputs[1] !== undefined) {
      let object = this.inputs[1]();
      let visible = this.inputs[2]();

      if (object !== null && object !== undefined && object.isInstanceOf('Entity')) {
        this._registerResetCallback(
          this.sys,
          object,
          [(_object, _visible) => (_object.visible = _visible)],
          [[object.visible]]
        );
        if (true === visible) {
          object.visible = visible;
          this._updateScriptComponentRecursively(object, visible);
        } else {
          this._updateScriptComponentRecursively(object, visible);
          object.visible = visible;
        }
        this.isVisible = visible;
      } else {
        this.isVisible = null;
      }
    }
    if (this.nexts[0]) {
      this.nexts[0]();
    }
  }

  beforeStart(sys) {
    this.sys = sys;
  }

  resetOnRecord(sys) {
    this.isVisible = true;
  }
}
CGSetVisibility.compsEnableMap = new Map();
exports.CGSetVisibility = CGSetVisibility;
