const {BaseNode} = require('./BaseNode');
const Amaz = effect.Amaz;

class CGScreenImageTap extends BaseNode {
  constructor() {
    super();
    this._min = new Amaz.Vector3f();
    this._max = new Amaz.Vector3f();
    this._fixedTapPos = new Amaz.Vector2f();
    this._tapPos = new Amaz.Vector2f();
    this._clamp01 = num => Math.min(Math.max(num, 0), 1);
    this._imgTrans = null;
    this._img = null;
    this._isScreenTapped = false;
    this.outputs[1] = false;
    this._imgCenter = new Amaz.Vector3f();
    this._xVec = new Amaz.Vector3f();
    this._yVec = new Amaz.Vector3f();
    this._planeNormal = new Amaz.Vector3f();
    this._camRay = new Amaz.Vector3f();
  }

  _getEffectNodeGUID(ent){
    let parentTransform = ent.getComponent('Transform');
    let effectNodeGUID = new Amaz.Guid();
    while(parentTransform != null){
      effectNodeGUID = parentTransform.entity.guid;
      parentTransform = parentTransform.parent;
    }

    return effectNodeGUID;
  }

  _checkIsValidImageCameraPair(img, cam){
    // Check whether belongs to same render chain
    const imageEffectNodeRoot = this._getEffectNodeGUID(img.entity);
    const screenEffectNodeRoot = this._getEffectNodeGUID(cam.entity);

    // ignore if not in same rendering chain
    if(!imageEffectNodeRoot.equals(screenEffectNodeRoot)){
      return false;
    }

    const screenTrans = img.entity.getComponent('ScreenTransform');

    // // 3D Image + Perspective Camera
    // if(screenTrans == null && cam.type === Amaz.CameraType.PERSPECTIVE){
    //   return true;
    // }
    // Valid 2D Image + Othographic Camera
    if(screenTrans.isValidScreenHierarchy() && cam.type === Amaz.CameraType.ORTHO){
      return true;
    }
    // Invalid 2D Image
    return false;
  }

  _runImageTapNode(sys) {
    const img = this.inputs[0]();

    if (img == null || !img.entity.visible) {
      return;
    }

    if (this._imgTrans == null || this._img !== img) {
      this._imgTrans = img.entity.getComponent('ScreenTransform');
      this._img = img;
    }

    const layer = img.entity.layer;
    const entities = sys.scene.entities;
    for (let i = 0; i < entities.size(); i++) {
      const cams = entities.get(i).getComponents('Camera');
      for (let j = 0; j < cams.size(); ++j) {
        const cam = cams.get(j);
        if (!cam.isLayerVisible(layer) || !cam.entity.visible) {
          continue;
        }

        if (!this._checkIsValidImageCameraPair(this._img, cam)){
          continue;
        }

        const isValidTap = this._setupData(this._imgTrans, cam);

        if (!isValidTap) {
          continue;
        }

        const isImgTapped = this._isImgTapped(cam);

        if (isImgTapped) {
          this.outputs[1] = true;
          if (this.nexts[0] != null) {
            this.nexts[0](); //on tapped event
          }
          return; //early out if we get a tap
        }
      }
    }
  }

  _isImgTapped(cam) {
    const p = this._camRay.origin;

    const n = this._planeNormal;
    const c = this._imgCenter;
    const l = this._camRay.direction;
    const t = (n.x*(c.x - p.x) + n.y * (c.y - p.y) + n.z * (c.z - p.z))/(n.x * l.x + n.y * l.y + n.z * l.z);
    const intersectionPT = (l.mul(t)).add(p);

    const OI = this._vectorFromToPoint(c, intersectionPT);

    const Ix = OI.dot(this._xVec.normalize())/(this._xVec.magnitude());
    const Iy = OI.dot(this._yVec.normalize())/(this._yVec.magnitude());

    // Whether interesection point lies in quad
    const isInQuad = !(Math.abs(Ix) > 1.0 || Math.abs(Iy) > 1.0);

    // Frustum test
    const isInView = this._inFrustum(cam, t);

    return isInQuad && isInView;
  }

