using DelimitedFiles
data = readdlm("/home/ali/Spare Time/AdventofCode/2022/input-day02.txt", ' ', Char, '\n')
# data = ['A' 'Y'
# 'B' 'X'
# 'C' 'Z']
points = 0
for i in 1:2500
    if data[i, 1] == 'A'
        data[i, 2] == 'X' && (points += 1 + 3)
        data[i, 2] == 'Y' && (points += 2 + 6)
        data[i, 2] == 'Z' && (points += 3 + 0)
    end
    if data[i, 1] == 'B'
        data[i, 2] == 'X' && (points += 1 + 0)
        data[i, 2] == 'Y' && (points += 2 + 3)
        data[i, 2] == 'Z' && (points += 3 + 6)
    end
    if data[i, 1] == 'C'
        data[i, 2] == 'X' && (points += 1 + 6)
        data[i, 2] == 'Y' && (points += 2 + 0)
        data[i, 2] == 'Z' && (points += 3 + 3)
    end
end
println(points)
points = 0
for i in 1:2500
    if data[i, 1] == 'A'
        data[i, 2] == 'X' && (points += 0 + 3)
        data[i, 2] == 'Y' && (points += 3 + 1)
        data[i, 2] == 'Z' && (points += 6 + 2)
    end
    if data[i, 1] == 'B'
        data[i, 2] == 'X' && (points += 0 + 1)
        data[i, 2] == 'Y' && (points += 3 + 2)
        data[i, 2] == 'Z' && (points += 6 + 3)
    end
    if data[i, 1] == 'C'
        data[i, 2] == 'X' && (points += 0 + 2)
        data[i, 2] == 'Y' && (points += 3 + 3)
        data[i, 2] == 'Z' && (points += 6 + 1)
    end
end
println(points)