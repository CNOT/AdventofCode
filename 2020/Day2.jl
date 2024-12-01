open("/home/ali/Spare Time/AdventofCode/2020/input-day2.txt") do f
    s = read(f,String)
    data = r"(\d+)-(\d+) ([a-z]): ([a-z]+)"
    counter = 0
    for m in eachmatch(data,s)
        # println(m[1],m[2],m[3],m[4])
        c = sum([1 for i = eachmatch(Regex(m[3]),m[4])])
        if parse(Int,m[1]) <= c <= parse(Int,m[2]) 
            counter += 1
        end
    end
    println( counter)
end

open("/home/ali/Spare Time/AdventofCode/2020/input-day2.txt") do f
    s = read(f,String)
    data = r"(\d+)-(\d+) ([a-z]): ([a-z]+)"
    counter = 0
    for m in eachmatch(data,s)
        if xor(m[4][parse(Int,m[1])]==m[3][1],m[4][parse(Int,m[2])]==m[3][1])
            counter += 1
        end
    end
    println( counter)
end