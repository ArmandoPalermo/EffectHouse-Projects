local CGSelect = CGSelect or {}
CGSelect.__index = CGSelect

function CGSelect.new()
    local self = setmetatable({}, CGSelect)
    self.inputs = {}
    return self
end

function CGSelect:setInput(index, func)
    self.inputs[index] = func
end

function CGSelect:getOutput(index)
    if self.inputs[0]() then
        return self.inputs[1]()
    else
        return self.inputs[2]()
    end
end

return CGSelect
