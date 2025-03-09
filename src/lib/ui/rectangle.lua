local Rectangle = new(Actor)

function Rectangle:init(args)
    self.x = args[1]
    self.y = args[2]
    self.w = args[3]
    self.h = args[4]
    self.color = args[5] or { 1, 1, 1, 1 }
end

function Rectangle:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x + self.prefixX, self.y + self.prefixY, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
end

function Rectangle:update()
end

return Rectangle
