local vars = {
    data = {
        ironamount = {
            base = 0,
            multi = 0
        }
    }
}

function vars:save()
    local file = io.open("data.json", "w")
    file:write(json.encode(self.data))
    file:close()
    print("saved data")
end

function vars:load()
    if love.filesystem.exists("data.json") then
        local file = io.open("data.json", "r")
        local data = file:read("*a")
        file:close()
        for key, var in pairs(json.decode(data)) do
            self.data[key] = var
        end
        print("loaded data")
    else
        print("no data.json found")
    end
end

return vars
