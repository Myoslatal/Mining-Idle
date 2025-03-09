function love.draw()
    Vars.scaleX = love.graphics.getWidth() / 1024
    Vars.scaleY = love.graphics.getHeight() / 720
    love.graphics.scale(Vars.scaleX, Vars.scaleY)

    love.graphics.setColor(0.1, 0.1, 0.1, 1)
    love.graphics.rectangle("fill", 0, 0, 2000, 2000)
    love.graphics.setColor(1, 1, 1, 1)

    Vars.mainActivity.draw()
end

function love.update(dt)
    if not love.mouse.isDown(1) then
        Vars.mx = 0
        Vars.my = 0
    end
    Vars.mainActivity.update()
    Dt = dt
end

function love.load()
    math.randomseed(os.time())
    love.window.setTitle("Test")
    print(">> initlazing")
    require("src.requires")

    love.graphics.setFont(Vars.Font)

    love.window.setMode(1024, 768, { resizable = true })
    DataVar:load()
end

function love.mousepressed(x, y, btn)
    if btn == 1 then
        Vars.mx = x
        Vars.my = y
        Vars.mainActivity:keypress()
        print(" >> mouseInput: \x1b[34mX:" .. x .. "\x1b[36mY:" .. y .. "\x1b[0m")
    end
end

function love.quit()
    DataVar:save()
end
