local mining = new(Activity)
local layout = new(Layout, {
    new(UI.rectangle, { 0, 0, Vars.ScreenW, 50, { 0.2, 0.2, 0.2, 1 } }),
})
layout:add({
    new(UI.rectangle, { 50, Vars.ScreenH - 320, 200, 200, { 168 / 255, 70 / 255, 23 / 255, 1 } }),
    new(UI.rectangle, { Vars.ScreenW / 2 - 10, 0, 20, Vars.ScreenH, { 0.2, 0.2, 0.2, 0.5 } }),
    new(UI.text,
        { 10, 100, "", { 1, 1, 1, 1 }, function()
            return string.format(Strings.ironamount,
                BigDouble.tostring(DataVar.data.ironamount.base, DataVar.data.ironamount.multi))
        end }),
    new(UI.button, { Vars.ScreenW / 2 + 20, 100, 100, 50, { 1, 1, 1, 0.5 }, "挖矿", function()
        DataVar.data.ironamount.base, DataVar.data.ironamount.multi = BigDouble.add(DataVar.data.ironamount.base,
            DataVar.data.ironamount.multi, 1, 0)
    end }),
    new(UI.button, { Vars.ScreenW / 2 + 130, 100, 100, 50, { 1, 1, 1, 0.5 }, "信标", function()
        Vars.mainActivity = require("src.cores.activities.beacon")
    end }),
    new(UI.rectangle, { Vars.ScreenW / 2 + 10, 250, Vars.ScreenW, 25, { 0.2, 0.2, 0.2, 0.5 } }),
    new(UI.button,
        { Vars.ScreenW / 2 + 10, 275, 1000, 20, { 1, 1, 1, 0.5 }, Strings.IronMinerUpgrade, function()
            if BigDouble.larger(DataVar.data.ironamount.base, DataVar.data.ironamount.multi, BigDouble.multiply(DataVar.data.ironminer.base, DataVar.data.ironminer.multi, 1, 1)) then
                DataVar.data.ironamount.base, DataVar.data.ironamount.multi = BigDouble.sub(DataVar.data.ironamount.base,
                    DataVar.data.ironamount.multi,
                    BigDouble.multiply(DataVar.data.ironminer.base, DataVar.data.ironminer.multi, 1, 1))
                DataVar.data.ironminer.base, DataVar.data.ironminer.multi = BigDouble.add(DataVar.data.ironminer.base,
                    DataVar.data.ironminer.multi, 1, 0)
            end
        end, Vars
            .FontSize20 }, {
            update = function(self)
                self.text:updateText(string.format(Strings.IronMinerUpgrade,
                    BigDouble.tostring(DataVar.data.ironminer.base, DataVar.data.ironminer.multi), BigDouble.tostring(
                        BigDouble.multiply(DataVar.data.ironminer.base, DataVar.data.ironminer.multi, 1, 1)), --价格=数量*10
                    BigDouble.tostring(DataVar.data.ironminer.multipiebase, DataVar.data.ironminer.multipiemulti)))
            end
        }),
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
