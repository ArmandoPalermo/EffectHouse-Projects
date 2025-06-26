local CGOr = CGOr or {}
CGOr.__index = CGOr

function CGOr.new()
    local self = setmetatable({}, CGOr)
    self.inputs = {}
    return self
end

function CGOr:setInput(index, func)
    self.inputs[index] = func
end

function CGOr:getOutput(index)
    return self.inputs[0]() or self.inputs[1]()
end

return CGOr
