open("/home/ali/Spare Time/AdventofCode/2022/input-day05.txt", "r") do f
    rx = r".(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.)."
    stacks = [String[], String[], String[], String[], String[], String[], String[], String[], String[]]
    for j in 1:8
        l = readline(f)
        m = match(rx, l)
        for i in 1:9
            if m[i] != " "
                pushfirst!(stacks[i], m[i])
            end
        end
    end
    readline(f)
    readline(f)
    rx = r"move (.+) from (.) to (.)"
    for j in 11:513
        l = readline(f)
        m = match(rx, l)
        n = parse(Int, m[1])
        a = stacks[parse(Int, m[2])]
        b = stacks[parse(Int, m[3])]
        for i in 1:n
            push!(b, pop!(a))
        end
    end
    str = ""
    for j in 1:9
        str *= stacks[j][end]
    end
    println(str)
end

open("/home/ali/Spare Time/AdventofCode/2022/input-day05.txt", "r") do f
    rx = r".(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.)...(.)."
    stacks = [String[], String[], String[], String[], String[], String[], String[], String[], String[]]
    for j in 1:8
        l = readline(f)
        m = match(rx, l)
        for i in 1:9
            if m[i] != " "
                pushfirst!(stacks[i], m[i])
            end
        end
    end
    readline(f)
    readline(f)
    rx = r"move (.+) from (.) to (.)"
    for j in 11:513
        l = readline(f)
        m = match(rx, l)
        n = parse(Int, m[1])
        a = stacks[parse(Int, m[2])]
        b = stacks[parse(Int, m[3])]
        append!(b,a[end-n+1:end])
        for i in 1:n
            pop!(a)
        end
    end
    str = ""
    for j in 1:9
        str *= stacks[j][end]
    end
    println(str)
end