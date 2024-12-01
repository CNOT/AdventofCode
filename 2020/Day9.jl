
function check(n,l)
    for i in 1:length(l)
        l2 = deepcopy(l)
        (n-l[i] ∈ deleteat!(l2,i)) && return true
    end
    return false    
end
function check2(n,l)
    for i in 1:length(l)
        j = 0
        while sum(l[i:i+j]) < n
            j += 1
        end
        sum(l[i:i+j]) == n && return min(l[i:i+j]...)+max(l[i:i+j]...)
    end
end
open("/home/ali/Spare Time/AdventofCode/2020/input-day9.txt") do f
    s = map(x->parse(Int,x),readlines(f))
    global n
    for i in 26:length(s)
        if !(check(s[i],s[i-25:i-1])) 
            n = s[i]
            println(n)
            break
        end
    end
    println(check2(n,s))
end