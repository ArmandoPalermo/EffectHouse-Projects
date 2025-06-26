local CGDataConvert = CGDataConvert or {}
CGDataConvert.__index = CGDataConvert

function CGDataConvert.new()
    local self = setmetatable({}, CGDataConvert)
    self.inputs = {}
    self.outputs = {}
    return self
end

function CGDataConvert:setInput(index, func)
    self.inputs[index] = func
end

function CGDataConvert:getOutput(index)
    local curType = self.valueType
    if curType == nil then
        Amaz.LOGE("ERROR: ", "CGDataConvert do not have node type")
        return nil
    end
    local value = self.inputs[0]()

    if value == nil then
        return nil
    end

    if curType == "Int" then
        self.outputs[0] = value
        self.outputs[1] = tostring(value)
    elseif curType == "Double" then
        self.outputs[0] = math.floor(value + 0.5)
        self.outputs[1] = tostring(value)
    elseif curType == "Vector2f" then
        self.outputs[0] = Amaz.Vector3f(value.x, value.y, 0.0)
        self.outputs[1] = Amaz.Vector4f(value.x, value.y, 0.0, 0.0)
        self.outputs[2] = string.format("x:%.2f, y:%.2f", value.x, value.y)
    elseif curType == "Vector3f" then
        self.outputs[0] = Amaz.Vector2f(value.x, value.y)
        self.outputs[1] = Amaz.Vector4f(value.x, value.y, value.z, 0.0)
        self.outputs[2] = Amaz.Color(value.x, value.y, value.z, 0.0)
        self.outputs[3] = string.format("x:%.2f, y:%.2f, z:%.2f", value.x, value.y, value.z)
    elseif curType == "Vector4f" then
        self.outputs[0] = Amaz.Vector2f(value.x, value.y);
        self.outputs[1] = Amaz.Vector3f(value.x, value.y, value.z);
        self.outputs[2] = Amaz.Color(value.x, value.y, value.z, value.w);
        self.outputs[3] = string.format("x:%.2f, y:%.2f, z:%.2f, w:%.2f", value.x, value.y, value.z, value.w)
        self.outputs[4] = Amaz.Rect(value.x, value.y, value.z, value.w);
    elseif curType == "Color" then
        self.outputs[0] = Amaz.Vector3f(value.r, value.g, value.b);
        self.outputs[1] = Amaz.Vector4f(value.r, value.g, value.b, value.a);
        self.outputs[2] = string.format("r:%.2f, g:%.2f, b:%.2f, a:%.2f", value.r, value.g, value.b, value.a)
    elseif curType == "Bool" then
        self.outputs[0] = tostring(value)
    elseif curType == "Rect" then
        self.outputs[0] = Amaz.Vector4f(value.x, value.y, value.width, value.height);
        self.outputs[1] = string.format("x:%.2f, y:%.2f, w:%.2f, h:%.2f", value.x, value.y, value.width, value.height)
    elseif curType == "Quaternionf" then
        self.outputs[0] = Amaz.Vector4f(value.x, value.y, value.z, value.w);
        self.outputs[1] = string.format("x:%.2f, y:%.2f, z:%.2f, w:%.2f", value.x, value.y, value.z, value.w)
    end
    return self.outputs[index]
end

return CGDataConvert
