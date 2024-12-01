function frontback(s)
    s = replace(s,"F"=>"0")
    s = replace(s,"B"=>"1")
    parse(Int,s,base=2)
end

function leftright(s)
    s = replace(s,"L"=>"0")
    s = replace(s,"R"=>"1")
    parse(Int,s,base=2)
end

function seatID(s)
    frontback(s[1:7])*8+leftright(s[8:10])
end

open("/home/ali/Spare Time/AdventofCode/2020/input-day5.txt") do f
    s = readlines(f)
    ma = 0
    for pass in s
        ma = max(ma,seatID(pass))
    end
    println(ma)
end

open("/home/ali/Spare Time/AdventofCode/2020/input-day5.txt") do f
    s = readlines(f)
    coords_x = Int[]
    coords_y = Int[] 
    for pass in s
        (y,x) = (frontback(pass[1:7]),leftright(pass[8:10]))
        push!(coords_x,x)
        push!(coords_y,y)
    end
    # for i in 0:127
    #     if !(i ∈ coords_y)
    #         println(i)
    #     end
    # end
    #rows 1 to 110 are on plane
    ids = [seatID(i) for i in s]
    for i in 16:8*109
        if !(i ∈ ids)
            println(i)
        end
    end
end
