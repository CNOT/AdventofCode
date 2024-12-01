open("/home/ali/Spare Time/AdventofCode/2020/input-day10.txt") do f
    s = sort!(map(x->parse(Int,x),readlines(f)))
    l = zeros(Int,3)
    l[3] = 1
    for i in 1:length(s)-1
        l[s[i+1]-s[i]]+=1
    end
    println(l[1]*l[3])

    function solve(input)
    cnt1 = 0
    cnt3 = 0

    for i in 2:lastindex(input)
        difference = abs(input[i]-input[i-1])
        difference == 1 && (cnt1 += 1)
        difference == 3 && (cnt3 += 1)
    end

    cnt1, cnt3, cnt1*cnt3
    end
    println(solve(s))


end

V = parse.(Int, readlines("/home/ali/Spare Time/AdventofCode/2020/input-day10.txt")) |> sort
V = [0; V; last(V)+3]

# part 1
function part1(V)
    ΔV = diff(V)
    count(==(1), ΔV) * count(==(3), ΔV)
end

# part 2
function part2(V)

    n = length(V)

    routes = zeros(Int, max(V...)+1)
    routes[end] = 1

    @inbounds for i in n:-1:1
        Vᵢ = V[i]
        routes[Vᵢ] = +(routes[Vᵢ+1], routes[Vᵢ+2], routes[Vᵢ+3])
    end

    return routes[1]
end
println(part1(V))
println(part2(V))

V = parse.(Int, readlines("/home/ali/Spare Time/AdventofCode/2020/input-day10.txt")) |> sort
V = [0; V; last(V)+3]
using LightGraphs
g = DiGraph(length(V))
for i in eachindex(V) , j in eachindex(V)
    if 0<V[i]-V[j]<=3
        add_edge!(g,j,i)
    end
end
s = zeros(length(V))
s[1] = 1
total = BigInt(0)
for i in eachindex(V)
    s = transpose(adjacency_matrix(g))*s
    total += s[end]
end
println(total)