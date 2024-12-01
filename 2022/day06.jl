open("/home/ali/Spare Time/AdventofCode/2022/input-day06.txt", "r") do f
    data = readline(f)
    counter = 4
    str = [data[1:3]...]
    for c in data[4:end]
        push!(str, c)
        length(union(str)) == 4 && break
        popfirst!(str)
        counter += 1
    end
    println(counter)
    counter = 14
    str = [data[1:13]...]
    for c in data[14:end]
        push!(str, c)
        length(union(str)) == 14 && break
        popfirst!(str)
        counter += 1
    end
    println(counter)

end