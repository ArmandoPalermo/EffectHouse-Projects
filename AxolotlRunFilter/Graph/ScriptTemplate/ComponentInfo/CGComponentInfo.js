"use strict";
const Amaz = effect.Amaz;
const { BaseNode } = require('./BaseNode');

class CGComponentInfo extends BaseNode {
    constructor(){
        super();
    }

    getOutput(index){
        const component  = this.inputs[0]();
        if(!component) return
        
        switch(index){
            case 0:
                return component.entity;
            case 1:
                if(component.entity){
                    return component.entity.getComponent('Transform');
                }
            case 2:
                return component.enabled;
        }
    }
}

exports.CGComponentInfo = CGComponentInfo;
    