  //sets up the corner points and adjusts the tap position to account for viewport adjustments
  _setupData(trans, cam) {
    const viewport = cam.viewport;

    // Very weird but our camera viewport is clamped at 0 -> 1 for both x and y
    // although it ranges spans from -1 to 2
    const adjustedViewPort = new Amaz.Rect(this._clamp01(viewport.x, 0.0, 1.0), 
                                          this._clamp01(viewport.y, 0.0, 1.0),
                                       viewport.x < 0? viewport.x + viewport.width: (viewport.x + viewport.width > 1.0? 1.0 - viewport.x :viewport.width),
                                       viewport.y < 0? viewport.y + viewport.height: (viewport.y + viewport.height > 1.0? 1.0 - viewport.y :viewport.height))
    
    if (!this._isInRect(this._tapPos, viewport)) {
      return false;
    }
    
    const imgCornersWorldPos = this._img.getWorldCornersOfRealSize();

    //correct for viewport adjustments
    //remaps the tapposition to be normalized screen coords to in actual camera's viewport
    this._fixedTapPos.set(
      this._inverseLerp(this._tapPos.x, adjustedViewPort.x, adjustedViewPort.x + adjustedViewPort.width),
      this._inverseLerp(this._tapPos.y, adjustedViewPort.y, adjustedViewPort.y + adjustedViewPort.height)
    );

    const ptA = imgCornersWorldPos.get(0);
    const ptB = imgCornersWorldPos.get(1);
    const ptC = imgCornersWorldPos.get(2);
    const ptD = imgCornersWorldPos.get(3);

    //this._camRay = cam.getLookAt().normalize();
    this._camRay = cam.ViewportPointToRay(this._fixedTapPos);

    this._imgCenter = this._getCenter(ptA, ptD);
    const ABCenter = this._getCenter(ptA, ptB);
    const ACCenter = this._getCenter(ptA, ptC);
    this._xVec = this._vectorFromToPoint(ABCenter, this._imgCenter);
    this._yVec = this._vectorFromToPoint(ACCenter, this._imgCenter);

    this._planeNormal = this._xVec.cross(this._yVec);

    if(this._planeNormal.dot(this._camRay.direction) === 0){
      return false;
    }
    
    return true;
  }

  _getCenter(ptA, ptB){
    return new Amaz.Vector3f((ptA.x + ptB.x)/2.0, (ptA.y + ptB.y)/2.0, (ptA.z + ptB.z)/2.0)
  }

  _vectorFromToPoint(ptA, ptB){
    return new Amaz.Vector3f(ptB.x - ptA.x, ptB.y - ptA.y, ptB.z - ptA.z);
  }

  _isInAABB(point, min, max) {
    return point.x > min.x && point.x < max.x && point.y > min.y && point.y < max.y;
  }

  _mulv3(a, b) {
    return new Amaz.Vector3f(a.x * b.x, a.y * b.y, a.z * b.z);
  }

  //only need to check if you are in between the near and far plane
  //and let inAABB take care of the other bounds
  _inFrustum(cam, d) {
    return d >= cam.zNear && d < cam.zFar;
  }

  _isInRect(point, rect) {
    return point.x > rect.x && point.x < rect.x + rect.width && point.y > rect.y && point.y < rect.y + rect.height;
  }

  _inverseLerp(v, a, b) {
    if (a === b) {
      return 0;
    }

    return this._clamp01((v - a) / (b - a));
  }

  onUpdate(sys, dt) {
    this.outputs[1] = false;
    if (this._isScreenTapped) {
      this._runImageTapNode(sys);
      this._isScreenTapped = false;
    }
  }

  onEvent(sys, event) {
    if (this.inputs[0] == null) {
      return;
    }

    if (event.type === Amaz.EventType.TOUCH) {
      const touch = event.args.get(0);
      if (touch.type === Amaz.TouchType.TOUCH_BEGAN) {
        this._tapPos.set(touch.x, 1 - touch.y);
        this._isScreenTapped = true;
      }
    }
  }
}

exports.CGScreenImageTap = CGScreenImageTap;
