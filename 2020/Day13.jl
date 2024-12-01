# n = 1008169
# bus_IDs = [29,41,37,653,13,17,23,823,19]
# mins = 0
# println(all([mod(n+mins , bus_IDs[i]) for i in eachindex(bus_IDs)] .!= 0))
# while(all([mod(n+mins , bus_IDs[i]) for i in eachindex(bus_IDs)] .!= 0))
#     mins += 1
# end

# println([mod(n+mins , bus_IDs[i]) for i in eachindex(bus_IDs)])
# println(823*mins)

function Chinese_remainder(prs,rems)
    multiplier = 1
    num = 0
    for i in 1:length(prs)
        while mod(num+rems[i],prs[i]) != 0
            num += multiplier
        end
        multiplier *= prs[i]
    end
    return num
end

open("input-day13.txt") do f
    readline(f)
    arrival_time = split(readline(f),",")
    key = Int[]
    val = Int[]
    for i in eachindex(arrival_time)
        if arrival_time[i] != "x"
            push!(key,parse(Int,arrival_time[i]))
            push!(val, i-1)
        end
    end
    @time println(Chinese_remainder(key,val))
end