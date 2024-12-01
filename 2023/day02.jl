data = readlines("2023/input-2.txt")
# const r, g, b = 12, 13, 14
d = Dict("r" => 12, "g" => 13, "b" => 14)
re1 = r"Game (\d+):"
re2 = r"(\d+) ([r,g,b])"
c = 0
for l in data
    game_ID = parse(Int,match(re1,l)[1])
    spl_1 = split(l,[';',':'])[2:end]
    tmp_bool = true
    for l2 in spl_1
        spl_2 = split(l2,',')
        # println(match(re2, spl_2[1]))
        tmp_bool &= all([d[match(re2,k)[2]] >= parse(Int,match(re2,k)[1]) for k in spl_2])
    end
    tmp_bool && (c += game_ID)
end
println(c)

c = 0
for l in data
    game_ID = parse(Int, match(re1, l)[1])
    spl_1 = split(l, [';', ':'])[2:end]
    tmp_bool = true
    for l2 in spl_1
        spl_2 = split(l2, ',')
        # println(match(re2, spl_2[1]))
        tmp_bool &= all([d[match(re2, k)[2]] >= parse(Int, match(re2, k)[1]) for k in spl_2])
    end
    tmp_bool && (c += game_ID)
end
println(c)