love.filesystem.readLines = function(name)
    local content = love.filesystem.read(name)
    local lines = {}
    for line in content:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end
    return lines
end
