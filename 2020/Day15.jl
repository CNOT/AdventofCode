inp = [20,9,11,0,1,2]
# global inp = [1,3,2]
l = length(inp)
for i in l+1:2020
    lis = inp[1:i-2]
    f = findlast(x -> x==last(inp),lis)
    push!(inp,f === nothing ? 0 : i-f-1)
end
println(inp[end])

inp = [20,9,11,0,1,2]
# global inp = [1,3,2]
l = length(inp)
d = Dict{Int,Int}()
function update(d,leng,last_element)
    return last_element in keys(d) ? leng-d[last_element]+1 : 0
end
global las = pop!(inp)
global leng = length(inp)
global d = Dict([(20,1),(9,2),(11,3),(0,4),(1,5)])
for i in l+1:30000000
    las2 = update(d,leng,las)
    d[las] = leng + 1
    leng += 1
    las = deepcopy(las2)
end
println(las)