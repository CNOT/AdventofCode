open("input-day01.txt","r") do f
    elves = split.(readlines(f),",")
    max_num = 0
    for i in 1:length(elves)-1
        sum = 0
        for j in 1:length(elves[i])
            sum += parse(Int,elves[i][j])
        end
        max_num = max(max_num,sum)
    end
    println(max_num)
end
open("input-day01.txt","r") do f
    elves = split.(readlines(f),",")
    sum_list = Int[]
    for i in 1:length(elves)-1
        sum = 0
        for j in 1:length(elves[i])
            sum += parse(Int,elves[i][j])
        end
        push!(sum_list,sum)
    end
    println(sum(sort(sum_list)[end-2:end]))
end