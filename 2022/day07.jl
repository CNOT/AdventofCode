# Solution copied from Slack Raoul Rodriguez
using Match

function do_operations(lines)
    current_dir = Vector{String}(["/"])
    fs = Dict()

    i = 1
    while i <= length(lines)
        current_line = lines[i]
        res = match(r"^\$ (cd|ls)(.*)$", current_line)
        @assert res !== nothing "Invalid operation \"$current_line\""
        command, raw_operands = res
        operands = split(raw_operands, " ", keepempty=false)
        @match (command, operands) begin
            ("cd", ["/"]) => begin
                empty!(current_dir)
                push!(current_dir, "/")
                i += 1
            end
            ("cd", [".."]) => begin
                pop!(current_dir)
                i += 1
            end
            ("cd", [dir]) => begin
                push!(current_dir, dir)
                i += 1
            end
            ("ls", []) => begin
                current_node = fs
                for node in current_dir
                    if !(node in keys(current_node))
                        current_node[node] = Dict()
                    end
                    current_node = current_node[node]
                end
                i += 1
                while i <= length(lines) && lines[i][1] !== '$'
                    output_line = lines[i]
                    if match(r"^dir \S+$", output_line) !== nothing
                        # Do nothing
                    elseif match(r"^(\d+) (\S+)$", output_line) !== nothing
                        size, file = match(r"^(\d+) (\S+)$", output_line)
                        current_node[file] = parse(Int, size)
                    else 
                        error("LS output, unhandled line $output_line")
                    end

                    i += 1
                end
                continue
            end
            _ => error("unhandled code $current_line")
        end
    end
    return fs
end

child_sum(leaf::Int) = :file, leaf
function child_sum(tree::Dict)
    cum = 0
    child_folders = Vector{Int}()
    for child in values(tree)
        ret = child_sum(child)
        @match ret begin
            (:file, curr) => begin
                cum += curr
            end
            (:folder, size, curr_child_folders) => begin
                cum += size
                push!(child_folders, size)
                append!(child_folders, curr_child_folders)
            end
        end
    end
    :folder, cum, child_folders
end

# pt1
lines = readlines("/home/ali/Spare Time/AdventofCode/2022/input-day07.txt")
fs = do_operations(lines)
_, total_size, all_folder_sizes = child_sum(fs)
println(sum(size for size in all_folder_sizes if size <= 100000))

# # pt2
sorted_folders = sort(all_folder_sizes)
println(sorted_folders[findfirst(x -> total_size - x < 40000000, sorted_folders)])
