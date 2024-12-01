function ns(s,i,j)
    r = size(s)[1]
    c = size(s[1])[1]
    i == 1 && j == 1 && return [s[1][2],s[2][1],s[2][2]]
    i == r && j == 1 && return [s[r][2],s[r-1][1],s[r-1][2]]
    i == 1 && j == c && return [s[2][c],s[2][c-1],s[1][c-1]]
    i == r && j == c && return [s[r][c-1],s[r-1][c],s[r-1][c-1]]
    i == 1 && return [s[i][j-1],s[i][j+1],s[i+1][j-1],s[i+1][j+1],s[i+1][j]]
    i == r && return [s[i][j-1],s[i][j+1],s[i-1][j-1],s[i-1][j+1],s[i-1][j]]
    j == 1 && return [s[i-1][j],s[i+1][j],s[i-1][j+1],s[i+1][j+1],s[i][j+1]]
    j == c && return [s[i-1][j],s[i+1][j],s[i-1][j-1],s[i+1][j-1],s[i][j-1]]
    return [s[i-1][j],s[i+1][j],s[i-1][j-1],s[i+1][j-1],s[i][j-1],s[i-1][j+1],s[i+1][j+1],s[i][j+1]]
end

function update(s)
    m = size(s)[1]
    n = size(s[1])[1]
    s₁ = deepcopy(s)
    for i in 1:m, j in 1:n
        if s[i][j] == "L"
            if all(ns(s,i,j) .!= "#")
                s₁[i][j] = "#"
            end
        elseif s[i][j] == "#"
            if count("#",join(ns(s,i,j))) >= 4
                s₁[i][j] = "L"
            end
        else
            s₁[i][j] = s[i][j]
        end
    end
    return s₁
end
# open("/home/ali/Spare Time/AdventofCode/2020/input-day11.txt") do f
#     s = split.(readlines(f),"")
#     σ = update(s)
#     while σ != s
#         (σ,s) = (update(σ),σ)
#     end
#     println(count("#",join(join.(σ))))
# end


test_s = split.(split(
"L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL"),"")
function count_occupied(s,i,j)
    m = size(s)[1]
    n = size(s[1])[1]
    b₁ = [s[i][j+k] for k in 1:n-j]
    b₂ = [s[i+k][j+k] for k in 1:min(n-j,m-i)]
    b₃ = [s[i+k][j] for k in 1:m-i]
    b₄ = [s[i+k][j-k] for k in 1:min(j-1,m-i)]
    b₅ = [s[i][j-k] for k in 1:j-1]
    b₆ = [s[i-k][j-k] for k in 1:min(j-1,i-1)]
    b₇ = [s[i-k][j] for k in 1:i-1]
    b₈ = [s[i-k][j+k] for k in 1:min(n-j,i-1)]
    a₁ = if findfirst(x->x!=".",b₁)!=nothing
        b₁[findfirst(x->x!=".",b₁)]
    end
    a₂ = if findfirst(x->x!=".",b₂)!=nothing
        b₂[findfirst(x->x!=".",b₂)]
    end
    a₃ = if findfirst(x->x!=".",b₃)!=nothing
        b₃[findfirst(x->x!=".",b₃)]
    end
    a₄ = if findfirst(x->x!=".",b₄)!=nothing
        b₄[findfirst(x->x!=".",b₄)]
    end
    a₅ = if findfirst(x->x!=".",b₅)!=nothing
        b₅[findfirst(x->x!=".",b₅)]
    end
    a₆ = if findfirst(x->x!=".",b₆)!=nothing
        b₆[findfirst(x->x!=".",b₆)]
    end
    a₇ = if findfirst(x->x!=".",b₇)!=nothing
        b₇[findfirst(x->x!=".",b₇)]
    end
    a₈ = if findfirst(x->x!=".",b₈)!=nothing
        b₈[findfirst(x->x!=".",b₈)]
    end
    # println([a₁,a₂,a₃,a₄,a₅,a₆,a₇,a₈])
    count(x->x=="#",[a₁,a₂,a₃,a₄,a₅,a₆,a₇,a₈])
end

function update2(s)
    m = size(s)[1]
    n = size(s[1])[1]
    σ = deepcopy(s)
    for i in 1:m, j in 1:n
        if s[i][j] == "L"
            if count_occupied(s,i,j) == 0
                σ[i][j] = "#"
            end
        elseif s[i][j] == "#"
            if count_occupied(s,i,j) >= 5
                σ[i][j] = "L"
            end
        end
    end
    return σ
end


count_occupied(test_s,1,10)
update2(update2(test_s))

open("/home/ali/Spare Time/AdventofCode/2020/input-day11.txt") do f
    s = split.(readlines(f),"")
    σ = update2(s)
    while σ != s
        (σ,s) = (update2(σ),σ)
    end
    println(count("#",join(join.(σ))))
end
