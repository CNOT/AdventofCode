open("/home/ali/Spare Time/AdventofCode/2022/input-day10.txt", "r") do f
    rx = r"addx (.+)"
    lines = readlines(f)
    x = zeros(Int, 400)
    x[1] = 1
    cycles = 1
    for i in eachindex(lines)
        m = match(rx, lines[i])
        x[cycles+1] = x[cycles]
        cycles += 1
        if m !== nothing
            x[cycles+1] = x[cycles] + parse(Int, m[1])
            cycles += 1
        end
    end
    println(20 * x[20] + 60 * x[60] + 100 * x[100] + 140 * x[140] + 180 * x[180] + 220 * x[220])
end
open("/home/ali/Spare Time/AdventofCode/2022/input-day10.txt", "r") do f
    rx = r"addx (.+)"
    lines = readlines(f)
    x = zeros(Int, 400)
    x[1] = 1
    cycles = 0
    pixels = fill(".", 240)
    abs(cycles - x[cycles+1]) < 2 && (pixels[cycles+1] = "#")
    for i in 1:140
        m = match(rx, lines[i])
        x[cycles+1+1] = x[cycles+1]
        cycles += 1
        abs(cycles - x[cycles+1]) < 2 && (pixels[cycles+1] = "#")
        if m !== nothing
            x[cycles+1+1] = x[cycles+1] + parse(Int, m[1])
            cycles += 1
            abs(cycles - x[cycles+1]) < 2 && (pixels[cycles+1] = "#")
        end
    end
    println(*(pixels[1:40]...))
    println(*(pixels[41:80]...))
    println(*(pixels[81:120]...))
    println(*(pixels[121:160]...))
    println(*(pixels[161:200]...))
    println(*(pixels[201:240]...))

end