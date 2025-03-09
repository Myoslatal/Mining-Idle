MathTool = {}
MathTool.inBlock = function(tx, ty, ax, ay, bx, by)
    ax = ax * Vars.scaleX
    ay = ay * Vars.scaleY
    bx = bx * Vars.scaleX
    by = by * Vars.scaleY
    if tx >= ax and tx <= bx then
        if ty >= ay and ty <= by then
            return true
        end
    end
    return false
end
