local layout = {}

layout.data = {}
layout.prefixX = 0
layout.prefixY = 0

function layout:draw()
    for key, var in pairs(self.data) do
        var:draw(var)
    end
end

function layout:update()
    for key, var in pairs(self.data) do
        var:update(var)
        var.prefixX = self.prefixX
        var.prefixY = self.prefixY
    end
end

function layout:init(args)
    self.data = args
end

function layout:keypress()
    for key, var in pairs(self.data) do
        if var.pressableFlag == 1 then
            var:click(var)
        end
    end
end

function layout:add(args)
    for key, var in pairs(args) do
        table.insert(self.data, var)
    end
end

return layout
