--depend lib/class
Vars = {}
Vars.mainActivity = new(Activity)
Vars.image0 = love.graphics.newImage("resources/images/test.png")
Vars.ScreenW = 1024
Vars.ScreenH = 720
Vars.Font = love.graphics.newFont("resources/fonts/zh-cn.ttf", 30)
Vars.FontSize10 = love.graphics.newFont("resources/fonts/zh-cn.ttf", 10)
Vars.FontSize20 = love.graphics.newFont("resources/fonts/zh-cn.ttf", 20)
Vars.mx = 0
Vars.my = 0
Vars.scaleX = 1
Vars.scaleY = 1

love.graphics.setDefaultFilter("nearest", "nearest")
Vars.textures = {
    beacon = love.graphics.newImage("resources/images/beacon.png"),
}
Dt = 0
