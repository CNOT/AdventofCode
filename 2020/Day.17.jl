
inp = ["..#..#..","#.#...#.","..#.....","##....##","#..#.###",".#..#...","###..#..","....#..#"]

initial_state = zeros(22,22,15)
inp_bits = [0 0 1 0 0 1 0 0 
1 0 1 0 0 0 1 0 
0 0 1 0 0 0 0 0 
1 1 0 0 0 0 1 1 
1 0 0 1 0 1 1 1 
0 1 0 0 1 0 0 0 
1 1 1 0 0 1 0 0 
0 0 0 0 1 0 0 1 ]
initial_state[8:15,8:15,8] = inp_bits

function neghbors(grid,i,j,k)
    return [grid[i,j+1,k],grid[i+1,j,k],grid[i,j,k+1],grid[i,j-1,k],grid[i-1,j,k],grid[i,j,k-1],grid[i+1,j+1,k],grid[i+1,j,k+1],grid[i,j+1,k+1],grid[i-1,j-1,k],grid[i-1,j,k-1],grid[i,j-1,k-1],grid[i+1,j+1,k+1],grid[i-1,j-1,k-1],grid[i-1,j+1,k],grid[i+1,j-1,k],grid[i-1,j,k+1],grid[i,j-1,k+1],grid[i+1,j,k-1],grid[i+1,j+1,k-1],grid[i+1,j-1,k+1],grid[i-1,j+1,k+1],grid[i-1,j-1,k+1],grid[i-1,j+1,k-1],grid[i+1,j-1,k-1],grid[i,j+1,k-1]]
end

function update_rule(grid)
    a,b,c = size(grid)
    grid2 = deepcopy(grid)
    for i in 2:a-1, j in 2:b-1, k in 2:c-1
        if grid[i,j,k] == 0
            if sum(neghbors(grid,i,j,k)) == 3
                grid2[i,j,k] = 1
            end
        elseif grid[i,j,k] ==  1
            if !((sum(neghbors(grid,i,j,k)) == 2) | (sum(neghbors(grid,i,j,k)) == 3))
                grid2[i,j,k] = 0
            end
        end
    end
    return grid2
end

for i in 1:6
    initial_state = update_rule(initial_state)
    # println(initial_state[:,:,8])
end
println(sum(initial_state))


function neghbors2(grid,i,j,k,l)
    return [grid[i,j+1,k,l],grid[i+1,j,k,l],grid[i,j,k+1,l],grid[i,j-1,k,l],grid[i-1,j,k,l],grid[i,j,k-1,l],grid[i+1,j+1,k,l],grid[i+1,j,k+1,l],grid[i,j+1,k+1,l],grid[i-1,j-1,k,l],grid[i-1,j,k-1,l],grid[i,j-1,k-1,l],grid[i+1,j+1,k+1,l],grid[i-1,j-1,k-1,l],grid[i-1,j+1,k,l],grid[i+1,j-1,k,l],grid[i-1,j,k+1,l],grid[i,j-1,k+1,l],grid[i+1,j,k-1,l],grid[i+1,j+1,k-1,l],grid[i+1,j-1,k+1,l],grid[i-1,j+1,k+1,l],grid[i-1,j-1,k+1,l],grid[i-1,j+1,k-1,l],grid[i+1,j-1,k-1,l],grid[i,j+1,k-1,l],grid[i,j+1,k,l+1],grid[i+1,j,k,l+1],grid[i,j,k+1,l+1],grid[i,j-1,k,l+1],grid[i-1,j,k,l+1],grid[i,j,k-1,l+1],grid[i+1,j+1,k,l+1],grid[i+1,j,k+1,l+1],grid[i,j+1,k+1,l+1],grid[i-1,j-1,k,l+1],grid[i-1,j,k-1,l+1],grid[i,j-1,k-1,l+1],grid[i+1,j+1,k+1,l+1],grid[i-1,j-1,k-1,l+1],grid[i-1,j+1,k,l+1],grid[i+1,j-1,k,l+1],grid[i-1,j,k+1,l+1],grid[i,j-1,k+1,l+1],grid[i+1,j,k-1,l+1],grid[i+1,j+1,k-1,l+1],grid[i+1,j-1,k+1,l+1],grid[i-1,j+1,k+1,l+1],grid[i-1,j-1,k+1,l+1],grid[i-1,j+1,k-1,l+1],grid[i+1,j-1,k-1,l+1],grid[i,j+1,k-1,l+1],grid[i,j+1,k,l-1],grid[i+1,j,k,l-1],grid[i,j,k+1,l-1],grid[i,j-1,k,l-1],grid[i-1,j,k,l-1],grid[i,j,k-1,l-1],grid[i+1,j+1,k,l-1],grid[i+1,j,k+1,l-1],grid[i,j+1,k+1,l-1],grid[i-1,j-1,k,l-1],grid[i-1,j,k-1,l-1],grid[i,j-1,k-1,l-1],grid[i+1,j+1,k+1,l-1],grid[i-1,j-1,k-1,l-1],grid[i-1,j+1,k,l-1],grid[i+1,j-1,k,l-1],grid[i-1,j,k+1,l-1],grid[i,j-1,k+1,l-1],grid[i+1,j,k-1,l-1],grid[i+1,j+1,k-1,l-1],grid[i+1,j-1,k+1,l-1],grid[i-1,j+1,k+1,l-1],grid[i-1,j-1,k+1,l-1],grid[i-1,j+1,k-1,l-1],grid[i+1,j-1,k-1,l-1],grid[i,j+1,k-1,l-1],grid[i,j,k,l-1],grid[i,j,k,l+1]]
end

function update_rule2(grid)
    a,b,c,d = size(grid)
    grid2 = deepcopy(grid)
    for i in 2:a-1, j in 2:b-1, k in 2:c-1,l in 2:d-1
        if grid[i,j,k,l] == 0
            if sum(neghbors2(grid,i,j,k,l)) == 3
                grid2[i,j,k,l] = 1
            end
        elseif grid[i,j,k,l] ==  1
            if !((sum(neghbors2(grid,i,j,k,l)) == 2) | (sum(neghbors2(grid,i,j,k,l)) == 3))
                grid2[i,j,k,l] = 0
            end
        end
    end
    return grid2
end

initial_state = zeros(22,22,15,15)
inp_bits = [0 0 1 0 0 1 0 0 
1 0 1 0 0 0 1 0 
0 0 1 0 0 0 0 0 
1 1 0 0 0 0 1 1 
1 0 0 1 0 1 1 1 
0 1 0 0 1 0 0 0 
1 1 1 0 0 1 0 0 
0 0 0 0 1 0 0 1 ]
initial_state[8:15,8:15,8,8] = inp_bits


for i in 1:6
    initial_state = update_rule2(initial_state)
    # println(initial_state[:,:,8])
end
println(sum(initial_state))
