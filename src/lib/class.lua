function new(base, args)
    local temp = {}
    for key, var in pairs(base) do
        temp[key] = var
    end
    temp:init(args)
    return temp
end

function extend(base, args)
    local temp = {}
    for key, var in pairs(base) do
        temp[key] = var
    end
    return temp
end
