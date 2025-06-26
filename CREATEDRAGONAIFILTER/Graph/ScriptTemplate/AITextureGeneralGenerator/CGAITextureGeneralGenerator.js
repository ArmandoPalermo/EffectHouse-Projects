/**
 * @file CGAITextureGeneralGenerator.js
 * @author Jie Li
 * @date 2023/12/21
 * @brief CGAITextureGeneralGenerator.js
 * @copyright Copyright (c) 2023, ByteDance Inc, All Rights Reserved
 */
const { BaseNode } = require('./BaseNode');
const JSAssetRuntimeManager = require('./JSAssetRuntimeManager');

const AlgorithmTypeMap = {
  AIDrawTexture: 'AIDrawTexture',
  AIDrawTextureDY: 'AIDrawTextureDY',
  FaceFusionTT: 'FaceFusionTT',
  FaceFusionDY: 'FaceFusionDY'
};

class CGAITextureGeneralGenerator extends BaseNode {
  constructor() {
    super();
    this.result = new effect.Amaz.Texture2D();
    this.serverMsg = '';
    this.aiTextureObj = null;

    this.onWaiting = this.onWaiting.bind(this);
    this.onStart = this.onStart.bind(this);
    this.onDuring = this.onDuring.bind(this);
    this.onSucceed = this.onSucceed.bind(this);
    this.onFail = this.onFail.bind(this);
    this.setResult = this.setResult.bind(this);
    this.setServerMsg = this.setServerMsg.bind(this);

    // when an input pulse is triggered from onStart, the JSAsset might not be ready yet
    // so record whatever event is missed from onStart and retrigger the event when JSAsset is ready
    this.missedEvents = [];
  }

  setServerMsg(msg)
  {
    this.serverMsg = msg;
  }

  setResult(result) {
    this.result = result;
  }

  onWaiting() {
    if (this.nexts[0]) {
      this.nexts[0]();
    }
  }

  onStart() {
    console.log('in graph node on start')
    if (this.nexts[1]) {
      this.nexts[1]();
    }
  }

  onDuring() {
    if (this.nexts[2]) {
      this.nexts[2]();
    }
  }

  onSucceed() {
    if (this.nexts[3]) {
      this.nexts[3]();
    }
  }

  onFail(errorMessage) {
    console.error('AIGC', errorMessage);
    if (this.nexts[4]) {
      this.nexts[4]();
    }
  }

  onUpdate(dt) {
    this.aiTexture = this.inputs[2]();
    if (!this.aiTexture) {
      console.error('Invalid Input AI texture!');
      return;
    }
    this.manager = JSAssetRuntimeManager.instance();
    if (!this.manager)
    {
      return;
    }
    const aiTextureObj = this.manager.getAsset(this.aiTexture);
    if (!aiTextureObj) {
      console.error('Input texture is not a supported JSAsset');
      return;
    }
    
    if (this.aiTextureObj !== aiTextureObj) {
      if (this.aiTextureObj !== null) {
        // the missedEvents should be cleared when the target JSAsset changes
        this.missedEvents = [];
      }
      switch (aiTextureObj.algorithmType) {
        case AlgorithmTypeMap.AIDrawTexture:
        case AlgorithmTypeMap.AIDrawTextureDY:
        case AlgorithmTypeMap.FaceFusionTT:
        case AlgorithmTypeMap.FaceFusionDY:
          // remove listener from previous asset if any
          if (this.aiTextureObj && this.aiTextureObj.removeGraphNode) {
            this.aiTextureObj.removeGraphNode(this);
          }
          this.aiTextureObj = aiTextureObj;
          this.aiTextureObj.registerGraphNode(this);
          if (this.missedEvents.length > 0)
          {
            this.missedEvents.forEach(e => this.execute(e));
            this.missedEvents = [];
          }
          break;
        default:
          console.error('JSAsset ' + aiTextureObj.constructor.name + ' not supported');
          return;
      }
    }
  }

  execute(index) {
    if (!this.aiTextureObj)
    {
      this.missedEvents.push(index);
    }
    if (index === 0) {
      console.log('graph trigger')
      this.aiTextureObj.triggerStartAlgorithm();
    } else if (index === 1) {
      this.aiTextureObj.triggerStopAlgorithm();
    }
  }

  getOutput(index) {
    if (index === 5)
    {
      return this.result;
    } else if (index === 6)
    {
      return this.serverMsg;
    }
  }
}

exports.CGAITextureGeneralGenerator = CGAITextureGeneralGenerator;
