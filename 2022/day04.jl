open("/home/ali/Spare Time/AdventofCode/2022/input-day04.txt", "r") do f
    lines = readlines(f)
    rx = r"(.+)-(.+),(.+)-(.+)"
    counter = 0
    for l in lines
        m = match(rx, l)
        a1 = parse(Int, m[1])
        a2 = parse(Int, m[2])
        b1 = parse(Int, m[3])
        b2 = parse(Int, m[4])
        if (a1 <= b1 && a2 >= b2) || (a1 >= b1 && a2 <= b2)
            counter += 1
        end
    end
    println(counter)
    counter = 0
    for l in lines
        m = match(rx, l)
        a1 = parse(Int, m[1])
        a2 = parse(Int, m[2])
        b1 = parse(Int, m[3])
        b2 = parse(Int, m[4])
        r1 = a1:a2
        r2 = b1:b2
        isempty(intersect(r1,r2)) ? continue :  counter += 1
    end
    println(counter)

end