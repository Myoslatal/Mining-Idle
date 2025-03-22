function new(base, args, override)
    local temp = {}
    for key, var in pairs(base) do
        temp[key] = var
    end
    if override then
        for key, var in pairs(override) do
            temp[key] = var
        end
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
