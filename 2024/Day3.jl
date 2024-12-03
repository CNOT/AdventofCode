data = read("2024/input-day03.txt",String)
tot = 0
for m in eachmatch(r"mul\((\d+),(\d+)\)"s,data)
    tot += parse(Int,m[1])*parse(Int,m[2])
end
println(tot)