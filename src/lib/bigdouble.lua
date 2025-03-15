local bigdouble = {
    add = function(base, multi, base2, multi2)
        if multi - multi2 > 8 or multi2 - multi > 8 then
            return base, multi
        end

        while multi ~= multi2 do
            if multi > multi2 then
                base2 = base2 / 10
                multi2 = multi2 + 1
            elseif multi < multi2 then
                base = base * 10
                multi2 = multi2 - 1
            end
        end

        base = base + base2

        while math.abs(base) >= 10 do
            base = base / 10
            multi = multi + 1
        end
        while math.abs(base) < 1 do
            base = base * 10
            multi = multi - 1
        end

        return base, multi
    end,
    sub = function(base, multi, base2, multi2)
        if multi - multi2 > 8 or multi2 - multi > 8 then
            return base, multi
        end

        while multi ~= multi2 do
            if multi > multi2 then
                base2 = base2 / 10
                multi2 = multi2 + 1
            elseif multi < multi2 then
                base = base * 10
                multi2 = multi2 - 1
            end
        end

        base = base - base2

        while math.abs(base) >= 10 do
            base = base / 10
            multi = multi + 1
        end

        while math.abs(base) < 1 do
            base = base * 10
            multi = multi - 1
        end

        return base, multi
    end,
    multiply = function(base, multi, base2, multi2)
        base = base * base2
        multi = multi + multi2
        while math.abs(base) >= 10 do
            base = base / 10
            multi = multi + 1
        end

        while math.abs(base) <= 1 do
            base = base * 10
            multi = multi - 1
        end
        return base, multi
    end,
    devtiply = function(base, multi, base2, multi2)
        base = base / base2
        multi = multi - multi2
        while math.abs(base) >= 10 do
            base = base / 10
            multi = multi + 1
        end

        while math.abs(base) <= 1 do
            base = base * 10
            multi = multi - 1
        end
        return base, multi
    end,
    powers = function(base, multi, power)
        base = base ^ power
        multi = multi * power

        if multi % 1 ~= 0 then
            local afterpoint = multi % 1
            multi = multi - afterpoint
            base = base * 10 ^ afterpoint
        end

        while math.abs(base) >= 10 do
            base = base / 10
            multi = multi + 1
        end

        while math.abs(base) <= 1 do
            base = base * 10
            multi = multi - 1
        end
        return base, multi
    end,
    larger = function(base, multi, base2, multi2)
        if base > 0 and base2 < 0 then
            return true
        end
        if multi > multi2 then
            return true
        elseif base > base2 then
            return true
        end
        return false
    end,
    smaller = function(base, multi, base2, multi2)
        if base < 0 and base2 > 0 then
            return true
        end
        if multi < multi2 then
            return true
        elseif base < base2 then
            return true
        end
        return false
    end,
    equal = function(base, multi, base2, multi2)
        if base == base2 and multi == multi2 then
            return true
        end
        return false
    end,
    tostring = function(base, multi)
        local str = ""
        if multi >= 1.79e308 then
            return "BigInfinity"
        end
        if multi <= -1.79e308 then
            return "-BigInfinity"
        end
        if multi < 5 then
            local temp = base * 10 ^ multi
            return string.format("%.2f", temp)
        end

        str = str .. string.format("%.2f", base) .. "e" .. multi
        return str
    end
}
return bigdouble
