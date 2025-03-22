--extend Actor
local text = new(Actor)
text.x = 0
text.y = 0
text.content = ""
text.color = { 1, 1, 1, 1 }
-- X Y Content Color(table)
text.init = function(self, args)
    self.x = args[1]
    self.y = args[2]
    self.content = args[3]
    self.color = args[4] or { 1, 1, 1, 1 }
    self.updateF = args[5] or function() return self.content end
    self.font = args[6] or Vars.Font
end

function text:draw()
    love.graphics.setFont(self.font)
    love.graphics.setColor(self.color)
    love.graphics.print(self.content, self.x + self.prefixX, self.y + self.prefixY)
    love.graphics.setColor(1, 1, 1, 1)
end

function text:update()
    self:updateText(self:updateF())
end

function text:updateText(newtext)
    self.content = newtext
end

return text
