local button = extend(UI.rectangle)

function button:init(args)
    self.x = args[1] + self.prefixX
    self.y = args[2] + self.prefixY
    self.w = args[3]
    self.h = args[4]

    self.color = args[5] or { 0.2, 0.2, 0.2, 1 }
    self.text = new(UI.text, { self.x + self.prefixX, self.y + self.prefixY, args[6], { 1, 1, 1, 1 } })
    self.callback = args[7]
end

function button:update()
end

function button:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    self.text:draw()
    love.graphics.setColor(1, 1, 1, 1)
end

function button:click()
    --use Math.inBlock
    if MathTool.inBlock(Vars.mx, Vars.my, self.x, self.y, self.x + self.w, self.y + self.h) then
        self.callback()
    end
end

button.pressableFlag = 1

return button
