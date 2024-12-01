function apply(initial,value,mask)
    inbit = split(bitstring(UInt64(initial)),"")[end-35:end]
    valbit = bitstring(UInt64(value))[end-35:end]
    for i in eachindex(mask)
        # println(i," ",mask[i])
        inbit[i] = mask[i] == 'X' ?  valbit[i:i] : mask[i:i]
    end
    return parse(UInt64,join(inbit),base=2)
end
parse_mask(s) = split(s)[end]
function parse_mem(s)
    reg = r"mem\[(\d+)\] = (\d+)"
    m = match(reg,s)
    return parse(Int,m[1]),parse(Int,m[2])
end

# test_st=["mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X","mem[8] = 11","mem[7] = 101","mem[8] = 0"]
function find_locs(value, mask)
    valbit = bitstring(UInt64(value))[end-35:end]
    count_X = count("X",mask)
    X_combinations = [bitstring(i)[end-count_X+1:end] for i in 0:1<<count_X-1]
    # println(X_combinations)
    locs = Int[]
    for xcom in X_combinations
        j = 1
        loc = repeat(['X'],36)
        for k in eachindex(mask)
            if mask[k] == 'X'
                loc[k] = xcom[j]
                j+=1
            elseif mask[k] == '0'
                loc[k] = valbit[k]
            else
                loc[k] = '1'
            end
        end
        push!(locs,parse(UInt64,join(loc),base=2))
    end
    return locs
end

open("input-day14.txt") do f
    s = readlines(f)
    # s = test_st
    d = Dict{Int,Int}()
    for st in s
        if st[2] =='a'
            global mask = parse_mask(st)
        else
            ke,va = parse_mem(st)
            d[ke] = ke ∈ keys(d) ? apply(d[ke],va,mask) : apply(0,va,mask)
        end
    end
    su = 0
    for k in keys(d)
        su += d[k]
    end
    println("solution to part 1: ",su)
    # test_st = ["mask = 000000000000000000000000000000X1001X","mem[42] = 100","mask = 00000000000000000000000000000000X0XX","mem[26] = 1"]
    d = Dict{Int,Int}()
    for st in s
        if st[2] =='a'
            global mask = parse_mask(st)
        else
            ke,va = parse_mem(st)
            println(find_locs(ke,mask))
            for loc in find_locs(ke,mask)
                d[loc] = va
            end
        end
    end
    println("solution to part 2: ",sum(values(d)))
end






