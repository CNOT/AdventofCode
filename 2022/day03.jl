open("/home/ali/Spare Time/AdventofCode/2022/input-day03.txt", "r") do f
    lines = readlines(f)
    pri = 0
    for l in lines
        la = l[1:Int(end / 2)]
        lb = l[Int(end / 2)+1:end]
        shareditem = intersect(la, lb)[1]
        isuppercase(shareditem) ? pri += Int(shareditem) - Int('A') + 27 : pri += Int(shareditem) - Int('a') + 1
    end
    println(pri)

    pri = 0
    for i in 1:3:length(lines)
        la = lines[i]
        lb = lines[i+1]
        lc = lines[i+2]
        shareditem = intersect(la, lb,lc)[1]
        isuppercase(shareditem) ? pri += Int(shareditem) - Int('A') + 27 : pri += Int(shareditem) - Int('a') + 1
    end
    println(pri)

end
