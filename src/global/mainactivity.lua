local TextA = 0.0
local rt = 0

local tipsSelect = math.random(1, #Strings.tips)

local point = {
    x = 0,
    y = 0,
    ry = 0,
    status = 1,
    draw = function(self)
        love.graphics.print(".", self.x, self.ry)
    end,
    update = function(self)
        if self.ry < self.y - 20 then
            self.status = -1
        end
        if self.ry > self.y then
            self.status = 1
        end
        self.ry = self.ry - Dt * 30 * self.status
    end,
    init = function(self, args)
        self.x = args[1]
        self.y = args[2]
        self.ry = self.y + args[3]
    end
}

local layout = new(Layout, {
    {
        textA = 0,
        rt = 0,
        draw = function(self)
            love.graphics.setColor(1, 1, 1, self.textA)
            love.graphics.print("Mining Idle", Vars.ScreenW / 2 - 125 + self.prefixX, Vars.ScreenH / 2 - 15 + self
                .prefixX)
            love.graphics.setColor(1, 1, 1, 1)
        end,
        update = function(self)
            self.textA = self.textA + Dt / 4
        end
    },
    {
        draw = function(self)
            love.graphics.print("Loading", 0, Vars.ScreenH - 40)
        end,
        update = function(self)

        end
    },
    new(point, { 150, Vars.ScreenH - 40, 0 }),
    new(point, { 165, Vars.ScreenH - 40, 5 }),
    new(point, { 180, Vars.ScreenH - 40, 10 }),

    new(UI.text, { 0, Vars.ScreenH - 100, "Tips:" .. Strings.tips[tipsSelect], { 1, 1, 1, 1 } })
})

Vars.mainActivity.draw = function()
    layout:draw()
end
Vars.mainActivity.update = function()
    layout:update()
    rt = rt + Dt
    if rt > 4 then
        Vars.mainActivity = require("src.cores.activities.mining")
    end
end
