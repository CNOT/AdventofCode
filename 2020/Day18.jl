function calculator(st)
    ini = st[1]
    if (ini == '(') 
        num,i = calculator(st[2:end])
        i += 1
    else
        num = parse(Int,ini)
        i = 2
    end
    
    
    is_mul = true
    while i in 2:length(st)
        st[i] == ')' && return (num,i+1)
        if st[i] == ' ' 
            i+=1
            continue
        end
        # println("i = ",i,", st[i] = ",st[i],", num = ",num)
        if (st[i] == '*') 
            is_mul = true
        elseif st[i] == '+'
            is_mul = false
        elseif st[i] == '('
            # println(st[i+1:end])
            num = is_mul ? *(num,calculator(st[i+1:end])[1]) : +(num,calculator(st[i+1:end])[1])
            count_open = 1
            while st[i] != ')' && count_open > 0
                # println("\t i = ",i)
                if st[i] == '('
                    count_open += 1
                elseif st[i] == ')'
                    count_open -= 1
                end
                i += 1
            end
            # println("i = ",i,", st[i] = ",st[i],", num = ",num)
        else
            num = is_mul ? *(num,parse(Int,st[i:i])) : +(num,parse(Int,st[i:i]))
        end
        i += 1
    end
    return (num,i+1)
end

open("input-day18.txt") do f
    to = 0
    s = readlines(f)
    for j in s[1:10]
        to += calculator(j)[1]
        println(j,"\n", calculator(j)[1])
    end
    println(to)

end

input = readlines("input-day18.txt")

⨦(a,b) = a * b  # define "multiplication" with same precedence as "+"
println(sum(map(l -> eval(Meta.parse(replace(l, "*" => "⨦"))), input)))

⨱(a,b) = a + b  # define "addition" with precedence of "*"
println(sum(map(l -> eval(Meta.parse(replace(replace(l, "*" => "⨦"), "+" => "⨱"))), input)))