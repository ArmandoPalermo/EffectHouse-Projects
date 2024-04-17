local CGCeil= CGCeil or {}
CGCeil.__index = CGCeil

function CGCeil.new()
    local self = setmetatable({}, CGCeil)
    self.inputs = {}
    return self
end

function CGCeil:setInput(index, func)
    self.inputs[index] = func
end

function CGCeil:getOutput(index)
    return math.ceil(self.inputs[0]())
end

return CGCeil
