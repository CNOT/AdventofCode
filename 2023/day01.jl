data = readlines("2023/input-1.txt")
s = 0
for i in data
    s += 10*parse(Int,i[findfirst(isdigit,i)]) + parse(Int,i[findlast(isdigit,i)])
end
println(s)

dig = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
dig_dict = Dict(zip(dig[1:18],vcat(1:9,1:9)))
s = 0
for j in 1:1000
    f = sort(filter(!isnothing,findfirst.(dig, data[j])))[1]
    fd = dig_dict[getindex(data[j],f)]
    l = sort(filter(!isnothing,findlast.(dig, data[j])))[end]
    ld = dig_dict[getindex(data[j],l)]
    s += 10fd + ld
end
println(s)