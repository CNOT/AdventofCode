open("/home/ali/Spare Time/AdventofCode/2020/input-day6.txt") do f
    s = map(x-> split(x,"\n"),split(read(f, String),"\n\n"))
    l = 0
    l2 = 0
    for si in s
        l += length(union(map(x -> Set(x),si)...))
        l2 += length(intersect(map(x -> Set(x),si)...))
    end
    println(l)
    println(l2)
end