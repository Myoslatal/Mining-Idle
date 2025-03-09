local mining = new(Activity)
layout = new(Layout, {
    new(UI.rectangle, { 0, 0, Vars.ScreenW, 50, { 0.2, 0.2, 0.2, 1 } }),
})

function mining:init()
end

function mining:update()
    layout:update()
end

function mining:draw()
    layout:draw()
end

function mining:keypress()
    layout:keypress()
end

return mining
