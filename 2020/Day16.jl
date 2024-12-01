using DelimitedFiles
your_ticket = [157,73,79,191,113,59,109,61,103,101,67,193,97,179,107,89,53,71,181,83]


reg = r": (\d+)-(\d+) or (\d+)-(\d+)"
open("input-day16.txt") do f
    s = readlines(f)
    valid_range = Int[]
    for i in 1:20
        m = match(reg,s[i])
        valid_range = union(parse(Int,m[1]):parse(Int,m[2]),parse(Int,m[3]):parse(Int,m[4]),valid_range)
    end
    # println(valid_range)
    data = readdlm("input-day16-nearbytickets.txt",',',Int,'\n')
    println(sum(x -> (x ∈ valid_range) ? 0 : x, data))
    valid_data_tmp = []
    for i in 1:235
        if all([data[i,j] ∈ valid_range for j in 1:20])
            push!(valid_data_tmp,data[i,:])
        end
    end
    valid_data = vcat([x' for x in valid_data_tmp]...)
    println(typeof(valid_data))
    valid_ranges = []
    for i in 1:20
        m = match(reg,s[i])
        push!(valid_ranges,union(parse(Int,m[1]):parse(Int,m[2]),parse(Int,m[3]):parse(Int,m[4])))
    end
    println(valid_data[:,1])
    for i in 1:20
        println("data field: ",i)
        for j in 1:20
            if all([valid_data[k,i] in valid_ranges[j] for k in 1:190])
                println("candidate field: ",s[j])
            end
        end
    end
    println(your_ticket[2]*your_ticket[14]*your_ticket[5]*your_ticket[18]*your_ticket[16]*your_ticket[15])
end