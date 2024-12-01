open("/home/ali/Spare Time/AdventofCode/2022/input-day08.txt", "r") do f
    l = readlines(f)
    m = zeros(Int8,length(l),length(l[1]))
    for i in 1:size(m)[1]
        s = digits(parse(BigInt,l[i]),pad=99)
        for j in 1:size(m)[2]
            m[i,j] = s[j]
        end
    end
    counter = 4*98
    for i in 2:size(m)[1]-1, j in 2:size(m)[2]-1
        if any([all(m[i,1:j-1].<m[i,j]),all(m[i,j+1:end].<m[i,j]),all(m[1:i-1,j].<m[i,j]),all(m[i+1:end,j].<m[i,j])])
            counter += 1
        end
    end
    println(counter)
    area = 0
    for i in 2:size(m)[1]-1, j in 2:size(m)[2]-1
        l1 = 1
        i1 = i-1
        while i1>1 && m[i,j]>m[i1,j]
            l1 += 1
            i1 -= 1
        end
        l2 = 1
        j1 = j-1
        while j1>1 && m[i,j]>m[i,j1]
            l2 += 1
            j1 -= 1
        end
        l3 = 1
        i2 = i+1
        while i2<size(m)[1] && m[i,j]>m[i2,j]
            l3 += 1
            i2 += 1
        end
        l4 = 1
        j2 = j+1
        while j2<size(m)[2] && m[i,j]>m[i,j2]
            l4 += 1
            j2 += 1
        end
        area = max(area,l1*l2*l3*l4)
    end
    println(area)
end