open("/home/ali/Spare Time/AdventofCode/2020/input-day8.txt") do f
    s = readlines(f)
    s1 = [split(i," ") for i in s]
    len = length(s)
    visits = zeros(len)
    i = 1
    g = 0
    while visits[i] == 0
        visits[i] += 1
        if s1[i][1] == "nop"
            i += 1
        elseif s1[i][1] == "acc"
            g += parse(Int,s1[i][2])
            i += 1
        elseif s1[i][1] == "jmp"
            i += parse(Int,s1[i][2])
        end
    end
    println(g)
end
test = "nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6"
open("/home/ali/Spare Time/AdventofCode/2020/input-day8.txt") do f
    s = readlines(f)
    # s = split(test,"\n")
    s1 = [split(i," ") for i in s]
    len = length(s)
    j = 1
    visits = zeros(len+1)
    while visits[end] == 0 && j <= len
        s2 = deepcopy(s1)
        # println(s2)
        if s2[j][1] == "jmp"
            s2[j][1] = "nop"
        elseif s2[j][1] == "nop"
            s2[j][1] = "jmp"
        else
            j += 1
            continue
        end
        i = 1
        g = 0
        visits = zeros(len+1)
        while visits[i] == 0 && i <= len
            visits[i] += 1
            if s2[i][1] == "nop"
                i += 1
            elseif s2[i][1] == "acc"
                g += parse(Int,s2[i][2])
                i += 1
            elseif s2[i][1] == "jmp"
                i += parse(Int,s2[i][2])
            end
            if i > len
                println("i = ",i)
                println(j,"=>",g)
                # println(s2)
                # println(visits)
                break
            end
        end
        j += 1
    end
end
